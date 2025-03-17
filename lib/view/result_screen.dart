import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_form/view/data.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late double width, height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/bgc.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
          Container(
            padding: EdgeInsets.all(width * 0.1),
            width: width,
            height: height,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.02,
                  ),
                  padding: EdgeInsets.all(width * 0.05),
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Biometric Training Assessment",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.05,
                        ),
                      ),

                      SizedBox(height: height * 0.02),
                      Container(
                        width: width,
                        // height: height * 0.3,
                        padding: EdgeInsets.all(width * 0.025),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          border: Border.all(
                            color: Color.fromRGBO(170, 162, 149, 1),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Points: ",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: "10/40",
                                    style: GoogleFonts.roboto(
                                      fontSize: width * 0.04,
                                      color: Color.fromRGBO(170, 162, 149, 1),

                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            RichText(
                              text: TextSpan(
                                text: "Time: ",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: "03:02",
                                    style: GoogleFonts.roboto(
                                      fontSize: width * 0.04,
                                      color: Color.fromRGBO(170, 162, 149, 1),

                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      Text(
                        "Student information",
                        style: GoogleFonts.roboto(
                          color: Color.fromRGBO(91, 81, 66, 1),
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Data().questions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${index + 1}. ",
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        Data().questions[index]['question'],
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: width * 0.038,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.05),
                                  child: RichText(
                                    text: TextSpan(
                                      text: '(1 Point)',
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: GoogleFonts.roboto(
                                            color: Colors.red,
                                            fontSize: width * 0.035,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      Data().questions[index]['options'].length,
                                  itemBuilder: (context, optionIndex) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: height * 0.01,
                                        left: width * 0.05,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle_outlined,
                                            size: width * 0.05,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: width * 0.02),
                                          Expanded(
                                            child: Text(
                                              Data()
                                                  .questions[index]['options'][optionIndex],
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      SizedBox(height: height * 0.02),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(width * 0.03),
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(117, 104, 84, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Save",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: width * 0.03,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
