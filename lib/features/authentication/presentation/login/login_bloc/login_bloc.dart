import 'dart:async';
import 'package:clothing_store/core/di.dart';
import 'package:clothing_store/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../models/models.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Login>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    Login event,
    Emitter<LoginState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: Formz.validate([email, password]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final LoginUseCase loginUseCase = getIt<LoginUseCase>();
      (await loginUseCase
              .call(LoginParams(email: email.value, password: password.value)))
          .fold(
              (l) => emit(state.copyWith(
                  status: FormzSubmissionStatus.failure,
                  errorMessage: l.message)),
              (r) =>
                  emit(state.copyWith(status: FormzSubmissionStatus.success)));
    }
  }
}
