// ignore: eol_at_end_of_file
// ignore: eol_at_end_of_file
// ignore_for_file: unused_import, sort_child_properties_last

import 'package:code_app/app/modules/languages/view/languages_page.dart';
import 'package:code_app/widgets/button.dart';
import 'package:code_app/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
// ignore: directives_ordering
import 'package:dio/dio.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // ignore: type_annotate_public_apis
  var title = 'Inicio';
  Widget? container;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeaderDrawer(),
                getBodyDrawer(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'CopyRight ${DateTime.now().year} Sartenejas II',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: container,
    );
  }

  Widget getHeaderDrawer() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 102, 196, 58),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset('assets/logo.png'),
              width: 80,
              height: 80,
            ),
            const Text(
              'Sartenejas II',
              textAlign: TextAlign.left,
            ),
            const Text(
              'Bienvenido!!!',
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget getBodyDrawer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: DividerWidget(title: 'Categorías'),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CustomButtomWidget(
            label: 'Inicio',
            onPressed: () {
              setState(() {
                title = 'Inicio';
                container = const LanguagesPage(
                  idCategory: 1,
                );
              });
              //dismiss drawer
              Navigator.pop(context);
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CustomButtomWidget(
            label: 'Grutas',
            onPressed: () {
              //Navigator.pushNamed(context, '/register');
              setState(() {
                title = 'Grutas';
                container = const LanguagesPage(
                  idCategory: 2,
                );
              });
              //dismiss drawer
              Navigator.pop(context);
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CustomButtomWidget(
            label: 'Gastronomia',
            onPressed: () {
              //Navigator.pushNamed(context, '/register');
              setState(() {
                title = 'Gastronomia';
                container = const LanguagesPage(
                  idCategory: 3,
                );
              });
              //dismiss drawer
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: DividerWidget(title: 'Otros'),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CustomButtomWidget(
            label: 'Contacto',
            onPressed: () {
              //Navigator.pushNamed(context, '/register');
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CustomButtomWidget(
            label: 'Salir',
            onPressed: () {
              //Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}
