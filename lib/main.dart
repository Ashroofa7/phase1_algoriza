


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1algoriza/Components/components.dart';
import 'package:project1algoriza/pages/insert_task_page.dart';
import 'package:project1algoriza/pages/schedule_page.dart';
import 'package:project1algoriza/shared/styles/themes.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/widgets/date_text_field.dart';
import 'Components/notifications.dart';
import 'bloc/mybloc.dart';
import 'home_page/home.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  BlocOverrides.runZoned(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      tz.initializeTimeZones();
      LocalNotifications.init();
      onClickNotification();
      print(dateTime1);
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

void onClickNotification() {
  void onClickNotification(String? payload) {}
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..CreateDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: Home(),
      ),
    );
  }
}
