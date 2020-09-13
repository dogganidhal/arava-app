import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:super_enum/super_enum.dart';

part 'media.g.dart';

@JsonSerializable()
@immutable
class Media extends Equatable {
  final String id;
  final String url;
  final String type;

  Media({
    this.id, this.url, this.type
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  List<dynamic> get props => [id, url, type];
}