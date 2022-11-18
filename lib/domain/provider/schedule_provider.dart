import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/data/constants.dart';
import 'package:test/data/models/schedule_model.dart';

class ScheduleProvider extends ChangeNotifier {
  List<ScheduleModel> _scheduleList = [];
  late Box<ScheduleModel> box;

  // UnmodifiableListView<ScheduleModel> get scheduleList =>
  //     UnmodifiableListView(_scheduleList);

  List<ScheduleModel> get scheduleList {
    return _scheduleList;
  }

  // Create new note
  Future<void> createItem(ScheduleModel schedule) async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    await box.add(schedule);
    _scheduleList.add(schedule);
    _scheduleList = box.values.toList();
    _scheduleList.sort(
      (b, a) => a.date.compareTo(b.date),
    );
    notifyListeners();
  }

  Future<void> getItems() async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    _scheduleList = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteItem(ScheduleModel schedule) async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    await box.delete(schedule.key);
    _scheduleList = box.values.toList();
    notifyListeners();
  }

  Future<void> clearBox() async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    box.clear();
  }

  bool checkIfRepeated(int field, DateTime newDate) {
    List<ScheduleModel> checkList = [];
    checkList = _scheduleList
        .where((schedule) =>
            (schedule.date == newDate) && (schedule.fieldId == field))
        .toList();

    return checkList.length >= 3;
  }
}
