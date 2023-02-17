import 'package:coordinadora_test/core/helper/spacer_helper.dart';
import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:coordinadora_test/features/onbording/data/model/tracking_model.dart';
import 'package:coordinadora_test/navigator.dart';
import 'package:flutter/material.dart';

class InforTracking extends StatefulWidget {
  final String? title;
  final String? estado;
  final String? nombre;
  final String? telefono;
  final String? direccion;
  final String? ciudad;
  final int? unidades;

  final Widget? iconPer;
  final Color? color;
  final List<Unidade>? listUnidades;
  final List<Unidade>? ubicacionguia;

  const InforTracking({
    Key? key,
    this.title,
    this.estado,
    this.iconPer,
    this.color,
    this.nombre,
    this.direccion,
    this.telefono,
    this.ciudad,
    this.unidades,
    this.listUnidades,
    this.ubicacionguia,
  }) : super(key: key);

  @override
  _InforTrackingState createState() => _InforTrackingState();
}

class _InforTrackingState extends State<InforTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APColors.whiteTechnical,
        leading: IconButton(
          onPressed: () => AppNavigator.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          color: APColors.black,
        ),
        title: Image.asset(
          'assets/img/image001.jpg',
          height: 200,
          width: 300,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: APColors.black,
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        elevation: 8,
      ),
      backgroundColor: APColors.whiteTechnical,
      body: Column(
        children: [
          VSpacer(32),
          Center(
              child: Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 24,
              color: APColors.primaryMain,
            ),
          )),
          const Divider(
            height: 16,
            thickness: 2,
            color: APColors.gray100,
          ),
          const VSpacer(16),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: widget.color,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.iconPer!,
                  const HSpacer(12),
                  Center(
                    child: Text(
                      widget.estado!,
                      style: const TextStyle(
                        color: APColors.whiteTechnical,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VSpacer(12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Información del destinatario:',
                style: TextStyle(
                  color: APColors.primaryMain,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Nombre:',
                    style: TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                  const HSpacer(28),
                  Text(
                    widget.nombre!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Telefono:',
                    style: TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                  const HSpacer(32),
                  Text(
                    widget.telefono!,
                    style: const TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Dirección:',
                    style: TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                  const HSpacer(32),
                  Text(
                    widget.direccion!,
                    style: const TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Ciudad:',
                    style: TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                  const HSpacer(32),
                  Text(
                    widget.ciudad!,
                    style: const TextStyle(
                      color: APColors.gray100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VSpacer(32),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Unidades ${widget.unidades}',
                style: const TextStyle(
                  color: APColors.gray100,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const VSpacer(32),
          Container(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              itemCount: widget.listUnidades!.length,
              itemBuilder: (context, index) {
                final data = widget.listUnidades![index];
                return Container(
                  width: double.infinity,
                  height: 40,
                  color: APColors.gray80,
                  child: Column(
                    children: [
                      Text(data.guia),
                      const Divider(
                        height: 16,
                        thickness: 2,
                        color: APColors.gray100,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          VSpacer(32),
          widget.ubicacionguia != []
              ? Padding(
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
                          setState(() {});
                        },
                        child: const Text("Abrir mapa de ubicación")),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
