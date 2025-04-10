part of 'physical_more_cubit.dart';

@immutable
sealed class PhysicalMoreState {}

final class PhysicalMoreInitial extends PhysicalMoreState {}

final class PhysicalMoreLoading extends PhysicalMoreState {}

final class PhysicalMoreSuccess extends PhysicalMoreState {
  final PhysicalTherapistMore physicalTherapistMore;

  PhysicalMoreSuccess(this.physicalTherapistMore);
}

final class PhysicalMoreFailure extends PhysicalMoreState {
  final String message;

  PhysicalMoreFailure(this.message);
}
