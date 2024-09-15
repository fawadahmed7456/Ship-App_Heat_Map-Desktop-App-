import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/config_provider.dart';
import 'package:ship_heat_managment_app/features/configuration/provider/position.dart';
import 'package:ship_heat_managment_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:ship_heat_managment_app/features/login/providers/auth_provider.dart';
import 'package:ship_heat_managment_app/features/login/sign_in_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/configuration/provider/reciever_model.dart';
import 'features/configuration/provider/shipholds_model.dart';
import 'features/configuration/provider/transmitter_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ConfigProviderAdapter());
  Hive.registerAdapter(ShipholdsModelAdapter());
  Hive.registerAdapter(TransmitterModelAdapter());
  Hive.registerAdapter(RecieverModelAdapter());
  Hive.registerAdapter(PositionAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ConfigProvider()),
        ChangeNotifierProvider(create: (context) => ShipholdsModel()),
        ChangeNotifierProvider(create: (context) => RecieverModel()),
        ChangeNotifierProvider(create: (context) => TransmitterModel()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
      ],
      child: Consumer(
        builder: (context, ConfigProvider config, child) {
          return MaterialApp(
            title: 'Ship Heat Management App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SignInScreen(),
          );
        },
      ),
    );
  }
}
