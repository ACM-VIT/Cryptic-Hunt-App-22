// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joinTeam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinTeam _$JoinTeamFromJson(Map<String?, dynamic> json) => JoinTeam(
      json['id'] as String?,
      json['email'] as String?,
      json['name'] as String?,
      json['picture'] as String?,
      json['gender'] as String?,
      json['rollNo'] as String?,
      json['phoneNo'] as String?,
      json['teamId'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String?, dynamic> _$JoinTeamToJson(JoinTeam instance) => <String?, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'picture': instance.picture,
      'gender': instance.gender,
      'rollNo': instance.rollNo,
      'phoneNo': instance.phoneNo,
      'teamId': instance.teamId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
