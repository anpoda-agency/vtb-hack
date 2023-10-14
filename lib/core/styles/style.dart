import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// кастомные поля
class OwnThemeFields {
  final Color errorShade;
  final Color textBaloon;

  const OwnThemeFields({
    Color? errorShade,
    Color? textBaloon,
  })  : errorShade = errorShade ?? Colors.red,
        textBaloon = textBaloon ?? Colors.black;
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    _own[inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty;

  OwnThemeFields own() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= const OwnThemeFields();
      o = empty;
    }
    return o!;
  }
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      Colors.blueGrey[50]!.value,
      <int, Color>{
        50: Color(Colors.blueGrey[50]!.value),
        100: Color(Colors.blueGrey[100]!.value),
        200: Color(Colors.blueGrey[200]!.value),
        300: Color(Colors.blueGrey[300]!.value),
        400: Color(Colors.blueGrey[400]!.value),
        500: Color(Colors.blueGrey[500]!.value),
        600: Color(Colors.blueGrey[600]!.value),
        700: Color(Colors.blueGrey[700]!.value),
        800: Color(Colors.blueGrey[800]!.value),
        900: Color(Colors.blueGrey[900]!.value)
      },
    ),
    primaryColor: const Color(0xFF7934D3),
    // primaryColor: const Color(0xFF3365BD),
    // primaryColorBrightness: Brightness.light,
    primaryColorLight: const Color(0xFFA999F3),
    primaryColorDark: const Color(0xFF6D4291),
    canvasColor: Colors.white,
    // фон навигации бар *************************
    scaffoldBackgroundColor: Colors.white,
    //6c5dd3
    cardColor: const Color(0xaaF5E0C3),
    dividerColor: const Color(0xFFDCE6E2),
    focusColor: const Color(0x1aF5E0C3),
    hoverColor: Colors.grey.shade400,
    highlightColor: Colors.grey[600],
    splashColor: Colors.grey[400],
    unselectedWidgetColor: const Color(0xFF7934D3),
    disabledColor: const Color(0xFFF0F0F0),
    // DCE6E2
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.grey[200],
      cursorColor: const Color(0xFF6D4291),
      selectionHandleColor: const Color(0xFF6D4291),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(const Color(0xFF9C9FB2)),
    ),
    secondaryHeaderColor: Colors.grey[700],
    dialogBackgroundColor: Colors.white,
    indicatorColor: const Color(0xFF6D4291),
    hintColor: Colors.grey,
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 24,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
      ),

      /// displayMedium
      // headline1: TextStyle(
      //   fontSize: 24,
      //   color: Color(0xFF000000),
      //   fontWeight: FontWeight.w500,
      // ),

      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
      ),

      /// displaySmall
      // headline2: TextStyle(
      //   fontSize: 20,
      //   color: Color(0xFF000000),
      //   fontWeight: FontWeight.w500,
      // ),

      headlineMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
      ),

      /// headlineMedium
      // headline3: TextStyle(
      //   fontSize: 16,
      //   color: Color(0xFF000000),
      //   fontWeight: FontWeight.w500,
      // ),

      bodyMedium: TextStyle(
        fontSize: 18,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w400,
      ),

      /// bodyMedium
      // bodyText1: TextStyle(
      //   fontSize: 18,
      //   color: Color(0xFF000000),
      //   fontWeight: FontWeight.w400,
      // ),

      bodySmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w400,
      ),

      /// bodySmall
      // bodyText2: TextStyle(
      //   fontSize: 16,
      //   color: Color(0xFF000000),
      //   fontWeight: FontWeight.w400,
      // ),

      labelSmall: TextStyle(
        fontSize: 12,
        color: Color(0xFF000000),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    primaryTextTheme: const TextTheme(
      labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),

      /// labelLarge
      // caption: TextStyle(
      //   fontWeight: FontWeight.bold,
      //   fontSize: 20,
      //   color: Colors.black,
      // ),

      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Color(0xFF232F37),
      ),

      /// displayMedium
      // headline1: TextStyle(
      //   fontWeight: FontWeight.w700,
      //   fontSize: 20,
      //   color: Color(0xFF232F37),
      // ),

      displaySmall: TextStyle(
        fontSize: 18,
        color: Color(0xFF232F37),
        fontWeight: FontWeight.w700,
      ),

      /// displaySmall
      // headline2: TextStyle(
      //   fontSize: 18,
      //   color: Color(0xFF232F37),
      //   fontWeight: FontWeight.w700,
      // ),

      headlineMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: Color(0xFF232F37),
      ),

      /// headlineMedium
      // headline3: TextStyle(
      //   fontSize: 17,
      //   fontWeight: FontWeight.w700,
      //   color: Color(0xFF232F37),
      // ),

      headlineSmall: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: Color(0xFF232F37),
      ),

      /// headlineSmall
      // headline4: TextStyle(
      //   fontSize: 17,
      //   fontWeight: FontWeight.w700,
      //   color: Color(0xFF232F37),
      // ),

      titleLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF232F37),
        fontWeight: FontWeight.w700,
      ),

      /// titleLarge
      // headline5: TextStyle(
      //   fontSize: 16,
      //   color: Color(0xFF232F37),
      //   fontWeight: FontWeight.w700,
      // ),

      titleMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF232F37),
      ),

      /// titleMedium
      // headline6: TextStyle(
      //   fontSize: 14,
      //   color: Color(0xFF232F37),
      // ),

      labelSmall: TextStyle(
        fontSize: 14,
        color: Color(0xFFCD40A4),
        letterSpacing: 0.0,
      ),

      /// labelSmall
      // button: TextStyle(
      //   fontSize: 14,
      //   color: Color(0xFFCD40A4),
      //   letterSpacing: 0.0,
      // ),

      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF232F37),
      ),

      /// bodyMedium
      // bodyText1: TextStyle(
      //   fontSize: 16,
      //   color: Color(0xFF232F37),
      // ),

      titleSmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF232F37),
      ),

      /// titleSmall
      // subtitle1: TextStyle(
      //   fontSize: 16,
      //   color: Color(0xFF232F37),
      // ),

      bodyLarge: TextStyle(
        fontSize: 14,
        color: Color(0xFF6D7371),
      ),

      /// bodyLarge
      // subtitle2: TextStyle(
      //   fontSize: 14,
      //   color: Color(0xFF6D7371),
      // ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFF9C9FB2))),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF6A6E87),
      ),
      contentPadding: EdgeInsets.fromLTRB(18, 12, 18, 12),
    ),
    iconTheme: const IconThemeData(
      color: Colors.blueGrey,
    ),
    primaryIconTheme: const IconThemeData(),
    sliderTheme: const SliderThemeData(
        // slider themes
        ),
    tabBarTheme: const TabBarTheme(
        // tab bat theme
        ),
    tooltipTheme: TooltipThemeData(
        // tool tip theme
        textStyle: TextStyle(
      color: Colors.grey[800],
    )),
    cardTheme: CardTheme(
        // card theme
        color: Colors.grey[50]),
    chipTheme: const ChipThemeData(
        backgroundColor: Color(0xFF006633),
        disabledColor: Color(0xFF9C9FB2),
        shape: StadiumBorder(),
        brightness: Brightness.light,
        labelPadding: EdgeInsets.all(8),
        labelStyle: TextStyle(),
        padding: EdgeInsets.all(8),
        secondaryLabelStyle: TextStyle(),
        secondarySelectedColor: Colors.white38,
        selectedColor: Colors.white
        // chip theme
        ),
    platform: TargetPlatform.android,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    applyElevationOverlayColor: true,
    appBarTheme: const AppBarTheme(
      // color: Colors.grey[50],
      elevation: 1,
      iconTheme: IconThemeData(color: Color(0xFF000000)),
      actionsIconTheme: IconThemeData(color: Color(0xFF7934D3)),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        // fontWeight: FontWeight.bold,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.grey[50],
    ),
    colorScheme: ColorScheme(
      primary: const Color(0xFF7934D3),
      // primaryVariant: const Color(0x1aF5E0C3),
      secondary: const Color(0xFF7934D3),
      // secondaryVariant: Color(Colors.blue[200]!.value),
      brightness: Brightness.light,
      background: Colors.white,
      error: Colors.red,
      onBackground: const Color(0xffB5BFD3),
      onError: Colors.red,
      onPrimary: Color(Colors.grey[200]!.value),
      onSecondary: Color(Colors.grey[400]!.value),
      onSurface: const Color(0xFF7934D3),
      surface: const Color(0xFF7934D3),
    ),
    snackBarTheme: const SnackBarThemeData(
      // snack bar theme
      backgroundColor: Color(0xFFFF4F45),
      // actionTextColor: const Color(0xFFFF4F45),
      // disabledActionTextColor: Colors.grey[500],
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    dialogTheme: DialogTheme(
      // dialog theme
      backgroundColor: Colors.grey[150],
      titleTextStyle: const TextStyle(color: Color(0xFF7934D3)),
      contentTextStyle: TextStyle(
        color: Colors.grey[700],
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFFA999F3),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // floating action button theme
      backgroundColor: Color(0xFF6D4291),
    ),
    navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Colors.grey[150],
        unselectedLabelTextStyle: TextStyle(
          color: Colors.grey[600],
        ),
        selectedLabelTextStyle: const TextStyle(color: Color(0xFF7934D3))),
    typography: Typography.material2018(),
    cupertinoOverrideTheme: const CupertinoThemeData(
        //cupertino theme
        ),
    bottomSheetTheme: BottomSheetThemeData(
      //bottom sheet theme
      backgroundColor: Colors.grey[150],
    ),
    popupMenuTheme: PopupMenuThemeData(
      //pop menu theme
      color: Colors.grey[350],
      textStyle: const TextStyle(color: Color(0xFF7934D3)),
    ),
    bannerTheme: MaterialBannerThemeData(
      // material banner theme
      backgroundColor: Colors.grey[150],
      contentTextStyle: const TextStyle(color: Color(0xFF7934D3)),
    ),
    dividerTheme: const DividerThemeData(
      //divider, vertical divider theme
      color: Color(0xffDCE5E2),
    ),
    buttonBarTheme: const ButtonBarThemeData(
        // button bar theme
        buttonTextTheme: ButtonTextTheme.normal),
    fontFamily: 'FuturaPT',
    splashFactory: InkSplash.splashFactory)

  /// тут описываем кастомные поля
  ..addOwn(const OwnThemeFields(
      errorShade: Color.fromARGB(240, 255, 200, 200),
      textBaloon: Color.fromARGB(240, 255, 200, 200)));

