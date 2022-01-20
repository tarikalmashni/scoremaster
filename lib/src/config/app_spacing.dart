// ignore_for_file: constant_identifier_names

class AppSpacing {
  AppSpacing._();

  static const XS = S / 2; // 4
  static const S = M / 1.5; // 5.33
  static const M = 8.0;
  static const L = M * 1.5; // 12
  static const XL = L * 2; // 24
  static const XXL = XL * 2; // 48

  static const currentSize = M;
}

class AppFontSizes {
  AppFontSizes._();

  static const double M = AppSpacing.M * 2.5;
  static const double L = AppSpacing.M * 3;
}

class AppPaddings {
  static const double M = AppSpacing.M * 2.5;
}
