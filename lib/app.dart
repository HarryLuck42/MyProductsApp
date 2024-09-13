import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_products/core/config/env.dart';
import 'package:my_products/core/constraint/enum.dart';
import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/core/helper/helper.dart';
import 'package:my_products/core/memory/hive/boxes.dart';
import 'package:my_products/initial/screen.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';

import 'core/memory/shared/share_preference.dart';

final GlobalKey<ScaffoldState> materialAppKey = GlobalKey<ScaffoldState>();

void myAppStarts(EnvType environment)async{

  runZonedGuarded(() async{

    WidgetsFlutterBinding.ensureInitialized();
    Env.init(environment);
    await SharedPreference.onInitialSharedPreferences();
    Helper().systemUIOverlayTheme();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Hive.initFlutter();
    Hive.registerAdapter(LocalCategoryAdapter());
    Hive.registerAdapter(LocalProductAdapter());
    await Boxes.initialBoxes();

    runApp( const MyAppLayout());
  }, (error, stack) {
    'error run myAppStarts: $error'.logger();
  });

}