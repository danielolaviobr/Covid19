import 'package:covid19/constants.dart';
import 'package:flutter/material.dart';

class BasicContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const BasicContainer({Key key, this.height, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 20,
                color: kActiveShadowColor,
              )
            ],
            borderRadius: BorderRadius.circular(50.0)),
        width: double.infinity,
        height: this.height,
        child: this.child,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
