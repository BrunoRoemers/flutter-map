import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text('Hello World!',
        style: TextStyle(fontSize: 30, color: theme.colorScheme.primary));
  }
}
