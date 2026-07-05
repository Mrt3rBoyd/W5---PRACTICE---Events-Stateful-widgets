import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/button_status.dart';

class ButtonRepository {
  Future<ButtonStatus> getButtonStatus() async {
    try {
      final url = Uri.parse(
        'https://mydata-8be4a-default-rtdb.asia-southeast1.firebasedatabase.app/button.json',
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch data (HTTP ${response.statusCode})');
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return ButtonStatus(
        title: json['title'] as String,
        selected: json['selected'] as bool,
      );
    } catch (e) {
      throw Exception('Unable to fetch button data: $e');
    }
  }
}
