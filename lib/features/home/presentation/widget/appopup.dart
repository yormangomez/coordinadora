import 'package:coordinadora_test/core/helper/spacer_helper.dart';
import 'package:coordinadora_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:coordinadora_test/features/onbording/presentation/bloc/onbording_bloc.dart';
import 'package:coordinadora_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/apcolors.dart';

class Appopup extends StatefulWidget {
  final String? rastreo;
  final String? fechaR;
  final String? fechaS;
  final String? novedad;
  final String? cliente;

  const Appopup({
    Key? key,
    this.rastreo,
    this.fechaR,
    this.fechaS,
    this.cliente,
    this.novedad,
  }) : super(key: key);

  @override
  _AppopupState createState() => _AppopupState();
}

class _AppopupState extends State<Appopup> {
  final TextEditingController controllerSolucion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: APColors.primaryMain,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.info,
                  color: APColors.whiteTechnical,
                  size: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      const Text(
                        'Guia de rastreo:',
                        style: TextStyle(
                          color: APColors.whiteTechnical,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${widget.rastreo}',
                        style: const TextStyle(
                          color: APColors.whiteTechnical,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Fecha de reporte:',
                  style: TextStyle(
                    color: APColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                HSpacer(16),
                Text(
                  '${widget.fechaR}',
                  style: const TextStyle(
                    color: APColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Fecha de solucion:',
                  style: TextStyle(
                    color: APColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                HSpacer(16),
                Text(
                  widget.fechaS != null
                      ? '${widget.fechaS}'
                      : 'sin información',
                  style: const TextStyle(
                    color: APColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: APColors.primaryMain,
          ),
          VSpacer(32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              maxLength: 300,
              maxLines: 5,
              controller: controllerSolucion,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                isDense: true,
                fillColor: APColors.whiteTechnical,
                filled: true,
                counterText: '',
                hintText: 'Ingrese Solución',
                hintStyle: const TextStyle(color: APColors.gray100),
              ),
            ),
          ),
          VSpacer(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: APColors.primaryMain,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    setState(() {
                      context.read<HomeBloc>().add(SolucionEvent(
                            fechaR: widget.fechaR,
                            fechaS: DateTime.now().toString(),
                            novedad: widget.novedad,
                            solucion: controllerSolucion.text,
                            rastreo: widget.rastreo,
                            cliente: widget.cliente,
                          ));
                      AppNavigator.pop();
                      AppNavigator.pop();
                      context.read<OnbordingBloc>().add(TrackingEvent());
                    });
                  },
                  child: const Text("Buscar envíos")),
            ),
          ),
          const VSpacer(32),
        ],
      ),
    );
  }
}
