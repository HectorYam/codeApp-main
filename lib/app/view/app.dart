// ignore: unused_import
import 'package:code_app/app/modules/languages/model/language_model.dart';
import 'package:code_app/app/modules/languages/view/language_detail_page.dart';
import 'package:code_app/app/modules/lenjuaje_model.dart';
import 'package:code_app/app/modules/login/view/login_page.dart';
import 'package:code_app/app/modules/main/view/main_page.dart';
import 'package:code_app/app/modules/register/view/register_page.dart';
import 'package:code_app/core/singleton/responsive_singleton.dart';
import 'package:code_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSingleton.init(context: context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(centerTitle: true, color: Colors.blue[100]),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.blue[100],
          backgroundColor: Colors.blue[100],
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainPage(),
        '/detailLanguage': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments;
          if (arguments is LugaresModel) {
            return LanguageDetailPage(lugarItem: arguments);
          }
          return Container();
        }
      },
      home: const MainPage(),
    );
  }
}
