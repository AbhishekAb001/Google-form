import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_form/view/quiz_screen.dart';

class Userdetail extends StatefulWidget {
  const Userdetail({super.key});

  @override
  State<Userdetail> createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {
  late double height, width;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _adharNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 243, 242, 1),
      body: Column(
        children: [
          // Fixed Stack with background and title
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

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    // Title Text
                    Text(
                      "Student Information",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    // Form Fields
                    createTextField(
                      "Enter your answer",
                      "Candidate Name",
                      _nameController,
                      "1",
                    ),
                    SizedBox(height: height * 0.03),
                    createTextField(
                      "Enter your answer",
                      "Location",
                      _locationController,
                      "2",
                    ),
                    SizedBox(height: height * 0.03),
                    createTextField(
                      "The value must be a number",
                      "Phone Number",
                      _phoneController,
                      "3",
                      true,
                    ),
                    SizedBox(height: height * 0.03),
                    createTextField(
                      "The value must be a number",
                      "Adhar Number",
                      _adharNumberController,
                      "4",
                      true,
                    ),
                    SizedBox(height: height * 0.05),

                    // Next Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizScreen()),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.all(width * 0.03),
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(117, 104, 84, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
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
    );
  }

  Widget createTextField(
    String hint,
    String title,
    TextEditingController controller,
    String number, [
    bool keyType = false,
  ]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title for the text field
        RichText(
          text: TextSpan(
            text: "$number. ",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: title,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: " *",
                style: GoogleFonts.roboto(
                  color: Colors.red,
                  fontSize: width * 0.04,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),

        // The actual TextField
        SizedBox(
          width: width,
          height: height * 0.045,
          child: TextField(
            keyboardType: keyType ? TextInputType.number : TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: width * 0.04,
              ),
              labelStyle: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: width * 0.04,
              ),
              filled: true,
              contentPadding: EdgeInsets.only(
                left: width * 0.02,
                bottom: height * 0.015,
              ),
              fillColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(134, 0, 0, 0),
                ),
              ),
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
