import 'package:flutter/material.dart';
import 'package:covid19/constants.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final Function onTap;

  const InfoCard({Key key, this.image, this.title, this.text, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: this.onTap,
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
              SizedBox(width: 10.0),
              Image.asset(this.image),
              SizedBox(width: 35.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    this.title,
                    style: TextStyle(fontSize: 20, fontFamily: 'Dosis'),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    child: Text(
                      this.text,
                      style: TextStyle(fontSize: 17, fontFamily: 'Dosis'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
