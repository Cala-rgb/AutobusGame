import 'package:autobus_game/shared/textstyles.dart';
import 'package:flutter/material.dart';

class ExtremeMode extends StatefulWidget {
  const ExtremeMode({super.key});

  @override
  State<ExtremeMode> createState() => _ExtremeModeState();
}

class _ExtremeModeState extends State<ExtremeMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extreme Mode",
          style: CustomTextStyle.customText,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Container(

      ),
    );
  }
}
