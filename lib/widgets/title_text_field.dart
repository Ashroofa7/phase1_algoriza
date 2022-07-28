import 'package:flutter/material.dart';

import '../Components/components.dart';

Widget TitleTextField(TextEditingController controller) => Container(child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Title',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    Container(
      height: 55,
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
              hint: 'Enter Your Title',
              read: false,
              show: true,
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
