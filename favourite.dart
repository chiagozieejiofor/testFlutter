import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mylove extends StatefulWidget {
  const Mylove({super.key});

  @override
  State<Mylove> createState() => _MyloveState();
}

class _MyloveState extends State<Mylove> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child:
                Text("Just where death is expecting you is something we can not know; So for your part expect him everywhere.",
                  style: GoogleFonts.pacifico(
                      fontSize: 16,
                      fontWeight: FontWeight.w400),)),
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
