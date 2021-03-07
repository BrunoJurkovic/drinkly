import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Color(0xff352f44),
          elevation: 0,
          actions: [
            IconButton(icon: Icon(CupertinoIcons.settings), onPressed: () {})
          ],
        ),
      ),
      backgroundColor: Color(0xff2a2438),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * 0.35,
            decoration: BoxDecoration(
              color: Color(0xff352f44),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
              ),
            ),
            child: Center(
              child: Container(
                height: height * 0.25,
                width: width * 0.7,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          Center(
            child: Text(
              'Who is playing?',
              style: GoogleFonts.poppins(
                fontSize: height * 0.03,
                color: Colors.pinkAccent[200].withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Container(
              height: height * 0.275,
              width: width * 0.8,
              padding: EdgeInsets.only(top: 25),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: height * 0.0175),
                    child: Dismissible(
                      key: Key(index.toString()),
                      onDismissed: (_) {},
                      child: Container(
                        width: width * 0.7,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xff352f44),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // SizedBox(height: height * 0.0025),
          Container(
            height: height * 0.035,
            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '+ Add new player',
                style: GoogleFonts.poppins(
                  fontSize: height * 0.015,
                  color: Colors.pinkAccent[200].withOpacity(0.9),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Center(
            child: Container(
              width: width * 0.7,
              height: height * 0.055,
              color: Color(0xff411e8f),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Let's go!",
                  style: GoogleFonts.poppins(
                    fontSize: height * 0.0275,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
