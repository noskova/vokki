part of './vokki_theme.dart';

/// Defines a set of custom colors.
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
///
///

@immutable
class ScoreColors extends ThemeExtension<ScoreColors> {
  const ScoreColors({
    this.score0 = const Color(0xFF731C00),
    this.score60 = const Color(0xFF9C2600),
    this.score70 = const Color(0xFFCD0000),
    this.score80 = const Color(0xFFD1760A),
    this.score90 = const Color(0xFFC0B90E),
    this.score100 = const Color(0xFF11A820),
    this.themeMode,
  });

  final VokkiThemeMode? themeMode;
  final Color? score0;
  final Color? score60;
  final Color? score70;
  final Color? score80;
  final Color? score90;
  final Color? score100;
  final Color sleepSectionColorDarkTheme = const Color(0xFF111111);
  final Color sleepSectionColorLightTheme = const Color(0xFFDEDBDB);

  @override
  ScoreColors copyWith({
    Color? score0,
    Color? score60,
    Color? score70,
    Color? score80,
    Color? score90,
    Color? score100,
  }) {
    return ScoreColors(
      score0: score0 ?? this.score0,
      score60: score60 ?? this.score60,
      score70: score70 ?? this.score70,
      score80: score80 ?? this.score80,
      score90: score90 ?? this.score90,
      score100: score100 ?? this.score100,
    );
  }

  @override
  ScoreColors lerp(ThemeExtension<ScoreColors>? other, double t) {
    if (other is! ScoreColors) {
      return this;
    }
    return ScoreColors(
      score0: Color.lerp(score0, other.score0, t),
      score60: Color.lerp(score60, other.score60, t),
      score70: Color.lerp(score70, other.score70, t),
      score80: Color.lerp(score80, other.score80, t),
      score90: Color.lerp(score90, other.score90, t),
      score100: Color.lerp(score100, other.score100, t),
    );
  }

  Color getScoreColor(int score) {
    for (var i = 0; i < ColorConstants.listOfThresholds.length - 1; i++) {
      final leftThreshold = ColorConstants.listOfThresholds[i];
      final rightThreshold = ColorConstants.listOfThresholds[i + 1];
      final leftColor = ColorConstants.listOfThresholdColors[i];
      final rightColor = ColorConstants.listOfThresholdColors[i + 1];
      if (score <= leftThreshold) {
        return leftColor;
      } else if (score < rightThreshold) {
        final interpolateT =
            (score - leftThreshold) / (rightThreshold - leftThreshold);
        return Color.lerp(leftColor, rightColor, interpolateT) ??
            ColorConstants.listOfThresholdColors.last;
      }
    }
    return ColorConstants.listOfThresholdColors.last;
  }

  Color getSleepSectionColor() {
    return themeMode == VokkiThemeMode.dark
        ? sleepSectionColorDarkTheme
        : sleepSectionColorLightTheme;
  }
}

@immutable
class FatigueRiskColors extends ThemeExtension<FatigueRiskColors> {
  const FatigueRiskColors({
    this.fatigueRiskNow = const Color(0xffCD3100),
    this.fatigueRiskLow = const Color(0xFFF3FFEF),
    this.fatigueRiskModerate = const Color(0xFFFEFFDA),
    this.fatigueRiskElevated = const Color(0xFFFFEED4),
    this.fatigueRiskHigh = const Color(0xFFE40D0D),
    this.fatigueRiskSevere = const Color(0xFFB40000),
  });

  final Color? fatigueRiskLow;
  final Color? fatigueRiskModerate;
  final Color? fatigueRiskElevated;
  final Color? fatigueRiskHigh;
  final Color? fatigueRiskSevere;
  final Color? fatigueRiskNow;

  @override
  FatigueRiskColors copyWith({
    Color? fatigueRiskLow,
    Color? fatigueRiskModerate,
    Color? fatigueRiskElevated,
    Color? fatigueRiskHigh,
    Color? fatigueRiskSevere,
    Color? fatigueRiskNow,
  }) {
    return FatigueRiskColors(
      fatigueRiskLow: fatigueRiskLow ?? this.fatigueRiskLow,
      fatigueRiskModerate: fatigueRiskModerate ?? this.fatigueRiskModerate,
      fatigueRiskElevated: fatigueRiskElevated ?? this.fatigueRiskElevated,
      fatigueRiskHigh: fatigueRiskHigh ?? this.fatigueRiskHigh,
      fatigueRiskSevere: fatigueRiskSevere ?? this.fatigueRiskSevere,
      fatigueRiskNow: fatigueRiskNow ?? this.fatigueRiskNow,
    );
  }

