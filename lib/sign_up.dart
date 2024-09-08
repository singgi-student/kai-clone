import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool passwordIsObscure = true;

  bool PasswordConfrimIsObscure = true;

  Color errorColor = Colors.green;
  String? errorText =
      "Minimal 8 karakter kombinasi huruf kecil besar dan angka";

  String? validatePassword(String? value) {
    if (value == "" || value == null) {
      errorColor = Colors.green;
      errorText = "Minimal 8 karakter kombinasi huruf kecil besar dan angka";
    } else if (value != _passwordController.text) {
      errorColor = Color.fromARGB(255, 255, 94, 0);
      errorText = "Kata Sandi yang anda masukkan tidak sesuai";
    } else {
      errorText = null;
    }

    setState(() {});
    return errorText;
  }

  void showCustomDialog(BuildContext context) {
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
                  'Konfirmasi',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Apakah anda yakin ingin mendaftarkan akun anda?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: Colors.black54),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      "IYA",
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
                        "TIDAK",
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue.shade700,
                )),
            backgroundColor: Colors.grey.shade100,
            title: Text(
              "Buat Kata Sandi",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        "Jangan bagikan kata sandi anda kepada siapapun demi keamanan data anda.",
                        style: GoogleFonts.inter(
                            color: Colors.black54, fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kata Sandi Baru",
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(
                            height: 8,
                          ),
                          _buildtextFieldPassword(),
                          SizedBox(
                            height: 24,
                          ),
                          Text("Ulangi Kata Sandi Baru",
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(
                            height: 8,
                          ),
                          _buildPasswordConfirm()
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        showCustomDialog(context);
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blue.shade700)),
                      child: Text(
                        "Simpan",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )))
            ],
          )),
    );
  }

  TextFormField _buildPasswordConfirm() {
    return TextFormField(
      controller: _passwordConfirmController,
      obscureText: PasswordConfrimIsObscure,
      validator: (value) => validatePassword(value),
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: (value) => validatePassword(value),
      style: GoogleFonts.inter(),
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: TextStyle(color: errorColor),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                PasswordConfrimIsObscure = !PasswordConfrimIsObscure;
              });
            },
            icon: Icon(
              PasswordConfrimIsObscure
                  ? Icons.visibility_off_outlined
                  : Icons.remove_red_eye_outlined,
            )),
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
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black12,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        hintText: "Ulangi Kata Sandi Baru",
      ),
    );
  }

  TextFormField _buildtextFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: passwordIsObscure,
      validator: (value) =>
          "Minimal 8 karakter kombinasi huruf kecil besar dan angka",
      autovalidateMode: AutovalidateMode.always,
      style: GoogleFonts.inter(),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.green,
          fontSize: 11,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordIsObscure = !passwordIsObscure;
              });
            },
            icon: Icon(
              passwordIsObscure
                  ? Icons.visibility_off_outlined
                  : Icons.remove_red_eye_outlined,
            )),
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
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black12,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        hintText: "Kata Sandi Baru",
      ),
    );
  }
}
