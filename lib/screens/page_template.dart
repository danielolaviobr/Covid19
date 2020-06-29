import 'package:covid19/screens/brasil_data.dart';
import 'package:covid19/widgets/header.dart';
import 'package:covid19/widgets/info_card.dart';
import 'package:covid19/widgets/info_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTemplate extends StatefulWidget {
  @override
  _PageTemplateState createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  ScrollController _controller = ScrollController();
  double offset = 0;
  var response;

  @override
  void initState() {
    _controller.addListener(() => setState(
        () => offset = (_controller.hasClients) ? _controller.offset : 0));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.max,
          children: [
            Header(offset: offset),
            SizedBox(height: 20),
            InfoSlider(),
            InfoCard(
              image: 'assets/images/mask_girl.png',
              title: 'Atenção',
              text: 'Lembre de sempre usar mascara e lavar bem as mãos',
            ),
            InfoCard(
              image: 'assets/images/mask_girl.png',
              title: 'Dados',
              text: 'Veja aqui os dados sobre o Corona Virus no Brasil',
              onTap: () {
                Get.to(BrasilData());
              },
            ),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
