import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project1algoriza/Components/components.dart';
import 'package:project1algoriza/pages/insert_task_page.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';
import 'package:project1algoriza/widgets/date_text_field.dart';


class Schedule extends StatelessWidget {
  DateTime date = DateTime.now();
  DatePickerController controller= DatePickerController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
        listener: (contexxt, state) {},
        builder: (Context, state) {
          var cubit =TodoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: const Text(
                'Schedule',
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildDateTime(),
                    const SizedBox(
                      height: 10,
                    ),
                    Mydivider(),
                    BuildDatePicker(date,context,controller),
                    const SizedBox(
                      height: 10,
                    ),
                    Mydivider(),
                    const SizedBox(
                      height: 10,
                    ),
                    if(date== controller)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index)=>
                              BuildTasksScheduled(TodoCubit.get(context).Scheduled_Tasks[index]),
                            separatorBuilder: (context, index) => MySeparetor(),
                            itemCount: TodoCubit.get(context).Scheduled_Tasks.length,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget BuildDateTime() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(
                DateTime.now(),
              ),
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Today',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
Widget BuildDatePicker(DateTime dateTime,context,controller) => Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Container(
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 60,
          controller: controller,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blueAccent,
          selectedTextColor: Colors.white,
          dayTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          dateTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          monthTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          onDateChange: (value) {
            dateTime=value;
           // TodoCubit.get(context).getScheuduleController(value);
          },
        ),
      ),
    );

Widget BuildTasksScheduled(Map task) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
      height: 85,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${task['startTime']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${task['title']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
