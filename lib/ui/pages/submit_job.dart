import 'package:flutter/material.dart';
import 'package:jobqo/models/job_model.dart';
import 'package:jobqo/models/lamaran_model.dart';
import 'package:jobqo/models/user_model.dart';
import 'package:jobqo/providers/auth_provider.dart';
import 'package:jobqo/providers/getjob_provider.dart';
import 'package:jobqo/providers/lamaran_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SubmitJob extends StatefulWidget {
  // const SubmitJob({Key? key}) : super(key: key);

  final JobModel job;
  SubmitJob(this.job);

  @override
  State<SubmitJob> createState() => _SubmitJobState();
}

class _SubmitJobState extends State<SubmitJob> {
  @override
  Widget build(BuildContext context) {
    LamaranProvider lamaranProvider = Provider.of<LamaranProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    TextEditingController iduserController =
        TextEditingController(text: '${user.id}');
    TextEditingController idjobController =
        TextEditingController(text: '${widget.job.id}');
    TextEditingController resumejobController = TextEditingController(text: '');

    handleCreate() async {
      if (await lamaranProvider.create(
        token: user.token.toString(),
        usersid: iduserController.text,
        jobsid: idjobController.text,
        resume: resumejobController.text,
      )) {
        Navigator.pushNamed(context, '/main');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: const Text(
              'Kamu berhasil Melamar',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Gagal Tambah',
            textAlign: TextAlign.center,
          ),
        ));
      }
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Submit Sekarang',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget useridInput() {
        return Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: false,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User saat ini',
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  cursorColor: kBlackColor,
                  controller: iduserController,
                  decoration: InputDecoration(
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
          ),
        );
      }

      Widget jobidInput() {
        return Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: false,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job yang dipilih',
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  cursorColor: kBlackColor,
                  controller: idjobController,
                  decoration: InputDecoration(
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
          ),
        );
      }

      Widget textInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deskripsikan diri anda',
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                cursorColor: kBlackColor,
                controller: resumejobController,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Ketik disini',
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

      Widget cvInput() {
        return Container(
          child: Row(
            children: [Text('CV anda')],
          ),
        );
      }

      Widget submitButton() {
        return CustomButton(
          title: 'Submit Lamaran',
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          onPressed: handleCreate,
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            useridInput(),
            jobidInput(),
            textInput(),
            cvInput(),
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
            Icons.chevron_left,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
