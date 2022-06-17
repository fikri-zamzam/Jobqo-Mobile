import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image_get_started.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Cari Pekerjaan\nsekarang juga',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 220,
                  height: 55,
                  margin: EdgeInsets.only(top: 50, bottom: 70),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                        )),
                    child: Text(
                      'Get Started',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
