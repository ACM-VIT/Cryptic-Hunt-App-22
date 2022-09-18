import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onBoarding.dart';

class Login extends StatelessWidget {
  static String id = "Login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xffff7a01),
        //margin: const EdgeInsets.only(left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ListView(
            children: [
              const Expanded(
                  child: SizedBox(
                    height: 106,
                  ),
                  flex: 1),
              Align(
                child: Expanded(
                    child: Image.asset("assets/login/treasure.png"), flex: 1),
                alignment: Alignment.centerLeft,
              ),
              const Expanded(child: SizedBox(height: 89)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                        text: "We are the ",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: const Color(0xFFFFFFFF))),
                    TextSpan(
                        text: "Event",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: const Color(0xFF181818))),
                    TextSpan(
                        text: "\neveryone’s been waiting",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: const Color(0xFFFFFFFF))),
                    TextSpan(
                        text: "\nfor",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: const Color(0xFFFFFFFF))),
                  ],
                )),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "Get notifications, know about the speaker sessions, ",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFFFFF4EA))),
                  TextSpan(
                      text: "\nabout the tracks and know a lot more.",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFFFFF4EA))),
                ])),
              ),
              Expanded(
                child: const SizedBox(height: 35),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18, right: 18),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    writeInSharedPreference();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnBoarding()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/login/google_icon.png'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Sign In with Google",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(13, 13, 13, 1)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void writeInSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Logged_In", true);
  }
}
