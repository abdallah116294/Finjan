import 'package:finjan/app/app.dart';
import 'package:finjan/core/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'injection_container.dart' as di;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterPaymob.instance.initialize(
      apiKey: AppConstants.paymobApiKey,
      iFrameID: 782498,
      walletIntegrationId: 4120104,integrationID:4443341 );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(MyApp());
}
