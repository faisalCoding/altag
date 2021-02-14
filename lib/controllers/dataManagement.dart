import 'package:dio/dio.dart';
import 'fetchData.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';

class DataManagement {
  Future<List<dynamic>> fetchData(String md5) async {
    var conn = await _isConnected();
    if (conn) {
      Dio dioFetchData = dio();
      Response fetch = await dioFetchData.get('/info/' + md5);
      Map fetchres = json.decode(fetch.toString());

      print('in if condation');

      if (fetchres.containsKey('update') &&
          fetchres['update'] == "no update  avalble") {
        return jsonDecode(
            (await prefs()).getString("srusents_cards_state"))['data'];
      }

      saveLoacally(fetch.toString(), fetchres['md5'].toString());
      return fetchres['data'];
    } else {
      if ((await prefs()).containsKey('srusents_cards_state')) {
        return jsonDecode(
            (await prefs()).getString("srusents_cards_state"))['data'];
      }
    }
    print('in no internet');

    return [
      {'networkAvailable': 'no'}
    ];
  }

  //public get data-------------------------------------------------------------

  Future<List<dynamic>> getStudenStCardState() async {
    if ((await prefs()).containsKey('md5')) {
      return fetchData((await prefs()).getString('md5'));
    }
    return fetchData(" ");
  }

  Future<Map> getMainMinState() async {
    var conn = await _isConnected();
    if (conn) {
      Dio dioFetchData = dio();
      Response fetchMcount = await dioFetchData.get('/tcount');
      Map fetchres = json.decode(fetchMcount.toString());

      saveLoacallyMainMin(fetchMcount.toString());

      return fetchres;
    } else {
      if ((await prefs()).containsKey('MainMin')) {
        return jsonDecode((await prefs()).getString("MainMin"));
      }
    }

    return {'tcoun': 0, 'mcount': "0"};
  }

  Future<Map> getTrendState() async {
    var conn = await _isConnected();
    if (conn) {
      Dio dioFetchData = dio();
      Response fetchTrend = await dioFetchData.get('/trend');

      Map fetchres;
      if (fetchTrend.toString() != '') {
        fetchres = json.decode(fetchTrend.toString());
      } else {
        fetchres = Map();
      }

      saveLoacallyMainMin(fetchTrend.toString());

      return fetchres;
    } else {
      if ((await prefs()).containsKey('trend') &&
          (await prefs()).containsKey('trend').toString() != '') {
        return jsonDecode((await prefs()).getString("trend"));
      }
    }

    return {'name': '______________'};
  }

  //###########################################

  // -------------------------SAVE data in user divce---------------------------
  void saveLoacally(String data, String md5) async {
    await (await prefs()).setString('srusents_cards_state', data);
    await (await prefs()).setString('md5', md5);
  }

  void saveLoacallyMainMin(String data) async {
    await (await prefs()).setString('MainMin', data);
  }

  void saveLoacallyTrend(String data) async {
    await (await prefs()).setString('trend', data);
  }
  //####################################

// -----------------------------functions init----------------------------------
  Future<bool> _isConnected() async =>
      await Connectivity().checkConnectivity() == ConnectivityResult.mobile ||
      await Connectivity().checkConnectivity() == ConnectivityResult.wifi;
}

Future<SharedPreferences> prefs() async {
  return await SharedPreferences.getInstance();
}
