import 'package:flutter/material.dart';
import 'package:project1algoriza/todo_cubit/todo_cubit.dart';

import '../Components/components.dart';


List<String> RemindList = [
  '1 day Before',
  '1 hour Before',
  '30 minutes Before',
  '5 minutes Before',
];


Widget RemindTextField(TextEditingController controller,context) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Remind',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Row(
              children: [
                Expanded(
                  child: defaultTextFiled(
                    controllerr: controller,
                    type: TextInputType.text,
                    hint: TodoCubit.get(context).Selected_Remind,
                    style: TextStyle(
                      color: Colors.black,
                    )
                  ),
                ),
              DropDownWidget(context,controller),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );

Widget DropDownWidget(context,controller) => DropdownButton(
  items: RemindList.map<DropdownMenuItem<String>>(
          (String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
  onChanged: (s) {
    TodoCubit.get(context).ChangeReminder(s!);
    controller.text = TodoCubit.get(context).Selected_Remind;
  },
  elevation: 4,
  borderRadius: BorderRadius.zero,
  iconSize: 30,
  isExpanded: false,
  underline: Container(height: 0,),
  icon: const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,),);
