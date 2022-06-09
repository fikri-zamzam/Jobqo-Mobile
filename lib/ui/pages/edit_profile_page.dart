import 'package:flutter/material.dart';
import 'package:jobqo/providers/auth_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../widgets/custom_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    TextEditingController nameController =
        TextEditingController(text: user.name);
    TextEditingController usernameController =
        TextEditingController(text: user.username);
    TextEditingController emailController =
        TextEditingController(text: user.email);

    handleEdit() async {
      if (nameController.text.isEmpty ||
          usernameController.text.isEmpty ||
          emailController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kPrimaryColor,
            content: const Text(
              'Isi kolom terlebih dahulu',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (await authProvider.update(
        token: user.token.toString(),
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
      )) {
        Navigator.pushNamed(context, '/main');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: const Text(
              'Profil berhasil diperbarui',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kPrimaryColor,
            content: const Text(
              'Gagal Update Profil!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    Widget name() {
      return Container(
        margin: EdgeInsets.only(bottom: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'name',
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              // controller: emailController,
              cursorColor: kBlackColor,
              controller: nameController,
              decoration: InputDecoration(
                  hintText: '${user.name}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ))),
            ),
          ],
        ),
      );
    }

    Widget username() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              // controller: emailController,
              cursorColor: kBlackColor,
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: '${user.username}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ))),
            ),
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              // controller: emailController,
              cursorColor: kBlackColor,
              controller: emailController,
              decoration: InputDecoration(
                hintText: '${user.email}',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget submitButton() {
      return CustomButton(
        title: 'Simpan',
        width: double.infinity,
        margin: EdgeInsets.only(top: 50),
        onPressed: handleEdit,
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://ui-avatars.com/api/name=${user.name}&background=random'),
                ),
              ),
            ),
            name(),
            username(),
            email(),
            submitButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
