import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchInputField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search by name',
          hintStyle: const TextStyle(
            fontSize: 13,
            color: Colors.black38,
          ),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.black54,
          ),
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
