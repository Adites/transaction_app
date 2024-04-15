// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';
part 'transaction.g.dart';

@JsonSerializable()
class Transaction_details {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "Amount")
  num? amount;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "transType")
  String? transType;

  @JsonKey(name: "Date")
  DateTime? date;

  Transaction_details({
    this.id,
    this.amount,
    this.description,
    this.transType,
    required DateTime date,
  });

  factory Transaction_details.fromJson(Map<String, dynamic> json) =>
      _$Transaction_detailsFromJson(json);
  Map<String, dynamic> toJson() => _$Transaction_detailsToJson(this);
}