  @override
  FatigueRiskColors lerp(ThemeExtension<FatigueRiskColors>? other, double t) {
    if (other is! FatigueRiskColors) {
      return this;
    }
    return FatigueRiskColors(
      fatigueRiskLow: Color.lerp(fatigueRiskLow, other.fatigueRiskLow, t),
      fatigueRiskModerate:
          Color.lerp(fatigueRiskModerate, other.fatigueRiskModerate, t),
      fatigueRiskElevated:
          Color.lerp(fatigueRiskElevated, other.fatigueRiskElevated, t),
      fatigueRiskHigh: Color.lerp(fatigueRiskHigh, other.fatigueRiskHigh, t),
      fatigueRiskSevere:
          Color.lerp(fatigueRiskSevere, other.fatigueRiskSevere, t),
      fatigueRiskNow: Color.lerp(fatigueRiskNow, other.fatigueRiskNow, t),
    );
  }

  Color? boxColor(String? riskLevel) {
    Color? boxColor;
    switch (riskLevel) {
      case "low":
        {
          boxColor = fatigueRiskLow;
        }
        break;

      case "moderate":
        {
          boxColor = fatigueRiskModerate;
        }
        break;

      case "elevated":
        {
          boxColor = fatigueRiskElevated;
        }
        break;

      case "high":
        {
          boxColor = fatigueRiskHigh;
        }
        break;

      default:
        {
          boxColor = fatigueRiskSevere;
        }
        break;
    }

    return boxColor;
  }
}

class OverviewIndividualsTwoTabColors
    extends ThemeExtension<OverviewIndividualsTwoTabColors> {
  const OverviewIndividualsTwoTabColors({
    this.selectedFlagged = const Color(0xFFFFEBEB),
    this.unselectedFlagged = const Color(0xFFEFEFEF),
    this.iconSelectedFlagged = const Color(0xffCD3100),
    this.iconUnselectedFlagged = const Color(0xFFAAAAAA),
    this.selectedLowRisk = const Color(0xFFD7F1E2),
    this.unselectedLowRisk = const Color(0xFFEFEFEF),
    this.iconSelectedLowRisk = const Color(0xFF00961A),
    this.iconUnselectedLowRisk = const Color(0xFFAAAAAA),
    this.defaultRiskCrew = Colors.yellow,
  });

  final Color? selectedFlagged;
  final Color? unselectedFlagged;
  final Color? iconSelectedFlagged;
  final Color? iconUnselectedFlagged;
  final Color? selectedLowRisk;
  final Color? unselectedLowRisk;
  final Color? iconSelectedLowRisk;
  final Color? iconUnselectedLowRisk;
  final Color? defaultRiskCrew;

  @override
  OverviewIndividualsTwoTabColors copyWith({
    Color? selectedFlagged,
    Color? unselectedFlagged,
    Color? iconSelectedFlagged,
    Color? iconUnselectedFlagged,
    Color? selectedLowRisk,
    Color? unselectedLowRisk,
    Color? iconSelectedLowRisk,
    Color? iconUnselectedLowRisk,
    Color? defaultRiskCrew,
  }) {
    return OverviewIndividualsTwoTabColors(
      selectedFlagged: selectedFlagged ?? this.selectedFlagged,
      unselectedFlagged: unselectedFlagged ?? this.unselectedFlagged,
      iconSelectedFlagged: iconSelectedFlagged ?? this.iconSelectedFlagged,
      iconUnselectedFlagged:
          iconUnselectedFlagged ?? this.iconUnselectedFlagged,
      selectedLowRisk: selectedLowRisk ?? this.selectedLowRisk,
      unselectedLowRisk: unselectedLowRisk ?? this.unselectedLowRisk,
      iconSelectedLowRisk: iconSelectedLowRisk ?? this.iconSelectedLowRisk,
      iconUnselectedLowRisk:
          iconUnselectedLowRisk ?? this.iconUnselectedLowRisk,
      defaultRiskCrew: defaultRiskCrew ?? this.defaultRiskCrew,
    );
  }

  @override
  OverviewIndividualsTwoTabColors lerp(
      ThemeExtension<OverviewIndividualsTwoTabColors>? other, double t) {
    if (other is! OverviewIndividualsTwoTabColors) {
      return this;
    }
    return OverviewIndividualsTwoTabColors(
      selectedFlagged: Color.lerp(selectedFlagged, other.selectedFlagged, t),
      unselectedFlagged:
          Color.lerp(unselectedFlagged, other.unselectedFlagged, t),
      iconSelectedFlagged:
          Color.lerp(iconSelectedFlagged, other.iconSelectedFlagged, t),
      iconUnselectedFlagged:
          Color.lerp(iconUnselectedFlagged, other.iconUnselectedFlagged, t),
      selectedLowRisk: Color.lerp(selectedLowRisk, other.selectedLowRisk, t),
      unselectedLowRisk:
          Color.lerp(unselectedLowRisk, other.unselectedLowRisk, t),
      iconSelectedLowRisk:
          Color.lerp(iconSelectedLowRisk, other.iconSelectedLowRisk, t),
      iconUnselectedLowRisk:
          Color.lerp(iconUnselectedLowRisk, other.iconUnselectedLowRisk, t),
      defaultRiskCrew: Color.lerp(defaultRiskCrew, other.defaultRiskCrew, t),
    );
  }

  Color flaggedTabColor(bool? isSelected) {
    return isSelected ?? true ? selectedFlagged! : unselectedFlagged!;
  }

  Color flaggedIconColor(bool? isSelected) {
    return isSelected ?? true ? iconSelectedFlagged! : iconUnselectedFlagged!;
  }

  Color lowerRiskTabColor(bool? isSelected) {
    return isSelected ?? true ? unselectedLowRisk! : selectedLowRisk!;
  }

  Color lowerRiskIconColor(bool? isSelected) {
    return isSelected ?? true ? iconUnselectedLowRisk! : iconSelectedLowRisk!;
  }

  Color liveReadiScoreColor(bool? isSelected) {
    return isSelected ?? true ? selectedFlagged! : selectedLowRisk!;
  }
}

