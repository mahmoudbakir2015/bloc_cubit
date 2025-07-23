part of 'product_cubit.dart';

sealed class ProductStateCubit {}

final class ProductLoading extends ProductStateCubit {}

final class ProductLoaded extends ProductStateCubit {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

final class ProductFailure extends ProductStateCubit {
  final String error;

  ProductFailure(this.error);
}
