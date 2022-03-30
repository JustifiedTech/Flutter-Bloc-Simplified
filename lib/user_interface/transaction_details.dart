import 'package:flutter/material.dart';
import 'package:new_app/utils/config/constants.dart';
import 'package:new_app/utils/config/size_config.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    Key? key,
  }) : super(key: key);

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
                height: getProportionateScreenHeight(349),
                width: getProportionateScreenWidth(334),
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(36),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(21)),
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
                    row('Recepient', 'John'),
                    row('Amount', '₦ 50,000'),
                    row('Transaction date', '23rd Oct. 2020'),
                    row('Reference', '0001111AXDRfrqy'),
                    row('Satus', 'Successful', color: kGreen,),
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
          style: textStyle(15, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
