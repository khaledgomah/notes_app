import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.orange,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            trailing: Column(
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.trash),
                  onPressed: () {},
                ),
              ],
            ),
            title: const Text(
              'My note',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'This is my first note This is my first note This is my first note',
                style: TextStyle(
                    color: Colors.black.withOpacity(.7), fontSize: 20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 24),
            child: Text(
              '10 Oct 2024',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
