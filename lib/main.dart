
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_dashboard/Core/services/custom_bloc_observer.dart';
import 'package:parking_dashboard/Core/services/shared_pref_services.dart';
import 'package:parking_dashboard/Core/translations/codegen_loader.g.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/constant_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
// import 'package:parking_dashboard/Feather/Home/presentation/manager/home_cubit.dart';
// import 'package:parking_dashboard/Feather/User/presentation/manager/user/user_cubit.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await SharedPreferencesServices.init();

  //EncryptKey.encryptMethod();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    runApp(EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
        ],
        fallbackLocale: Locale(ConstantData.kDefaultLung),
        startLocale: Locale(SharedPreferencesServices.getDate(key: ConstantData.kLung)??ConstantData.kDefaultLung),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
        //
        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider (create: (BuildContext context) => UserCubit(),),
        //     BlocProvider (create: (BuildContext context) => HomeCubit(),),
        //   ],
        //   child: const MyApp(),)
    ));
  });


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Styles.init(context);
    return MaterialApp.router(
      title: 'Parking Dashboard',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  color: ColorData.greyBlue1Color,
                  fontFamily: Styles.fontFamily
              )
          )
      ),
      routerConfig: AppRouter.router,
    );
  }
}

