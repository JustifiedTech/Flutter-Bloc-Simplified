import 'package:flutter/material.dart';
import 'package:new_app/models/transaction_model.dart';

import '../user_interface/all_transactions.dart';
import '../user_interface/error.dart';
import '../user_interface/transaction_details.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case allTransactions:
        return MaterialPageRoute(builder: (context) => const AllTransactions());
      case transactionDetail:
        final data = settings.arguments as ClientTransactions;

        return MaterialPageRoute(
            builder: (context) => TransactionDetails(
                  transactionData: data,
                ));
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }

  static const String allTransactions = '/all_transactions';
  static const String transactionDetail = '/transaction_detail';
}
