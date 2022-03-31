import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/transaction_model.dart';
import '../repository/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _transactionRepository;

  TransactionBloc(this._transactionRepository)
      : super(TransactionLoadingState()) {
    on<LoadTransactionEvent>((event, emit) async {
      emit(TransactionLoadingState());
      try {
        final transaction = await _transactionRepository.readJson();
        emit(TransactionLoadedState(transaction));
      } catch (e) {
        emit(TransactionErrorState(e.toString()));
      }
    });
  }
}
