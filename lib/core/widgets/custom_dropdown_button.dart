import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items; // القيم اللي هتظهر في القائمة
  final String? selectedValue; // القيمة اللي هتكون مختارة مبدئيًا
  final ValueChanged<String?>? onChanged; // علشان نرجع القيمة للأب لو محتاجها
  final String hintText; // النص اللي بيظهر قبل الاختيار

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hintText,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedValue; // الحالة اللي هنخزن فيها القيمة المختارة

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue; // نخزن القيمة المبدئية
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.backgroundColor,
      icon: const Icon(Icons.arrow_drop_down, color: AppColors.primary),
      style: textTheme.titleSmall!.copyWith(color: AppColors.primary),
      initialValue: _selectedValue, // ✅ بدل initialValue
      hint: Text(
        widget.hintText.tr(), // الترجمة لكلمة "الدور"
        style: textTheme.titleSmall!.copyWith(color: AppColors.hintColor),
      ),
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item.tr()), // نترجم العنصر
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value; // نحدث القيمة المختارة
        });
        widget.onChanged?.call(value); // نرجع القيمة للأب لو محتاج يسمعها
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_select_a_role'.tr();
        }
        return null;
      },
    );
  }
}
