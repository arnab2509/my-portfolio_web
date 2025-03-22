import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      color: Colors.black87,
      child: Center(
        child: Text(
          '© ${DateTime.now().year} Arnab Mondal. All rights reserved.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
} 