import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PositionProvider extends ChangeNotifier {
  Position? _location;
  void saveLocation(Position location) {
    _location = location;
    notifyListeners();
  }

  Position? get location {
    return _location;
  }
}
