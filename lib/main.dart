import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
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
          await DBHelper.dbHelperInstance.getTableRow(db: db, id: "5");
      print("isGet:::::::::::::$isGet");
    }
  }

  clickOnDeleteButton() async {
    Database? db = await DBHelper.dbHelperInstance.openDB();
    if (db != null) {
      int isDelete =
          await DBHelper.dbHelperInstance.deleteTableRow(db: db, id: "4");
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
}
