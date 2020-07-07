import 'dart:convert';
import 'package:covid19/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiData extends GetxController {
  http.Response _response;
  var _data;
  List<int> dates = [];

  // ignore: missing_return
  Future<Map<String, int>> countryCurrentData() async {
    try {
      _response = await http
          .get('https://covid19-brazil-api.now.sh/api/report/v1/brazil');
      _response.statusCode == 200
          ? _data = await jsonDecode(_response.body)
          : print(_response.statusCode);
      if (_data != {'data': []} && _data != null) {
        print(_data);
        return {
          'confirmedCases': _data['data']['confirmed'],
          'deaths': _data['data']['deaths'],
          'recovered': _data['data']['recovered'],
        };
      } else {
        return {
          'confirmedCases': 0,
          'deaths': 0,
          'recovered': 0,
        };
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, int>> StateCurrentData(String state) async {
    String stateCode = stateCatcher(state);
    try {
      _response = await http.get(
          'https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/$stateCode');
      _response.statusCode == 200
          ? _data = await jsonDecode(_response.body)
          : print(_response.statusCode);
      if (_data != null) {
        //print(_data);
        print(_data);
        return {
          'confirmedCases': _data['cases'],
          'deaths': _data['deaths'],
        };
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<int> StateHistoricalData(day, month, year, state) async {
    try {
      String _monthStr = month < 10 ? "0$month" : "$month";
      String _dayStr = day < 10 ? "0$day" : "$day";
      _response = await http.get(
          'https://covid19-brazil-api.now.sh/api/report/v1/brazil/$year$_monthStr$_dayStr');

      _response.statusCode == 200
          ? _data = await jsonDecode(_response.body)
          : print(_response.statusCode);
      if (_data != null) {
        for (int a = 0; a <= _data['data'].length; a++) {
          if (_data['data'][a]['state'] == state) {
            return _data['data'][a]['deaths'];
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<int>> getPastWeekData(state) async {
    int _currentDay = DateTime.now().day;
    int _currentMonth = DateTime.now().month;
    int _currentYear = DateTime.now().year;
    int _month = _currentMonth;
    List<int> returningList = [];
    for (int i = 0; i < 7; i++) {
      if (_currentDay <= 1) {
        _month = _currentMonth - 1;
        if (k31DaysMonths.contains(_month)) {
          _currentDay = 31;
        } else if (_currentMonth == 2) {
          _currentDay = 29;
        } else {
          _currentDay = 30;
        }
      }
      int _day = _currentDay - i;

      await StateHistoricalData(_day, _month, _currentYear, state)
          .then((value) {
        returningList.add(value ?? 0);
      });

      // print(returningList);
    }
    print(returningList);
    return returningList;
  }

  List<int> pastSevenDays() {
    int _currentDay = DateTime.now().day;
    int _currentMonth = DateTime.now().month;
    int _currentYear = DateTime.now().year;
    int _month = _currentMonth;
    dates = [];
    for (int i = 0; i < 7; i++) {
      if (_currentDay <= 1) {
        _month = _currentMonth - 1;
        if (k31DaysMonths.contains(_month)) {
          _currentDay = 31;
        } else if (_currentMonth == 2) {
          _currentDay = 29;
        } else {
          _currentDay = 30;
        }
      }
      int _day = _currentDay - i;
      dates.add(_day);
    }
    return dates;
  }

  String stateCatcher(String state) {
    switch (state) {
      case 'Rio de Janeiro':
        return 'rj';
        break;
      case 'Sao Paulo':
        return 'sp';
        break;
      case 'Acre':
        return 'ac';
        break;
      case 'Alagoas':
        return 'al';
        break;
      case 'Amazonas':
        return 'am';
        break;
      case 'Bahia':
        return 'ba';
        break;
      case 'Ceará':
        return 'ce';
        break;
      case 'Brasilia':
        return 'df';
        break;
      case 'Espirito Santo':
        return 'es';
        break;
      case 'Goaiás':
        return 'go';
        break;
      case 'Maranhão':
        return 'ma';
        break;
      case 'Mato Grosso':
        return 'mt';
        break;
      case 'Mato Grosso do Sul':
        return 'ms';
        break;
      case 'Minas Gerais':
        return 'mg';
        break;
      case 'Pará':
        return 'pa';
        break;
      case 'Paraíba':
        return 'pb';
        break;
      case 'Parana':
        return 'pr';
        break;
      case 'Pernambuco':
        return 'pe';
        break;
      case 'Piauí':
        return 'pi';
        break;
      case 'Rio Grande do Norte':
        return 'rn';
        break;
      case 'Rio Grande do Sul':
        return 'rs';
        break;
      case 'Rondônia':
        return 'ro';
        break;
      case 'Roraima':
        return 'rr';
        break;
      case 'Santa Catarina':
        return 'sc';
        break;
      case 'Sergipe':
        return 'se';
        break;
      case 'Tocantins':
        return 'to';
        break;
      default:
        return '';
        break;
    }
  }
}
