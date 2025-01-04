import 'package:basketball_counter_app/constant.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)

class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final num? ratingCount;
  @HiveField(6)
  final String? category;
  @HiveField(7)
  final String? infoLink;
  @HiveField(8)
  final String? previewLink;

  BookEntity({required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.rating,
    required this.ratingCount,
    required this.category,
    required this.infoLink,
    required this.previewLink
  });
}



//flutter packages pub run build_runner build
