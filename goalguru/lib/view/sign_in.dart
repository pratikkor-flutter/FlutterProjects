import 'package:goalguru/main.dart';
import 'package:flutter/material.dart';
import 'package:goalguru/view/home_screen.dart';
import 'package:goalguru/view/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool flag = false;
  final signInFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> verifyCredentials() async {
    final Map<String, bool> verification = await checkUserCredentials(
        usernameController.text.trim(), passwordController.text.trim());

    if (verification[usernameController.text.trim()]!) {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 81, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GOALGURU",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const Divider(
                      indent: 100,
                      endIndent: 100,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text(
                      "DREAM . PLAN . ACHIEVE",
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 75,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome back",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                      ),
                      Text(
                        " Ready to conquer more goals together?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                      ),
                      Visibility(
                        visible: !flag,
                        child: SizedBox(
                          height: 175,
                          child: Image.asset("assets/images/signIn.jpg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Form(
                          key: signInFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                "Username",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 43, 0, 255),
                                ),
                              ),
                              TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "username is required";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 24,
                                    color: Color.fromARGB(255, 111, 81, 255),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  filled: true,
                                  fillColor: Color.fromARGB(96, 232, 244, 247),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                ),
                                onTap: () {
                                  setState(() {
                                    flag = true;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Password",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 43, 0, 255),
                                ),
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "password is required";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 24,
                                    color: Color.fromARGB(255, 111, 81, 255),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  filled: true,
                                  fillColor: Color.fromARGB(96, 232, 244, 247),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                ),
                                onTap: () {
                                  setState(() {
                                    flag = true;
                                  });
                                },
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Forgot Password",
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromARGB(255, 43, 0, 255),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (signInFormKey.currentState!
                                        .validate()) {
                                      verifyCredentials();
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width / 1.45,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 111, 81, 255),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "New here? Chart your path to success by",
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 43, 0, 255),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const SignUp(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.poppins(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromARGB(
                                              255, 43, 0, 255),
                                        ),
                                      ))
                                ],
                              )
                              // Text("Let's embark back on your journey of goal achievement.")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
