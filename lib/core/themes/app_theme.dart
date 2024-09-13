import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app_colors.dart';

ThemeData appLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _lightColorScheme,
    primaryColor: _lightColorScheme.background,
    dividerTheme: _darkDividerThemeData,
    scaffoldBackgroundColor: _lightColorScheme.background,
    textTheme: _lightTextTheme(),
    primaryTextTheme: _lightTextTheme().apply(
      bodyColor: TextLightPrimary,
      displayColor: TextLightPrimary,
    ),
    inputDecorationTheme: _lightInputDecorationTheme,
    elevatedButtonTheme: _lightElevatedButtonThemeData,
    textButtonTheme: _lightTextButtonThemeData,
    iconTheme: _lightIconThemeData,
    primaryIconTheme: _lightIconThemeData,
    appBarTheme: _lightAppBarTheme,
    bottomAppBarTheme: _lightBottomAppBarTheme,
    bottomNavigationBarTheme: _lightBottomNavigationBarThemeData,
    floatingActionButtonTheme: _lightFloatingActionButtonTheme,
    radioTheme: _lightRadioThemeData,
    switchTheme: _lightSwitchThemeData,
    checkboxTheme: _lightCheckBoxThemeData,
    textSelectionTheme: _lightTextSelectionThemeData,
    tabBarTheme: _lightTabBarTheme,
    dialogTheme: _lightDialogTheme,
    cardTheme: _lightCardTheme,
    chipTheme: _lightChipThemeData,
    bottomSheetTheme: _lightBottomSheetThemeData,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // textSelectionHandleColor: Primary,
  );
}

ThemeData appDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: _darkColorScheme,
    primaryColor: _darkColorScheme.background,
    dividerTheme: _darkDividerThemeData,
    scaffoldBackgroundColor: _darkColorScheme.background,
    textTheme: _darkTextTheme(),
    primaryTextTheme: _darkTextTheme().apply(
      bodyColor: const Color(0xffC1C1C1),
      displayColor: const Color(0xffC1C1C1),
    ),
    inputDecorationTheme: _darkInputDecorationTheme,
    elevatedButtonTheme: _darkElevatedButtonThemeData,
    textButtonTheme: _darkTextButtonThemeData,
    iconTheme: _darkIconThemeData,
    primaryIconTheme: _darkIconThemeData,
    appBarTheme: _darkAppBarTheme,
    bottomAppBarTheme: _darkBottomAppBarTheme,
    bottomNavigationBarTheme: _darkBottomNavigationBarThemeData,
    floatingActionButtonTheme: _darkFloatingActionButtonTheme,
    radioTheme: _darkRadioThemeData,
    switchTheme: _darkSwitchThemeData,
    checkboxTheme: _darkCheckBoxThemeData,
    textSelectionTheme: _darkTextSelectionThemeData,
    tabBarTheme: _darkTabBarTheme,
    dialogTheme: _darkDialogTheme,
    cardTheme: _darkCardTheme,
    chipTheme: _darkChipThemeData,
    bottomSheetTheme: _darkBottomSheetThemeData,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const ColorScheme _lightColorScheme = ColorScheme.light(
  primary: Primary,
  secondary: LightSecondary,
  surface: LightSurface,
  tertiary: LightInactive1,
  background: LightBackground,
  error: Danger,
  brightness: Brightness.light,
  onBackground: DarkBackground,
  onSecondary: LightActiveChip,
  secondaryContainer: LightBackground,
  onSecondaryContainer: LightBackground,
  outline: PrimaryText
);

const ColorScheme _darkColorScheme = ColorScheme.dark(
  primary: Primary,
  secondary: Secondary,
  surface: Surface,
  tertiary: LightInactive1,
  background: DarkBackground,
  error: Danger,
  brightness: Brightness.dark,
  onBackground: LightBackground,
  onSecondary: DarkBackground,
  secondaryContainer: Surface,
  onSecondaryContainer: Primary,
  outline: PrimaryDarkText,

);

const DividerThemeData _darkDividerThemeData = DividerThemeData(color: DividerColor);

final BottomSheetThemeData _lightBottomSheetThemeData = BottomSheetThemeData(
    elevation: 0.0, backgroundColor: _lightColorScheme.surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))));

final BottomSheetThemeData _darkBottomSheetThemeData = BottomSheetThemeData(
    elevation: 0.0, backgroundColor: _darkColorScheme.surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))));

final ChipThemeData _lightChipThemeData = ChipThemeData(
  elevation: 0.0,
  backgroundColor: _lightColorScheme.background,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  disabledColor: const Color.fromRGBO(255, 255, 255, 0.12),
  selectedColor: const Color.fromRGBO(255, 255, 255, 0.12),
  secondarySelectedColor: const Color.fromRGBO(255, 255, 255, 0.12),
  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
  labelStyle: _lightTextTheme().bodyMedium,
  secondaryLabelStyle: _lightTextTheme().bodyMedium,
  brightness: Brightness.dark,
);