class IconColors extends ThemeExtension<IconColors> {
  const IconColors({
    this.iconColorOrange = const Color(0xFFFFA702),
    this.iconColorCrayola = const Color(0xFF127FFF),
  });

  final Color? iconColorOrange;
  final Color? iconColorCrayola;

  @override
  IconColors copyWith({
    Color? iconColorOrange,
    Color? iconColorCrayola,
  }) {
    return IconColors(
      iconColorOrange: iconColorOrange ?? this.iconColorOrange,
      iconColorCrayola: iconColorCrayola ?? this.iconColorCrayola,
    );
  }

  @override
  IconColors lerp(ThemeExtension<IconColors>? other, double t) {
    if (other is! IconColors) {
      return this;
    }
    return IconColors(
      iconColorOrange: Color.lerp(iconColorOrange, other.iconColorOrange, t),
      iconColorCrayola: Color.lerp(iconColorCrayola, other.iconColorCrayola, t),
    );
  }
}

class HotspotsColors extends ThemeExtension<HotspotsColors> {
  const HotspotsColors({
    this.regularFatigueText = const Color(0xFF8F8F8F),
    this.highFatigueText = const Color(0xFFEFEFEF),
    this.higherThanUsualFatigue = const Color(0xffCD3100),
    this.lowerThanUsualFatigue = const Color(0xFF00961A),
    this.usualFatigue = const Color(0xFF000000),
  });

  final Color? regularFatigueText;
  final Color? highFatigueText;
  final Color? higherThanUsualFatigue;
  final Color? lowerThanUsualFatigue;
  final Color? usualFatigue;

  @override
  HotspotsColors copyWith({
    Color? regularFatigueText,
    Color? highFatigueText,
    Color? higherThanUsualFatigue,
    Color? lowerThanUsualFatigue,
    Color? usualFatigue,
  }) {
    return HotspotsColors(
      regularFatigueText: regularFatigueText ?? this.regularFatigueText,
      highFatigueText: highFatigueText ?? this.highFatigueText,
      higherThanUsualFatigue:
          higherThanUsualFatigue ?? this.higherThanUsualFatigue,
      lowerThanUsualFatigue:
          lowerThanUsualFatigue ?? this.lowerThanUsualFatigue,
      usualFatigue: usualFatigue ?? this.usualFatigue,
    );
  }

  @override
  HotspotsColors lerp(ThemeExtension<HotspotsColors>? other, double t) {
    if (other is! HotspotsColors) {
      return this;
    }
    return HotspotsColors(
      regularFatigueText:
          Color.lerp(regularFatigueText, other.regularFatigueText, t),
      highFatigueText: Color.lerp(highFatigueText, other.highFatigueText, t),
      higherThanUsualFatigue:
          Color.lerp(higherThanUsualFatigue, other.higherThanUsualFatigue, t),
      lowerThanUsualFatigue:
          Color.lerp(lowerThanUsualFatigue, other.lowerThanUsualFatigue, t),
      usualFatigue: Color.lerp(usualFatigue, other.usualFatigue, t),
    );
  }

  Color? textColor(risk) => (risk == "high" || risk == "severe")
      ? highFatigueText
      : regularFatigueText;
}

