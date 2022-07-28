import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1algoriza/Components/components.dart';
import 'package:project1algoriza/Components/notifications.dart';
import 'package:project1algoriza/Components/notifications.dart';
import 'package:project1algoriza/home_page/home.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';

import '../widgets/date_text_field.dart';
import '../widgets/deadline_text_field.dart';
import '../widgets/end_time_text_field.dart';
import '../widgets/remind_text_field.dart';
import '../widgets/start_time_text_field.dart';
import '../widgets/title_text_field.dart';
TextEditingController DateController = TextEditingController();

class AddTask extends StatelessWidget {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DeadlineController = TextEditingController();
  TextEditingController StartTimeController = TextEditingController();
  TextEditingController EndTimeController = TextEditingController();
  TextEditingController RemindController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextField(TitleController),
                        DateTextField(DateController, context),
                        Row(
                          children: [
                            StartTimeTextField(StartTimeController, context),
                            SizedBox(
                              width: 10,
                            ),
                            EndTimeTextField(EndTimeController, context),
                          ],
                        ),
                        DeadlineTextField(DeadlineController, context),
                        RemindTextField(RemindController, context),
                        //RepeatTextField(RepeatController),
                        SizedBox(
                          height: 60,
                        ),
                        defaultButton(
                              () {
                            if ((TitleController.text != "" &&
                                TitleController.text != null) &&
                                (DateController.text != "" &&
                                    DateController.text != null) &&
                                (StartTimeController.text != "" &&
                                    StartTimeController.text != null) &&
                                (EndTimeController.text != "" &&
                                    EndTimeController.text != null) &&
                                (DeadlineController.text != "" &&
                                    DeadlineController.text != null)&&
                                (RemindController.text != "" &&
                                    RemindController.text != null)
                            ) {
                              TodoCubit.get(context).InsertToDatabase(
                                title: TitleController.text,
                                date: DateController.text,
                                startTime: StartTimeController.text,
                                endTime: EndTimeController.text,
                                deadline: DeadlineController.text,
                                remind: RemindController.text,

                              );
                              if (RemindController.text == '1 day Before') {
                                LocalNotifications.ReceivedNotification(
                                    ScheduledDate: startdateTime.subtract(
                                        Duration(days: 1)));
                              } else if (RemindController.text ==
                                  '1 hour Before') {
                                LocalNotifications.ReceivedNotification(
                                    ScheduledDate: startdateTime.subtract(
                                        Duration(hours: 1)));
                              } else if (RemindController.text ==
                                  '30 minutes Before') {
                                LocalNotifications.ReceivedNotification(
                                    ScheduledDate: startdateTime.subtract(
                                        Duration(minutes: 30)));
                              } else if
                                (RemindController.text ==
                                  '5 minutes Before')
                              {
                                LocalNotifications.ReceivedNotification(
                                    ScheduledDate: startdateTime.subtract(
                                        Duration(minutes: 5)));
                              }

                              Navigateandfinish(context, Home());
                            } else {
                              return Toasts(
                                state: ToastsState.Error,
                                message: 'There\'s something missing',
                              );
                            }
                          },
                          'Add Task',
                          color: Colors.green,
                          width: double.infinity,
                          radius: 10,
                          TextColor: Colors.white,
                          TextFontSize: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
