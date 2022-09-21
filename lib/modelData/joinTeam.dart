import 'package:json_annotation/json_annotation.dart';

part 'joinTeam.g.dart';

@JsonSerializable()
class JoinTeam {
  String? id,
      email,
      name,
      picture,
      gender,
      rollNo,
      phoneNo,
      teamId,
      createdAt,
      updatedAt;
  JoinTeam(this.id, this.email, this.name, this.picture, this.gender,
      this.rollNo, this.phoneNo, this.teamId, this.createdAt, this.updatedAt);

  factory JoinTeam.fromJson(Map<String?, dynamic> json) =>
      _$JoinTeamFromJson(json);

  Map<String?, dynamic> toJson() => _$JoinTeamToJson(this);
}
