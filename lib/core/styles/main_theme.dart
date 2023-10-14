import 'style.dart';

abstract class ThemeEx {
  static theme({bool themeStyle = true}) => themeStyle ? lightTheme : darkTheme;
}
