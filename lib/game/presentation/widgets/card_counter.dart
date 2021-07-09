import 'package:drinkly/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCountWidget extends StatelessWidget {
  const CardCountWidget({
    Key? key,
    required this.frontCardIndex,
  }) : super(key: key);

  final int frontCardIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Text(
        // '$frontCardIndex/25 cards',
        '$frontCardIndex/25 ${AppLocalizations.of(context)!.card_count}',
        style: GoogleFonts.poppins(
          fontSize: height * 0.025,
          color: Colors.white.withOpacity(0.65),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
