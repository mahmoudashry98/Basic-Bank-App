import 'package:flutter/material.dart';

Widget defaultFloatButton({
  required String text,
  context,
  required Function function,

}){
  return FlatButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
    color: Colors.deepPurple,
    onPressed: (){
      function();
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );

Widget defaultTextForm({
  required String labelText,
  required String hintText,
  TextInputType? keyboardType,
  FormFieldValidator<String>? validate,
  ValueChanged<String>? onSubmit,
  required TextEditingController controller,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,

}){
  return  TextFormField(
    controller: controller,
    onFieldSubmitted: onSubmit,
    validator: validate,
    keyboardType: keyboardType,
    obscureText: isPassword,
    decoration: InputDecoration(
      suffixIcon: suffix != null
          ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffix,
        ),
      )
          : null,
      labelText: labelText,
      hintText: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(28),
          gapPadding: 10
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(28),
          gapPadding: 10
      ),
    ),
  );
}