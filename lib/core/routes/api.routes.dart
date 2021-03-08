import '../config.dart';

class ApiRoutes {
  static String get baseUrl => AppConfig.PRODUCTION ? _productionBaseUrl : _homologBaseUrl;

  //Homologation
  static const String _homologBaseUrl = "http://portal.greenmilesoftware.com/get_resources_since";
  //Production
  static const String _productionBaseUrl = "http://portal.greenmilesoftware.com/get_resources_since";
}
