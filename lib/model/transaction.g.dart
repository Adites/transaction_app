// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction_details _$Transaction_detailsFromJson(Map<String, dynamic> json) =>
    Transaction_details(
      id: json['id'] as int?,
      amount: json['Amount'] as num?,
      description: json['description'] as String?,
      transType: json['transType'] as String?,
      date: json['Date'] as String,
    );

Map<String, dynamic> _$Transaction_detailsToJson(
        Transaction_details instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Amount': instance.amount,
      'description': instance.description,
      'transType': instance.transType,
      'Date': instance.date,
    };
