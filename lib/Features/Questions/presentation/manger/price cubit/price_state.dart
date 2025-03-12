part of 'price_cubit.dart';


abstract class PriceState {}

class PriceInitial extends PriceState {}

class PriceSelected extends PriceState {
  final int price;
  PriceSelected(this.price);
}
