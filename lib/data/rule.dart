import 'package:json_annotation/json_annotation.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule {
  Rule(this.description);

  @JsonKey(name: "content")
  String description;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RuleToJson(this);
}
