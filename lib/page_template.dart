import 'package:covid19/brasil_data.dart';
import 'package:covid19/header.dart';
import 'package:covid19/info_card.dart';
import 'package:covid19/info_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageTemplate extends StatefulWidget {
  @override
  _PageTemplateState createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  ScrollController _controller = ScrollController();
  double offset = 0;
  var response;

  Future<void> getData() async {
    print('getting data');
    response = await http
        .get('https://covid19-brazil-api.now.sh/api/report/v1/brazil');
    response.statusCode == 200
        ? print(response.body)
        : print(response.statusCode);
  }

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
                getData();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BrasilData()));
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
