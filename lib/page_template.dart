import 'package:covid19/header.dart';
import 'package:covid19/info_card.dart';
import 'package:covid19/info_slider.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatefulWidget {
  @override
  _PageTemplateState createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  ScrollController _controller = ScrollController();
  double offset = 0;

  void onScroll() {
    setState(() => offset = (_controller.hasClients) ? _controller.offset : 0);
  }

  @override
  void initState() {
    _controller.addListener(() => onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Header(offset: offset),
          SizedBox(height: 20),
          InfoSlider(),
          InfoCard(),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
