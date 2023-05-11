import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqf_or_sp/shared_preference/shared_preference.dart';
import 'package:sqf_or_sp/sqf_lite/db_constant.dart';
import 'package:sqf_or_sp/sqf_lite/db_helper.dart';
import 'package:sqf_or_sp/sqf_lite/user_data.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQF LITE'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => clickOnSharedPreference(),
              child: const Text("SP"),
            ),
            ElevatedButton(
              onPressed: () => clickOnAddButton(),
              child: const Text("ADD"),
            ),
            ElevatedButton(
              onPressed: () => clickOnGetButton(),
              child: const Text("GET"),
            ),
            ElevatedButton(
              onPressed: () => clickOnDeleteButton(),
              child: const Text("DELETE"),
            ),
            ElevatedButton(
              onPressed: () => clickOnUpdateButton(),
              child: const Text("UPDATE"),
            ),
            ElevatedButton(
              onPressed: () => clickOnUpdateRowButton(),
              child: const Text("UPDATE ROW COLUMN"),
            ),
            ElevatedButton(
              onPressed: () => clickOnInsertList(),
              child: const Text("INSERT LIST"),
            ),
            ElevatedButton(
              onPressed: () => clickOnGetList(),
              child: const Text("GET LIST"),
            ),
            ElevatedButton(
              onPressed: () => clickOnUploadImage(),
              child: const Text("UPLOAD IMAGE"),
            ),
          ],
        ),
      ),
    );
  }

  clickOnSharedPreference() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SD(),
        ));
  }

  clickOnAddButton() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      await DBHelper.dbHelperInstance.createTable(db: db);
      UserData userData = UserData(
          name: 'Mahendra',
          number: "9098977418",
          email: "mahendra@gmail.com",
          boolValue: "1",
          numberValue: '222245557');
      int isAdd = await DBHelper.dbHelperInstance
          .insertTableRow(db: db, data: userData.toMap());
      print("isAdd:::::::::::::$isAdd");
    }
  }

  clickOnGetButton() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      List<Map> isGet =
          await DBHelper.dbHelperInstance.getTableRow(db: db, id: "22");
      print("isGet:::::::::::::$isGet");
    }
  }

  clickOnDeleteButton() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      int isDelete =
          await DBHelper.dbHelperInstance.deleteTableRow(db: db, id: "1");
      print("isDelete:::::::::::::$isDelete");
    }
  }

  clickOnUpdateButton() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      int isUpdate =
          await DBHelper.dbHelperInstance.updateTableRow(db: db, id: "4");
      print("isUpdate:::::::::::::$isUpdate");
    }
  }

  clickOnUpdateRowButton() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      int isUpdateRowColumn =
          await DBHelper.dbHelperInstance.updateTableRowColumn(db: db, id: "3");
      print("isUpdateRowColumn:::::::::::::$isUpdateRowColumn");
    }
  }

  clickOnInsertList() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      List names = ["mmmm", "tttt", "sssss"];
      String nameListString = names.join(",").toString();
      List nameList = nameListString.split(",");
      print("names::::::::::::$names");
      print("nameList::::::::::::$nameList");
      UserData userData = UserData(
          name: 'Mahendra',
          number: "9098977418",
          email: nameListString,
          boolValue: "1",
          numberValue: '222245557');
      int isAddList = await DBHelper.dbHelperInstance
          .insertTableRowList(db: db, data: userData.toMap());
      print("isAddList:::::::::::::$isAddList");
    }
  }

  clickOnGetList() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      List<Map<String, Object?>> list = await DBHelper.dbHelperInstance.getList(db: db);
      print("isGetList:::::::::::::$list");
    }
  }

  clickOnUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      Uint8List imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      Database? db =await DBHelper.dbHelperInstance.openDB();
      if(db != null)
      {
        UserData userData = UserData(
            name: 'Mahendra Image',
            number: "9098977418",
            email: "mahendra@gmail.com",
            boolValue: "1",
            numberValue: '222245557', image: imageBytes);
        await DBHelper.dbHelperInstance.uploadImage(db: db,userData: userData.toMap());
      }
    }
  }
}
