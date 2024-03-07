import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'country.g.dart';

@JsonSerializable()
class CountryName {
  final String common;
  final String official;

  CountryName({
    required this.common,
    required this.official,
  });

  factory CountryName.fromJson(Map<String, dynamic> json) =>
      _$CountryNameFromJson(json);

  Map<String, dynamic> toJson() => _$CountryNameToJson(this);
}

@JsonSerializable()
class CapitalInfo {
  final List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) =>
      _$CapitalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CapitalInfoToJson(this);
}

@JsonSerializable()
class Country {
  final CountryName name;
  final List<String> capital;
  final CapitalInfo capitalInfo;

  Country({
    required this.name,
    required this.capital,
    required this.capitalInfo,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

Future<List<Country>> fetchAllCountries() async {
  const url =
      'https://restcountries.com/v3.1/all?fields=name,capital,capitalInfo';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((dynamic country) =>
            Country.fromJson(country as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception(
      'Failed to load countries: $url returned status code ${response.statusCode}',
    );
  }
}
