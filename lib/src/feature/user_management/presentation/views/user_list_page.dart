import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/config/debouncer.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/providers/manage_user_provider.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/custom_add_dialog.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/filter_button.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/search_input_field.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/user_card.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/user_card_loading.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/user_list_appbar.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late ManageUserProvider manageUserProvider;

  void onSearch(String value, BuildContext context) {
    final debouncer = Debouncer(milliseconds: 500);
    debouncer.run(() {
      Provider.of<ManageUserProvider>(context, listen: false)
          .getAllUser(query: value);
    });
  }

  @override
  void initState() {
    manageUserProvider =
        Provider.of<ManageUserProvider>(context, listen: false);
    manageUserProvider.getAllUser();
    super.initState();
  }

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
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchInputField(
                    onChanged: (value) => onSearch(value, context),
                  ),
                  const SizedBox(width: 5),
                  const FilterButton()
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
            userListWidget()
          ],
        ),
        floatingActionButton: addButton(context),
      ),
    );
  }

  Expanded userListWidget() {
    return Expanded(
      child: Consumer<ManageUserProvider>(
        builder: (context, value, child) {
          if (value.getLoading) {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const UserCardLoading();
              },
            );
          }
          if (value.users.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              physics: const BouncingScrollPhysics(),
              itemCount: value.users.length,
              itemBuilder: (context, index) {
                var user = value.users[index];
                return UserCard(user: user);
              },
            );
          }
          return const Center(
            child: Text('No Users Found'),
          );
        },
      ),
    );
  }

  IconButton addButton(BuildContext context) {
    return IconButton(
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
    );
  }
}
