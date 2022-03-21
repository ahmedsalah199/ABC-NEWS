import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/web_services/web_services.dart';
import 'package:news_app/presentation/modules/home_screen.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/logic/cubit/states.dart';
import 'package:news_app/shared/theme/my_theme.dart';
import 'package:news_app/shared/my_bloc_observer.dart';
import 'package:news_app/shared/local/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  WebServices.init();
  await SharedPreferencesData.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isLight = SharedPreferencesData.getData() == null ? true  : SharedPreferencesData.getData()!;
    return BlocProvider(
      create: (BuildContext context) => CubitNews()..getNewsGeneral()..isLight = SharedPreferencesData.getData()! ,
      child: BlocConsumer<CubitNews, StateNews>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: CubitNews.getCubit(context).isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const Directionality(
              textDirection: TextDirection.rtl,
              child: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
