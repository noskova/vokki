part of 'vokki_theme.dart';

class LaunchButton extends ThemeExtension<LaunchButton> {
  const LaunchButton({
    this.launchButtonColor = const Color(0xFFEEEEEE),
    this.launchButtonTextColor = const Color(0xFF000000),
  });

  final Color? launchButtonColor;
  final Color? launchButtonTextColor;

  @override
  LaunchButton copyWith({
    Color? launchButtonColor,
    Color? launchButtonTextColor,
  }) {
    return LaunchButton(
      launchButtonColor: launchButtonColor ?? this.launchButtonColor,
      launchButtonTextColor:
          launchButtonTextColor ?? this.launchButtonTextColor,
    );
  }

  @override
  LaunchButton lerp(ThemeExtension<LaunchButton>? other, double t) {
    if (other is! LaunchButton) {
      return this;
    }
    return LaunchButton(
      launchButtonColor:
          Color.lerp(launchButtonColor, other.launchButtonColor, t),
      launchButtonTextColor:
          Color.lerp(launchButtonTextColor, other.launchButtonTextColor, t),
    );
  }

  ButtonStyle launchButtonColorTheme() {
    return ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: launchButtonColor,
        foregroundColor: launchButtonTextColor);
  }
}

class SignOutButton extends ThemeExtension<SignOutButton> {
  const SignOutButton();

  @override
  SignOutButton copyWith() {
    return const SignOutButton();
  }

  @override
  SignOutButton lerp(ThemeExtension<SignOutButton>? other, double t) {
    if (other is! SignOutButton) {
      return this;
    }
    return const SignOutButton();
  }

  ButtonStyle signOutButtonLight() {
    return ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(
          color: VokkiColorSchemeLight.colorScheme.outlineVariant,
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return VokkiColorSchemeLight.colorScheme.onBackground
              .withOpacity(0.4);
        }
        return VokkiColorSchemeLight.colorScheme.onBackground;
      }),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
      ),
    );
  }

  ButtonStyle signOutButtonDark() {
    return ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(
        VokkiColorSchemeDark.colorScheme.background,
      ),
      textStyle: MaterialStateProperty.all(
        VokkiTheme._baseTheme().textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return VokkiColorSchemeDark.colorScheme.onTertiary.withOpacity(0.4);
          }
          return VokkiColorSchemeDark.colorScheme.onTertiary.withOpacity(0.8);
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color:
                  VokkiColorSchemeDark.colorScheme.onTertiary.withOpacity(0.4),
              width: 0.3,
            );
          }
          return BorderSide(
            color: VokkiColorSchemeDark.colorScheme.outlineVariant,
            width: 0.3,
          );
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5.5,
          ),
        ),
      ),
    );
  }
}

class UnitButton extends ThemeExtension<UnitButton> {
  const UnitButton({
    VokkiThemeMode? themeMode,
  }) : _themeMode = themeMode;

  final VokkiThemeMode? _themeMode;

  @override
  UnitButton copyWith() {
    return UnitButton(
      themeMode: _themeMode,
    );
  }

  @override
  UnitButton lerp(ThemeExtension<UnitButton>? other, double t) {
    if (other is! UnitButton) {
      return this;
    }
    return UnitButton(
      themeMode: _themeMode,
    );
  }

  ButtonStyle unitButton() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _themeMode == VokkiThemeMode.dark
                ? VokkiColorSchemeDark.colorScheme.primary
                : VokkiColorSchemeLight.colorScheme.primary;
          }
          return _themeMode == VokkiThemeMode.dark
              ? VokkiColorSchemeDark.colorScheme.surface
              : VokkiColorSchemeLight.colorScheme.surface;
        },
      ),
      textStyle: MaterialStateProperty.all(
        VokkiTheme._baseTheme().textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _themeMode == VokkiThemeMode.dark
                ? VokkiColorSchemeDark.colorScheme.onPrimary
                : VokkiColorSchemeLight.colorScheme.onPrimary;
          }
          return _themeMode == VokkiThemeMode.dark
              ? VokkiColorSchemeDark.colorScheme.onSurface
              : VokkiColorSchemeLight.colorScheme.onSurface;
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: _themeMode == VokkiThemeMode.dark
                  ? VokkiColorSchemeDark.colorScheme.primary
                  : VokkiColorSchemeLight.colorScheme.primary,
              width: 0.3,
            );
          }
          return BorderSide(
            color: _themeMode == VokkiThemeMode.dark
                ? VokkiColorSchemeDark.colorScheme.onSurface
                : VokkiColorSchemeLight.colorScheme.onSurface,
            width: 0.3,
          );
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
      ),
    );
  }
}

class TimeFormatButton extends ThemeExtension<TimeFormatButton> {
  const TimeFormatButton({
    themeMode,
  }) : _themeMode = themeMode;

  final VokkiThemeMode? _themeMode;

