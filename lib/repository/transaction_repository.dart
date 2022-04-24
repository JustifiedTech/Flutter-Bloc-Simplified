import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionRepository {
  final String _baseUrl = '';

  Future<TransactionModel> getTransaction() async {
    final response = await http.get(Uri.parse(_baseUrl), headers: {
      'Accept': 'application/json; charset=utf-8',
   
      HttpHeaders.authorizationHeader:
          "Bearer "
    });
    if (response.statusCode == 200) {
      final result = transactionModelFromJson(response.body);
      log(result.message.toString());
      return result;
    } else {
      throw Exception("Failed to load transaction");
    }
  }

  Future<TransactionModel> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/result.json');
    final result = transactionModelFromJson(response);
    return result;
  }
}

Future<TransactionModel> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/result.json');
  final result = transactionModelFromJson(response);
  return result;
}
