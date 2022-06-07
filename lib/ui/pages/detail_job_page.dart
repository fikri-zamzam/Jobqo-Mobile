import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/custom_button.dart';
import 'package:jobqo/ui/widgets/syarat_item.dart';

import '../../models/job_model.dart';

class DetailJob extends StatefulWidget {
  // const DetailJob({Key? key}) : super(key: key);

  final JobModel job;
  DetailJob(this.job);

  @override
  State<DetailJob> createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 275,
        decoration: BoxDecoration(
          image: DecorationImage(
            // fit: BoxFit.cover,
            image: AssetImage('assets/image_detail_job.png'),
          ),
        ),
      );
    }

    Widget imageContainer() {
      return Container(
        width: 97,
        height: 97,
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 227,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }

    Widget logo() {
      return Container(
        width: 65,
        height: 65,
        margin: EdgeInsets.only(
          left: 44,
          top: 243,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/bat.png',
            ),
          ),
        ),
      );
    }

    // NOTE : TITLE & gaji
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 344, left: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.job.name_job}',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Kisaran Gaji',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Rp ${widget.job.gajii.gaji}',
                    style: greyTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 450, left: defaultMargin),
        padding: EdgeInsets.only(right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi Pekerjaan',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${widget.job.desk_job}',
              style: greyTextStyle.copyWith(
                height: 1.6,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Syarat Pekerjaan',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                SyaratItem(
                  syarat: 'Minimal 2 tahun bekerja sebagai software engineer',
                ),
                SyaratItem(
                  syarat: 'Menguasai bahasa php',
                ),
                SyaratItem(
                  syarat: 'Menguasai web server',
                ),
              ],
            ),
            CustomButton(
              title: 'Lamar Sekarang',
              onPressed: () {},
              width: double.infinity,
              margin: EdgeInsets.only(top: 40, bottom: 50),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            imageContainer(),
            logo(),
            title(),
            content(),
          ],
        ),
      ),
    );
  }
}
