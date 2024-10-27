import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorItemBuilder extends StatefulWidget {
  const ColorItemBuilder({
    super.key,
    required this.colorsList,
  });
  final List<Color> colorsList;

  @override
  State<ColorItemBuilder> createState() => _ColorItemBuilderState();
}

class _ColorItemBuilderState extends State<ColorItemBuilder> {
  int selectedColorIndex = 0;
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
