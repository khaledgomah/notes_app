import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class HomeViewButtpmSheet extends StatefulWidget {
  const HomeViewButtpmSheet({
    super.key,
  });

  @override
  State<HomeViewButtpmSheet> createState() => _HomeViewButtpmSheetState();
}

class _HomeViewButtpmSheetState extends State<HomeViewButtpmSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kViewPadding,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 48,
              ),
              CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "this field can't be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    title = value;
                  },
                  labelText: 'title'),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormField(
                autovalidateMode: autovalidateMode,
                onSaved: (value) {
                  content = value;
                },
                labelText: 'content',
                maxLines: 5,
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                text: 'Add',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
