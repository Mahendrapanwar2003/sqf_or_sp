class DBConstant {
  static String dbName = "DBName.db";
  static String tableName = "User";
  static String version = "Version";
  static String columnId = "Id";
  static String columnName = "Name";
  static String columnNumber = "Number";
  static String columnEmail = "Email";
  static String columnBool = "BoolValue";
  static String columnNumberValue = "NumberValue";
  static String columnImage = "Image";
}

class DBDataType {
  static String integerPrimaryKeyAutoIncrement =
      'INTEGER PRIMARY KEY AUTOINCREMENT';
  static String nameText = 'TEXT';
  static String emailText = 'TEXT';
  static String numberVarchar = 'VARCHAR NOT NULL';
  static String bool = 'BOOLEAN NOT NULL';
  static String number = 'NUMBER';
  static String image = 'TEXT';
}
