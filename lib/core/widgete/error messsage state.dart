import 'package:flutter/material.dart';

class ErrorMessageState extends StatelessWidget {
  const ErrorMessageState({super.key,required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}
