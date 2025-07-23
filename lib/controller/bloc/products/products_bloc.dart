import 'package:bloc_cubit/controller/bloc/products/products_state_bloc.dart';
import 'package:bloc_cubit/model/product_model.dart';
import 'package:bloc_cubit/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductStateBloc> {
  ProductRepo productRepo = ProductRepo();
  List<ProductModel> products = [];
  ProductsBloc() : super(ProductLoading()) {
    on<ProductsEvent>((event, emit) async {
      try {
        await Future.delayed(Duration(seconds: 2));
        // Fetch products from repository
        products = await productRepo.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductFailure(e.toString()));
      }
    });
  }
}
