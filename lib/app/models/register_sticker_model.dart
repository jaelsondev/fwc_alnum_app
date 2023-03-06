import 'dart:convert';

class RegisterStickerModel {
  final String stickerName;
  final String stickerCode;
  final String stickerNumber;

  RegisterStickerModel({
    required this.stickerName,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'sticker_name': stickerName,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickerModel.fromMap(Map<String, dynamic> map) {
    return RegisterStickerModel(
      stickerName: map['sticker_name'] ?? '',
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStickerModel.fromJson(String source) =>
      RegisterStickerModel.fromMap(json.decode(source));
}
