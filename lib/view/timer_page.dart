import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:google_form/view/userdetail.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late double height, width;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: height * 0.2,
                width: double.infinity,
                child: Image.asset("assets/bgc.png", fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: Text(
                  "Biometric Training Assessment",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.06,
                    backgroundColor: Color.fromRGBO(137, 125, 100, 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.05),

          // Timer Section
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                      size: width * 0.05,
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      "30 minutes",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "This is a timed form.",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: width * 0.04,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Once you start, you can't pause the timer. Don't worry, Forms gives you a final minute reminder before submission. Your answers will be automatically submitted when the time is up. Please prepare before you begin to help manage your submission time.",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: width * 0.04,
                  ),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Userdetail()),
                      );
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(width * 0.03),
                    width: width,
                    decoration: BoxDecoration(
                      color:
                          isLoading
                              ? Color.fromRGBO(91, 81, 66, 0.586)
                              : Color.fromRGBO(91, 81, 66, 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child:
                        isLoading
                            ? CircularProgressIndicator()
                            : Text(
                              "Start Timer",
                              style: GoogleFonts.roboto(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
