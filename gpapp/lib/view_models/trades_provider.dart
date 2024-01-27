import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../models/trade_model.dart';
import '../utils/api/endpoints.dart';
import '../utils/api/key.dart';

class TradeProvider extends ChangeNotifier {
  bool loading = false;
  final List<StockModel> trades = <StockModel>[];

  List<StockModel> get tradeItems {
    return [...trades];
  }

  Future<void> fetchAndSetTradeItems(String symbol) async {
    //fetch company stocks by company symbol

    loading = true;
    notifyListeners();
    final url = '${Endpoints.baseURL}/tickers/$symbol/eod?access_key=$apiKey';
    final response = await http.get(Uri.parse(url));
    final responseData = jsonDecode(response.body);

    var body = responseData["data"]["eod"];
    for (var stockItem in body) {
      trades.add(StockModel.fromJson(stockItem));
    }
    loading = false;
    notifyListeners();
    // ignore: unused_local_variable
    for (var compItem in trades) {}
    notifyListeners();
  }

  removeFromList(index) {
    tradeItems.removeAt(index);
    notifyListeners();
  }
}
