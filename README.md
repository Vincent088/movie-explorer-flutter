# Movie Explorer (Flutter)

A Flutter app for browsing popular movies, searching titles, and saving favorites — powered by the TMDB API.

---

## Running the app

### Prerequisites

- Flutter SDK (3.41+) installed and on your `PATH`
- An Android emulator or iOS simulator set up, or a physical device connected

### Setup

1. Install dependencies

```bash
flutter pub get
```

2. Run the app

```bash
flutter run
```

If multiple devices/emulators are connected, pick one:

```bash
flutter devices
flutter run -d <device-id>
```

### On an emulator

- **Android**: start an AVD via `flutter emulators --launch <emulator-id>`, then `flutter run`
- **iOS**: `open -a Simulator`, then `flutter run`

### On a real device

Connect the device via USB (or pair wirelessly for iOS), make sure it's authorized/trusted, then `flutter run`.

### Running tests

```bash
flutter test
```

---

## Third-party libraries

| Library                                          | Why                                                                                                                                                                                                           |
| ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **flutter_riverpod**                             | State management for movies, search, and favorites. Compile-safe, testable outside of widgets (used directly in `ProviderContainer` for unit tests), and avoids the boilerplate of BLoC for an app this size. |
| **riverpod_generator** / **riverpod_annotation** | Generates providers from `@riverpod` annotated classes/functions (`build_runner`), so each controller/repository/service is declared once without manually writing `Provider`/`NotifierProvider` boilerplate. |
| **dio**                                          | HTTP client with cleaner config than `http` — base URL, query params, and timeouts set once instead of repeated per call.                                                                                     |
| **shared_preferences**                           | Simple key-value persistence for favorites. The data is a small list of movie JSON objects, so a full database (sqflite/Isar) would be overkill.                                                              |
| **cached_network_image**                         | Caches poster/backdrop images to disk and memory so scrolling and revisiting screens doesn't re-fetch images.                                                                                                 |
| **flutter_dotenv**                               | Loads the TMDB API key/URLs from `.env` so secrets stay out of source code.                                                                                                                                   |

After pulling the repo, run `dart run build_runner build` once to generate the `.g.dart` provider files (or `dart run build_runner watch` while developing).

---

## Architecture

The app follows a **feature-based Clean Architecture**, split into a `core/` layer (shared infrastructure) and `features/` (one folder per feature, each with `domain` → `infrastructure` → `presentation`):

```
lib/
├── main.dart                  # Entry point: loads .env, wraps app in ProviderScope
├── core/
│   ├── configs/               # AppTheme (Dark Cinema, light/dark, rating color logic)
│   ├── constants/             # Api, Strings
│   ├── navigations/           # AppNavigator — centralizes screen-to-screen navigation
│   └── services/
│       ├── model/             # TmdbResponse — generic paginated API wrapper
│       ├── remote.dart        # Dio client, exposed as a @riverpod provider
│       ├── storage.dart       # SharedPreferences, exposed as a @riverpod provider
│       └── error_mapper.dart  # Maps DioException → user-facing error strings
├── features/
│   ├── app/                   # MovieExplorerApp — MaterialApp + theme wiring
│   ├── movies/
│   │   ├── domain/model/       # Movie
│   │   ├── infrastructure/     # MoviesRepository (wraps remote calls)
│   │   └── presentation/
│   │       ├── controller/     # MoviesController, SearchController
│   │       └── home.screen.dart
│   ├── movie_detail/
│   │   ├── domain/model/       # MovieDetail, Genre
│   │   ├── infrastructure/     # MovieDetailRepository
│   │   └── presentation/
│   │       ├── controller/     # movieDetailController (family provider by movie id)
│   │       └── movie_detail.screen.dart
│   └── favorites/
│       ├── infrastructure/     # FavoritesRepository (wraps SharedPreferences)
│       └── presentation/controller/  # FavoritesController
└── widgets/                    # Shared dumb UI: MovieCard, MovieGrid, SearchBarField, LoadingIndicator, ErrorMessage
```

**Data flow**: screens watch controllers (the "ViewModel" layer) → controllers call repositories (the "Model"/data layer) → repositories call `remote` (Dio) or `storage` (SharedPreferences). Widgets stay dumb — they receive data and callbacks as props and never talk to repositories directly.

Each feature owns its own `domain` (data shape), `infrastructure` (how data is fetched/persisted), and `presentation` (controller + screen) — so a feature can be understood, tested, or removed without touching the others. `core/` holds only what's genuinely shared: theme, constants, navigation, and the two cross-cutting services (`remote`, `storage`) that every feature's repository depends on.
