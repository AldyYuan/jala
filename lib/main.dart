import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala/core/const/app_const.dart';
import 'package:jala/core/injection/injection.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/presentation/shrimp_price_list/bloc/shrimp_price_list_bloc.dart';
import 'package:jala/presentation/shrimp_price_list/page/shrimp_price_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Shrimp Price List Bloc
        BlocProvider<ShrimpPriceListBloc>(
          create: (context) => ShrimpPriceListBloc(
            getListShrimpPrice: getIt(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        title: AppConst.appName,
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConst.appName),
        ),
        body: Column(
          children: [
            // Tab Bar
            const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Harga Udang'),
                Tab(text: 'Kabar Udang'),
                Tab(text: 'Penyakit'),
              ],
            ),

            // Body
            Expanded(
              child: TabBarView(
                children: [
                  const ShrimpPriceListPage(),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
