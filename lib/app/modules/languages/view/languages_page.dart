// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:code_app/app/modules/languages/model/language_model.dart';
import 'package:code_app/app/modules/lenjuaje_model.dart';
import 'package:code_app/core/singleton/responsive_singleton.dart';
import 'package:code_app/core/utils/Utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({required this.idCategory, super.key});

  final int idCategory;

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  List<LanguageModel> lsLanguages1 = [];
  List<LugaresModel> lsLugares = [];

  bool isFirstAccess = true;

// Obtener los lugares(Grutas, Gastronomia, )
  Future<void> getLugares() async {
    final dio = Dio();
    // ignore: inference_failure_on_function_invocation
    final response = await dio.get(
      '${Utils.urlBase}Api/getDatos.php?idCategoria=${widget.idCategory}',
    );
    if (response.statusCode == 200) {
      lsLugares = List<LugaresModel>.from(
        response.data!.map(LugaresModel.fromJson) as Iterable,
      );
      log('carga de informacion');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstAccess) {
      getLugares();
      isFirstAccess = false;
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: lsLugares.length,
        itemBuilder: (context, index) {
          final item = lsLugares[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveSingleton.proportionalFont(18),
                    ),
                  ),
                  Row(
                    children: [
                      //Image.asset(item.image),
                      const FlutterLogo(
                        size: 80,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item.descripcion,
                            style: TextStyle(
                              fontSize:
                                  ResponsiveSingleton.proportionalFont(14),
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      )
                    ],
                  ),
                  //ver curso texto y flecha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/detailLanguage',
                            arguments: item,
                          );
                        },
                        child: const Text('Ver mas...'),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_ios),
                      const SizedBox(width: 8),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
