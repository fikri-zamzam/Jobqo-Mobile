import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/riwayat_card.dart';

class ApplicantPage extends StatelessWidget {
  const ApplicantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 50,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Riwayat Lamaran',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget emptyApplicant() {
      return Expanded(
        child: Container(
          color: kBackgroundColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kamu belum melamar pekerjaan',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: kBackgroundColor,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              RiyawatCard(),
              RiyawatCard(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // header(),
        emptyApplicant(),
        // content(),
      ],
    );
  }
}
