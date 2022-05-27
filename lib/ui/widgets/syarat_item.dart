import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class SyaratItem extends StatelessWidget {
  final String syarat;

  const SyaratItem({Key? key, required this.syarat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(right: 8, top: 4, bottom: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/icon_checklist.png',
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            syarat,
            style: greyTextStyle.copyWith(
              fontWeight: medium,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
