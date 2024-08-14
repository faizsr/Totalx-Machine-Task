import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/views/login_page.dart';
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
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const LoginPage(),
        ),
      ),
    );
  }
}
