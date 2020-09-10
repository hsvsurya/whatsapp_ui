import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No Calls'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_call),
        onPressed: () {},
      ),
    );
  }
}
