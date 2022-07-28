import 'package:bloc/bloc.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';
import 'package:sqflite/sqflite.dart';
import '../pages/tabbarpages/boardpage.dart';
import '../pages/tabbarpages/completedtaskpage.dart';
import '../pages/tabbarpages/favouritepage.dart';
import '../pages/tabbarpages/uncompletedtaskpage.dart';
import '../widgets/date_text_field.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of(context);
  List<Tab> Tabs = const [
    Tab(
      child: Text('All'),
    ),
    Tab(
      child: Text('Completed Tasks'),
    ),
    Tab(
      child: Text('Uncompleted Tasks'),
    ),
    Tab(
      child: Text('Favourite'),
    ),
  ];

  List<Widget> TabPages = [
    AllTasks(),
    CompletedTasks(),
    UncompletedTasks(),
    FavouriteTasks(),
  ];

  late Database database;
  List<Map> All_Tasks = [];
  List<Map> Completed_Tasks = [];
  List<Map> Uncompleted_Tasks = [];
  List<Map> Favourites_Tasks = [];
  List<Map> Scheduled_Tasks = [];

  void CreateDatabase() async {
    database = await openDatabase('Todo.db', version: 1,
        onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY,status TEXT, title TEXT, date TEXT, startTime TEXT , endTime TEXT,deadline TEXT,remind TEXT)')
          .then((value) {
        print('database created');
      }).catchError((error) {
        print('databaseCreateError ${error.toString()}');
      });
    }, onOpen: (database) {
      print('database Opened');
      GetDatabaseData(database);
    });
  }

  Future InsertToDatabase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String deadline,
    required String remind,
  }) {
    return database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO Tasks (status,title,date,startTime,endTime,deadline,remind) VALUES("new","$title","$date","$startTime","$endTime","$deadline","$remind")')
          .then((value) {
        print('$value inserted');
        GetDatabaseData(database);
        emit(InsertedIntoDatabaseData());
      }).catchError((error) {
        print(error.toString());
      });
    });
  }

  void GetDatabaseData(database) {
    database.rawQuery('SELECT * FROM Tasks').then((value) {
      All_Tasks = [];
      Completed_Tasks = [];
      Uncompleted_Tasks = [];
      Favourites_Tasks = [];
      All_Tasks = value;
      for (var element in value) {
        if (element['status'] == 'Completed') {
          Completed_Tasks.add(element);
        } else if (element['status'] == 'Favourite') {
          Favourites_Tasks.add(element);
        } else
          Uncompleted_Tasks.add(element);
      }

      emit(GotDatabaseData());
    }).catchError((error) {});
  }

  bool ischecked = false;
  IconData iconData = Icons.check_box;

  void UpdateDatabase({
    required String status,
    required int id,
  }) async {
    ischecked = !ischecked;
    database.rawUpdate('UPDATE Tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      GetDatabaseData(database);
      emit(UpdatedDataBaseData());
    }).catchError((error) {});
  }

  void UpdateDatabaseflag({
    required String flag,
    required int id,
  }) {
    database.rawUpdate(
        'UPDATE Tasks SET flag = ? WHERE id = ?', ['$flag', id]).then((value) {
      GetDatabaseData(database);
      emit(UpdatedDataBaseData());
    }).catchError((error) {});
  }

  void DeleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      GetDatabaseData(database);
      emit(rawofDatabaseDeleted());
    }).catchError((error) {});
  }

  String Selected_Remind = '1 day Before';
  void ChangeReminder(Object s,) {
    Selected_Remind = '$s';
    emit(ReminderChanged());
  }





}
