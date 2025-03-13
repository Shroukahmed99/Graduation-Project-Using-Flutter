import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit() : super(PriceInitial()) {
    loadSavedPrice();
  }

  Future<void> loadSavedPrice() async {
    var savedPrice = CacheHelper.getData(key: 'priceRange');

    int price = (savedPrice is int) ? savedPrice : int.tryParse(savedPrice?.toString() ?? '') ?? 100;

    emit(PriceSelected(price));
  }

  Future<void> selectPrice(int price) async {
    bool success = await CacheHelper.saveData(key: 'priceRange', value: price);
    if (success) {
      print("✅ Price saved successfully: $price");
      emit(PriceSelected(price));
    } else {
      print("❌ Failed to save price");
    }
  }
}
