import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionRepository {
  final String _baseUrl =
      "https://api-sandbox.renmoney.com/deposit-transfer/api/v3/investment/3580016662/transactions";

  Future<TransactionModel> getTransaction() async {
    final response = await http.get(Uri.parse(_baseUrl), headers: {
      'Accept': 'application/json',
      "sourceappid": "ckpu7zo0p0000gg5436coo7xs",
      HttpHeaders.authorizationHeader:
          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ4NjU0OTI1LCJleHAiOjE2NDg3NDEzMjV9.o3VXlAKnHmt_DLv2gQZ9GsLhSsCSIDlOcepGtmG07omgtNXROz8tKY7eyYIv3LH0U0DGBTPLxVS_OAuL_UZ5Nw"
    });
    if (response.statusCode == 200) {
      final result = transactionModelFromJson(response.body);
      log(result.message.toString());
      return result;
    } else {
      throw Exception("Failed to load transaction");
    }
  }
}

Future<TransactionModel> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/result.json');
  final result = transactionModelFromJson(response);
  log(result.message.toString());
  return result;
}
