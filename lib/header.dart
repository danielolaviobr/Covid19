import 'package:covid19/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class Header extends StatelessWidget {
  final offset;
  Header({this.offset});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PathClipper(),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF005C97), Color(0xFF363795)],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.85, -0.35),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: SvgPicture.asset(
                  kVirus,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.9, -0.7),
              child: Transform.rotate(
                angle: 1.5 * math.pi,
                child: SvgPicture.asset(
                  kVirus,
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            Positioned(
              top: (this.offset < 0) ? 20 : this.offset,
              child: Container(
                padding: EdgeInsets.only(top: 30),
                height: 300,
                //width: 300,
                child: SvgPicture.asset('assets/svg/sick.svg'),
              ),
            ),
            Positioned(
              top: (this.offset < 0) ? 20 : this.offset / 2,
              child: Text(
                'Covid-19',
                style: kHeaderTitle,
              ),
            ),
            Align(
              alignment: Alignment(0.3, 0.5),
              child: Transform.rotate(
                angle: math.pi / 4,
                child: SvgPicture.asset(
                  kVirus,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
