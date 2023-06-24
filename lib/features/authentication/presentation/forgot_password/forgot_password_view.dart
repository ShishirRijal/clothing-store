import 'package:formz/formz.dart';

import '../login/login_view.dart';
import '../../../../core/resources/asset_manager.dart';
import '../shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_bloc/forgot_password_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: ForgotPasswordForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => ForgotPasswordFormState();
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
          showDialog<void>(
            context: context,
            builder: (_) => const SuccessDialog(),
          );
        }
        if (state.status.isInProgress) {
          showDialog<void>(
            context: context,
            builder: (_) => const LoadingPopup(),
          );
        }
        if (state.status.isFailure) {
          Navigator.of(context).pop();
          showDialog<void>(
              context: context,
              builder: (_) {
                return ErrorPopup(errorText: state.errorMessage);
              });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Image.asset(AssetManager.logo, height: 200),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reset Password",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 20.0),
            const EmailInput(),
            const SizedBox(height: 50.0),
            const ResetPasswordButton(),
          ],
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return CustomTextField(
          initialValue: state.email.value,
          label: 'Email',
          hintText: 'Eg: shishir@gmail.com',
          errorText:
              state.email.displayError != null ? 'Enter a valid email' : null,
          icon: Icons.email,
          onChange: (value) {
            context.read<ForgotPasswordBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid =
        context.select((ForgotPasswordBloc bloc) => bloc.state.isValid);
    return CustomButton(
      title: 'Reset Password',
      onPressed: isValid
          ? () => context.read<ForgotPasswordBloc>().add(ResetPassword())
          : null,
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertPopup(
      assetAddress: AssetManager.success,
      text: 'Password reset link is sent to your email.',
      buttonText: 'Okay',
      showButton: true,
      onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView())),
    );
  }
}

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAlertPopup(
        assetAddress: AssetManager.loading, text: 'Loading...');
  }
}

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({this.errorText, super.key});
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return CustomAlertPopup(
      assetAddress: AssetManager.error,
      text: errorText ?? 'An unknown error occurred!',
      showButton: true,
      onPressed: () => Navigator.pop(context),
    );
  }
}
