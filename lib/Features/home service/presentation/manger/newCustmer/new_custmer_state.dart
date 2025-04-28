part of 'new_custmer_cubit.dart';

@immutable
sealed class NewCustmerState {}

final class NewCustmerInitial extends NewCustmerState {}

final class NewCustmerLoading extends NewCustmerState {}

final class NewCustmerSuccess extends NewCustmerState {
  final List<ClientData> data;

  NewCustmerSuccess(this.data);
}

final class NewCustmerFaliure extends NewCustmerState {
  final String message;

  NewCustmerFaliure(this.message);
}
