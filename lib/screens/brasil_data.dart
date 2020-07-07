import 'package:covid19/widgets/basic_container.dart';
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
  List<int> dataList = [];

  Future<List<int>> getGraphData(selected) async {
    return dataList = await apiData
        .getPastWeekData(selected != 'Brasil' ? selected : 'Rio de Janeiro');
  }

  void updateData(value) async {
    setState(() {
      selected = value;
      getGraphData(value);
      waitData = value != 'Brasil'
          ? apiData.StateCurrentData(value)
          : apiData.countryCurrentData();
    });
  }

  @override
  void initState() {
    getGraphData(selected);
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
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: BasicContainer(
                              child: Column(
                                children: [
                                  Text(
                                    'Mortes nos ultimos 7 dias',
                                    style: TextStyle(
                                        fontSize: 30, fontFamily: 'Dosis'),
                                  ),
                                  FutureBuilder(
                                      future: getGraphData(selected),
                                      builder: (_, dataSnapshot) {
                                        var oldData = dataSnapshot.data;
                                        return dataSnapshot.hasData
                                            ? Chart(dataList: dataList)
                                            : Center(
                                                child:
                                                    CircularProgressIndicator());
                                      }),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(height: 30),
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
