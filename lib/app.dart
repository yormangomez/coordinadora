import 'package:coordinadora_test/core/bloc/global_bloc.dart';
import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:coordinadora_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:coordinadora_test/features/onbording/presentation/bloc/onbording_bloc.dart';
import 'package:coordinadora_test/flavor.dart';
import 'package:coordinadora_test/l10n/l10n.dart';
import 'package:coordinadora_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coordinadora_test/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<GlobalBloc>()),
          BlocProvider(create: (context) => di.sl<HomeBloc>()),
          BlocProvider(create: (context) => di.sl<OnbordingBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:
              Flavor.instance.value == FlavorType.dev ? true : false,
          title: 'WeTechn',
          theme: ThemeData(
            primaryColor: APColors.whitePure,
            scaffoldBackgroundColor: APColors.whiteTechnical,
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.light(
              primary: APColors.gray100,
              primaryContainer: APColors.gray100.withOpacity(0.8),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: L10n.all,
          navigatorKey: AppNavigator.navigatorKey,
          onGenerateRoute: AppNavigator.onGenerateRoute,
        ),
      ),
    );
  }
}
