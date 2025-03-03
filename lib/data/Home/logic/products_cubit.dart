import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Home/models/home.dart';
import 'package:project/data/Home/repository/api.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Home> products;
  HomeLoaded(this.products);
}

class HomeError extends HomeState {}

class HomeCubit extends Cubit<HomeState> {
  final HomeServices apiService;
  HomeCubit(this.apiService) : super(HomeInitial());

  void fetchHome() async {
    emit(HomeLoading());
    try {
      final data = await apiService.fetchHome();
      emit(HomeLoaded(data));
    } catch (e) {
      print(e);
      emit(HomeError());
    }
  }
}
