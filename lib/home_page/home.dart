import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1algoriza/Components/components.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';
import 'package:project1algoriza/todo_cubit/todo_states.dart';

import '../pages/schedule_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = TodoCubit.get(context);
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 20,
              title: Text(
                'Board',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(onPressed: (){
                    Navigateto(context,Schedule() );
                  }, icon:Icon( Icons.calendar_month,color: Colors.red,),),
                ),
              ],
              bottom: TabBar(
               // indicatorPadding: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: BouncingScrollPhysics(),
                indicatorColor: Colors.black54,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: c.Tabs,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: TabBarView(
                children: c.TabPages,
              ),
            ),
          ),
        );
      },
    );
  }
}
