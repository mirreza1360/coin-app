import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/provider/counter_provider.dart';
import 'package:shopping/provider/favoritse_provider.dart';
import 'package:shopping/routes/route_names.dart';
import 'package:shopping/routes/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: RouteName.mainPage,
      onGenerateRoute: Routes.genareteRoute,
    );
  }
}
