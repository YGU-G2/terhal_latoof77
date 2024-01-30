import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:terhal/firebase_options.dart';
import 'package:terhal/home.dart';
import 'package:terhal/l10n/ln10.dart';
import 'package:terhal/pages/signin_page/signin_page.dart';
import 'package:terhal/pages/signin_page/signup_page.dart';
import 'package:terhal/utils/constants.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  runApp(const TerhalApp());
}

class TerhalApp extends StatelessWidget {
  const TerhalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       localizationsDelegates: [
        AppLocalizations.delegate, // this one was missing
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 46, 115, 0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 68, 95, 4),
          centerTitle: true,
        ),
      ),
      getPages: [
        GetPage(
          name: HomePage.id,
          page: () => const HomePage(),
        ),
        GetPage(
          name: SignInPage.id,
          page: () => const SignInPage(),
        ),
        GetPage(
          name: SignUpPage.id,
          page: () => const SignUpPage(),
        ),
      ],
      initialRoute: auth.currentUser != null ? HomePage.id : SignInPage.id,
      supportedLocales: L10n.all,
    );
  }
}
