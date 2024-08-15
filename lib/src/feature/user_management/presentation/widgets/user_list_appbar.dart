import 'package:flutter/material.dart';

class UserListAppbar extends StatelessWidget {
  const UserListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.black,
      child: TextButton(
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
    );
  }
}
