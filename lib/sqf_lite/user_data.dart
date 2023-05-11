import 'dart:typed_data';

import 'package:sqf_or_sp/sqf_lite/db_constant.dart';

class UserData {
  String? name;
  String? number;
  String? email;
  String? numberValue;
  String? boolValue;
  // String? image;
   Uint8List? image;

  UserData({
    required this.name,
    required this.number,
    required this.email,
    required this.numberValue,
    required this.boolValue,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      DBConstant.columnName: name,
      DBConstant.columnNumber: number,
      DBConstant.columnNumber: number,
      DBConstant.columnEmail: email,
      DBConstant.columnNumberValue: numberValue,
      DBConstant.columnBool: boolValue,
      DBConstant.columnImage: image,
    };
  }

  UserData.fromJson(Map<String, dynamic> json) {
    name = json[DBConstant.columnName];
    number = json[DBConstant.columnNumber];
    email = json[DBConstant.columnEmail];
    numberValue = json[DBConstant.columnNumberValue];
    boolValue = json[DBConstant.columnBool];
    image = json[DBConstant.columnImage];
  }
}
