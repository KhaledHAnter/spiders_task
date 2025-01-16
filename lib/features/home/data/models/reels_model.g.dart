// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelsModel _$ReelsModelFromJson(Map<String, dynamic> json) => ReelsModel(
      reels: (json['data'] as List<dynamic>?)
          ?.map((e) => ReelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReelsModelToJson(ReelsModel instance) =>
    <String, dynamic>{
      'data': instance.reels,
    };

ReelModel _$ReelModelFromJson(Map<String, dynamic> json) => ReelModel(
      id: (json['id'] as num?)?.toInt(),
      isMine: json['isMine'] as bool?,
      roomId: (json['roomId'] as num?)?.toInt(),
      video: json['video'] as String?,
      preview: json['preview'] as String?,
      size: json['size'] as String?,
      duration: json['duration'] as String?,
      likesCount: json['likesCount'],
      likesCountTranslated: json['likesCountTranslated'] as String?,
      authLikeStatus: json['authLikeStatus'] as bool?,
    );

Map<String, dynamic> _$ReelModelToJson(ReelModel instance) => <String, dynamic>{
      'id': instance.id,
      'isMine': instance.isMine,
      'roomId': instance.roomId,
      'video': instance.video,
      'preview': instance.preview,
      'size': instance.size,
      'duration': instance.duration,
      'likesCount': instance.likesCount,
      'likesCountTranslated': instance.likesCountTranslated,
      'authLikeStatus': instance.authLikeStatus,
    };
