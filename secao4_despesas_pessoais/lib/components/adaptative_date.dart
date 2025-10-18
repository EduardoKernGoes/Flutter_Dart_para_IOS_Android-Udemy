import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AdaptativeDate extends StatelessWidget {
  final DateTime? selectedDate;
  final Function (DateTime) onDateChanged;

  AdaptativeDate(this.selectedDate, this.onDateChanged);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }
      
      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
      Container(
        height: 180,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          minimumDate: DateTime(2024),
          maximumDate: DateTime.now(),
          onDateTimeChanged: onDateChanged,
        ),
      )
      :
      Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              selectedDate == null ?
              'Nenhuma Data selecionada'
              :
              DateFormat('dd/MM/y').format(selectedDate!),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            TextButton(
              onPressed: () => _showDatePicker(context),
              child: Text(
                'Selecionar Data',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
  }
}