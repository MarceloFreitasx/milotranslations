import 'package:get_storage/get_storage.dart';

class LocalStorage {
  LocalStorage(this.key);

  final String key;
  final _box = GetStorage();

  has() => _box.hasData(key);

  read() => _box.read(key);

  write(String value) {
    _box.write(key, value);
  }

  remove() => _box.remove(key);
}
