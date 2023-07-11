import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/screen/second_screen.dart';
import 'package:suitmedia_test/widget/name_textfield.dart';
import 'package:suitmedia_test/widget/sentence_textfield.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController namecontroller = TextEditingController();
  bool ispali = false;

  bool isPalindrome(String text) {
    String reversedText = text.replaceAll(" ", "").split('').reversed.join();
    return text.replaceAll(" ", "") == reversedText;
  }

  void checkPalindrome() {
    String sentence = namecontroller.text;
    isPalindrome(sentence);

    if (isPalindrome(sentence)) {
      setState(() {
        ispali = true;
      });
    } else {
      setState(() {
        ispali = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blueGrey,
              Colors.blue,
              Colors.blueAccent,
              Colors.grey,
            ],
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: const Icon(
                    Icons.person_add_alt_1,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    NameTextfield(controller: namecontroller, hintText: "Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    SentenceTexField(
                      labelText: namecontroller.text == ''
                          ? "Palindrome"
                          : ispali
                              ? "true"
                              : "false",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xff2b637b),
                    fixedSize: const Size(310, 41),
                  ),
                  onPressed: () {
                    checkPalindrome();
                  },
                  child: const Text(
                    "CHECK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xff2b637b),
                    fixedSize: const Size(310, 41),
                  ),
                  onPressed: () {
                    Get.to(
                      const SecondScreen(),
                      arguments: namecontroller.text,
                    );
                  },
                  child: const Text("NEXT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
