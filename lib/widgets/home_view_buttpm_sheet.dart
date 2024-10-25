import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class HomeViewButtpmSheet extends StatelessWidget {
  const HomeViewButtpmSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kViewPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 48,
          ),
          CustomTextFormField(onChanged: (p0) {}, labelText: 'title'),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            onChanged: (p0) {},
            labelText: 'content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
