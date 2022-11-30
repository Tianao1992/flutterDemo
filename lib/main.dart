// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member
import 'package:favorcate/core/routers/router.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmdoel/favor_view_model.dart';
import 'package:favorcate/core/viewmdoel/filter_view_model.dart';
import 'package:favorcate/core/viewmdoel/meal_viewmdoel.dart';
import 'package:favorcate/ui/shares/app_theme.dart';
import 'package:favorcate/ui/shares/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//测试1
//测试2
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        return FilterViewModel();
      }),
      ChangeNotifierProxyProvider<FilterViewModel, FavorViewModel>(
          create: (context) {
        return FavorViewModel();
      }, update: (cxt, filterVM, favorVM) {
        favorVM!.updateFilterVM(filterVM);
        return favorVM;
      }),
      ChangeNotifierProxyProvider2<FilterViewModel, FavorViewModel,
          MealViewModel>(create: (context) {
        return MealViewModel();
      }, update: (context, filterVM, favorVM, mealVM) {
        mealVM!.storages = favorVM.favors;
        mealVM.updateFilterVM(filterVM);
        return mealVM;
      }),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    SharedPreferences.getInstance();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.normTheme,
      initialRoute: TRouter.initialRoute,
      routes: TRouter.routes,
      onGenerateRoute: TRouter.generateRoute,
      onUnknownRoute: TRouter.unknownRoute,
    );
  }
}
