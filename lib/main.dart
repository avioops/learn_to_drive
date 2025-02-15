import 'package:first_app/Screens/splashscreen.dart' show SplashScreen;
import 'package:first_app/Services/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    KhaltiScope(
      publicKey: "test_public_key_f18b878e02d64e10988f46aea7baa233",
        builder: (context, navigatorKey) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
                  // supportedLocales: const [
                  //   Locale('en', 'US'),
                  //   Locale('ne', 'NP'),
                  // ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          translations: LocaleString(),
          locale: const Locale('en','US'),
          home: const SplashScreen()
        );
      }
    )
  );
}


