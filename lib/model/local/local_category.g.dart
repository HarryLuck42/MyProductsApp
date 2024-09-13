// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCategoryAdapter extends TypeAdapter<LocalCategory> {
  @override
  final int typeId = 0;

  @override
  LocalCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCategory(
      id: fields[0] as String?,
      categoryName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
