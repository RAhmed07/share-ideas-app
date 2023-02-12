import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_ideas/core/common/loader.dart';
import 'package:share_ideas/core/common/signin_button.dart';
import 'package:share_ideas/core/constants/constants.dart';
import 'package:share_ideas/features/auth/controller/auth_controller.dart';
import 'package:share_ideas/responsive/responsive.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signInAsGuest(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInAsGuest(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          // TextButton(
          //   onPressed: () => signInAsGuest(ref, context),
          //   child: const Text(
          //     'Skip',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Dive into innovative ideas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Constants.loginImagePath,
              height: 400,
            ),
          ),
          const SizedBox(height: 20),
          const Responsive(child: SignInButton()),
        ],
      ),
    );
  }
}