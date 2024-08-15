import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/providers/manage_user_provider.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/custom_radio_list_tile.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

enum FilterType { all, elder, younger }

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, builder) {
        return Container(
          padding: const EdgeInsets.all(18),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Sort', style: subHeadingTextStyle),
              const SizedBox(height: 10),
              radioListTile(
                title: 'All',
                filterType: FilterType.all,
              ),
              radioListTile(
                title: 'Age: Elder',
                filterType: FilterType.elder,
              ),
              radioListTile(
                title: 'Age: Younger',
                filterType: FilterType.younger,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget radioListTile({
    required String title,
    required FilterType filterType,
  }) {
    return Consumer<ManageUserProvider>(
      builder: (context, value, child) {
        log('Filter Type: ${value.filterValue}');
        return CustomRadioListTile(
          title: title,
          value: filterType,
          groupValue: value.filterValue,
          onChanged: (FilterType value) {
            log('Value: $value');
            Provider.of<ManageUserProvider>(context, listen: false)
                .getAllUser(filterType: value);
          },
        );
      },
    );
  }
}
