import 'dart:convert';

import 'package:flutter_workshop/core/models/list_model.dart';
import 'package:get_storage/get_storage.dart';

/* 
  StorageManager class'ında initialize (Başlatma) işlemi yaptım.
  Herhangi bir veriyi kaydetmek ve silmek için fonksiyonlarını yazdım.
*/
class StorageManager {
  static final StorageManager _instance = StorageManager._init();

  late GetStorage box;
  static StorageManager get instance => _instance;

  StorageManager._init() {
    box = GetStorage();
  }
  void setData(StorageKey key, dynamic value) => box.write(key.name, value);

  int? getInt(StorageKey key) => box.read(key.name);

  String? getString(StorageKey key) => box.read(key.name);

  bool? getBool(StorageKey key) => box.read(key.name);

  double? getDouble(StorageKey key) => box.read(key.name);

  dynamic getData(StorageKey key) => box.read(key.name);

  /*
    Daha spesifik bir şekilde sadece listelerle işlem yapacağımız için
    listelere veri ekleme, silme ve gösterme işlemlerini yapıyorum
  */
  void addItemToList(ListElement item) {
    ListModel model = list();
    model.list.add(item);
    box.write(StorageKey.LISTS.name, jsonEncode(model));
  }

  void deleteItemToList(int index) {
    ListModel model = list();
    model.list.removeAt(index);
    box.write(StorageKey.LISTS.name, jsonEncode(model));
  }

  ListModel list() {
    var model = listModelFromJson(box.read(StorageKey.LISTS.name) ?? '''{"list": []}''');
    return model;
  }

  void clearData() async => box.erase();
}

enum StorageKey { LISTS }
