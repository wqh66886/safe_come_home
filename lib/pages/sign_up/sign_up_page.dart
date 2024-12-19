import 'package:flutter/material.dart';
import 'package:safe_come_home/constants/pallet.dart';
import 'package:safe_come_home/widgets/auth_button.dart';
import 'package:safe_come_home/widgets/input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
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
            padding: const EdgeInsets.all(27.0),
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
                  InputField(
                    hintText: "Name",
                    prefixIcon: Icons.people_alt_outlined,
                    controller: nameController,
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
                    buttonText: "注 册",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "已经有账户了 ?",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: " 去登录",
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
