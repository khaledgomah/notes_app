import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String titile;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final int color;

  NoteModel(
      {required this.titile,
      required this.desc,
      required this.date,
      required this.color});
}
