import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as msg;
import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final String msg;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hintText,
    required this.msg,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.backgroundColor,
      icon: const Icon(Icons.arrow_drop_down, color: AppColors.primary),
      style: textTheme.titleSmall!.copyWith(color: AppColors.primary),
      initialValue: _selectedValue,
      hint: Text(
        widget.hintText.tr(),
        style: textTheme.titleSmall!.copyWith(color: AppColors.hintColor),
      ),
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item.tr()));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.msg.tr();
        }
        return null;
      },
    );
  }
}
