import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextFormFiled(
        {required TextEditingController controllerr,
        required TextInputType type,
        VoidCallback? suffixpresed,
        ValueChanged<String>? change,
        ValueChanged? submit,
        bool ispassword = true,
        required FormFieldValidator<String>? valid,
        OutlineInputBorder? border,
        IconData? suffix,
        IconData? prefix,
         String? label,
        Widget? widget,
        Color? color1,
        Color? color2,
        double radius = 0.0,
        required FontWeight fontw,
        required double fonts,
        TextStyle? style}) =>
    TextFormField(
      style: style,
      readOnly: widget==null?false:true,
      keyboardType: type,
      controller: controllerr,
      onChanged: change,
      onFieldSubmitted: submit,
      obscureText: ispassword,
      validator: valid,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        prefixIcon: Icon(
          prefix,
          color: color2,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: suffixpresed,
              )
            : null,
        label: Text(
          '',
          style: TextStyle(
            color: color1,
            fontSize: fonts,
            fontWeight: fontw,
          ),
        ),
      ),
    );



Widget defaultTextFiled(
    {required TextEditingController controllerr,
      required TextInputType type,
      VoidCallback? suffixpresed,
      ValueChanged<String>? change,
      ValueChanged? submit,
      bool ispassword = false,
      OutlineInputBorder? border,
      IconData? suffix,
      IconData? prefix,
      String? label,
      bool read = true,
      bool show = false,
      Color? color1,
      Color? color2,
      required String? hint,
      double radius = 0.0,
      Widget? widget,
      TextStyle? style}) =>
    TextField(
      cursorColor: Colors.grey[800],
      readOnly: read,
      showCursor: show,
      style: style,
      keyboardType: type,
      controller: controllerr,
      onChanged: change,
      obscureText: ispassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        hintText: hint,
        hintStyle:TextStyle(
          color: Colors.grey[500],
        ),

      ),
    );



Future Navigateto(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
);

Future Navigateandfinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget Mydivider() => Container(
  width: double.infinity,
  height: 1,
  color: Colors.black,
);

void Toasts({
  required ToastsState state,
  required var message,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: enumcolor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastsState { Success, Warning, Error }

Color enumcolor(ToastsState state) {
  Color color;
  switch (state) {
    case ToastsState.Success:
      color = Colors.green;
      break;
    case ToastsState.Warning:
      color = Colors.amber;
      break;
    case ToastsState.Error:
      color = Colors.red;
      break;
  }
  return color;
}

String token = "";

Widget defaultwidthButton(
  VoidCallback? fun,
  String text, {
  double size = 25,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      color: Colors.deepOrange,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: Colors.white,
          ),
        ),
        onPressed: fun,
      ),
    );

Widget defaultButton(
  VoidCallback? fun,
  String text, {
  double TextFontSize = 20,
  double? width,
  Color? color,
  double radius=10,
  Color? TextColor,
}) =>
    Container(
      width: width,
      alignment:Alignment.bottomCenter ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,

      ),
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: TextFontSize,
            color: TextColor,
          ),
        ),
        onPressed: fun,
      ),
    );

String uId = "";

AppBar defaultAppBar({
  IconData? iconB,
  IconData? iconLe,
  Text? text,
  Text? textB,
  VoidCallback? onpA,
  VoidCallback? onpLe,
}) =>
    AppBar(
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MaterialButton(
            onPressed: onpA,
            child: textB,
          ),
        ),
      ],
      title: text,
      leading: IconButton(
        onPressed: onpLe,
        icon: Icon(iconLe),
      ),
    );

Widget MySeparetor()=> SizedBox(
  height: 8,);
