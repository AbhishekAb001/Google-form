import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_form/view/data.dart';
import 'package:google_form/view/info_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late double height, width;
  int currentQuestionIndex = 0;
  int totalQuestions = 10;
  double progress = 0.0;
  double totalTime = 30 * 60.0;
  int remainingTimeInSeconds = 30 * 60;
  late Timer _timer;
  List<int> selectedOptionIndices = List.filled(Data().questions.length, -1);
  String messege = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTimeInSeconds > 0) {
        setState(() {
          remainingTimeInSeconds--;
          progress = (totalTime - remainingTimeInSeconds) / totalTime;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

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
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                padding: EdgeInsets.all(width * 0.05),
                width: width,
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(-1.0, 1.0),
                        child: LinearProgressIndicator(
                          value: progress,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(117, 104, 84, 1),
                          ),
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                      size: width * 0.05,
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      formatTime(remainingTimeInSeconds),
                      style: GoogleFonts.roboto(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
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
                        RichText(
                          text: TextSpan(
                            text: "*  ",
                            style: GoogleFonts.roboto(
                              color: Colors.red,
                              fontSize: width * 0.035,
                            ),
                            children: [
                              TextSpan(
                                text: "Required",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: width * 0.035,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Statistics Quiz",
                          style: GoogleFonts.roboto(
                            color: Color.fromRGBO(91, 81, 66, 1),
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    padding: EdgeInsets.only(
                                      left: width * 0.05,
                                    ),
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
                                        Data()
                                            .questions[index]['options']
                                            .length,
                                    itemBuilder: (context, optionIndex) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: height * 0.01,
                                          left: width * 0.05,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedOptionIndices[index] =
                                                      optionIndex;
                                                });
                                              },
                                              child:
                                                  selectedOptionIndices[index] ==
                                                          optionIndex
                                                      ? Icon(
                                                        Icons.check_circle,
                                                        size: width * 0.05,

                                                        color: Colors.black,
                                                      )
                                                      : Icon(
                                                        Icons.circle_outlined,
                                                        size: width * 0.05,
                                                        color: Colors.black,
                                                      ),
                                            ),
                                            SizedBox(width: width * 0.02),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedOptionIndices[index] =
                                                        optionIndex;
                                                  });
                                                },
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

                        (messege.isNotEmpty)
                            ? Text(
                              messege,
                              style: GoogleFonts.roboto(
                                color: Colors.red,
                                fontSize: width * 0.035,
                              ),
                            )
                            : Container(),
                        SizedBox(height: height * 0.02),
                        GestureDetector(
                          onTap: submitQuiz,
                          child: Container(
                            padding: EdgeInsets.all(width * 0.03),
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(117, 104, 84, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void submitQuiz() {
    selectedOptionIndices.forEach((element) {
      if (element == -1) {
        setState(() {
          messege = 'Please answer all questions *';
        });
        return;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoScreen()),
        );
      }
    });
  }
}
