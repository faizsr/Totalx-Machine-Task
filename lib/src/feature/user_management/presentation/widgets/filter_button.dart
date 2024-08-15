import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/filter_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const FilterBottomSheet();
          },
        );
      },
      icon: const Icon(
        Icons.filter_list,
        size: 28,
        color: Colors.white,
      ),
    );
  }
}
