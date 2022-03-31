import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/user_interface/default_svg_icon.dart';
import 'package:new_app/utils/config/constants.dart';
import 'package:new_app/utils/date_formatter.dart';
import 'package:new_app/utils/routes.dart';

import '../bloc_providers/transaction_bloc.dart';
import '../models/transaction_model.dart';
import '../repository/transaction_repository.dart';
import '../utils/config/size_config.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => TransactionBloc(
        RepositoryProvider.of<TransactionRepository>(context),
      )..add(LoadTransactionEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(30),
                left: getProportionateScreenWidth(21),
                right: getProportionateScreenWidth(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('All Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPurple,
                    )),
                SizedBox(
                  height: getProportionateScreenWidth(23),
                ),
                Expanded(
                  child: FutureBuilder<TransactionModel>(
                      future: readJson(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          TransactionModel transaction = snapshot.requireData;
                          return ListView.builder(
                              itemCount:
                                  transaction.data!.clientTransactions?.length,
                              itemBuilder: (context, index) {
                                var transa = transaction
                                    .data!.clientTransactions?[index];

                                return Container(
                                  height: getProportionateScreenHeight(69),
                                  width: getProportionateScreenWidth(330),
                                  margin: EdgeInsets.only(
                                      bottom: getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: kList,
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(
                                              AppRoute.transactionDetail),
                                      leading: CircleAvatar(
                                          backgroundColor:
                                              (transa?.type ?? '') != 'DEPOSIT'
                                                  ? kPurpleA
                                                  : kGreenA,
                                          child:
                                              (transa?.type ?? '') != 'DEPOSIT'
                                                  ? Icon(
                                                      Icons.arrow_upward,
                                                      color: kPurple,
                                                    )
                                                  : Icon(Icons.arrow_downward,
                                                      color: kGreen)),
                                      title: Text.rich(TextSpan(
                                          text: transa?.type,
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      13),
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: '',
                                                style: TextStyle(
                                                  color: kPurple,
                                                ))
                                          ])),
                                      subtitle: Text(
                                          DateFormatter.parseToDay(
                                              transa?.entryDate ?? ""),
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      11),
                                              color: kGrey)),
                                      trailing: Text(
                                        '${transa?.amount}'.startsWith('-')
                                            ? '--₦${transa?.amount.toString().substring(1)}'
                                                .substring(1)
                                            : '₦${transa?.amount}',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(14),
                                            color: (transa?.amount ?? '')
                                                    .toString()
                                                    .startsWith('-')
                                                ? kRed
                                                : kGreen,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                              child: CircularProgressIndicator.adaptive());
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
