import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/theme/color_constants.dart';
import 'package:test/theme/common_input_shadow.dart';
import 'package:test/theme/math_utils.dart';

class ThemeConfig {
  static ThemeData createTheme({required Brightness brightness}) {
    return ThemeData(
      scaffoldBackgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      primaryColor: ColorConstants.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        )),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorConstants.primary.withOpacity(0.5);
            } else if (states.contains(MaterialState.disabled)) {
              return const Color.fromARGB(255, 67, 95, 78);
            }
            return ColorConstants.primary; // Use the component's default.
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.white; // Use the component's default.
          },
        ), //actual text color

        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            //this determines the text style of the text displayed on buttons
            fontSize: 14,
            color: Colors.white, //color not used
          ),
        ),
      )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorConstants.primary),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.primary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: getBorder(),
        errorBorder: getErrorBorder(),
        enabledBorder: getEnableBorder(),
        disabledBorder: getDisableBorder(),
        focusedErrorBorder: getFocusErrorBorder(),
        focusedBorder: getFocusBorder(),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.transparent,
      ),
    );
  }

  static DecoratedInputBorder getBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: getSize(14), cornerSmoothing: 1),
        ),
        borderSide: BorderSide(color: ColorConstants.grey1),
      ),
      shadow: BoxShadow(
        offset: const Offset(15, 20),
        blurRadius: 45,
        color: ColorConstants.shadowColor.withOpacity(0.25),
      ),
    );
  }

  static DecoratedInputBorder getErrorBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: getSize(14), cornerSmoothing: 1),
        ),
        borderSide: BorderSide(color: ColorConstants.redErrorColor),
      ),
      shadow: BoxShadow(
        offset: const Offset(15, 20),
        blurRadius: 45,
        color: ColorConstants.shadowColor.withOpacity(0.25),
      ),
    );
  }

  static DecoratedInputBorder getEnableBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: getSize(14), cornerSmoothing: 1),
        ),
        borderSide: BorderSide(color: ColorConstants.grey1),
      ),
      shadow: BoxShadow(
        offset: const Offset(15, 20),
        blurRadius: 45,
        color: ColorConstants.shadowColor.withOpacity(0.25),
      ),
    );
  }

  static DecoratedInputBorder getDisableBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: getSize(14), cornerSmoothing: 1),
        ),
        borderSide: BorderSide(color: ColorConstants.grey1),
      ),
      shadow: BoxShadow(
        offset: const Offset(15, 20),
        blurRadius: 45,
        color: ColorConstants.shadowColor.withOpacity(0.25),
      ),
    );
  }

  static DecoratedInputBorder getFocusErrorBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: getSize(12), cornerSmoothing: 1),
        ),
        borderSide: BorderSide(color: ColorConstants.redErrorColor),
      ),
      shadow: BoxShadow(
        offset: const Offset(15, 20),
        blurRadius: 45,
        color: ColorConstants.shadowColor.withOpacity(0.25),
      ),
    );
  }

  static DecoratedInputBorder getFocusBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: getSize(14), cornerSmoothing: 1),
        ),
        borderSide: BorderSide(color: ColorConstants.primary),
      ),
      shadow: BoxShadow(
        offset: const Offset(15, 20),
        blurRadius: 45,
        color: ColorConstants.shadowColor.withOpacity(0.25),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(brightness: Brightness.light);

  static ThemeData get darkTheme => createTheme(brightness: Brightness.dark);
}
