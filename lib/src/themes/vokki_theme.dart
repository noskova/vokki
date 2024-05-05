import 'package:flutter/material.dart';
import 'package:vokki/src/constants/app_sizes.dart';

part 'color_scheme.dart';
part 'custom_colors.dart';
part 'custom_themes.dart';

enum VokkiThemeMode {
  light,
  dark,
}

@immutable
class VokkiTheme {
  const VokkiTheme({
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
  });

  final Color? primaryColor;
  final Color? secondaryColor;
  final MaterialColor? tertiaryColor;

  static ThemeData _baseTheme({VokkiThemeMode? themeMode}) => ThemeData(
        brightness: themeMode == VokkiThemeMode.dark
            ? Brightness.dark
            : Brightness.light,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            letterSpacing: 0,
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        chipTheme: const ChipThemeData(
          shape: StadiumBorder(),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: CircleBorder(),
          elevation: 1,
        ),
        extensions: [
          const LaunchButton(),
          const SignOutButton(),
          UnitButton(themeMode: themeMode),
          TimeFormatButton(themeMode: themeMode),
          AddSyncButtonsTheme(themeMode: themeMode),
          LocateUnpairTextButton(themeMode: themeMode),
        ],
      );

  ThemeData get lightTheme {
    return _baseTheme().copyWith(
      brightness: Brightness.light,
      primaryColor: VokkiColorSchemeLight.colorScheme.primary,
      colorScheme: VokkiColorSchemeLight.colorScheme,
      scaffoldBackgroundColor: VokkiColorSchemeLight.colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: VokkiColorSchemeLight.colorScheme.surfaceVariant,
        // surfaceTintColor: VokkiColorSchemeLight.colorScheme.surfaceVariant,
        // centerTitle: true,
        // scrolledUnderElevation: 0,
        // shape: Border(
        //   bottom: BorderSide(
        //     color: VokkiColorSchemeLight.colorScheme.outlineVariant,
        //     width: 0,
        //   ),
        // ),
        // elevation: 0,
        // iconTheme: IconThemeData(
        //   color: VokkiColorSchemeLight.colorScheme.primary,
        // ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: VokkiColorSchemeLight.colorScheme.surface,
        selectedTileColor: VokkiColorSchemeLight.colorScheme.primaryContainer,
        selectedColor: VokkiColorSchemeLight.colorScheme.onBackground,
        subtitleTextStyle: _baseTheme().textTheme.bodySmall?.copyWith(
              color: VokkiColorSchemeLight.colorScheme.onTertiary,
            ),
        iconColor: VokkiColorSchemeLight.colorScheme.onSurface,
        textColor: VokkiColorSchemeLight.colorScheme.onBackground,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        collapsedIconColor: VokkiColorSchemeLight.colorScheme.outlineVariant,
        iconColor: VokkiColorSchemeLight.colorScheme.outlineVariant,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: VokkiColorSchemeLight.colorScheme.primary,
          foregroundColor: VokkiColorSchemeLight.colorScheme.onPrimary,
          disabledBackgroundColor:
              VokkiColorSchemeLight.colorScheme.surfaceVariant,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return VokkiColorSchemeLight.colorScheme.inverseSurface
                    .withOpacity(0.2);
              }
              return VokkiColorSchemeLight.colorScheme.inverseSurface;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return VokkiColorSchemeLight.colorScheme.inverseSurface
                    .withOpacity(0.2);
              }
              return VokkiColorSchemeLight.colorScheme.inverseSurface;
            },
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.resolveWith(
            (states) => VokkiColorSchemeLight.colorScheme.inverseSurface,
          ),
          overlayColor: MaterialStateProperty.all(
            VokkiColorSchemeLight.colorScheme.inverseSurface.withOpacity(0.2),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        backgroundColor: VokkiColorSchemeLight.colorScheme.onSurfaceVariant,
        indicatorColor: Colors.transparent,
        shadowColor: VokkiColorSchemeLight.colorScheme.outlineVariant,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return TextStyle(
              fontSize: 12,
              color: VokkiColorSchemeLight.colorScheme.primary,
            );
          }
          return TextStyle(
            color: VokkiColorSchemeLight.colorScheme.onTertiary,
            fontSize: 12,
          );
        }),
      ),
      dividerTheme: DividerThemeData(
        color: VokkiColorSchemeLight.colorScheme.background,
      ),
      popupMenuTheme: PopupMenuThemeData(
        surfaceTintColor: VokkiColorSchemeLight.colorScheme.background,
        elevation: 8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: VokkiColorSchemeLight.colorScheme.outlineVariant,
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.focused)
                ? VokkiColorSchemeLight.colorScheme.primary
                : VokkiColorSchemeLight.colorScheme.outlineVariant;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: VokkiColorSchemeLight.colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: VokkiColorSchemeLight.colorScheme.primary),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: VokkiColorSchemeLight.colorScheme.error),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      textTheme: _baseTheme().textTheme.copyWith(
            titleSmall: _baseTheme().textTheme.titleSmall?.apply(
                  color: VokkiColorSchemeLight.colorScheme.onTertiary,
                ),
            bodySmall: _baseTheme().textTheme.bodySmall?.apply(
                  color: VokkiColorSchemeLight.colorScheme.onTertiary,
                ),
          ),
      chipTheme: _baseTheme().chipTheme.copyWith(
            labelStyle: TextStyle(
              color: VokkiColorSchemeLight.colorScheme.onTertiary,
            ),
            secondaryLabelStyle: TextStyle(
              color: VokkiColorSchemeLight.colorScheme.shadow,
            ),
            backgroundColor: VokkiColorSchemeLight.colorScheme.onInverseSurface,
            selectedColor: VokkiColorSchemeLight.colorScheme.onSurfaceVariant,
            checkmarkColor: VokkiColorSchemeLight.colorScheme.shadow,
            side: BorderSide(
              color: VokkiColorSchemeLight.colorScheme.outlineVariant,
            ),
          ),
      floatingActionButtonTheme: _baseTheme()
          .floatingActionButtonTheme
          .copyWith(
            foregroundColor: VokkiColorSchemeLight.colorScheme.inversePrimary,
            backgroundColor: VokkiColorSchemeLight.colorScheme.outlineVariant,
          ),
      timePickerTheme: TimePickerThemeData(
        confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (_) => VokkiColorSchemeLight.colorScheme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor:
            const PickerColors(themeMode: VokkiThemeMode.light).pickerColor(),
        dialBackgroundColor: VokkiColorSchemeLight.colorScheme.onTertiary,
        dialHandColor: VokkiColorSchemeLight.colorScheme.primary,
        dialTextColor: VokkiColorSchemeLight.colorScheme.onBackground,
        dayPeriodColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeLight.colorScheme.primary;
            }
            return VokkiColorSchemeLight.colorScheme.onTertiary;
          },
        ),
        dayPeriodTextColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeLight.colorScheme.onPrimary;
            }
            return VokkiColorSchemeLight.colorScheme.onBackground;
          },
        ),
        hourMinuteColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeLight.colorScheme.primary;
            }
            return VokkiColorSchemeLight.colorScheme.onTertiary;
          },
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (_) => VokkiColorSchemeLight.colorScheme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor:
            const PickerColors(themeMode: VokkiThemeMode.light).pickerColor(),
      ),
    );
  }

  ThemeData get darkTheme {
    return _baseTheme(themeMode: VokkiThemeMode.dark).copyWith(
      brightness: Brightness.dark,
      colorScheme: VokkiColorSchemeDark.colorScheme,
      scaffoldBackgroundColor: VokkiColorSchemeDark.colorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: VokkiColorSchemeDark.colorScheme.background,
        shape: Border(
          bottom: BorderSide(
            color: VokkiColorSchemeDark.colorScheme.background,
            width: 1,
          ),
        ),
        elevation: 0,
        toolbarTextStyle: _baseTheme().textTheme.titleSmall,
        titleTextStyle: _baseTheme().textTheme.titleLarge?.apply(
              color: VokkiColorSchemeDark.colorScheme.onBackground,
            ),
        iconTheme: IconThemeData(
          color: VokkiColorSchemeDark.colorScheme.onBackground,
        ),
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: VokkiColorSchemeDark.colorScheme.primary,
          foregroundColor: VokkiColorSchemeDark.colorScheme.onPrimary,
          disabledBackgroundColor: VokkiColorSchemeDark.colorScheme.surface,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: VokkiColorSchemeDark.colorScheme.outline.withOpacity(0.4),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return VokkiColorSchemeLight.colorScheme.inverseSurface
                    .withOpacity(0.2);
              }
              return VokkiColorSchemeLight.colorScheme.inverseSurface;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return VokkiColorSchemeLight.colorScheme.inverseSurface
                    .withOpacity(0.2);
              }
              return VokkiColorSchemeLight.colorScheme.inverseSurface;
            },
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: VokkiColorSchemeDark.colorScheme.onBackground,
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.focused)
                ? VokkiColorSchemeDark.colorScheme.primary
                : VokkiColorSchemeDark.colorScheme.outline;
            return TextStyle(
              color: color,
              letterSpacing: 1.3,
            );
          },
        ),
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: VokkiColorSchemeDark.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: VokkiColorSchemeDark.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: VokkiColorSchemeDark.colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      listTileTheme: ListTileThemeData(
        selectedTileColor: VokkiColorSchemeDark.colorScheme.primaryContainer,
        selectedColor: VokkiColorSchemeDark.colorScheme.onBackground,
        iconColor: VokkiColorSchemeDark.colorScheme.onSurface,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
          ),
        ),
        textColor: VokkiColorSchemeDark.colorScheme.onBackground,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: VokkiColorSchemeDark.colorScheme.primary,
          textStyle: _baseTheme().textTheme.titleLarge,
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeDark.colorScheme.primary;
            }
            return VokkiColorSchemeDark.colorScheme.tertiary;
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith(
          (states) => VokkiColorSchemeDark.colorScheme.onBackground,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeDark.colorScheme.onPrimary;
            }
            return VokkiColorSchemeDark.colorScheme.tertiary;
          },
        ),
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeDark.colorScheme.primary;
            }
            return VokkiColorSchemeDark.colorScheme.tertiary;
          },
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeDark.colorScheme.primary;
            }
            return VokkiColorSchemeDark.colorScheme.tertiary;
          },
        ),
      ),
      iconTheme: IconThemeData(
        color: VokkiColorSchemeDark.colorScheme.tertiary,
      ),
      textTheme: _baseTheme().textTheme.apply(
            bodyColor: VokkiColorSchemeDark.colorScheme.tertiary,
          ),
      cardTheme: _baseTheme().cardTheme.copyWith(
            color:
                VokkiColorSchemeDark.colorScheme.onBackground.withOpacity(0.12),
            elevation: 0,
          ),
      dialogTheme: DialogTheme(
        actionsPadding: const EdgeInsets.all(
          Sizes.p4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: VokkiColorSchemeDark.colorScheme.background,
        elevation: 5,
        surfaceTintColor: VokkiColorSchemeDark.colorScheme.onBackground,
        titleTextStyle: _baseTheme().textTheme.bodyLarge,
        contentTextStyle: _baseTheme().textTheme.bodyMedium,
      ),
      timePickerTheme: TimePickerThemeData(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(0),
          labelStyle: TextStyle(
            color: VokkiColorSchemeDark.colorScheme.onBackground,
          ),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.focused)
                  ? VokkiColorSchemeDark.colorScheme.primary
                  : VokkiColorSchemeDark.colorScheme.outline;
              return TextStyle(
                color: color,
              );
            },
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: VokkiColorSchemeDark.colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: VokkiColorSchemeDark.colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: VokkiColorSchemeDark.colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (_) => VokkiColorSchemeDark.colorScheme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: const PickerColors(themeMode: VokkiThemeMode.dark)
            .pickerColor(), // TODO: Implement picker colors in colorTheme instead of using custom color
        dialBackgroundColor: VokkiColorSchemeDark.colorScheme.onTertiary,
        dialHandColor: VokkiColorSchemeDark.colorScheme.primary,
        dialTextColor: VokkiColorSchemeDark.colorScheme.onBackground,
        dayPeriodColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeDark.colorScheme.primary;
            }
            return VokkiColorSchemeDark.colorScheme.onTertiary;
          },
        ),
        dayPeriodTextColor: VokkiColorSchemeDark.colorScheme.onBackground,
        hourMinuteColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return VokkiColorSchemeDark.colorScheme.primary;
            }
            return VokkiColorSchemeDark.colorScheme.onTertiary;
          },
        ),
        hourMinuteTextColor: VokkiColorSchemeDark.colorScheme.onBackground,
      ),
      datePickerTheme: DatePickerThemeData(
        confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (_) => VokkiColorSchemeDark.colorScheme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: const PickerColors(themeMode: VokkiThemeMode.dark)
            .pickerColor(), // TODO: Implement picker colors in colorTheme instead of using custom color
      ),
    );
  }
}
