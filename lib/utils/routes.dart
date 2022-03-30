import 'package:flutter/material.dart';

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
        return MaterialPageRoute(
            builder: (context) => const TransactionDetails());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }

  static const String allTransactions = '/all_transactions';
  static const String transactionDetail = '/transaction_detail';
}
