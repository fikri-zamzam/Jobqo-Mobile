import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobqo/cubit/page_cubit.dart';
import 'package:jobqo/ui/pages/main_page.dart';
import 'package:jobqo/ui/pages/sign_in_page.dart';
import 'package:jobqo/ui/pages/sign_up_page.dart';
import 'ui/pages/splash_screen.dart';
import 'ui/pages/get_started_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}
