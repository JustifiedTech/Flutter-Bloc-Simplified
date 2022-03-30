import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/user_interface/default_svg_icon.dart';
import 'package:new_app/utils/config/constants.dart';
import 'package:new_app/utils/date_formatter.dart';
import 'package:new_app/utils/routes.dart';

import '../bloc_providers/transaction_bloc.dart';
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
                  child: FutureBuilder(
                      future: readJson(),
                      builder: (context, snapshot) {
                        var transaction = snapshot.data;
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemBuilder: (context, index) {
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
                                      .pushNamed(AppRoute.transactionDetail),
                                  leading: CircleAvatar(
                                    backgroundColor: kPurpleA,
                                    child: DefaultSvgIcon(
                                      icon: 'assets/svg/phone-with-arrow.svg',
                                      color: kRed,
                                    ),
                                  ),
                                  title: Text.rich(TextSpan(
                                      text: 'Money received from ',
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(13),
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: 'Michael',
                                            style: TextStyle(
                                              color: kPurple,
                                            ))
                                      ])),
                                  subtitle: Text(
                                      DateFormatter.parseToDay(
                                          '2022-03-09T09:29:09+0000'),
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(11),
                                          color: kGrey)),
                                  trailing: Text(
                                    '₦ 50,000',
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: kGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          });
                        } else {
                          return CircularProgressIndicator.adaptive();
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
