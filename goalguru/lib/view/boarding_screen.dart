import 'package:flutter/material.dart';
import 'package:goalguru/view/sign_up.dart';
import 'package:goalguru/view/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 81, 255),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hey There",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: Image.asset(
                          "assets/images/wave.gif",
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome to your productivity hub! \nLet's turn your goals into achievements.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  // color: Color.fromARGB(255, 201, 181, 224),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      "GOALGURU",
                      colors: const [
                        Color.fromRGBO(43, 0, 255, 1),
                        Color.fromARGB(255, 205, 0, 60),
                        Color.fromARGB(255, 43, 0, 255),
                      ],
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        // color: const Color.fromARGB(255, 43, 0, 255),
                      ),
                    ),
                    const Divider(
                      indent: 70,
                      endIndent: 70,
                      height: 1,
                      color: Color.fromARGB(255, 31, 0, 206),
                    ),
                    Text(
                      "DREAM . PLAN . ACHIEVE",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 24, 0, 144),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: MediaQuery.sizeOf(context).height / 3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/optionForBoarding.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const SignUp(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 1.25,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 111, 81, 255),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.5),
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const SignIn(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 1.25,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 111, 81, 255),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.5),
                          child: Text(
                            "Sign In",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      " or continue with",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 24, 0, 144),
                      ),
                    ),
                    const SizedBox(height: 2.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: SizedBox(
                            height: 35,
                            child: Image.asset(
                              "assets/images/facebook.png",
                              color: const Color.fromARGB(255, 111, 81, 255),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: SizedBox(
                            height: 35,
                            child: Image.asset(
                              "assets/images/instagram.png",
                              color: const Color.fromARGB(255, 111, 81, 255),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: SizedBox(
                            height: 35,
                            child: Image.asset(
                              "assets/images/social.png",
                              color: const Color.fromARGB(255, 111, 81, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
