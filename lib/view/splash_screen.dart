import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_form/view/timer_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/bgc.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Biometric Training Assessment",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.12,
                  ),
                ),
                SizedBox(height: height * 0.05),
                Text(
                  "This template includes Statistics, for biometric as examples to demonstrate how Forms can help Trainer and Candidate effectively use tests or quizzes online",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    backgroundColor: Color.fromRGBO(137, 125, 100, 1),
                  ),
                ),
                SizedBox(height: height * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerPage()),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(width * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Start now",
                      style: GoogleFonts.roboto(
                        color: Color.fromRGBO(117, 104, 84, 1),
                        fontSize: width * 0.05,
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