// ***************************************************************************************************************
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: const MaterialColor(
    0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1a5D4524),
      100: Color(0xa15D4524),
      200: Color(0xaa5D4524),
      300: Color(0xaf5D4524),
      400: Color(0x1a483112),
      500: Color(0xa1483112),
      600: Color(0xaa483112),
      700: Color(0xff483112),
      800: Color(0xaf2F1E06),
      900: Color(0xff2F1E06),
    },
  ),
  primaryColor: const Color(0xff5D4524),
  // primaryColorBrightness: Brightness.dark,
  primaryColorLight: const Color(0x1a311F06),
  primaryColorDark: const Color(0xff936F3E),
  canvasColor: const Color(0xff6D42CE),
  scaffoldBackgroundColor: Colors.white,
  cardColor: const Color(0xaa311F06),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1a311F06),
  hoverColor: const Color(0xa15D4524),
  highlightColor: const Color(0xaf2F1E06),
  splashColor: const Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: const Color(0xFFF0F0F0),
  buttonTheme: const ButtonThemeData(
//button themes
      ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
//toggle button theme
      ),
  secondaryHeaderColor: Colors.grey,
  dialogBackgroundColor: Colors.white,
  indicatorColor: const Color(0xff457BE0),
  hintColor: Colors.grey,
  scrollbarTheme: const ScrollbarThemeData(),
  textTheme: const TextTheme(
//text themes that contrast with card and canvas
      ),
  primaryTextTheme: const TextTheme(
//text theme that contrast with primary color
      ),
  inputDecorationTheme: const InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: const IconThemeData(
    color: Colors.red,
//icon themes that contrast with card and canvas
  ),
  primaryIconTheme: const IconThemeData(
//icon themes that contrast primary color
      ),
