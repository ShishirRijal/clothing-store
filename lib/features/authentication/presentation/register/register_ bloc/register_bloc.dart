import 'dart:async';
import 'package:clothing_store/core/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../domain/usecases/register_usecase.dart';
import '../../models/models.dart';
import 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Register>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    Register event,
    Emitter<RegisterState> emit,
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
      final RegisterUseCase registerUseCase = getIt<RegisterUseCase>();
      (await registerUseCase.call(
              RegiseterParams(email: email.value, password: password.value)))
          .fold((l) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, errorMessage: l.message));
      }, (r) => emit(state.copyWith(status: FormzSubmissionStatus.success)));
    }
  }
}
