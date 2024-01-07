import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/login_bloc/login_state.dart';
import 'package:gelivery_tracker/src/presentation/widgets/inputs/check_box_with_label.dart';
import 'package:gelivery_tracker/src/presentation/widgets/inputs/input_text_with_icon.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.onGetLoginBloc,
    required this.onLoggedInSuccess,
  });
  final LoginBloc Function() onGetLoginBloc;
  final VoidCallback onLoggedInSuccess;

  @override
  Widget build(BuildContext context) {
    final bloc = onGetLoginBloc();
    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (_, state) {
            if (state case LoginLoadingState()) {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }

            if (state case LoginSuccessState()) {
              context.pop();
              onLoggedInSuccess();
            }

            if (state case LoginFailedState(failure: (final failure))) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  showCloseIcon: true,
                  content: Text(failure.reason),
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
              const FlutterLogo(
                size: 150,
                textColor: Colors.green,
              ),
              const SizedBox(height: 32),
              InputTextWithPrefixIcon(
                controller: bloc.usernameController,
                iconData: Icons.phone,
                hintText: 'Username (or) Phone number/Email',
              ),
              const SizedBox(height: 16),
              InputTextWithPrefixIcon(
                controller: bloc.passwordController,
                iconData: Icons.star,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CheckBoxWithText(
                text: "Terms & Conditions",
                onChanged: (value) => bloc.agreedTermsAndConditions = value,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => bloc.login(),
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
