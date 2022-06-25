import 'package:flutter/material.dart';
import 'package:jobqo/providers/auth_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/custom_button.dart';
import 'package:jobqo/ui/widgets/custom_text_form_field.dart';
import 'package:jobqo/ui/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/main');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Gagal Register',
            textAlign: TextAlign.center,
          ),
        ));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Daftar Akun\nSekarang Juga',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Lengkap',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: nameController,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: 'Masukkan Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ))),
              ),
            ],
          ),
        );
      }

      Widget usernameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: usernameController,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Masukkan username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: emailController,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: 'Masukkan Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ))),
              ),
            ],
          ),
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: showPassword,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Masukkan Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  suffixIcon: Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: kPrimaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget submitButton() {
        return CustomButton(
          title: 'Daftar Sekarang',
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          onPressed: handleSignUp,
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            nameInput(),
            usernameInput(),
            emailInput(),
            passwordInput(),
            isLoading ? LoadingButton() : submitButton(),
          ],
        ),
      );
    }

    Widget loginButton() {
      return Container(
        margin: EdgeInsets.only(top: 50, bottom: 73),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-in');
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          child: Text(
            'Sudah Punya akun? masuk disini',
            style: greyTextStyle.copyWith(
                fontWeight: medium, decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            loginButton(),
          ],
        ),
      ),
    );
  }
}
