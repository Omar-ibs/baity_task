import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle regularStyle16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(16, context),
      fontWeight: FontWeight.w400,
      color: const Color(0xff064061),
    );
  }

  static TextStyle mediumStyle16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(16, context),
      fontWeight: FontWeight.w500,
      color: const Color(0xff064061),
    );
  }

  static TextStyle semiBoldStyle16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(16, context),
      fontWeight: FontWeight.w600,
      color: const Color(0xff064061),
    );
  }

  static TextStyle semiBoldStyle20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(20, context),
      fontWeight: FontWeight.w600,
      color: const Color(0xff064061),
    );
  }

  static TextStyle regularStyle12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(12, context),
      fontWeight: FontWeight.w400,
      color: const Color(0xffAAAAAA),
    );
  }

  static TextStyle semiBoldStyle24(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(24, context),
      fontWeight: FontWeight.w600,
      color: const Color(0xff4EB7F2),
    );
  }

  static TextStyle regularStyle14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(14, context),
      fontWeight: FontWeight.w400,
      color: const Color(0xffAAAAAA),
    );
  }

  static TextStyle semiBoldStyle18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(18, context),
      fontWeight: FontWeight.w600,
      color: const Color(0xff4EB7F2),
    );
  }

  static TextStyle boldStyle16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(16, context),
      fontWeight: FontWeight.bold,
      color: const Color(0xff4EB7F2),
    );
  }

  static TextStyle mediumStyle20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(20, context),
      fontWeight: FontWeight.w500,
      color: const Color(0xffFFFFFF),
    );
  }
}

double getResponsiveFontSize(double fontSize, BuildContext context) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double upperLimit = fontSize * 1.2;
  double lowerLimit = fontSize * 0.8;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 600;
  } else {
    return width / 1000;
  }
}
