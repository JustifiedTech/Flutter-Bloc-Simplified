part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState extends Equatable {}

class TransactionLoadingState extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionLoadedState extends TransactionState {
  final TransactionModel transaction;

  TransactionLoadedState(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class TransactionErrorState extends TransactionState {
  final String error;

  TransactionErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
