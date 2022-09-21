import 'package:json_annotation/json_annotation.dart';
part 'createTeam.g.dart';

@JsonSerializable()
class CreateTeam {
  String? id, name, teamcode, teamLeaderId, createdAt, updatedAt;
  int points;
  CreateTeam(this.id, this.name, this.teamcode, this.teamLeaderId,
      this.createdAt, this.updatedAt, this.points);

  String? teamCode() {
    return teamcode;
  }

  factory CreateTeam.fromJson(Map<String, dynamic> json) =>
      _$CreateTeamFromJson(json);

  Map<String?, dynamic> toJson() => _$CreateTeamToJson(this);
}
