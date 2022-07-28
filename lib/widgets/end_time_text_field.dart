
import 'package:flutter/material.dart';

import '../Components/components.dart';

Widget EndTimeTextField(TextEditingController controller,context) => Expanded(
  child: Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'End Time',
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
                  hint: '9:30 PM',
                ),
              ),
              IconButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialEntryMode: TimePickerEntryMode.input,
                    initialTime: TimeOfDay.now(),
                  ).then((value){
                    controller.text = value!.format(context).toString();
                  });
                },
                icon: Icon(
                  Icons.access_time_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  ),
);
