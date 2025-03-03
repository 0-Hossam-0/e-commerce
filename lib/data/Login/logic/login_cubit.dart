import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Login/repository/api.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final String facts;
  LoginLoaded(this.facts);
}

class LoginError extends LoginState {}

class LoginCubit extends Cubit<LoginState> {
  final LoginServices apiService;
  LoginCubit(this.apiService) : super(LoginInitial());

  void fetchLogin(String username, String password) async {
    emit(LoginLoading());
    try {
      final data = await apiService.fetchLogin(username, password);
      emit(LoginLoaded(data));
    } catch (e) {
      emit(LoginError());
    }
  }
}
