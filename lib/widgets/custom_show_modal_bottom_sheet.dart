import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'custom_text_feild.dart';

class CustomShowModalBottomSheet extends StatelessWidget {
  const CustomShowModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hint: 'title',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hint: 'content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
