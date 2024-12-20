import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/constants/pallet.dart';
import 'package:safe_come_home/providers/auth/auth_cubit.dart';
import 'package:safe_come_home/widgets/auth_button.dart';
import 'package:safe_come_home/widgets/input_field.dart';
import 'package:safe_come_home/widgets/loading.dart';
import 'package:safe_come_home/widgets/show_snackbar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().validateToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(27),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, state.message);
                } else if (state is AuthSuccess ||
                    (state is AuthSignIn && state.signIn)) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/home", (route) => false);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Loading();
                }
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset("images/sign_up.png"),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InputField(
                        hintText: "Email",
                        prefixIcon: Icons.email_outlined,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InputField(
                        hintText: "Password",
                        prefixIcon: Icons.lock_clock_outlined,
                        controller: passwordController,
                        isObscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthButton(
                        buttonText: "登 录",
                        onPressed: signIn,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed("/signup");
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "还没有账户 ?",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: " 去注册",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppPallet.buttonBackgroundColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
