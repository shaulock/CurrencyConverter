// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversionAdapter extends TypeAdapter<Conversion> {
  @override
  final int typeId = 0;

  @override
  Conversion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Conversion(
      fromCurrency: fields[0] as String,
      toCurrency: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Conversion obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fromCurrency)
      ..writeByte(1)
      ..write(obj.toCurrency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
