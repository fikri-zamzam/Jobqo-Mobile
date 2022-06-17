import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jobqo/providers/getjob_provider.dart';
import 'package:jobqo/providers/lamaran_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/pages/submit_job.dart';
import 'package:jobqo/ui/widgets/custom_button.dart';
import 'package:jobqo/ui/widgets/syarat_item.dart';
import 'package:provider/provider.dart';

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
    final _htmlContent = """ ${widget.job.job_requirement} """;
    // getProvider getprovider = Provider.of<getProvider>(context);
    // LamaranProvider lamaranProvider = Provider.of<LamaranProvider>(context);

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
            image: NetworkImage(
              'https://ws-tif.com/jobqo/public/img/${widget.job.company.imgUrl}',
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
                    '${widget.job.gajii.gaji}',
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
                Html(
                  data: _htmlContent,
                  style: {
                    'li': Style(
                      color: kGreyColor,
                    ),
                  },
                ),
                // SyaratItem(
                //   syarat: '${widget.job.job_requirement}',
                // ),
              ],
            ),
            CustomButton(
              title: 'Lamar Sekarang',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubmitJob(widget.job),
                  ),
                );
              },
              width: double.infinity,
              margin: EdgeInsets.only(top: 40, bottom: 50),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
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
