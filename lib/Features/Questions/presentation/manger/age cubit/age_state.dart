part of 'age_cubit.dart';

abstract class AgeState {}

class AgeInitial extends AgeState {}

class AgeSelected extends AgeState {
  final int age;
  AgeSelected(this.age);
}
