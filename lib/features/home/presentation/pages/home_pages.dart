import 'package:coordinadora_test/core/helper/format_helpers.dart';
import 'package:coordinadora_test/core/helper/spacer_helper.dart';
import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:coordinadora_test/features/home/data/models/home_item_model.dart';
import 'package:coordinadora_test/features/home/presentation/widget/appopup.dart';
import 'package:coordinadora_test/features/home/presentation/widget/cars_color.dart';
import 'package:coordinadora_test/features/home/presentation/widget/infor_tracking.dart';
import 'package:coordinadora_test/features/onbording/presentation/bloc/onbording_bloc.dart';
import 'package:coordinadora_test/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePages extends StatefulWidget {
  final String? numberPhone;
  final String? idUser;
  const HomePages({
    Key? key,
    this.numberPhone,
    this.idUser,
  }) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late Color colorEstado;
  late Widget iconCoor;

  void initState() {
    super.initState();
  }

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
      body: BlocBuilder<OnbordingBloc, OnbordingState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                VSpacer(16),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 2,
                        color: APColors.gray100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                                'Envios Encontrados: ${state.tracking!.guias.length}'),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.filter_alt_rounded),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.arrow_drop_down_outlined),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 610,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.tracking!.guias.length,
                      itemBuilder: (context, index) {
                        final data = state.tracking!.guias[index];
                        if (data.estadoGuia == 'En terminal destino') {
                          colorEstado = Colors.amber;
                          iconCoor = const Icon(
                            Icons.warehouse_rounded,
                            color: APColors.whiteTechnical,
                            size: 32,
                          );
                        }
                        if (data.estadoGuia == 'En NyS') {
                          colorEstado = Colors.red;
                          iconCoor = const Icon(
                            Icons.info,
                            color: APColors.whiteTechnical,
                            size: 32,
                          );
                        }
                        if (data.estadoGuia == 'En Reparto') {
                          colorEstado = Colors.blue;
                          iconCoor = const Icon(
                            Icons.fire_truck_sharp,
                            color: APColors.whiteTechnical,
                            size: 32,
                          );
                        }
                        if (data.estadoGuia == 'Entregada') {
                          colorEstado = Colors.green;
                          iconCoor = const Icon(
                            Icons.check_box,
                            color: APColors.whiteTechnical,
                            size: 32,
                          );
                        }
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            child: Slidable(
                              endActionPane: data.estadoGuia == 'En NyS'
                                  ? ActionPane(
                                      motion: BehindMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Appopup(
                                                  rastreo: data.guia,
                                                  novedad: data.novedad,
                                                  cliente: state.documento,
                                                  fechaR: AppFormatters.instance
                                                      .dateFormatUtil(
                                                    dateTime:
                                                        ((data.fechaNovedad!)
                                                            .toLocal()),
                                                    typeFormat:
                                                        TypeFormat.ddMMyyyy,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: (Icons.person_add_alt),
                                          label: 'Revisar problema',
                                        )
                                      ],
                                    )
                                  : null,
                              child: InkWell(
                                onTap: () {
                                  late Color colorE;
                                  late Widget iconC;
                                  if (data.estadoGuia ==
                                      'En terminal destino') {
                                    colorE = Colors.amber;
                                    iconC = const Icon(
                                      Icons.warehouse_rounded,
                                      color: APColors.whiteTechnical,
                                      size: 32,
                                    );
                                  }
                                  if (data.estadoGuia == 'En NyS') {
                                    colorE = Colors.red;
                                    iconC = const Icon(
                                      Icons.info,
                                      color: APColors.whiteTechnical,
                                      size: 32,
                                    );
                                  }
                                  if (data.estadoGuia == 'En Reparto') {
                                    colorE = Colors.blue;
                                    iconC = const Icon(
                                      Icons.fire_truck_sharp,
                                      color: APColors.whiteTechnical,
                                      size: 32,
                                    );
                                  }
                                  if (data.estadoGuia == 'Entregada') {
                                    colorE = Colors.green;
                                    iconC = const Icon(
                                      Icons.check_box,
                                      color: APColors.whiteTechnical,
                                      size: 32,
                                    );
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InforTracking(
                                                title: data.guia,
                                                estado: data.estadoGuia,
                                                iconPer: iconC,
                                                color: colorE,
                                                nombre:
                                                    data.destinatario.nombre,
                                                telefono:
                                                    data.destinatario.telefono,
                                                direccion: data.destinatario
                                                    .zonificacion.direccion,
                                                ciudad: data.destinatario
                                                    .zonificacion.ciudad,
                                                unidades: data.unidades.length,
                                                listUnidades: data.unidades,
                                              )));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: APColors.whitePure,
                                    boxShadow: [
                                      BoxShadow(
                                        color: APColors.primaryMain
                                            .withOpacity(.15),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      )
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      CarsColor(
                                        title: data.estadoGuia,
                                        color: colorEstado,
                                        iconPer: iconCoor,
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 100),
                                          child: SizedBox(
                                            height: 150,
                                            width: 271,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: ListTile(
                                                    title: const Text(
                                                      'Guía de rastreo',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    subtitle: Text(data.guia,
                                                        style: const TextStyle(
                                                          fontSize: 28,
                                                        )),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    width: 90,
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: APColors.gray50,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(16),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        AppFormatters.instance
                                                            .dateFormatUtil(
                                                          dateTime:
                                                              ((data.fechaEnvio)
                                                                  .toLocal()),
                                                          typeFormat: TypeFormat
                                                              .ddMMyyyy,
                                                        ),
                                                        style: const TextStyle(
                                                          color: APColors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 32),
                                          child: Divider(
                                            thickness: 2,
                                            color: APColors.gray100,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: SizedBox(
                                              width: double.infinity,
                                              height: 40,
                                              child: Text(
                                                'Destinatario: ${data.destinatario.nombre}',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
