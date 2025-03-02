part of 'height_cubit.dart';

@immutable
abstract class HeightState {}

class HeightInitial extends HeightState {}

class HeightSelected extends HeightState {
  final int height;
  HeightSelected(this.height);
}
