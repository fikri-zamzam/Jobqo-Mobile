import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/custom_button.dart';
import 'package:jobqo/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return CustomTextFormField(
          title: 'Nama Lengkap',
          hint: 'Nama Lengkap',
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hint: 'Email Lengkap',
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hint: 'password',
          obs: true,
        );
      }

      Widget submitButton() {
        return CustomButton(
          title: 'Daftar Sekarang',
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
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
            emailInput(),
            passwordInput(),
            submitButton(),
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
