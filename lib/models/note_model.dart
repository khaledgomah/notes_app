import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  
  @HiveField(1)
   String desc;
  
  @HiveField(2)
  final DateTime creatAt;  // Change this to DateTime
  
  @HiveField(3)
   int color;

  NoteModel({
    required this.title,
    required this.desc,
    required this.creatAt,
    required this.color,
  });
}
