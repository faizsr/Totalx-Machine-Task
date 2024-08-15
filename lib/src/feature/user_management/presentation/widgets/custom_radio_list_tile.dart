import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/filter_bottom_sheet.dart';

class CustomRadioListTile extends StatelessWidget {
  final FilterType value;
  final FilterType groupValue;
  final String title;
  final ValueChanged<FilterType> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: Row(
          children: [
            _customRadioButton,
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: 2,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : null,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
