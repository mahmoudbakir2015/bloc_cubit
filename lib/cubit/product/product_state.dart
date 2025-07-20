part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {}

final class ProductFailure extends ProductState {}
