import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Home/models/home.dart';
import 'package:project/data/Home/repository/api.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductsLoading extends HomeState {}

class ProductsLoaded extends HomeState {
  final List<Home> products;
  ProductsLoaded(this.products);
}

class ProductsError extends HomeState {}

class ProductsCubit extends Cubit<HomeState> {
  final HomeServices apiService;
  ProductsCubit(this.apiService) : super(HomeInitial());

  void fetchProducts() async {
    emit(ProductsLoading());
    try {
      final data = await apiService.fetchHome();
      emit(ProductsLoaded(data));
    } catch (e) {
      emit(ProductsError());
    }
  }
}