@immutable
class FatigueRiskLevelColors extends ThemeExtension<FatigueRiskLevelColors> {
  const FatigueRiskLevelColors({
    this.low = const Color(0xFF63D640),
    this.moderate = const Color(0xFFF9D64B),
    this.elevated = const Color(0xFFE39E38),
    this.high = const Color(0xFFD2361F),
    this.severe = const Color(0xFFD2361F),
  });

  final Color? low;
  final Color? moderate;
  final Color? elevated;
  final Color? high;
  final Color? severe;

  @override
  FatigueRiskLevelColors copyWith({
    Color? low,
    Color? moderate,
    Color? elevated,
    Color? high,
    Color? severe,
  }) {
    return FatigueRiskLevelColors(
      low: low ?? this.low,
      moderate: moderate ?? this.moderate,
      elevated: elevated ?? this.elevated,
      high: high ?? this.high,
      severe: severe ?? this.severe,
    );
  }

  @override
  FatigueRiskLevelColors lerp(
      ThemeExtension<FatigueRiskLevelColors>? other, double t) {
    if (other is! FatigueRiskLevelColors) {
      return this;
    }
    return FatigueRiskLevelColors(
      low: Color.lerp(low, other.low, t),
      moderate: Color.lerp(moderate, other.moderate, t),
      elevated: Color.lerp(elevated, other.elevated, t),
      high: Color.lerp(high, other.high, t),
      severe: Color.lerp(severe, other.severe, t),
    );
  }

  Color? riskLevelColor(String riskLevel) => switch (riskLevel) {
        "low" => low,
        "moderate" => moderate,
        "elevated" => elevated,
        "high" => high,
        "severe" => severe,
        'unknown' => null,
        _ => null,
      };
}

class ShiftTypeColors extends ThemeExtension<ShiftTypeColors> {
  const ShiftTypeColors({
    this.themeMode,
    this.day = const Color(0xFFA79601),
    this.night = const Color(0xFF6772AA),
    this.afternoon = const Color(0xFF796600),
  });

  final VokkiThemeMode? themeMode;
  final Color? day;
  final Color? night;
  final Color? afternoon;

  @override
  ShiftTypeColors copyWith({
    VokkiThemeMode? themeMode,
    Color? day,
    Color? night,
    Color? afternoon,
  }) {
    return ShiftTypeColors(
      themeMode: themeMode ?? this.themeMode,
      day: day ?? this.day,
      night: night ?? this.night,
      afternoon: afternoon ?? this.afternoon,
    );
  }

  @override
  ShiftTypeColors lerp(ThemeExtension<ShiftTypeColors>? other, double t) {
    if (other is! ShiftTypeColors) {
      return this;
    }
    return ShiftTypeColors(
      themeMode: themeMode,
      day: Color.lerp(day, other.day, t),
      night: Color.lerp(night, other.night, t),
      afternoon: Color.lerp(afternoon, other.afternoon, t),
    );
  }

  Color? shiftTypeColor(String shiftType) {
    return switch (shiftType) {
      "day" => day,
      "night" => night,
      "afternoon" => afternoon,
      _ => themeMode == VokkiThemeMode.dark
          ? VokkiColorSchemeDark.colorScheme.primary
          : VokkiColorSchemeLight.colorScheme.primary,
    };
  }
}

class PickerColors extends ThemeExtension<PickerColors> {
  const PickerColors({
    this.themeMode,
    this.light = const Color(0xFFF2F2F2),
    this.dark = const Color(0xFF1E1E1E),
  });

  final VokkiThemeMode? themeMode;
  final Color? light;
  final Color? dark;

  @override
  PickerColors copyWith({
    VokkiThemeMode? themeMode,
    Color? light,
    Color? dark,
  }) {
    return PickerColors(
      themeMode: themeMode ?? this.themeMode,
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }

  @override
  PickerColors lerp(ThemeExtension<PickerColors>? other, double t) {
    if (other is! PickerColors) {
      return this;
    }
    return PickerColors(
      themeMode: themeMode,
      light: Color.lerp(light, other.light, t),
      dark: Color.lerp(dark, other.dark, t),
    );
  }

  Color? pickerColor() {
    return switch (themeMode) {
      VokkiThemeMode.light => light,
      VokkiThemeMode.dark => dark,
      _ => null,
    };
  }
}

class ColorConstants {
  static const listOfThresholdColors = <Color>[
    Color(0XFFffcdea),
    Color(0XFFdeecea),
    Color(0XFFb2f3e8),
  ];
  static const listOfThresholds = <double>[0.0, 50.0, 100.0];
}
