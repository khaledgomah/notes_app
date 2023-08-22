import 'package:flutter/material.dart';

import 'custom_show_modal_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add, size: 32),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) {
            return SizedBox(
                height: MediaQuery.of(context).copyWith().size.height * 0.75,
                child: const AddNoteButtomSheet());
          },
        );
      },
    );
  }
}
