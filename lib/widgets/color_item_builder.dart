// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorItemBuilder extends StatefulWidget {
  const ColorItemBuilder({
    super.key,
    required this.colorsList,
    this.colorIndex,
  });
  final List<Color> colorsList;
  final int? colorIndex;

  @override
  State<ColorItemBuilder> createState() => _ColorItemBuilderState();
}

class _ColorItemBuilderState extends State<ColorItemBuilder> {
  late int selectedColorIndex;
  @override
  void initState() {
    selectedColorIndex = widget.colorIndex ?? 0;
    BlocProvider.of<NotesCubit>(context).color =
        widget.colorsList[selectedColorIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        itemCount: widget.colorsList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedColorIndex = index;
            BlocProvider.of<NotesCubit>(context).color =
                widget.colorsList[index];

            setState(() {});
          },
          child: ColorItem(
            isSelected: selectedColorIndex == index,
            color: widget.colorsList[index],
          ),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
