import 'package:json_annotation/json_annotation.dart';
import 'package:spiders_task/features/home/data/models/links_model.dart';

part 'reels_model.g.dart';

@JsonSerializable()
class ReelsModel {
  @JsonKey(name: 'data')
  List<ReelModel>? reels;
  @JsonKey(name: 'links')
  LinksModel? links;

  ReelsModel({this.reels});

  factory ReelsModel.fromJson(Map<String, dynamic> json) =>
      _$ReelsModelFromJson(json);
}

@JsonSerializable()
class ReelModel {
  int? id;
  bool? isMine;
  int? roomId;
  String? video;
  String? preview;
  String? size;
  String? duration;
  dynamic likesCount;
  String? likesCountTranslated;
  bool? authLikeStatus;

  ReelModel({
    this.id,
    this.isMine,
    this.roomId,
    this.video,
    this.preview,
    this.size,
    this.duration,
    this.likesCount,
    this.likesCountTranslated,
    this.authLikeStatus,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);
}
