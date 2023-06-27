import 'package:crud/provider/users_provider.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:crud/screens/user_form.dart';
import 'package:crud/screens/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Users())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            AppRoutes.home: (_) => const UserList(),
            AppRoutes.userForm: (_) => UserForm()
          }),
    );
  }
}
