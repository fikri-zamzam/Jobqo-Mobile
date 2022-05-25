import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class JobCard extends StatelessWidget {
  final String name;
  final String company;
  final String imageUrl;

  const JobCard(
      {Key? key,
      required this.name,
      required this.company,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  imageUrl,
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
                  name,
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
                  company,
                  style: blackTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  '8 Hours Ago',
                  style: greyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
