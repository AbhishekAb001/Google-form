import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_form/view/result_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You can view some results so far.Your final score will be ready after grading is completed.",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: width * 0.04),
            ),
            SizedBox(height: height * 0.03), // Increased spacing
            Text(
              "--- Important things you can do next ---",
              textAlign: TextAlign.center, // Ensures center alignment
              style: GoogleFonts.roboto(fontSize: width * 0.045),
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultScreen();
                        },
                      ),
                    );
                  },
                  child: _buildButton("View results"),
                ),
                SizedBox(width: width * 0.03),
                _buildButton("Save my response"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.015,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(170, 162, 149, 1)),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: width * 0.04,
          color: Color.fromRGBO(170, 162, 149, 1),
        ),
      ),
    );
  }
}
