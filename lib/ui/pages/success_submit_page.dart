import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class SuccessJob extends StatelessWidget {
  const SuccessJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        width: 323,
        height: 203,
        padding: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/image_success.png'),
        )),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          'Sukses Melamar Pekerjaan',
          style: blackTextStyle.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget subTitle() {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        margin: EdgeInsets.only(top: 18),
        child: Text(
          'Anda telah sukses melamar pekerjaan yang anda pilih sebelumnya, untuk melihat progress anda silahkan kunjungi menu progress',
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget button() {
      return Container(
        width: 220,
        height: 55,
        margin: EdgeInsets.only(top: 30, bottom: 25),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          child: Text(
            'Kembali',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image(),
            title(),
            subTitle(),
            button(),
          ],
        ),
      ),
    );
  }
}
