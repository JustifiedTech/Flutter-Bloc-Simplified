import 'package:flutter/material.dart';
import 'package:new_app/utils/config/constants.dart';
import 'package:new_app/utils/config/size_config.dart';

import '../models/transaction_model.dart';
import '../utils/date_formatter.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key, required this.transactionData})
      : super(key: key);
  final ClientTransactions transactionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkpurple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkpurple,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(30),
              left: getProportionateScreenWidth(21),
              right: getProportionateScreenWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaction details',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: getProportionateScreenHeight(369),
                width: getProportionateScreenWidth(334),
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(36),
                  left: getProportionateScreenWidth(16),
                  right: getProportionateScreenWidth(21),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detailed summary of transaction',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: kPurple,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                    row('Transaction ID',
                        transactionData.transactionId.toString()),
                    row('Amount', '₦${transactionData.amount}'),
                    row(
                        'Transaction date',
                        DateFormatter.parseToDay(
                            transactionData.entryDate ?? '')),
                    // row('Comment',
                    //     '${transactionData.comment?.split(":").last}'),
                    row('Balance', transactionData.balance.toString()),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Row row(String key, String value, {Color color = kBlack}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key, style: textStyle(14, color: kGrey)),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 5,
          style: textStyle(15, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
