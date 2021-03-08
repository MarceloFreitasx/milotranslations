import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String get onlyDate {
    return this == null ? "" : DateFormat("dd/MM/yyyy").format(this.toLocal());
  }

  String get onlyHour {
    return this == null ? "" : DateFormat("HH:mm").format(this.toLocal());
  }

  String get onlyDateHour {
    return this == null ? "" : DateFormat("dd/MM/yyyy HH:mm").format(this.toLocal());
  }
}
