import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/config/alerts.dart';
import 'package:totalx_machine_task/src/config/navigators.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/set_login_status_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/views/login_page.dart';
import 'package:totalx_machine_task/injection_container.dart' as di;

class UserListAppbar extends StatelessWidget {
  const UserListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.white,
                ),
                SizedBox(width: 2),
                Text(
                  'Nilambur',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () async {
              await di.getIt.get<SetLoginStatusUsecase>().call(false);
              nextScreenRemoveUntil(context, const LoginPage());
              Provider.of<AuthProvider>(context, listen: false).logout();
              final snackbar = CustomAlerts.snackBar('Sucessfully Logged Out');
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
