import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  String? status;
  String? code;
  String? message;
  Data? data;

  TransactionModel({this.status, this.code, this.message, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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
  int? transactionId;
  String? type;
  double? amount;
  String? comment;
  String? entryDate;
  String? currencyCode;
  String? balance;

  ClientTransactions(
      {this.transactionId,
      this.type,
      this.amount,
      this.comment,
      this.entryDate,
      this.currencyCode,
      this.balance});

  ClientTransactions.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    type = json['type'];
    amount = json['amount'];
    comment = json['comment'];
    entryDate = json['entryDate'];
    currencyCode = json['currencyCode'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['type'] = type;
    data['amount'] = amount;
    data['comment'] = comment;
    data['entryDate'] = entryDate;
    data['currencyCode'] = currencyCode;
    data['balance'] = balance;
    return data;
  }
}
