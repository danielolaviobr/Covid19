import 'package:flutter/material.dart';
import 'package:covid19/constants.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String text;
  final Function onTap;

  const DataCard({Key key, this.title, this.text, this.onTap})
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
                color: Colors.red.withOpacity(0.5),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.8),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.withOpacity(0.5),
                  ),
                ),
              ),
            ),
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
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
