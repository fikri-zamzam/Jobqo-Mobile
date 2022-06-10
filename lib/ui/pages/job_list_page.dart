import 'package:flutter/material.dart';
import 'package:jobqo/models/user_model.dart';
import 'package:jobqo/providers/auth_provider.dart';
import 'package:jobqo/providers/job_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/job_tile.dart';
import 'package:provider/provider.dart';

class JobList extends StatelessWidget {
  const JobList({Key? key}) : super(key: key);

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
                    'Cari Pekerjaan\nLebih Mudah',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              width: 22,
              height: 28,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  'assets/Bookmark.png',
                ),
              )),
            ),
          ],
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
          children: jobProvider.jobs.map((job) => JobTile(job)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        newJob(),
      ],
    );
  }
}
