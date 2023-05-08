import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SD extends StatefulWidget {
  const SD({Key? key}) : super(key: key);

  @override
  State<SD> createState() => _SDState();
}

class _SDState extends State<SD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SD'),
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
              onPressed: () => clickOnClearButton(),
              child: const Text("CLEAR"),
            ),
            ElevatedButton(
              onPressed: () => clickOnGetKeysButton(),
              child: const Text("GET KEYS"),
            ),
            ElevatedButton(
              onPressed: () => clickOnReloadButton(),
              child: const Text("RELOAD"),
            ),
            ElevatedButton(
              onPressed: () => clickOnCommitButton(),
              child: const Text("COMMIT"),
            ),
          ],
        ),
      ),
    );
  }

  clickOnAddButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', "Mahendra");
    sharedPreferences.setBool('value', true);
    sharedPreferences.setInt('int', 9098977418);
    sharedPreferences.setDouble('double', 90989.77418);
    List<String> list = ['Mahendra', 'manish', 'sapan', 'abhishek', 'aman'];
    sharedPreferences.setStringList('list', list);
  }

  clickOnGetButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("name:${sharedPreferences.getString('name')}");
    print("value:${sharedPreferences.getBool('value')}");
    print("int:${sharedPreferences.getInt('int')}");
    print("double:${sharedPreferences.getDouble('double')}");
    print("list:${sharedPreferences.getStringList('list')}");
  }

  clickOnDeleteButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('name');
    await sharedPreferences.remove('value');
    await sharedPreferences.remove('int');
    await sharedPreferences.remove('double');
    await sharedPreferences.remove('list');
  }

  clickOnUpdateButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', "Mahendra Update");
    sharedPreferences.setBool('value', true);
    sharedPreferences.setInt('int', 1234567890);
    sharedPreferences.setDouble('double', 12345.6789);
    List<String> list = [
      'Mahendra',
      'manish',
      'sapan',
      'abhishek',
      'aman',
      'Update'
    ];
    sharedPreferences.setStringList('list', list);
  }

  clickOnClearButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("${sharedPreferences.clear()}");
  }

  clickOnGetKeysButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("${sharedPreferences.getKeys()}");
  }

  clickOnReloadButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("${sharedPreferences.reload()}");
  }

  clickOnCommitButton() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("${sharedPreferences.commit()}");
  }
}
