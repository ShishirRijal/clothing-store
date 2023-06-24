import 'package:clothing_store/core/resources/asset_manager.dart';

import '../forgot_password/forgot_password_view.dart';
import '../register/register_view.dart';
import 'login_bloc/login_bloc.dart';
import 'login_bloc/login_state.dart';
import '../../../../core/resources/resources.dart';
import '../shared_widgets/shared_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'login_bloc/login_event.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: GestureDetector(
        onTap: () {
          // dismiss keyboard when touched outside the textfield
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 20.0),
                child: _LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(getSuccessSnackbar(context));
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
                "Login",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 20.0),
            const EmailInput(),
            const SizedBox(height: 20.0),
            const PasswordInput(),
            const ForgotPassword(),
            const SizedBox(height: 50.0),
            const LoginButton(),
            const SizedBox(height: 30),
            const SignUp(),
          ],
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPasswordView()));
          },
          child: Text(
            "Forgot password?",
            style: Theme.of(context).textTheme.labelLarge,
          )),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
          text: "Don't have an account yet? ",
          style: getRegularTextStyle(),
        ),
        TextSpan(
          text: "Sign Up",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterView()));
            },
          style: getRegularTextStyle(color: ColorManager.accent),
        ),
      ],
    ));
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          initialValue: state.email.value,
          label: 'Email',
          hintText: 'Eg: shishir@gmail.com',
          errorText:
              state.email.displayError != null ? 'Enter a valid email' : null,
          icon: Icons.email,
          onChange: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          initialValue: state.password.value,
          hintText: 'Enter your password',
          label: 'Password',
          errorText: state.password.displayError != null
              ? 'Enter a valid password'
              : null,
          icon: Icons.lock,
          onChange: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          isObscure: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
    return CustomButton(
      title: 'Login',
      onPressed: isValid ? () => context.read<LoginBloc>().add(Login()) : null,
    );
  }
}

SnackBar getSuccessSnackbar(BuildContext context) {
  return SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: ColorManager.success,
      content: Text("Login successfull!",
          style: Theme.of(context).textTheme.labelMedium));
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text("Login successfull!",
            style: Theme.of(context).textTheme.labelMedium));
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
