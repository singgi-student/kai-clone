import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/sign_up.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  void showCustomDialog(BuildContext context, String email) {
    if (email.trimLeft().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / 1.5,
              left: 8,
              right: 8),
          content: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Email / No.Telepon tidak boleh kosong",
                style: TextStyle(fontSize: 14),
              ),
            ],
          )));
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Email / No.Telepon belum Terdaftar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Email / No.Telepon ($email) yang kamu Masukkan belum terdaftar di access",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: Colors.black54),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SignUp(),
                        ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      "BUAT AKUN BARU",
                      style: GoogleFonts.inter(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Center(
                      child: Text(
                        "KEMBALI",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final TextEditingController inputController = TextEditingController();
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SizedBox(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xffff00cc), Color(0xff333399)],
                stops: [0, 1],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )),
              child: SvgPicture.asset("assets/Subway-rafiki.svg"),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 0.70,
              controller: sheetController,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang di Access!",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Login atau Register sekarang! untuk menikmati Semua fitur yang tersedia di Access.",
                          style: GoogleFonts.inter(
                              fontSize: 16, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Email / No. Telp",
                            style: GoogleFonts.inter(
                                fontSize: 12, color: Colors.black54)),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: inputController,
                          style: GoogleFonts.inter(),
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                inputController.clear();
                              },
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.black87,
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            hintText: "Masukkan Email atau No. Telp anda",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            showCustomDialog(context, inputController.text);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                              "LANJUTKAN",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black12,
                                height: 1,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Atau gunakan akun",
                              style: GoogleFonts.inter(color: Colors.black54),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black12,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black12, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 20,
                                  child: SvgPicture.asset(
                                      "assets/icons8-google.svg")),
                              Text(
                                "Sign in with Google",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
