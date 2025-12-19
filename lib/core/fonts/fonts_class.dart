import 'package:flutter/material.dart';

class AppTextStyles {
  static const String _fontFamily = 'Cairo';

  // =========================
  // Body Styles
  // =========================

  /// Large / Regular — 19px
  static const bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 19,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  /// Large / SemiBold — 19px
  static const bodyLargeSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 19,
    height: 1.4,
    fontWeight: FontWeight.w600,
  );

  /// Base / Regular — 16px
  static const bodyBase = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  /// Base / Medium — 16px
  static const bodyBaseMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w500,
  );

  /// Base / Bold — 16px
  static const bodyBaseBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  /// Small / Regular — 13px
  static const bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  /// Small / Regular — 13px
  static const bodySmallBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    height: 1.6,
    fontWeight: FontWeight.bold,
  );

  /// Small / Medium — 13px
  static const bodySmallMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    height: 1.7,
    fontWeight: FontWeight.w500,
  );

  /// X-Small / Regular — 11px
  static const bodyXSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  // =========================
  // Heading Styles
  // =========================

  /// H1 — 48px
  static const h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  static const h1Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );

  /// H2 — 40px
  static const h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  static const h2SemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    height: 1.4,
    fontWeight: FontWeight.w600,
  );

  /// H3 — 33px
  static const h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 33,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  static const h3Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 33,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );

  /// H4 — 28px
  static const h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  static const h4Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );

  /// H5 — 23px
  static const h5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 23,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  static const h5Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 23,
    height: 1.4,
    fontWeight: FontWeight.w500,
  );

  // =========================
  // Special / Strong emphasis
  // =========================

  static const extraBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
  );

  static const black = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
  );
}
