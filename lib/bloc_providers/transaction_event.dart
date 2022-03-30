part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class LoadTransactionEvent extends TransactionEvent {
  @override
  List<Object> get props => [];
}
