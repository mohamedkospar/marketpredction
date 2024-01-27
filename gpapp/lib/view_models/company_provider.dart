// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/company_model.dart';
import '../utils/api/endpoints.dart';

class CompanyProvider extends ChangeNotifier {
  final List<CompanyData> companies = <CompanyData>[];

  List<CompanyData> get companyItems {
    return [...companies];
  }

  Future<void> fetchAndSetCompanyItems() async {
    //fetch companies

    final url = Endpoints.companyURL;
    final response = await http.get(Uri.parse(url));
    final responseData = jsonDecode(response.body);
    companies.clear();
    for (var compItem in responseData["data"]) {
      companies.add(CompanyData.fromJson(compItem));
    }

    // ignore: unused_local_variable
    for (var compItem in companies) {}
    notifyListeners();
  }

  removeFromList(index) {
    companyItems.removeAt(index);
    notifyListeners();
  }
}
