import 'package:flutter/material.dart';

insurenceDatePicker({context,controller})async{
  final DateTime? selectedDate= await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),);

  if(selectedDate !=null){
    controller.text="${selectedDate.toLocal()}".split(' ')[0];
  }

}