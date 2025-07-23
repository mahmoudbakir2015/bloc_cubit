import 'package:bloc_cubit/model/product_model.dart';
import 'package:bloc_cubit/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_state_cubit.dart';

class ProductCubit extends Cubit<ProductStateCubit> {
  ProductCubit() : super(ProductLoading());
  ProductRepo productRepo = ProductRepo();
  List<ProductModel> products = [];
  getProducts() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      // Fetch products from repository
      products = await productRepo.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
