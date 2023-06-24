import 'package:clothing_store/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../../../core/di.dart';
import '../../models/models.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<EmailChanged>(_onEmailChanged);
    on<ResetPassword>(_resetPassword);
  }

  void _onEmailChanged(EmailChanged event, Emitter<ForgotPasswordState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email]),
    ));
  }

  void _resetPassword(
    ResetPassword event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final forgotPasswordUseCase = getIt<ForgetPasswordUseCase>();
      (await forgotPasswordUseCase.call(ForgetPasswordParams(email.value)))
          .fold(
              (l) => emit(state.copyWith(
                  status: FormzSubmissionStatus.failure,
                  errorMessage: l.message)),
              (r) =>
                  emit(state.copyWith(status: FormzSubmissionStatus.success)));
    }
  }
}
