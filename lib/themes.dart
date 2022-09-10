import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

const FlexSchemeData _myFlexScheme = FlexSchemeData(
  name: 'Blank',
  description: 'Colorscheme dedicated to Blank (stolen from twitter)',
  light: FlexSchemeColor(
    primary: Color(0xFF00501E),
    primaryContainer: Color(0xFFABFE2C),
    secondary: Color(0xFFE3CFFF),
    secondaryContainer: Color(0xFFC7C0D9),
    tertiary: Color(0xFF657786),
    tertiaryContainer: Color(0xFFAAB8C2),
    error: Color(0xFFDF576B),
    errorContainer: Color(0xFFF9DDE1)
  ),
  // TODO: choose a colorscheme for darktheme
  dark: FlexSchemeColor(
    primary: Color(0xFFB1CFF5),
    primaryContainer: Color(0xFF3873BA),
    secondary: Color(0xFFFFD270),
    secondaryContainer: Color(0xFFD26900),
    tertiary: Color(0xFFC9CBFC),
    tertiaryContainer: Color(0xFF535393),
  ),
);

FlexColorScheme lightColorScheme = FlexColorScheme.light(
  colors: _myFlexScheme.light,
  useMaterial3: true
);

FlexColorScheme darkColorScheme = FlexColorScheme.dark(
    colors: _myFlexScheme.dark,
    useMaterial3: true
);

ThemeData lightThemeData = lightColorScheme.toTheme.copyWith(
  textTheme: GoogleFonts.robotoTextTheme(lightColorScheme.textTheme)
);

ThemeData darkThemeData = darkColorScheme.toTheme.copyWith(
  textTheme: GoogleFonts.robotoTextTheme(darkColorScheme.textTheme)
);