//     accentIconTheme: const IconThemeData(
// //icon themes that contrast accent color
//         ),
  sliderTheme: const SliderThemeData(
      // slider themes
      ),
  tabBarTheme: const TabBarTheme(
      // tab bat theme
      ),
  tooltipTheme: const TooltipThemeData(
      // tool tip theme
      ),
  cardTheme: const CardTheme(
      // card theme
      ),
  chipTheme: const ChipThemeData(
      backgroundColor: Color(0xff2F1E06),
      disabledColor: Color(0xFFF0F0F0),
      shape: StadiumBorder(),
      brightness: Brightness.dark,
      labelPadding: EdgeInsets.all(8),
      labelStyle: TextStyle(),
      padding: EdgeInsets.all(8),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.white38,
      selectedColor: Colors.white
      // chip theme
      ),
  platform: TargetPlatform.android,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  applyElevationOverlayColor: true,
  appBarTheme: const AppBarTheme(
      //app bar theme
      // color:
      ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.grey[50],
  ),
  colorScheme: const ColorScheme(
      primary: Color(0xff5D4524),
      // primaryVariant: Color(0x1a311F06),
      secondary: Color(0xff457BE0),
      // secondaryVariant: Color(0xaa457BE0),
      brightness: Brightness.dark,
      background: Color(0xffB5BFD3),
      error: Colors.red,
      onBackground: Color(0xffB5BFD3),
      onError: Colors.red,
      onPrimary: Color(0xff5D4524),
      onSecondary: Color(0xff457BE0),
      onSurface: Color(0xff457BE0),
      surface: Color(0xff457BE0)),
  snackBarTheme: const SnackBarThemeData(
      // snack bar theme
      ),
  dialogTheme: const DialogTheme(
      // dialog theme
      ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    // floating action button theme
    backgroundColor: Color(0xff457BE0),
  ),
  navigationRailTheme: const NavigationRailThemeData(
      // navigation rail theme
      ),
  typography: Typography.material2018(),
  cupertinoOverrideTheme: const CupertinoThemeData(
      //cupertino theme
      ),
  bottomSheetTheme: const BottomSheetThemeData(
      //bottom sheet theme
      // backgroundColor: Colors.black54,
      ),
  popupMenuTheme: const PopupMenuThemeData(
      //pop menu theme
      ),
  bannerTheme: const MaterialBannerThemeData(
      // material banner theme
      ),
  dividerTheme: const DividerThemeData(
      //divider, vertical divider theme
      ),
  buttonBarTheme: const ButtonBarThemeData(
      // button bar theme
      ),
  fontFamily: 'FuturaPT',
  splashFactory: InkSplash.splashFactory,
)

  /// тут описываем кастомные поля
  ..addOwn(const OwnThemeFields(
      errorShade: Color.fromARGB(240, 255, 200, 200),
      textBaloon: Color.fromARGB(240, 255, 200, 200)));
