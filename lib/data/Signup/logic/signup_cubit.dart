import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Signup/repository/api.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {}

class SignUpError extends SignUpState {}

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpServices apiService;
  SignUpCubit(this.apiService) : super(SignUpInitial());

  void fetchSignUpn(String email, String username, String password) async {
    emit(SignUpLoading());
    try {
      await apiService.fetchSignUp(email, username, password);
      emit(SignUpLoaded());
    } catch (e) {
      emit(SignUpError());
    }
  }
}
