import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Components/components.dart';

DateTime startdateTime = DateTime.now();

Widget StartTimeTextField(TextEditingController controller, context) =>
    Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start Time',
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
                      hint:
                          '${DateFormat("hh:mm a").format(DateTime.now()).toString()}',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialEntryMode: TimePickerEntryMode.input,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {

                      controller.text = value!.format(context).toString();
                      });
                    },
                    icon: Icon(
                      Icons.access_time_outlined,
                      color: Colors.green,
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
