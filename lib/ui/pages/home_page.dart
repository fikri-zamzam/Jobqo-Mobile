import 'package:flutter/material.dart';
import 'package:jobqo/models/user_model.dart';
import 'package:jobqo/providers/auth_provider.dart';
import 'package:jobqo/providers/job_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/job_card.dart';
import 'package:jobqo/ui/widgets/job_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    JobProvider jobProvider = Provider.of<JobProvider>(context);

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
                    'Selamat Datang\n${user.name}',
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
                    image: NetworkImage(
                      'https://ui-avatars.com/api/name=${user.name}&background=random',
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    Widget banner() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        width: 331,
        height: 180,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/image_banner.png'))),
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
            children: jobProvider.jobs.map((job) => JobCard(job)).toList(),
          ),
        ),
      );
    }

    Widget newJobTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
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
          ],
        ),
      );
    }

    Widget newJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 5,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 140,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: jobProvider.jobs.map((job) => JobTile(job)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        banner(),
        popularJob(),
        newJobTitle(),
        newJob(),
      ],
    );
  }
}
