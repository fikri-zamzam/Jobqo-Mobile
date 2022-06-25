import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class EmptyApplicant extends StatelessWidget {
  const EmptyApplicant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        width: 291,
        height: 291,
        padding: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/Image_maintenance.png'),
        )),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          'Sedang Dalam Perbaikan',
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
          'Halaman lamaran sedang dalam perbaikan dan belum dapat dilihat ',
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
