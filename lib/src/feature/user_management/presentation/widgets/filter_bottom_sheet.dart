import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/custom_radio_list_tile.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

enum FilterType { all, elder, younger }

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  FilterType _filterType = FilterType.all;

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
                value: FilterType.all,
              ),
              radioListTile(
                title: 'Age: Elder',
                value: FilterType.elder,
              ),
              radioListTile(
                title: 'Age: Younger',
                value: FilterType.younger,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget radioListTile({
    required String title,
    required FilterType value,
  }) {
    return CustomRadioListTile(
      title: title,
      value: value,
      groupValue: _filterType,
      onChanged: (FilterType value) {
        _filterType = value;
        setState(() {});
      },
    );
  }
}
