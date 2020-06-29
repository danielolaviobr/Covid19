import 'package:covid19/widgets/data_card.dart';
import 'package:covid19/main.dart';
import 'package:covid19/widgets/drop_list.dart';
import 'package:covid19/widgets/graph.dart';
import 'package:flutter/material.dart';

class BrasilData extends StatefulWidget {
  @override
  _BrasilDataState createState() => _BrasilDataState();
}

class _BrasilDataState extends State<BrasilData> {
  Future<Map<String, int>> waitData = apiData.countryCurrentData();
  bool checker = false;
  String selected = 'Brasil';

  Widget graphic() {
    if (checker) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: BarChartSample3());
    } else {
      return SizedBox(height: 10);
    }
  }

  void updateData(value) async {
    setState(() {
      selected = value;
      waitData = value == 'Rio de Janeiro'
          ? apiData.RioCurrentData()
          : apiData.countryCurrentData();
    });

    //waitData = apiData.RioCurrentData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: waitData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DropList(onChange: updateData),
                    DataCard(
                      title: 'Mortes',
                      text: '${snapshot.data['deaths'] ?? 'carregando'}',
                      color: Colors.red,
                    ),
                    DataCard(
                      title: 'Casos Confirmados',
                      text:
                          '${snapshot.data['confirmedCases'] ?? 'carregando'}',
                      color: Colors.orange,
                    ),
                    selected == 'Brasil'
                        ? DataCard(
                            title: 'Casos Recuperados',
                            text:
                                '${snapshot.data['recovered'] ?? 'carregando'}',
                            color: Colors.blue,
                          )
                        : SizedBox(height: 10),
                    SizedBox(height: 30),
                    graphic(),
                    SizedBox(height: 300)
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
