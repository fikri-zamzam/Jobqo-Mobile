import 'package:flutter/material.dart';
import 'package:jobqo/models/job_model.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/pages/detail_job_page.dart';

class JobTile extends StatelessWidget {
  // final String name;
  // final String company;
  // final String imageUrl;

  final JobModel job;
  JobTile(this.job);

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
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://ws-tif.com/jobqo/public/img/${job.company.imgUrl}'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${job.name_job}',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${job.company.name}',
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
