import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project1algoriza/Components/components.dart';
import 'package:project1algoriza/pages/insert_task_page.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = TodoCubit.get(context);
        return Column(
          children: [
            MySeparetor(),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    BuildAllTasks(c.All_Tasks[index], c),
                separatorBuilder: (context, index) => Mydivider(),
                itemCount: c.All_Tasks.length,
              ),
            ),
            SizedBox(height: 5,),
            defaultButton(
              () {
                Navigateto(context, AddTask());
              },
              'Add Task',
              width: double.infinity,
              color: Colors.green,
              TextColor: Colors.white,
              TextFontSize: 20,
            ),
          ],
        );
      },
    );
  }
}

Widget BuildAllTasks(Map task, TodoCubit cubit) => Slidable(
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              cubit.UpdateDatabase(status: 'Completed', id: task['id']);
            },
            icon: Icons.check_circle,
            backgroundColor: Colors.green,
          ),
          SlidableAction(
            onPressed: (context) {
              cubit.UpdateDatabase(status: 'Uncompleted', id: task['id']);
            },
            icon: Icons.timer_outlined,
            backgroundColor: Colors.yellow,
          ),
          SlidableAction(
            onPressed: (context) {
              cubit.DeleteData(id: task['id']);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListTile(
                title: Text(
                  task['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.ischecked
                  ? cubit.UpdateDatabase(status: 'Favourite', id: task['id'])
                  : cubit.UpdateDatabase(status: 'new', id: task['id']);
            },
            icon: (task['status'] == 'Favourite'
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_border_outlined, color: Colors.grey)),
          ),
        ],
      ),
    );
