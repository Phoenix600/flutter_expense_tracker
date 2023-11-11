import 'package:expensetracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// for locking the device orientation
import 'package:flutter/services.dart';

// color schemes, naming convention for variables holding the SeedColor
var kColorSchemes =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  ).then((someAnotherFunctionArgument) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.onSecondary,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        // theme: ThemeData(useMaterial3: true ),
        theme: ThemeData().copyWith(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: kColorSchemes.onPrimaryContainer,
            foregroundColor: kColorSchemes.primaryContainer,
          ),
          // Setting the card theme
          cardTheme: const CardTheme().copyWith(
            color: kColorSchemes.secondaryContainer,
            shadowColor: kColorSchemes.tertiaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorSchemes.primaryContainer,
              foregroundColor: kColorSchemes.onPrimaryContainer,
            ),
          ),
          iconTheme: const IconThemeData().copyWith(
            color: kColorSchemes.onPrimaryContainer,
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: kColorSchemes.onSecondaryContainer,
                ),
                bodyLarge: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kColorSchemes.onSecondaryContainer,
                ),
              ),
          primaryColor: kColorSchemes.onBackground,
          colorScheme: kColorSchemes,
        ),
        themeMode: ThemeMode.system,
        home: const Expenses(),
      ),
    );
  });

  // runApp(
  //   MaterialApp(
  //     darkTheme: ThemeData.dark().copyWith(
  //       brightness: Brightness.dark,
  //       useMaterial3: true,
  //       colorScheme: kDarkColorScheme,
  //       cardTheme: const CardTheme().copyWith(
  //         color: kDarkColorScheme.onSecondary,
  //         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: kDarkColorScheme.primaryContainer,
  //           foregroundColor: kDarkColorScheme.onPrimaryContainer,
  //         ),
  //       ),
  //     ),
  //     // theme: ThemeData(useMaterial3: true ),
  //     theme: ThemeData().copyWith(
  //       useMaterial3: true,
  //       appBarTheme: AppBarTheme(
  //         backgroundColor: kColorSchemes.onPrimaryContainer,
  //         foregroundColor: kColorSchemes.primaryContainer,
  //       ),
  //       // Setting the card theme
  //       cardTheme: const CardTheme().copyWith(
  //         color: kColorSchemes.secondaryContainer,
  //         shadowColor: kColorSchemes.tertiaryContainer,
  //         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: kColorSchemes.primaryContainer,
  //           foregroundColor: kColorSchemes.onPrimaryContainer,
  //         ),
  //       ),
  //       iconTheme: const IconThemeData().copyWith(
  //         color: kColorSchemes.onPrimaryContainer,
  //       ),
  //       textTheme: ThemeData().textTheme.copyWith(
  //             titleLarge: TextStyle(
  //               fontSize: 17,
  //               fontWeight: FontWeight.bold,
  //               color: kColorSchemes.onSecondaryContainer,
  //             ),
  //             bodyLarge: TextStyle(
  //               fontSize: 15,
  //               fontWeight: FontWeight.bold,
  //               color: kColorSchemes.onSecondaryContainer,
  //             ),
  //           ),
  //       primaryColor: kColorSchemes.onBackground,
  //       colorScheme: kColorSchemes,
  //     ),
  //     themeMode: ThemeMode.system,
  //     home: const Expenses(),
  //   ),
  // );
}
