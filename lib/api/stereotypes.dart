import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'stereotypes.g.dart';

@JsonSerializable()
class Stereotypes {
  final String prompt;
  final String content;

  Stereotypes({
    required this.prompt,
    required this.content,
  });

  factory Stereotypes.fromJson(Map<String, dynamic> json) =>
      _$StereotypesFromJson(json);

  Map<String, dynamic> toJson() => _$StereotypesToJson(this);
}

Future<Stereotypes> fetchStereotypes(String country) async {
  final url =
      'https://subtle-speculoos-72e57a.netlify.app/api/v1/stereotypes?country=$country';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Stereotypes.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception(
      'Failed to load stereotypes: $url returned status code ${response.statusCode}',
    );
  }
}
