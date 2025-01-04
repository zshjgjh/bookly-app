part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      image: fields[1] as String?,
      title: fields[2] as String?,
      authorName: fields[3] as String?,
      rating: fields[4] as num?,
      bookId: fields[0] as String?,
      ratingCount: fields[5] as num?,
      category: fields[6] as String?,
        infoLink: fields[7] as String?,
        previewLink: fields[8] as String?
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.authorName)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.ratingCount)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.infoLink)
      ..writeByte(8)
      ..write(obj.previewLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BookEntityAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
