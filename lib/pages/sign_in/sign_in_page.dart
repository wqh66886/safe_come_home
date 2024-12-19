import 'package:flutter/material.dart';
import 'package:safe_come_home/constants/pallet.dart';
import 'package:safe_come_home/widgets/auth_button.dart';
import 'package:safe_come_home/widgets/input_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(27),
            child: Form(
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
                    onPressed: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
