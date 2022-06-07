import 'package:flutter/material.dart';
import 'package:jobqo/models/job_model.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/pages/detail_job_page.dart';

class JobCard extends StatelessWidget {
  // final String name;
  // final String company;
  // final String imageUrl;

  final JobModel job;
  JobCard(this.job);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailJob(job),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 240,
        margin: EdgeInsets.only(left: defaultMargin),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(
                left: 5,
                top: 5,
                bottom: defaultMargin,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/bat.png',
                  ),
                ),
                // color: kPrimaryColor,
                // borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${job.name_job}',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${job.company.name}',
                    style: blackTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    '${job.createdAt}',
                    style: greyTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
