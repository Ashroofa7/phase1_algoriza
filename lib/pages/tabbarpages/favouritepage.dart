import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';

import '../../Components/components.dart';

class FavouriteTasks extends StatelessWidget {
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
                    BuildCompletedTasks(c.Favourites_Tasks[index], c),
                separatorBuilder: (context, index) => Mydivider(),
                itemCount: c.Favourites_Tasks.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget BuildCompletedTasks(Map task, TodoCubit cubit) => Slidable(
  endActionPane: ActionPane(
    motion: DrawerMotion(),
    children: [
      SlidableAction(
        onPressed: (context) {},
        icon: Icons.check_circle,
        backgroundColor: Colors.green,
      ),
      SlidableAction(
        onPressed: (context) {},
        icon: Icons.timer_outlined,
        backgroundColor: Colors.yellow,
      ),
      SlidableAction(
        onPressed: (context) {},
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

          cubit.ischecked?
          cubit.UpdateDatabase(status: 'Favourite', id: task['id']):
          cubit.UpdateDatabase(status: 'new', id: task['id']);
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
