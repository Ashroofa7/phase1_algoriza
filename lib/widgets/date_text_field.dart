import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Components/components.dart';

DateTime dateTime1 = DateTime.now();

Widget DateTextField(TextEditingController controller,context) =>
    Container(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
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
                  hint: 'Enter Your Date',
                ),
              ),
              IconButton(onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2100),).then((value) {
                    dateTime1 = value!;
                    controller.text= DateFormat.yMd().format(value);
                  });
              },
                icon: Icon(
                  Icons.calendar_month_outlined, color: Colors.grey,),),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],),
    );
