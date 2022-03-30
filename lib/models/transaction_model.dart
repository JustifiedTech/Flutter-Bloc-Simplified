import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  String? code;
  Data? data;
  String? message;
  String? status;

  TransactionModel({this.code, this.data, this.message, this.status});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  List<ClientTransactions>? clientTransactions;

  Data({this.clientTransactions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['clientTransactions'] != null) {
      clientTransactions = <ClientTransactions>[];
      json['clientTransactions'].forEach((v) {
        clientTransactions!.add(ClientTransactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clientTransactions != null) {
      data['clientTransactions'] =
          clientTransactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientTransactions {
  double? amount;
  String? balance;
  String? comment;
  String? currencyCode;
  String? entryDate;
  int? transactionId;
  String? type;

  ClientTransactions(
      {this.amount,
      this.balance,
      this.comment,
      this.currencyCode,
      this.entryDate,
      this.transactionId,
      this.type});

  ClientTransactions.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    balance = json['balance'];
    comment = json['comment'];
    currencyCode = json['currencyCode'];
    entryDate = json['entryDate'];
    transactionId = json['transactionId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['balance'] = balance;
    data['comment'] = comment;
    data['currencyCode'] = currencyCode;
    data['entryDate'] = entryDate;
    data['transactionId'] = transactionId;
    data['type'] = type;
    return data;
  }
}
