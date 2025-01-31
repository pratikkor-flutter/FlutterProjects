import 'package:intl/intl.dart';
import 'package:goalguru/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:date_picker_timeline/date_picker_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  dynamic editTitleController;
  dynamic editDescController;
  dynamic editDateController;

  int completionStatus = 0;
  Icon currentIcon = const Icon(Icons.circle_outlined);

  final goalFormKey = GlobalKey<FormState>();

  String? name;
  dynamic goalCardMapFromSqflite;

  void getGoalCardData() async {
    goalCardMapFromSqflite = await getGoalData();
  }

  void displayName() async {
    name = await getName();
  }

  void insertGoalCard() async {
    await insertGoalData(
      GoalData(
        title: titleController.text.trim(),
        description: descController.text.trim(),
        date: dateController.text.trim(),
      ),
    );
  }

  void updateGoalCard() async {
    await updateGoalData(
      GoalData(
        title: editTitleController.text.trim(),
        description: editDescController.text.trim(),
        date: editDateController.text.trim(),
      ),
    );
  }

  void clearControllerValues() {
    titleController.clear();
    descController.clear();
    dateController.clear();
  }

  void presentBottomSheet(bool isEdit, String title, String desc, String date) {
    if (isEdit) {
      editTitleController = TextEditingController(text: title);
      editDescController = TextEditingController(text: desc);
      editDateController = TextEditingController(text: date);
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEdit ? "Enhance your Tackle !" : "Ready to Set a Goal !",
                  style: GoogleFonts.quicksand(
                    color: const Color.fromARGB(255, 43, 0, 255),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Form(
                  key: goalFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Title",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                      ),
                      TextFormField(
                        controller:
                            isEdit ? editTitleController : titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "title is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          filled: true,
                          fillColor: Color.fromARGB(96, 232, 244, 247),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                      ),
                      TextFormField(
                        controller:
                            isEdit ? editDescController : descController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "description is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          filled: true,
                          fillColor: Color.fromARGB(96, 232, 244, 247),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Date",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 43, 0, 255),
                        ),
                      ),
                      TextFormField(
                        controller:
                            isEdit ? editDateController : dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "date is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            height: 12,
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              "assets/images/calendar.gif",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          filled: true,
                          fillColor: const Color.fromARGB(96, 232, 244, 247),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        readOnly: true,
                        onTap: () async {
                          // showDatePicker return Future thus use async with await
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2025),
                            lastDate: DateTime(2026),
                          );
                          // DateFormat is used to format date & also it converts date into String
                          String formatDate =
                              DateFormat.yMMMMd().format(pickedDate!);
                          setState(
                            () {
                              dateController.text = formatDate;
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isEdit ? updateGoalCard() : insertGoalCard();
                    getGoalCardData();
                    Navigator.of(context).pop();
                    clearControllerValues();
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 1.45,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 111, 81, 255),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    displayName();
    getGoalCardData();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(200, 111, 81, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 24,
              left: 18,
              right: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    name == null ? "" : name!,
                    style: GoogleFonts.quicksand(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 125,
              bottom: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height - 226,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 200, 200, 200),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "\tYour Goals",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 45,
                    //   width: MediaQuery.sizeOf(context).width,
                    //   margin: const EdgeInsets.symmetric(vertical: 4),
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 10,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(7.0),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               _selectedIndex = index;
                    //             });
                    //           },
                    //           child: Container(
                    //             width: 50,
                    //             decoration: BoxDecoration(
                    //               color: index == _selectedIndex
                    //                   ? const Color.fromARGB(255, 111, 81, 255)
                    //                   : Colors.white,
                    //               boxShadow: const [
                    //                 BoxShadow(
                    //                   spreadRadius: 2,
                    //                   blurRadius: 2.5,
                    //                   color: Colors.black45,
                    //                   offset: Offset(2, 2),
                    //                 ),
                    //               ],
                    //               borderRadius: BorderRadius.circular(12.5),
                    //             ),
                    //             child: Center(
                    //               child: Text(
                    //                   "${DateFormat.MMMd().format(DateTime.now())}"),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 3.5),
                    //   padding: const EdgeInsets.symmetric(vertical: 4),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black45,
                    //         spreadRadius: 1,
                    //         blurRadius: 2,
                    //         offset: Offset(0, 1),
                    //       ),
                    //     ],
                    //   ),
                    //   child: DatePicker(
                    //     DateTime.now(),
                    //     width: 45,
                    //     height: 65,
                    //     monthTextStyle: const TextStyle(
                    //       fontSize: 10,
                    //       fontWeight: FontWeight.w500,
                    //       color: Color.fromARGB(255, 111, 81, 255),
                    //     ),
                    //     dateTextStyle: const TextStyle(
                    //       fontSize: 10,
                    //       fontWeight: FontWeight.bold,
                    //       color: Color.fromARGB(255, 111, 81, 255),
                    //     ),
                    //     dayTextStyle: GoogleFonts.quicksand(
                    //       fontSize: 10,
                    //       fontWeight: FontWeight.w500,
                    //       color: const Color.fromARGB(255, 111, 81, 255),
                    //     ),
                    //     initialSelectedDate: DateTime.now(),
                    //     selectionColor: const Color.fromARGB(255, 111, 81, 255),
                    //   ),
                    // ),
                    // const Divider(
                    //   height: 1,
                    // ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height - 246,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(
                          top: 25,
                          left: 10,
                          right: 10,
                        ),
                        itemCount: goalCardMapFromSqflite == null
                            ? 0
                            : goalCardMapFromSqflite.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.2,
                              children: [
                                Container(
                                  width: 60,
                                  height: 90,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 1),
                                      SlidableAction(
                                        padding: const EdgeInsets.all(2),
                                        onPressed: (context) {
                                          presentBottomSheet(
                                            true,
                                            goalCardMapFromSqflite[index]
                                                ['GOAL_TITLE'],
                                            goalCardMapFromSqflite[index]
                                                ['GOAL_DESCRIPTION'],
                                            goalCardMapFromSqflite[index]
                                                ['GOAL_DATE'],
                                          );
                                        },
                                        icon: Icons.edit,
                                        backgroundColor: const Color.fromARGB(
                                            200, 111, 81, 255),
                                        foregroundColor: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(360),
                                      ),
                                      const SizedBox(height: 5),
                                      SlidableAction(
                                        padding: const EdgeInsets.all(2),
                                        onPressed: (context) async {
                                          await deleteGoalData(
                                              goalCardMapFromSqflite[index]
                                                  ['GOAL_TITLE']);
                                        },
                                        icon: Icons.delete_outline,
                                        backgroundColor: const Color.fromARGB(
                                            200, 111, 81, 255),
                                        foregroundColor: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(360),
                                      ),
                                      const SizedBox(height: 1),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width - 20,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: 0,
                                    blurRadius: 15,
                                    color: Color.fromARGB(255, 215, 215, 215),
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.black,
                                      child: Image.asset(
                                          "assets/images/checklist.gif"),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          goalCardMapFromSqflite[index]
                                              ['GOAL_TITLE'],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          goalCardMapFromSqflite[index]
                                              ['GOAL_DESCRIPTION'],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          goalCardMapFromSqflite[index]
                                              ['GOAL_DATE'],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      if (completionStatus == 0) {
                                        completionStatus = 1;
                                        currentIcon =
                                            const Icon(Icons.circle_outlined);
                                      } else {
                                        completionStatus = 0;
                                        currentIcon = const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        );
                                      }
                                      setState(() {});
                                    },
                                    icon: currentIcon,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: GNav(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          tabMargin: const EdgeInsets.symmetric(horizontal: 15),
          gap: 10,
          activeColor: const Color.fromARGB(200, 111, 81, 255),
          tabBackgroundColor: const Color.fromARGB(100, 111, 81, 255),
          tabs: [
            GButton(
              icon: Icons.list,
              onPressed: () {
                setState(() {});
              },
              text: "Home",
              textStyle: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(200, 111, 81, 255),
              ),
            ),
            GButton(
              icon: Icons.library_add,
              onPressed: () {
                presentBottomSheet(false, "", "", "");
              },
              text: "Set Goal",
              textStyle: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(200, 111, 81, 255),
              ),
            ),
            GButton(
              icon: Icons.person,
              onPressed: () {
                //
              },
              text: "Profile",
              textStyle: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(200, 111, 81, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
