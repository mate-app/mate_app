import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({
    Key key,
    this.message = "Ein Fehler ist aufgetreten",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
