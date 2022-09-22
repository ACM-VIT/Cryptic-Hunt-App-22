// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createTeam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTeam _$CreateTeamFromJson(Map<String, dynamic> json) => CreateTeam(
      json['id'] as String,
      json['name'] as String,
      json['teamcode'] as String,
      json['teamLeaderId'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$CreateTeamToJson(CreateTeam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teamcode': instance.teamcode,
      'teamLeaderId': instance.teamLeaderId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'points': instance.points,
    };
