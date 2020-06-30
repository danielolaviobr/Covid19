import 'package:flutter/material.dart';
import 'package:covid19/constants.dart';

class InfoSliderItem extends StatelessWidget {
  final String text;
  final String image;

  const InfoSliderItem({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                ],
                borderRadius: BorderRadius.circular(25.0)),
            width: 180.0,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150, child: Image.asset(this.image)),
                Text(
                  this.text,
                  style: TextStyle(fontSize: 20, fontFamily: 'Dosis'),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSlider extends StatefulWidget {
  @override
  _InfoSliderState createState() => _InfoSliderState();
}

class _InfoSliderState extends State<InfoSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Sintomas',
              style: TextStyle(
                fontFamily: 'Dosis',
                fontSize: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 230,
          child: ListView.builder(
            itemCount: kImageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: InfoSliderItem(
                  image: kImageList[index],
                  text: kTextList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
