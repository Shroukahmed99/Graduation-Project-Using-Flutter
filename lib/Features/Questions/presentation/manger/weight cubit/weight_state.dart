part of 'weight_cubit.dart';

@immutable
abstract class WeightState {}

class WeightInitial extends WeightState {}

class WeightSelected extends WeightState {
  final int weight;
  WeightSelected(this.weight);
}
