// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryName _$CountryNameFromJson(Map<String, dynamic> json) => CountryName(
      common: json['common'] as String,
      official: json['official'] as String,
    );

Map<String, dynamic> _$CountryNameToJson(CountryName instance) =>
    <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
    };

CapitalInfo _$CapitalInfoFromJson(Map<String, dynamic> json) => CapitalInfo(
      latlng: (json['latlng'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$CapitalInfoToJson(CapitalInfo instance) =>
    <String, dynamic>{
      'latlng': instance.latlng,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: CountryName.fromJson(json['name'] as Map<String, dynamic>),
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      capitalInfo:
          CapitalInfo.fromJson(json['capitalInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'capital': instance.capital,
      'capitalInfo': instance.capitalInfo,
    };
