// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:coordinadora_test/core/bloc/global_bloc.dart';
import 'package:coordinadora_test/core/helper/constants_helper.dart';
import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:coordinadora_test/flavor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:soundpool/soundpool.dart';
import 'package:device_info_plus/device_info_plus.dart';

enum LocationFormat { es, en }

enum UserType { admin, collaborator, owner }

class AppUtils {
  AppUtils._internal();
  static final AppUtils _instance = AppUtils._internal();
  static AppUtils get instance => _instance;

  Future<Position> getUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de ubicación están denegados');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los permisos de ubicación se niegan permanentemente, no podemos solicitar permisos');
    }
    Position? position;
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = userLocation;
    return position;
  }

  String generateLocation(LocationFormat locationFormat) {
    switch (locationFormat) {
      case LocationFormat.es:
        return "es";
      case LocationFormat.en:
        return "en";
    }
  }

  double stringToDouble(String number) {
    double newDouble = 0.0;
    String newNumber = number;
    try {
      if (number.contains(',')) {
        newNumber = number.replaceAll(',', '.');
      }
      newDouble = double.parse(newNumber);
      return newDouble;
    } catch (_) {
      return 0;
    }
  }

  /// convert String to String with 2 decimals and currency
  String stringToStringCurrency(String number) {
    return '\$ ${stringToDouble(number).toStringAsFixed(2)}';
  }

  String parseNumberFormat(String number) {
    String numberFormat =
        number.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return numberFormat;
  }

  String uuidToShortString(String uuid) {
    var paramUuid = uuid.split("-");
    return paramUuid[0];
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  double jsonToDouble(dynamic value) {
    if (value != null) {
      if (value is String) {
        return double.parse(value);
      } else if (value is int) {
        return 0.0 + value;
      } else {
        return value;
      }
    } else {
      return 0.0;
    }
  }

  Future<DateTime> selectDate(
      {required BuildContext context,
      required DateTime dateTime,
      DateTime? minDate,
      DateTime? maxDate}) async {
    DateTime? minDateTmp;
    DateTime? maxDateTmp;
    if (minDate != null) {
      minDateTmp = DateTime(minDate.year, minDate.month, minDate.day);
    }

    if (maxDate != null) {
      maxDateTmp = DateTime(maxDate.year, maxDate.month, maxDate.day);
    }
    DateTime? picked = dateTime;
    if (Platform.isIOS) {
      await showModalBottomSheet(
        backgroundColor: APColors.whitePure,
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Hecho',
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).copyWith().size.height / 3.5,
                child: CupertinoDatePicker(
                  initialDateTime: dateTime,
                  onDateTimeChanged: (DateTime newdate) {
                    picked = newdate;
                  },
                  minimumDate: minDate != null
                      ? minDateTmp
                      : AppConstants.instance.minDateTime,
                  maximumDate: maxDate != null
                      ? maxDateTmp
                      : AppConstants.instance.maxDateTime,
                  minimumYear: AppConstants.instance.minDateTime.year,
                  maximumYear: AppConstants.instance.maxDateTime.year,
                  backgroundColor: APColors.whitePure,
                  mode: CupertinoDatePickerMode.date,
                )),
          ]);
        },
      );
    } else {
      picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate:
            minDate != null ? minDateTmp! : AppConstants.instance.minDateTime,
        lastDate:
            maxDate != null ? maxDateTmp! : AppConstants.instance.maxDateTime,
        builder: (context, child) {
          return child!;
        },
      );

      if (picked != null) {
        return picked;
      } else {
        return dateTime;
      }
    }
    return picked!;
  }

  getDataDecode(Uint8List bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }

  String monthToString(DateTime dateTime) {
    String monthName = DateFormat('MMMM', 'es_ES').format(dateTime);
    String data = "${monthName.capitalize()} ${dateTime.year}";
    return data;
  }

  Future<void> isPhysicalDevice() async {
    bool isPhysicalD = true;
    var deviceData = <String, dynamic>{};
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
      return <String, dynamic>{
        'isPhysicalDevice': build.isPhysicalDevice,
      };
    }

    Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
      return <String, dynamic>{
        'isPhysicalDevice': data.isPhysicalDevice,
      };
    }

    if (Platform.isAndroid) {
      deviceData = readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
    isPhysicalD = deviceData['isPhysicalDevice'] ?? true;
    Flavor.instance.setPhysicalDevice = isPhysicalD;
  }

  Future<void> playScannerAudio() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle
        .load("assets/audio/scanner2.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }

  /*getPercentageProfileFromUser(User user) {
    if (user.firstName.isNotEmpty &&
        user.lastName.isNotEmpty &&
        user.mobile.isNotEmpty & user.email.isNotEmpty) {
      return 100.00;
    } else if (user.firstName.isNotEmpty &&
        user.lastName.isNotEmpty &&
        user.mobile.isNotEmpty) {
      return 75.00;
    } else if (user.firstName.isNotEmpty && user.lastName.isNotEmpty) {
      return 35.00;
    } else if (user.firstName.isNotEmpty) {
      return 15.00;
    } else {
      return 0.00;
    }
  }*/

  double priceToShowRegister(
      {required double lastSalePrice, required double averageSalePrice}) {
    if (lastSalePrice != 0) {
      return lastSalePrice;
    } else if (averageSalePrice != 0) {
      return averageSalePrice;
    } else {
      return 0;
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
