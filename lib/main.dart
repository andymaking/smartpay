import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'data/cache/config.dart';
import 'data/routes/router.dart';
import 'data/services/local/locale.service.dart';
import 'data/services/local/navigation.service.dart';
import 'data/services/local/theme.service.dart';
import 'data/services/local/user.service.dart';
import 'locator.dart';
import 'screens/splash-screen/splash_screen.dart';
import 'styles/app_style.dart';


Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();

  // SETUP DOT ENV
  await dotenv.load(fileName: ".env");

  // SETUP STORAGE PACKAGE
  await GetStorage.init();

  // SETUP OUR SERVICES AND VIEWMODEL
  await setupLocator();

  // SETUP OUR SCREEN TO ALWAYS BE VERTICAL
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // SET APPBAR BACKGROUND
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  //setup different deployment environment
  Config.appFlavor = Flavor.DEVELOPMENT;

  // Initialize and check login Status
  await locator<UserService>().initializer();

  // INITIALIZE OUR LANGUAGE
  await locator<LocaleService>().init();


  runApp(const MyApp());
      (dynamic error, dynamic stack) {
    if (kDebugMode) {
      // SETUP PRINT ERROR ONLY IN DEBUG MODE
      print(error);
      print(stack);
    }
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // SETUP THEMES
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, themeProvider, child) {
              return OKToast(
                  child: ScreenUtilInit(
                    //setup to fit into bigger screens
                    designSize: const Size(390, 844),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (BuildContext context, Widget? child) {
                      return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        navigatorKey: locator<NavigationService>().navigatorKey,
                        scaffoldMessengerKey: locator<NavigationService>().snackBarKey,
                        title: "SMARTPAY",
                        theme: Styles.themeData(isDark: themeProvider.isDark),
                        supportedLocales: locator<LocaleService>().localization.supportedLocales,
                        localizationsDelegates: locator<LocaleService>().localization.localizationsDelegates,
                        onGenerateRoute: Routers.generateRoute,
                        home: const SplashScreen(),
                      );
                    },
                  ));
            }
        )
    );
  }
}
