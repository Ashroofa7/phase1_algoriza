import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1algoriza/Components/components.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';

class UncompletedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = TodoCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    BuildCompletedTasks(c.Uncompleted_Tasks[index], c),
                separatorBuilder: (context, index) =>Mydivider(),
                itemCount: c.Uncompleted_Tasks.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget BuildCompletedTasks(Map task, TodoCubit cubit) => Row(
  children: [
    Text(
      task['title'],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
);
