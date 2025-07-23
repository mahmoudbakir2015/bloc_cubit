part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

final class ProductFailure extends ProductState {
  final String error;

  ProductFailure(this.error);
}
