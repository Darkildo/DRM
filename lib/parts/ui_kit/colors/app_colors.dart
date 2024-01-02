part of '../ui_kit.dart';

extension ThemeColors on ThemeData {
  AppColors get colors {
    return brightness == Brightness.light ? LightAppColors() : DarkAppColors();
  }
}

abstract class AppColors {
  const AppColors();

  Color get primary;
  Color get secondary;
  Color get white;
  Color get black;
  Color get tertiary;
  Color get border;
  Color get red;
  Color get grey;
  Color get lightGrey;
}

class LightAppColors extends AppColors {
  @override
  Color get primary => const Color.fromRGBO(60, 90, 134, 1);

  @override
  Color get secondary => const Color.fromRGBO(86, 123, 179, 1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get black => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Color get tertiary => const Color.fromRGBO(213, 222, 236, 1);

  @override
  Color get border => const Color.fromRGBO(232, 230, 234, 1);

  @override
  Color get red => const Color.fromRGBO(255, 51, 51, 1);

  @override
  Color get grey => const Color.fromRGBO(204, 204, 204, 1);

  @override
  Color get lightGrey => const Color.fromRGBO(243, 243, 243, 1);
}

class DarkAppColors extends AppColors {
  @override
  Color get primary => const Color.fromRGBO(31, 78, 146, 1);

  @override
  Color get secondary => const Color.fromRGBO(71, 117, 186, 1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get black => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Color get tertiary => const Color.fromRGBO(167, 182, 205, 1);

  @override
  Color get border => const Color.fromRGBO(69, 69, 69, 1);

  @override
  Color get red => const Color.fromRGBO(255, 82, 82, 1);

  @override
  Color get grey => const Color.fromRGBO(144, 144, 144, 1);

  @override
  Color get lightGrey => const Color.fromRGBO(229, 229, 229, 1);
}
