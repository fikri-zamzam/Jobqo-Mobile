import 'package:flutter/material.dart';
import 'package:jobqo/models/job_model.dart';
import 'package:jobqo/providers/wishlist_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/pages/detail_job_page.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final JobModel job;
  WishlistCard(this.job);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
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
        height: 84,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://ws-tif.com/jobqo/public/img/${job.company.imgUrl}',
                width: 40,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${job.name_job}',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${job.company.name}',
                    style: greyTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                wishlistProvider.setJob(job);
              },
              child: Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
    );
  }
}
