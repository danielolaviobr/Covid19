import 'package:flutter/material.dart';
import 'package:covid19/constants.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String text;
  final Color color;

  const DataCard({Key key, this.title, this.text, this.color})
      : super(key: key);
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
            SizedBox(width: 35.0),
            Container(
              padding: EdgeInsets.all(5),
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: this.color.withOpacity(0.5),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(width: 4, color: this.color)),
              ),
            ),
            SizedBox(width: 35.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  this.title,
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'Dosis', color: this.color),
                ),
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    width: 250,
                    child: Text(
                      this.text,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Dosis',
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