  @override
  TimeFormatButton copyWith() {
    return TimeFormatButton(
      themeMode: _themeMode,
    );
  }

  @override
  TimeFormatButton lerp(ThemeExtension<TimeFormatButton>? other, double t) {
    if (other is! TimeFormatButton) {
      return this;
    }
    return TimeFormatButton(
      themeMode: _themeMode,
    );
  }

  ButtonStyle timeFormatButton() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _themeMode == VokkiThemeMode.dark
                ? VokkiColorSchemeDark.colorScheme.primary
                : VokkiColorSchemeLight.colorScheme.primary;
          }
          return _themeMode == VokkiThemeMode.dark
              ? VokkiColorSchemeDark.colorScheme.surface
              : VokkiColorSchemeLight.colorScheme.surface;
        },
      ),
      textStyle: MaterialStateProperty.all(
        VokkiTheme._baseTheme().textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _themeMode == VokkiThemeMode.dark
                ? VokkiColorSchemeDark.colorScheme.onPrimary
                : VokkiColorSchemeLight.colorScheme.onPrimary;
          }
          return _themeMode == VokkiThemeMode.dark
              ? VokkiColorSchemeDark.colorScheme.onPrimary
              : VokkiColorSchemeLight.colorScheme.onPrimary;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
      ),
    );
  }
}

class AddSyncButtonsTheme extends ThemeExtension<AddSyncButtonsTheme> {
  const AddSyncButtonsTheme({
    this.themeMode,
  });

  final VokkiThemeMode? themeMode;

  @override
  AddSyncButtonsTheme copyWith({
    VokkiThemeMode? themeMode,
  }) {
    return AddSyncButtonsTheme(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  AddSyncButtonsTheme lerp(
      ThemeExtension<AddSyncButtonsTheme>? other, double t) {
    if (other is! AddSyncButtonsTheme) {
      return this;
    } else {
      return AddSyncButtonsTheme(
        themeMode: themeMode,
      );
    }
  }

  ButtonStyle getAddSyncButtonTheme() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return themeMode == VokkiThemeMode.light
                ? VokkiColorSchemeLight.colorScheme.onTertiary
                : VokkiColorSchemeDark.colorScheme.onTertiary;
          }
          return themeMode == VokkiThemeMode.light
              ? VokkiColorSchemeLight.colorScheme.tertiary
              : VokkiColorSchemeDark.colorScheme.tertiary;
        },
      ),
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return themeMode == VokkiThemeMode.light
                ? VokkiColorSchemeLight.colorScheme.onTertiary
                : VokkiColorSchemeDark.colorScheme.onTertiary;
          }
          return themeMode == VokkiThemeMode.light
              ? VokkiColorSchemeLight.colorScheme.tertiary
              : VokkiColorSchemeDark.colorScheme.tertiary;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return themeMode == VokkiThemeMode.light
                ? VokkiColorSchemeLight.colorScheme.tertiaryContainer
                    .withOpacity(0.1)
                : VokkiColorSchemeDark.colorScheme.tertiaryContainer
                    .withOpacity(0.1);
          }
          return themeMode == VokkiThemeMode.light
              ? VokkiColorSchemeLight.colorScheme.tertiaryContainer
              : VokkiColorSchemeDark.colorScheme.tertiaryContainer;
        },
      ),
    );
  }
}

class LocateUnpairTextButton extends ThemeExtension<LocateUnpairTextButton> {
  const LocateUnpairTextButton({
    this.themeMode,
  });

  final VokkiThemeMode? themeMode;

  @override
  LocateUnpairTextButton copyWith({
    VokkiThemeMode? themeMode,
  }) {
    return LocateUnpairTextButton(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  LocateUnpairTextButton lerp(
      ThemeExtension<LocateUnpairTextButton>? other, double t) {
    if (other is! LocateUnpairTextButton) {
      return this;
    } else {
      return LocateUnpairTextButton(
        themeMode: themeMode,
      );
    }
  }

  ButtonStyle getLocateUnpairTextButtonTheme() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return themeMode == ThemeMode.light
                ? VokkiColorSchemeLight.colorScheme.inverseSurface
                    .withOpacity(0.2)
                : VokkiColorSchemeDark.colorScheme.inverseSurface;
          }
          return themeMode == ThemeMode.light
              ? VokkiColorSchemeLight.colorScheme.primary
              : VokkiColorSchemeDark.colorScheme.primary;
        },
      ),
      iconColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return themeMode == ThemeMode.light
                ? VokkiColorSchemeLight.colorScheme.inverseSurface
                    .withOpacity(0.2)
                : VokkiColorSchemeDark.colorScheme.inverseSurface;
          }
          return themeMode == ThemeMode.light
              ? VokkiColorSchemeLight.colorScheme.primary
              : VokkiColorSchemeDark.colorScheme.primary;
        },
      ),
      textStyle: MaterialStatePropertyAll(
        VokkiTheme._baseTheme().textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}
