import 'package:flutter/material.dart';
import 'package:test/data/models/field_model.dart';

class FieldProvider extends ChangeNotifier {
  FieldsModels _selected = FieldsModels();
  void selectField(FieldsModels field) {
    _selected = field;
    notifyListeners();
  }

  FieldsModels get selectedField {
    return _selected;
  }

  final List<FieldsModels> _items = [
    FieldsModels(
      id: 1,
      name: 'Cancha A',
    ),
    FieldsModels(
      id: 2,
      name: 'Cancha B',
    ),
    FieldsModels(
      id: 3,
      name: 'Cancha C',
    )
  ];

  List<FieldsModels> get fieldList {
    return _items;
  }
}
