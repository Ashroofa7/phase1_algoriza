import 'package:flutter/material.dart';

import '../Components/components.dart';

Widget RepeatTextField(TextEditingController controller) => Container(child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Repeat',
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
              hint: 'Enter Your Deadline',
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 10,
    ),
  ],),
);
