import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  // Username Operations
  String getUserName() {
    return _box.read('userName') ?? '';
  }

  Future<void> saveUserName(String name) async {
    await _box.write('userName', name);
  }

  // Counter Operations
  int getCount() {
    return _box.read('count') ?? 0;
  }

  Future<void> saveCount(int count) async {
    await _box.write('count', count);
  }

  // Clear all stored data
  Future<void> clearAll() async {
    await _box.erase();
  }
}