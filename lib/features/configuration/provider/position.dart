import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'position.g.dart';

@HiveType(typeId: 4)
class Position extends HiveObject with ChangeNotifier {
  @HiveField(0)
  int? row;
  @HiveField(1)
  int? col;

  Position({this.row, this.col});

  void setRow(int value) {
    row = value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'Position(row: $row, col: $col)';
  }

  void setCol(int value) {
    col = value;
    notifyListeners();
  }
}
