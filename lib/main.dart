import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/services/get_it_services.dart';
import 'package:fruits_app_dashboard/core/utilis/locale/app_localizations_setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bloc_observer.dart';
import 'core/helper_function/on_generate_routes.dart';
import 'feature/dashboard/presentation/views/dashboard_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer= FruitsBlocObserver();
  ServicesLoacator().init();


  await Supabase.initialize(
    url: "https://pekytshuvupspusketqt.supabase.co",
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBla3l0c2h1dnVwc3B1c2tldHF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIzNzI0NTgsImV4cCI6MjA0Nzk0ODQ1OH0.uuix3exkZlqpDZbQkgOIIJQzULc4VHHx1ijphaGOMYg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenrateRoute,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
    );
  }
}
