import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/todo_app/archive_tasks_screen.dart';
import '../../modules/todo_app/done_tasks_screen.dart';
import '../../modules/todo_app/new_tasks_screen.dart';


class AppCubit extends Cubit<TodoStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  late Database database;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  List<Widget> screens = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchiveTasksScreen()
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavigationBarState());
  }

  bool isBottomSheetShow = false;

  IconData fabIcon = Icons.edit;

  void iconChange({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fabIcon = icon;
    emit(AppIconChangeState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('Database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {})
            .catchError((error) {
          print('Error when creating table ${error.toString()}');
        });
        print('Table created');
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        emit(AppGetDatabaseState());
        print('Database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    }).catchError((error) {
      print('Error when Opening ${error.toString()}');
    });
  }

  Future insertDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")',
      ).then((value) {
        print('$value insert successfully');
        emit(AppInsertDatabaseState());
      });
    });
    getDataFromDatabase(database);
  }

 void getDataFromDatabase(database)  {
   emit(AppGetDatabaseLoadingState());
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new'){
          newTasks.add(element);
        }else if (
        element['status'] == 'done'
        ){
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });

  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value) {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
    });
  }
}