final ChipThemeData _darkChipThemeData = ChipThemeData(
  elevation: 0.0,
  backgroundColor: _darkColorScheme.background,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  disabledColor: Color.fromARGB(30, 164, 213, 26),
  selectedColor: _darkColorScheme.background,
  secondarySelectedColor: Color.fromARGB(30, 38, 46, 206),
  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
  labelStyle: _darkTextTheme().bodyMedium,
  secondaryLabelStyle: _darkTextTheme().bodyMedium,
  brightness: Brightness.dark,
);

final CardTheme _lightCardTheme =
CardTheme(elevation: 0.4, color: _lightColorScheme.surface, margin: const EdgeInsets.symmetric(vertical: 10.0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)));

final CardTheme _darkCardTheme =
CardTheme(elevation: 0.4, color: _darkColorScheme.surface, margin: const EdgeInsets.symmetric(vertical: 10.0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)));

final DialogTheme _lightDialogTheme = DialogTheme(
  backgroundColor: _lightColorScheme.surface,
  elevation: 0.0,
  titleTextStyle: _lightTextTheme().titleSmall,
  contentTextStyle: _lightTextTheme().bodyMedium,
);

final DialogTheme _darkDialogTheme = DialogTheme(
  backgroundColor: _darkColorScheme.surface,
  elevation: 0.0,
  titleTextStyle: _darkTextTheme().titleSmall,
  contentTextStyle: _darkTextTheme().bodyMedium,
);

const TabBarTheme _lightTabBarTheme = TabBarTheme(
  labelColor: Primary,
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: LightSecondary,
  indicator: UnderlineTabIndicator(borderSide: BorderSide(color: LightSecondary, width: 2.0)),
);

const TabBarTheme _darkTabBarTheme = TabBarTheme(
  labelColor: Primary,
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: BottomNavBarIcon,
  indicator: UnderlineTabIndicator(borderSide: BorderSide(color: TextPrimary, width: 2.0)),
);

TextSelectionThemeData _lightTextSelectionThemeData = TextSelectionThemeData(cursorColor: Primary, selectionHandleColor: Primary, selectionColor: Primary.withOpacity(0.5));
TextSelectionThemeData _darkTextSelectionThemeData = TextSelectionThemeData(cursorColor: Primary, selectionHandleColor: Primary, selectionColor: Primary.withOpacity(0.5));

final SwitchThemeData _lightSwitchThemeData = SwitchThemeData(thumbColor: MaterialStateProperty.all<Color>(LightInactive2));
final SwitchThemeData _darkSwitchThemeData = SwitchThemeData(thumbColor: MaterialStateProperty.all<Color>(TextPrimary));

final CheckboxThemeData _lightCheckBoxThemeData = CheckboxThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  checkColor: MaterialStateProperty.all<Color>(Colors.black),
);

final CheckboxThemeData _darkCheckBoxThemeData = CheckboxThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  checkColor: MaterialStateProperty.all<Color>(Colors.white),
);

const FloatingActionButtonThemeData _lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0.0,
    focusElevation: 0.0,
    hoverElevation: 0.0,
    disabledElevation: 0.0,
    highlightElevation: 0.0,
    splashColor: Primary,
    backgroundColor: Primary,
    foregroundColor: TextPrimary);

const FloatingActionButtonThemeData _darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0.0,
    focusElevation: 0.0,
    hoverElevation: 0.0,
    disabledElevation: 0.0,
    highlightElevation: 0.0,
    splashColor: Primary,
    backgroundColor: Primary,
    foregroundColor: TextPrimary);

const IconThemeData _lightIconThemeData = IconThemeData(color: LightIcon);
const IconThemeData _darkIconThemeData = IconThemeData(color: Color(0xffC1C1C1));

final AppBarTheme _lightAppBarTheme = AppBarTheme(
  elevation: 0.0,
  centerTitle: false,
  backgroundColor: _lightColorScheme.surface,
  titleTextStyle: _lightTextTheme().titleMedium,
  iconTheme: const IconThemeData(color: LightIcon),
);

final AppBarTheme _darkAppBarTheme = AppBarTheme(
  elevation: 0.0,
  centerTitle: false,
  backgroundColor: _darkColorScheme.surface,
  titleTextStyle: _darkTextTheme().titleMedium,
  iconTheme: const IconThemeData(color: TextPrimary),
);

final BottomAppBarTheme _lightBottomAppBarTheme = BottomAppBarTheme(elevation: 0.4, color: _lightColorScheme.surface);
final BottomAppBarTheme _darkBottomAppBarTheme = BottomAppBarTheme(elevation: 0.4, color: _darkColorScheme.surface);

