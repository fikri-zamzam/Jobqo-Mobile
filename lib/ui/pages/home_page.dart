import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/job_card.dart';
import 'package:jobqo/ui/widgets/job_tile.dart';

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
        margin: EdgeInsets.only(
          top: 40,
        ),
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

    Widget newJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 140,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pekerjaan Baru',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            JobTile(
              name: 'HRD Manager',
              company: 'BAT Company',
              imageUrl: 'assets/bat.png',
            ),
            JobTile(
              name: 'WEB Engineer',
              company: 'Wismilak Company',
              imageUrl: 'assets/wismilak.png',
            ),
            JobTile(
              name: 'WEB Engineer',
              company: 'Wismilak Company',
              imageUrl: 'assets/wismilak.png',
            ),
            JobTile(
              name: 'WEB Engineer',
              company: 'Wismilak Company',
              imageUrl: 'assets/wismilak.png',
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularJob(),
        newJob(),
      ],
    );
  }
}
