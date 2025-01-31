import 'package:goalguru/main.dart';
import 'package:flutter/material.dart';
import 'package:goalguru/view/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool flag = false;
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  void insertCredentials() {
    insertUserData(
      UserData(
        name: "Pratik",
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPwdController.dispose();
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
            // const SizedBox(height: 10),
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
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                      ),
                      Text(
                        " Let's embark on a journey of goal achievement",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Visibility(
                        visible: !flag,
                        child: SizedBox(
                          height: 175,
                          child: Image.asset("assets/images/signUp.jpg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Form(
                          key: signUpFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                "Set Username",
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    flag = true;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Set Password",
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
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_open,
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
                                "Confirm Password",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 43, 0, 255),
                                ),
                              ),
                              TextFormField(
                                controller: confirmPwdController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "confirmation is required";
                                  } else if (passwordController.text.trim() !=
                                      confirmPwdController.text.trim()) {
                                    return "password does not match";
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
                              const SizedBox(height: 20),
                              Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (signUpFormKey.currentState!
                                        .validate()) {
                                      insertCredentials();

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const SignIn(),
                                        ),
                                      );
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Returning user? Let's tackle your tasks by",
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
                                                const SignIn(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Sign In",
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
