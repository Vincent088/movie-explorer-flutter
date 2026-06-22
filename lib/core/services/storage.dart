import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage.g.dart';

@riverpod
Future<SharedPreferences> storage(Ref ref) {
  return SharedPreferences.getInstance();
}
