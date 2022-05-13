import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool rememberpwd = false;
  bool sec = true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 32, 70, 116)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 166,
                            width: 250,
                            child: Image.asset('images/logo.png'),
                          ),
                        ),
                        Text(
                          "Daftarkan Akun Anda",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        buildNama(),
                        SizedBox(
                          height: 50,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 50,
                        ),
                        buildPassword(),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        buildRegisterButton(),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     buildGoogle(),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        Text(
                          "Sudah punya akun? Masuk",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
                hintText: 'Masukkan Nama Anda',
                hintStyle:
                    TextStyle(color: Colors.grey, fontFamily: "Poppins")),
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
                hintText: 'Masukkan Email Anda',
                hintStyle:
                    TextStyle(color: Colors.grey, fontFamily: "Poppins")),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          child: TextField(
            obscureText: sec,
            style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      sec = !sec;
                    });
                  },
                  icon: sec ? visableoff : visable,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10, top: 14),
                hintText: "Masukkan Password Anda",
                hintStyle:
                    TextStyle(color: Colors.grey, fontFamily: "Poppins")),
          ),
        )
      ],
    );
  }

  Widget buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {},
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color.fromARGB(255, 242, 189, 77),
          padding: EdgeInsets.all(20),
          child: Text(
            "Daftar",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
