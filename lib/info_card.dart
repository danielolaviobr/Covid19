import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19/constants.dart';

class InfoCard extends StatelessWidget {
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
        height: 150,
        child: Row(
          children: [
            SvgPicture.asset('assets/images/mask_girl.png'),
          ],
        ),
      ),
    );
  }
}
