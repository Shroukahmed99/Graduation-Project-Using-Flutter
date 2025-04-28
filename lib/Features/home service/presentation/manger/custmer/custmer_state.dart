part of 'custmer_cubit.dart';

@immutable
sealed class CustmerState {}

final class CustmerInitial extends CustmerState {}

final class CustmerLoading extends CustmerState {}

final class CustmerSuccess extends CustmerState {
  final List<PaymentData> data;

  CustmerSuccess(this.data);
}

final class CustmerFaliure extends CustmerState {
  final String message;

  CustmerFaliure(this.message);
}
