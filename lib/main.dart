import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/pages/home_page.dart';
import 'package:bank__sha/ui/pages/onboarding_page.dart';
import 'package:bank__sha/ui/pages/pin_page.dart';
import 'package:bank__sha/ui/pages/profile_edit_page.dart';
import 'package:bank__sha/ui/pages/profile_page.dart';
import 'package:bank__sha/ui/pages/sign_in_page.dart';
import 'package:bank__sha/ui/pages/sign_up_page.dart';
import 'package:bank__sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bank__sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank__sha/ui/pages/sign_up_success_page.dart';
import 'package:bank__sha/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semibold,
          ),
        ),
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-set-profile': (context) => const SignUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/profile-edit': (context) => const ProfileEditPage(),
        '/pin': (context) => const PinPage(),
      },
    );
  }
}
