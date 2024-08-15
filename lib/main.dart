import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/get_login_status_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/views/login_page.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/providers/manage_user_provider.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/views/user_list_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => di.getIt.get<AuthProvider>(),
          ),
          ChangeNotifierProvider(
            create: (context) => di.getIt.get<ManageUserProvider>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Colors.white,
          ),
          home: FutureBuilder<bool>(
            future: di.getIt.get<GetLoginStatusUsecase>().call(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log('Snapshot ${snapshot.data}');
                return snapshot.data ?? false
                    ? const UserListPage()
                    : const LoginPage();
              }
              return const UserListPage();
            },
          ),
        ),
      ),
    );
  }
}
