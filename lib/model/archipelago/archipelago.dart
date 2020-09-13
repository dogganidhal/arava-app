import 'package:arava/model/island/island.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:super_enum/super_enum.dart';

part 'archipelago.g.dart';

@immutable
@JsonSerializable()
class Archipelago extends Equatable {
  final String id;
  final String name;
  final List<Island> islands;

  Archipelago({this.id, this.name, this.islands});

  factory Archipelago.fromJson(Map<String, dynamic> json) => _$ArchipelagoFromJson(json);
  Map<String, dynamic> toJson() => _$ArchipelagoToJson(this);

  @override
  List<dynamic> get props => [id, name, islands];
}