// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TinanoGenerator
// **************************************************************************

DatabaseBuilder<MyDatabase> _$createMyDatabase() {
  return new DatabaseBuilder(new _$MyDatabaseImpl(), "my_database.sqlite", 1);
}

class _$MyDatabaseImpl extends MyDatabase implements GeneratedDatabaseImpl {
  Database database;
  Future<List<TodoEntry>> getTodoEntries() async {
    String sql = "SELECT id, content FROM todos";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final parsedResults = new List<TodoEntry>();
    rows.forEach((row) {
      TodoEntry parsedRow =
          new TodoEntry(row["id"] as int, row["content"] as String);
      parsedResults.add(parsedRow);
    });
    return parsedResults;
  }

  Future<int> createTodoEntryAndReturnId(String content) async {
    String sql = "INSERT INTO todos (content) VALUES (?)";

    final bindParams_0 = content;

    final bindArgs = [bindParams_0];

    int lastInsertedRecordId = await database.rawInsert(sql, bindArgs);

    return lastInsertedRecordId;
  }

  Future<int> getAmountOfTodos() async {
    String sql = "SELECT COUNT(id) FROM todos";

    final bindArgs = [];

    final rows = await database.rawQuery(sql, bindArgs);

    final row = rows.first;
    int parsedRow = row.values.first as int;
    return parsedRow;
  }

  Future updateTodoText(int id, String content) async {
    String sql = "UPDATE todos SET content = ? WHERE id = ?";

    final bindParams_0 = id;
    final bindParams_1 = content;

    final bindArgs = [bindParams_1, bindParams_0];

    int affectedRows = await database.rawUpdate(sql, bindArgs);

    return affectedRows;
  }

  Future<bool> deleteTodoEntry(int id) async {
    String sql = "DELETE FROM todos WHERE id = ?";

    final bindParams_0 = id;

    final bindArgs = [bindParams_0];

    int affectedRows = await database.rawUpdate(sql, bindArgs);

    return affectedRows > 0;
  }
}
