import 'package:path/path.dart';
import 'package:sqf_or_sp/sqf_lite/db_constant.dart';
import 'package:sqf_or_sp/sqf_lite/user_data.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? database;

  DBHelper._privateConstructor();

  static DBHelper dbHelperInstance = DBHelper._privateConstructor();

  factory DBHelper() {
    return dbHelperInstance;
  }

  Future<Database?> openDB() async {
    database =
        await openDatabase(join(await getDatabasesPath(), DBConstant.dbName));
    return database;
  }

  closeDB() async {
    Database? database = await openDB();
    database?.close();
  }

  createTable({required Database db}) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS ${DBConstant.tableName} (${DBConstant.columnId} ${DBDataType.integerPrimaryKeyAutoIncrement}, ${DBConstant.columnName} ${DBDataType.nameText}, ${DBConstant.columnNumber} ${DBDataType.numberVarchar}, ${DBConstant.columnEmail} ${DBDataType.emailText}, ${DBConstant.columnNumberValue} ${DBDataType.number},${DBConstant.columnBool} ${DBDataType.bool})');
  }

  insertTableRow(
      {required Database db, required Map<String, dynamic> data}) async {
    return await db.insert(
      DBConstant.tableName,
      data,
    );
  }

  deleteTableRow({required Database db, required String id}) async {
    return await db.delete(
      DBConstant.tableName,
      where: "${DBConstant.columnId}=?",
      whereArgs: [id],
    );
  }

  updateTableRow({required Database db, required String id}) async {
    return await db.update(
        DBConstant.tableName,
        UserData(
                name: 'Mahendra Panwar Update',
                number: '123456789',
                email: "MahendraUpadte@gmail.com",
                numberValue: '1234512345',
                boolValue: "false")
            .toMap(),
        where: "${DBConstant.columnId}=?",
        whereArgs: [id]);
  }

  updateTableRowColumn({required Database db, required String id}) async {
    return await db.rawUpdate(
        'UPDATE ${DBConstant.tableName} SET  ${DBConstant.columnName} = ? WHERE ${DBConstant.columnId} = ?',
        ['Mahendra', '3']);
  }

  getTableRow({required Database db, required String id}) async {
    return await db.query(DBConstant.tableName,
        where: "${DBConstant.columnId}=?", whereArgs: [id]);
  }
}
