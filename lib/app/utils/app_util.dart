import 'dart:convert';

import 'package:flutter/services.dart';

class AppUtil{
  static Future<String?> getJobTranslation(
      String department, String job) async {
    try {
      // JSON dosyasını oku
      String jsonString = await rootBundle.loadString('assets/job/jobs.json');
      List<dynamic> data = jsonDecode(jsonString);

      // Departmanı bul
      var departmentData = data.firstWhere(
        (element) => element['department_org'] == department,
        orElse: () => null,
      );

      if (departmentData != null) {
        // İş tanımını bul
        var jobTranslation = departmentData['jobs'][job];
        if (jobTranslation != null) {
          return jobTranslation;
        } else {
          return 'İş tanımı bulunamadı.';
        }
      } else {
        return 'Departman bulunamadı.';
      }
    } catch (e) {
      //  print('Hata: $e');
      return null;
    }
  }
}