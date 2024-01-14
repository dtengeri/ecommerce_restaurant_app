import 'package:ecommerce_restaurant_app/features/foods/domain/food_repository.dart';
import 'package:ecommerce_restaurant_app/features/foods/infrastruture/firestore_food_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FoodRepository foodRepository(FoodRepositoryRef ref) {
  return FirestoreFoodRepository();
}
