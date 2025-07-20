import 'package:bloc_cubit/model/product_model.dart';
import 'package:bloc_cubit/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());
  ProductRepo productRepo = ProductRepo();
  getProducts() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      // Fetch products from repository
      final products = await productRepo.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
