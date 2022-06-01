import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget profile() {
      return Container(
        margin: EdgeInsets.only(top: 41),
        child: Column(
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_profile.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Ade Bagus Pratama',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'adebagus@gmail.com',
              style: greyTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),
            Container(
              width: 220,
              height: 55,
              margin: EdgeInsets.only(top: 15, bottom: 25),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    )),
                child: Text(
                  'Edit Profile',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget bio() {
      Widget content() {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Probolinggo, Kraksaan',
                style: greyTextStyle.copyWith(
                  height: 1.6,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Nomor HP',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '+62 82334668379',
                style: greyTextStyle.copyWith(
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content(),
          ],
        ),
      );
    }

    Widget logout() {
      return Container(
        width: 220,
        height: 55,
        margin: EdgeInsets.only(top: 150, bottom: 25),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '');
          },
          style: TextButton.styleFrom(
            backgroundColor: kTransparentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          child: Text(
            'Logout',
            style: redTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            profile(),
            bio(),
            logout(),
          ],
        ),
      ),
    );
  }
}
