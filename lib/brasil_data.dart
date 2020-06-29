import 'package:covid19/data_card.dart';
import 'package:flutter/material.dart';

class BrasilData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DataCard(
              title: 'Teste',
              text: 'Text',
            )
          ],
        ),
      ),
    );
  }
}
