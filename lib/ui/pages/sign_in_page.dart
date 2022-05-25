import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/custom_button.dart';
import 'package:jobqo/ui/widgets/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Dapatkan Pekerjaan\nSekarang',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
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
          title: 'Login',
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
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget registerButton() {
      return Container(
        margin: EdgeInsets.only(top: 50, bottom: 73),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          child: Text(
            'Belum Punya akun? daftar Disini',
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
            registerButton(),
          ],
        ),
      ),
    );
  }
}
