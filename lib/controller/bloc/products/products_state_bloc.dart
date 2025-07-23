import 'package:bloc_cubit/model/product_model.dart';

sealed class ProductStateBloc {}

final class ProductLoading extends ProductStateBloc {}

final class ProductLoaded extends ProductStateBloc {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

final class ProductFailure extends ProductStateBloc {
  final String error;

  ProductFailure(this.error);
}
