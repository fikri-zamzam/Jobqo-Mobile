import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang\nAde Bagus',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Jelajahi Sekarang Juga',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image_profile.png',
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    Widget popularJob() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              JobCard(
                name: 'Web Developer ABAL ABAL',
                company: 'BAT Company',
                imageUrl: 'assets/bat.png',
              ),
              JobCard(
                name: 'APP Developer',
                company: 'BAT Company',
                imageUrl: 'assets/wismilak.png',
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularJob(),
      ],
    );
  }
}
