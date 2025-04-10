part of 'physical_therap_cubit.dart';

@immutable
sealed class PhysicalTherapState {}

final class PhysicalTherapInitial extends PhysicalTherapState {}

final class PhysicalTherapLoading extends PhysicalTherapState {}

final class PhysicalTherapSuccess extends PhysicalTherapState {
  final List<PhysicalTherapModel> physicalTherapists;

  PhysicalTherapSuccess(this.physicalTherapists);
}

final class PhysicalTherapFailure extends PhysicalTherapState {
  final String message;

  PhysicalTherapFailure(this.message);
}
