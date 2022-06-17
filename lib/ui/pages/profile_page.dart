import 'package:flutter/material.dart';
import 'package:jobqo/models/user_model.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleLogout() async {
      AlertDialog alertDialog = AlertDialog(
        title: const Text('Warning!!'),
        content: const Text('Apakah anda yakin ingin keluar?'),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
              child: const Text('Yakin'),
              onPressed: () async {
                Navigator.pop(context);

                if (await authProvider.logout(user.token!)) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: const Text(
                        'Berhasil Logout',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: const Text(
                        'Gagal Logout',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              }),
        ],
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }

    Widget profile() {
      return Container(
        width: double.infinity,
        margin:
            EdgeInsets.only(top: 41, left: defaultMargin, right: defaultMargin),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://ui-avatars.com/api/name=${user.name}&background=random',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '${user.name}',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '${user.email}',
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
                  ),
                ),
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
          width: double.infinity,
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
        margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
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
          onPressed: handleLogout,
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
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
