import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class DateFormatter {
  // 현재 날짜를 '2024년 12월 08일' 형식으로 반환
  static String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('yyyy년 MM월 dd일').format(now);
  }

  // 현재 월을 '12월' 형식으로 반환
  static String getCurrentMonth() {
    final now = DateTime.now();
    return DateFormat('M월').format(now);
  }

  // '2024-12-08' → '2024년 12월 08일' 변환
  static String formatToKoreanDate(String? date) {
    if (date == null || date.isEmpty) return "";

    try {
      final parsedDate = DateFormat('yyyy-MM-dd').parse(date);
      return DateFormat('yyyy년 MM월 dd일').format(parsedDate);
    } catch (e) {
      return "";
    }
  }

  // '2024년 12월 08일' → '2024-12-08' 변환
  static String formatToIsoDate(String koreanDate) {
    try {
      final RegExp regex = RegExp(r'(\d+)년\s*(\d+)월\s*(\d+)일');
      final match = regex.firstMatch(koreanDate);

      if (match != null) {
        final year = match.group(1);
        final month = match.group(2)?.padLeft(2, '0');
        final day = match.group(3)?.padLeft(2, '0');

        return '$year-$month-$day';
      }
      return '';
    } catch (e) {
      print('날짜 형식 변환 오류: $e');
      return '';
    }
  }

  // '2024년 12월 08일' → `DateTime` 객체로 변환
  static DateTime parseKoreanDateToDateTime(String koreanDate) {
    try {
      final regex = RegExp(r'(\d+)년\s+(\d+)월\s+(\d+)일');
      final match = regex.firstMatch(koreanDate);

      if (match != null) {
        final year = int.parse(match.group(1)!);
        final month = int.parse(match.group(2)!);
        final day = int.parse(match.group(3)!);
        return DateTime(year, month, day);
      }
      return DateTime.now();
    } catch (e) {
      Logger().e('날짜 파싱 오류: $e');
      return DateTime.now();
    }
  }

  // '2024-12-08T08:16:00' → '2024년 12월 08일 오전 08시 16분' 변환
  static String formatToKoreanDateTime(String? dateTimeStr) {
    if (dateTimeStr == null || dateTimeStr.isEmpty) return "";

    try {
      final DateTime parsedDate = DateTime.parse(dateTimeStr);
       // 'a' (AM/PM)를 '오전/오후'로 변환
    final String formattedDate = DateFormat('yyyy년 MM월 dd일 a hh시 mm분', 'ko_KR').format(parsedDate);

    // 'AM' → '오전', 'PM' → '오후' 변환
    return formattedDate.replaceAll('AM', '오전').replaceAll('PM', '오후');
    } catch (e) {
      Logger().e("날짜 변환 오류: $e");
      return "";
    }
  }
}
