//import 'package:code_app/app/modules/languages/model/language_model.dart';
// ignore_for_file: avoid_dynamic_calls, inference_failure_on_function_invocation

import 'dart:developer';

import 'package:code_app/app/modules/languages/model/fotos_model.dart';
import 'package:code_app/app/modules/lenjuaje_model.dart';
import 'package:code_app/widgets/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../../core/utils/Utils.dart';

class LanguageDetailPage extends StatefulWidget {
  const LanguageDetailPage({required this.lugarItem, super.key});
  final LugaresModel lugarItem;

  @override
  State<LanguageDetailPage> createState() => _LanguageDetailPageState();
}

class _LanguageDetailPageState extends State<LanguageDetailPage> {
  //listado de las fotos del lugar
  List<FotosModel> lsFotosLugar = [];
  bool isFirstAccess = true;
  final CardSwiperController controller = CardSwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getFotosLugar() async {
    final dio = Dio();

    //request para obtener las fotos del lugar
    final response = await dio.get(
      '${Utils.urlBase}Api/getFoto.php?idLugar=${widget.lugarItem.id}',
    );

    if (response.statusCode == 200) {
      lsFotosLugar = List<FotosModel>.from(
        response.data!.map(FotosModel.fromJson) as Iterable,
      );

      log('carga de informacion');

      //emitir un cambio de estado para informar que la lista ahora tiene valores
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //ejecutar funcion para obtener foto solo la priemera vez
    if (isFirstAccess) {
      getFotosLugar();
      isFirstAccess = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lugarItem.nombre),
      ),
      body: Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //presentar el slider
              Flexible(
                child: CardSwiper(
                  numberOfCardsDisplayed: lsFotosLugar.length > 0 ? 1 : 0,
                  cardsCount: lsFotosLugar.length,
                  controller: controller,
                  duration: const Duration(milliseconds: 200),
                  cardBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.network(
                        fit: BoxFit.fill,
                        '${Utils.urlBase}${lsFotosLugar[index].uriFoto}',
                      ),
                    );
                  },
                ),
              ),

              Text(widget.lugarItem.descripcion),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CustomButtomWidget(
                onPressed: () {
                  Navigator.pushNamed(context, '/course');
                },
                label: 'Ver',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
