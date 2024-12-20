import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/constants/pallet.dart';
import 'package:safe_come_home/providers/auth/auth_cubit.dart';
import 'package:safe_come_home/widgets/auth_button.dart';
import 'package:safe_come_home/widgets/input_field.dart';
import 'package:safe_come_home/widgets/loading.dart';
import 'package:safe_come_home/widgets/show_snackbar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final birthdayController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<String> data = ['男', '女', '未知'];
  late String? _gender = data.first;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
            name: nameController.text.trim(),
            birthday: birthdayController.text.trim(),
            gender: _gender! == "男" ? 1 : 0,
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    }
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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, state.message);
                } else if (state is AuthSuccess) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/login", (route) => false);
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
                      InputField(
                        hintText: "Name",
                        prefixIcon: Icons.people_alt_outlined,
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                            locale: const Locale('zh'),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              birthdayController.text =
                                  selectedDate.toIso8601String().split("T")[0];
                            });
                          }
                        },
                        child: InputField(
                          hintText: "生日",
                          prefixIcon: Icons.date_range_outlined,
                          controller: birthdayController,
                          enabled: false,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField<String>(
                        value: _gender,
                        onChanged: (String? newValue) {
                          setState(() {
                            _gender = newValue;
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.how_to_reg_outlined), // 添加前缀图标
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                        ),
                        items:
                            data.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                        onPressed: signUp,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
