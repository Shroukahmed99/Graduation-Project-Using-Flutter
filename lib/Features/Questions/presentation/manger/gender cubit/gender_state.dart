part of 'gender_cubit.dart';

sealed class GenderState {}

final class GenderInitial extends GenderState {}

class GenderSelected extends GenderState {
  final String gender;
  GenderSelected(this.gender);
}
