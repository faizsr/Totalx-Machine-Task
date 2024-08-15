import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/custom_add_dialog.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/filter_button.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/search_input_field.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/user_card.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/user_list_appbar.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: UserListAppbar(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchInputField(),
                  ),
                  SizedBox(width: 5),
                  FilterButton()
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Users Lists',
                style: subHeadingTextStyle,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                physics: const BouncingScrollPhysics(),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return const UserCard();
                },
              ),
            )
          ],
        ),
        floatingActionButton: IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(15),
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const CustomAddDialog(),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
