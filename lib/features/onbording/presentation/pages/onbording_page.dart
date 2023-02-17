import 'package:coordinadora_test/core/helper/spacer_helper.dart';
import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:coordinadora_test/features/onbording/presentation/bloc/onbording_bloc.dart';
import 'package:coordinadora_test/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  _OnbordingPageState createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  final TextEditingController controllerDocument = TextEditingController();

  void initState() {
    context.read<OnbordingBloc>().add(const TrackingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APColors.whiteTechnical,
        leading: Container(),
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
      backgroundColor: APColors.whitePure,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            const VSpacer(32),
            const Center(
              child: Text(
                'Tracking de Envio',
                style: TextStyle(
                  color: APColors.primaryMain,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            const VSpacer(32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'Escriba su número Cédula para buscar sus guías asociadas.',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const VSpacer(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                maxLength: 15,
                controller: controllerDocument,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  isDense: true,
                  fillColor: APColors.whiteTechnical,
                  filled: true,
                  counterText: '',
                  hintText: 'Ingrese su cédula',
                  hintStyle: const TextStyle(color: APColors.gray100),
                ),
              ),
            ),
            const VSpacer(32),
            BlocBuilder<OnbordingBloc, OnbordingState>(
              builder: (context, state) {
                return Padding(
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
                            context.read<OnbordingBloc>().add(
                                  TrackingSeachEvent(
                                    document: controllerDocument.text,
                                  ),
                                );
                          });
                        },
                        child: const Text("Buscar envíos")),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
