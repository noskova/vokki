part of 'vokki_theme.dart';

class VokkiColorSchemeLight {
  static ColorScheme get colorScheme {
    const MaterialAccentColor primaryColor = MaterialAccentColor(
      0xFF20556f, //crayola
      <int, Color>{
        100: Color(0xFF4994EC), // blueberry
      },
    ); // Crayola
    const MaterialAccentColor secondaryColor = MaterialAccentColor(
      0xFFb0f4ea,
      <int, Color>{
        100: Color(0xFFFFEBEB), // linen
        200: Color(0xFFEFEFEF), // brightGray
        400: Color(0xFFDEDBDB), // gainsboro
        700: Color(0xFFB9B9B9), // lightGray
      },
    );
    const MaterialAccentColor tertiaryColor = MaterialAccentColor(
      0xFFf1fdfb,
      <int, Color>{
        100: Color(0xFFAAAAAA), // darkGray
        200: Color(0xFFA8A8A8), // darkGray2
        400: Color(0xFF7F7F7F), // gray
      },
    );
    const MaterialColor neutralColor = MaterialColor(
      0xFFddedec,
      <int, Color>{
        50: Color(0xFFFFFFFF), // white
        100: Color(0xFFF6F6F6), // cultured
        200: Color(0xFFFCFCFC), // lotion
        300: Color(0xFFEEEEEE), // greyBackdrop
        400: Color(0xFFCBCBCB), // chineseSilver
        500: Color(0xFF8F8F8F), // Philippine Gray
        800: Color(0xFF4F4F4F), // darkLiver
        900: Color(0xFF000000), // Black
      },
    );
    return ColorScheme(
      brightness: Brightness.light,

      primary: primaryColor,
      onPrimary: neutralColor.shade50, //Switch background Color

      primaryContainer: primaryColor.withOpacity(0.1), // CircleAvatar
      onPrimaryContainer: neutralColor.shade50, //TextForCircleAvatar

      secondary: secondaryColor,
      onSecondary: secondaryColor.shade700,

      secondaryContainer: secondaryColor.shade100,

      tertiary: tertiaryColor,
      onTertiary: tertiaryColor.shade100, //darkgray

      tertiaryContainer: neutralColor.shade800, //darkliver

      background: secondaryColor.shade400, //gainsboro
      onBackground: neutralColor.shade900, // black

      surface: neutralColor.shade200, // lotion
      onSurface: neutralColor.shade500, // phili

      surfaceVariant: tertiaryColor, // cultured
      onSurfaceVariant: neutralColor.shade300, // greybackgrop

      shadow: neutralColor.shade900, // black

      outline: neutralColor.shade800, // darkliver
      outlineVariant: neutralColor.shade400, //chinese silver

      error: const Color(0xffCD3100), // Error Color
      onError: neutralColor.shade50, // white

      inverseSurface: tertiaryColor.shade400, // gray SnackBar background
      onInverseSurface: neutralColor.shade50, //SnackBar Text Color

      inversePrimary: neutralColor.shade50, //SnackBar Button Color
    );
  }
}

class VokkiColorSchemeDark {
  static ColorScheme get colorScheme {
    const Color primaryColor = Color(0xFFD38B03); // Orange
    const MaterialAccentColor secondaryColor = MaterialAccentColor(
      0xFFEFEFEF,
      <int, Color>{
        100: Color(0xFFFFEBEB), // linen
        200: Color(0xFFEFEFEF), // brightGray
        400: Color(0xFFDEDBDB), // gainsboro
        700: Color(0xFFB9B9B9), // lightGray
      },
    );
    const MaterialAccentColor tertiaryColor = MaterialAccentColor(
      0xFFA8A8A8,
      <int, Color>{
        100: Color(0xFFAAAAAA), // darkGray
        200: Color(0xFFA8A8A8), // darkGray2
        400: Color(0xFF7F7F7F), // gray
      },
    );
    const MaterialColor neutralColor = MaterialColor(
      0xFF8F8F8F,
      <int, Color>{
        50: Color(0xFFFFFFFF), // white
        100: Color(0xFFF6F6F6), // cultured
        200: Color(0xFFFCFCFC), // lotion
        300: Color(0xFFEEEEEE), // greyBackdrop
        400: Color(0xFFCBCBCB), // chineseSilver
        500: Color(0xFF8F8F8F), // Philippine Gray
        800: Color(0xFF4F4F4F), // darkLiver
        900: Color(0xFF000000), // Black
      },
    );
    return ColorScheme(
        brightness: Brightness.dark,
        primary: primaryColor,
        onPrimary: neutralColor.shade900, //Switch background Color

        primaryContainer: primaryColor.withOpacity(0.1), // CircleAvatar
        onPrimaryContainer: neutralColor.shade900, //TextForCircleAvatar

        secondary: secondaryColor, // brightGray
        onSecondary: secondaryColor.shade700, // lightGray

        secondaryContainer: secondaryColor.shade100, // linen
        onSecondaryContainer: secondaryColor.shade400, //gainboro

        tertiary: tertiaryColor, // darkGray2
        onTertiary: tertiaryColor.shade400, //gray

        tertiaryContainer: neutralColor.shade300, //greyBackdrop
        onTertiaryContainer: neutralColor.shade400, //ChineseSilver

        background: neutralColor.shade900, // black
        onBackground: neutralColor.shade50, // white

        surface: neutralColor.shade500.withOpacity(0.45), // Philippine Gray
        onSurface: tertiaryColor.shade100, //darkgray

        surfaceVariant: neutralColor.shade800, // darkliver
        onSurfaceVariant: tertiaryColor.shade200, // cultured

        shadow: neutralColor.shade50, // White

        outline: neutralColor // darkliver
            .shade800,
        outlineVariant: neutralColor.shade200, //Lotion

        error: const Color(0xffCD3100), // Error Color
        onError: neutralColor.shade50, // white

        inverseSurface: neutralColor.shade800, // darkLiver SnackBar background
        onInverseSurface: neutralColor.shade50, //white SnackBar Text Color
        inversePrimary: neutralColor.shade50 //white SnackBar Button Color

        );
  }
}
