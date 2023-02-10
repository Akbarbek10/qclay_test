// Place fonts/AppIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: AppIcons
//      fonts:
//       - asset: fonts/AppIcons.ttf
import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  static const String _fontFamily = 'AppIcons';

  static const IconData ic_menu = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData ic_arrow_right = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData ic_filter = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData ic_bag = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData ic_arrows = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData ic_chips = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData ic_choco = IconData(0xe907, fontFamily: _fontFamily);
}
