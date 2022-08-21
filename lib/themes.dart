import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class GrowthronTheme extends Theme {
//   const GrowthronTheme({data, child, Key? key})
//       : super(data: data, child: child, key: key);

//       static ThemeData of(BuildContext context) : Theme.of(context);
// }

// abstract class _ProvisionaryFFTheme extends ThemeData {
//   _ProvisionaryFFTheme({})

//   // _ProvisionaryFFTheme.of(BuildContext context) : Theme.of(context);
// }

class ThemeColumnWidget extends StatelessWidget {
  const ThemeColumnWidget({super.key});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Theme(
// Unique theme with ThemeData - Overwrite
          data: ThemeData(
            cardColor: Colors.deepOrange,
          ),
          child: const Card(
            child: Text('Unique ThemeData'),
          ),
        ),
        Theme(
// copyWith Theme - Inherit (Extended)
          data: Theme.of(context).copyWith(cardColor: Colors.deepOrange),
          child: const Card(
            child: Text('copyWith Theme'),
          ),
        ),
      ],
    );
  }
}

class OutfitTheme {
  static final TextStyle fontFamily =
      GoogleFonts.outfit(fontWeight: FontWeight.w600);
  static final TextStyle bodyText1 = fontFamily.copyWith(fontSize: 14);
  static final TextStyle bodyText2 = fontFamily.copyWith(fontSize: 14);
  static final TextStyle subtitle2 = fontFamily.copyWith(fontSize: 16);
  static final TextStyle subtitle1 = fontFamily.copyWith(fontSize: 18);
  static final TextStyle title3 = fontFamily.copyWith(fontSize: 20);
  static final TextStyle title2 = fontFamily.copyWith(fontSize: 22);
  static final TextStyle title1 = fontFamily.copyWith(fontSize: 24);
}
