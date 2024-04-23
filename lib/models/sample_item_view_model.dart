import 'package:flutter/material.dart';

import '../sample_item.dart';

class SampleItemViewModel extends ChangeNotifier{
  static final _instance = SampleItemViewModel._();
  factory SampleItemViewModel() => _instance;
  SampleItemViewModel._();
  List<SampleItem> items = [
  ];


  void addItem(String name){
    items.add(SampleItem(name: name));
    notifyListeners();
  }

  void removeItem(String id){
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateItem(String id, String newName){
    try {
      final item = items.firstWhere((item) => item.id == id);
      item.name.value = newName;
    }
    catch (e) {
      debugPrint("Khong tim thay muc voi Id $id");
    }
  }
}

