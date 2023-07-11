import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/controller/user_controller.dart';
import 'package:suitmedia_test/screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final String name = Get.arguments;
    final nameFromThird = Get.find<SelectedUserController>();
    Get.find<SelectedUserController>().selectedUserName.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Second Screen",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff04021D),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            color: Color(0xffE5E5E5),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, left: 20.0, right: 20, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff04021D),
                        ),
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff04021D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Obx(() => Column(
                    children: [
                      const Text(
                        'Selected User Name',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff04021D)),
                      ),
                      Text(
                        nameFromThird.selectedUserName.value,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2b637b),
                  fixedSize: const Size(310, 41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Choose a User',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Get.to(
                    const ThirdScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
