import 'package:date_format/date_format.dart';

class DateUtil{

  static String getDateString(DateTime dateTime){
    return (dateTime != null) ? formatDate(dateTime, [yyyy, '/', mm, '/', dd]) : '';
  }

}