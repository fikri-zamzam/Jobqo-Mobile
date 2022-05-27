import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class JobTile extends StatelessWidget {
  final String name;
  final String company;
  final String imageUrl;

  const JobTile(
      {Key? key,
      required this.name,
      required this.company,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
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
                company,
                style: greyTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
