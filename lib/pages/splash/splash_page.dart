import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/providers/splash/splash_cubit.dart';
import 'package:safe_come_home/widgets/auth_button.dart';
import 'package:safe_come_home/widgets/loading.dart';
import 'package:safe_come_home/widgets/show_snackbar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().isFirstOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadFailure) {
            showSnackBar(context, state.message);
          } else if (state is SplashLoadSuccess) {
            if (state.isFirstOpen) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => false);
            }
          }
        },
        builder: (context, state) {
          if (state is SplashLoading) {
            return const Loading();
          }
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/splash.png"),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "把失去的微笑带回家，让心重聚",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 66,
                    ),
                    AuthButton(
                      buttonText: "让我们开始吧",
                      onPressed: () {
                        context.read<SplashCubit>().appIsOpen();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