final BottomNavigationBarThemeData _lightBottomNavigationBarThemeData = BottomNavigationBarThemeData(
    elevation: 0.0,
    showSelectedLabels: false,
    selectedItemColor: Primary,
    type: BottomNavigationBarType.fixed,
    backgroundColor: _lightColorScheme.surface,
    unselectedItemColor: LightIcon,
    selectedIconTheme: const IconThemeData(color: Primary),
    unselectedIconTheme: const IconThemeData(color: LightIcon));

final BottomNavigationBarThemeData _darkBottomNavigationBarThemeData = BottomNavigationBarThemeData(
    elevation: 0.0,
    showSelectedLabels: false,
    selectedItemColor: Primary,
    type: BottomNavigationBarType.fixed,
    backgroundColor: _darkColorScheme.surface,
    unselectedItemColor: LightSecondary,
    selectedIconTheme: const IconThemeData(color: Primary),
    unselectedIconTheme: const IconThemeData(color: LightSecondary));

const InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 36.0, top: 2.5),
    border: UnderlineInputBorder(borderSide: BorderSide(color: LightSecondary)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: LightSecondary)),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Primary)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Danger)),
    focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Danger)));

const InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 36.0, top: 2.5),
    border: UnderlineInputBorder(borderSide: BorderSide(color: Secondary)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Secondary)),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Primary)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Danger)),
    focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Danger)));

final ElevatedButtonThemeData _lightElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        overlayColor: MaterialStateProperty.all<Color>(Primary),
        textStyle: MaterialStateProperty.all<TextStyle>(_lightTextTheme().labelMedium?.copyWith(color: Primary) ?? const TextStyle()),
        backgroundColor: MaterialStateProperty.all<Color>(_lightColorScheme.surface),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))));

final ElevatedButtonThemeData _darkElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        overlayColor: MaterialStateProperty.all<Color>(Primary),
        textStyle: MaterialStateProperty.all<TextStyle>(_lightTextTheme().labelMedium?.copyWith(color: Primary) ?? const TextStyle()),
        backgroundColor: MaterialStateProperty.all<Color>(_darkColorScheme.surface),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))));

final TextButtonThemeData _lightTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))));

final TextButtonThemeData _darkTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))));

final RadioThemeData _lightRadioThemeData = RadioThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  overlayColor: MaterialStateProperty.all<Color>(LightInactive1),
  fillColor: MaterialStateProperty.all<Color>(const Color(0xffC1C1C1)),
);

final RadioThemeData _darkRadioThemeData = RadioThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  overlayColor: MaterialStateProperty.all<Color>(Primary),
  fillColor: MaterialStateProperty.all<Color>(const Color(0xffC1C1C1)),
);

TextTheme _lightTextTheme() {
  final base = ThemeData.light().textTheme;
  return base
      .copyWith(
      displayMedium: base.displayMedium?.copyWith(fontSize: 96, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300),
      headlineLarge: base.headlineLarge?.copyWith(fontSize: 60, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300),
      headlineMedium: base.headlineMedium?.copyWith(fontSize: 48, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      headlineSmall: base.headlineSmall?.copyWith(fontSize: 34, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300),
      titleLarge: base.titleLarge?.copyWith(fontSize: 28, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      titleMedium: base.titleMedium?.copyWith(fontSize: 24, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),
      titleSmall: base.titleSmall?.copyWith(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 18, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),
      bodyMedium: base.bodyMedium?.copyWith(fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      bodySmall: base.bodySmall?.copyWith(fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      labelLarge: base.labelLarge?.copyWith(fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
      labelMedium: base.labelMedium?.copyWith(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      labelSmall: base.labelSmall?.copyWith(fontSize: 10, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, letterSpacing: -0.3))
      .apply(fontFamily: 'Overpass', displayColor: LightSecondary, bodyColor: LightSecondary);
}

TextTheme _darkTextTheme() {
  final base = ThemeData.dark().textTheme;
  return base
      .copyWith(
      displayMedium: base.displayMedium?.copyWith(fontSize: 96, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300),
      headlineLarge: base.headlineLarge?.copyWith(fontSize: 60, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300),
      headlineMedium: base.headlineMedium?.copyWith(fontSize: 48, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      headlineSmall: base.headlineSmall?.copyWith(fontSize: 34, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300),
      titleLarge: base.titleLarge?.copyWith(fontSize: 28, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      titleMedium: base.titleMedium?.copyWith(fontSize: 24, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),
      titleSmall: base.titleSmall?.copyWith(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 18, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),
      bodyMedium: base.bodyMedium?.copyWith(fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      bodySmall: base.bodySmall?.copyWith(fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      labelLarge: base.labelLarge?.copyWith(fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
      labelMedium: base.labelMedium?.copyWith(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      labelSmall: base.labelSmall?.copyWith(fontSize: 10, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, letterSpacing: -0.3))
      .apply(fontFamily: 'Overpass', displayColor: TextPrimary, bodyColor: TextPrimary);
}
