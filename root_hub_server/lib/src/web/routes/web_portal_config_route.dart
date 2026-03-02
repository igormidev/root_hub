import 'package:serverpod/serverpod.dart';

class WebPortalConfigWidget extends JsonWidget {
  WebPortalConfigWidget({
    required String apiUrl,
    required bool isProduction,
  }) : super(
         object: {
           'apiUrl': apiUrl,
           'isProduction': isProduction,
         },
       );
}

class WebPortalConfigRoute extends WidgetRoute {
  WebPortalConfigRoute({
    required ServerConfig apiConfig,
    required String runMode,
  }) : widget = WebPortalConfigWidget(
         apiUrl: _resolveApiUrl(apiConfig, runMode).toString(),
         isProduction: runMode == ServerpodRunMode.production,
       );

  final WebPortalConfigWidget widget;

  @override
  Future<WebWidget> build(Session session, Request request) async {
    return widget;
  }

  static Uri _resolveApiUrl(ServerConfig apiConfig, String runMode) {
    if (runMode == ServerpodRunMode.production) {
      return Uri.parse('https://roothub.api.serverpod.space/');
    }

    return Uri(
      scheme: apiConfig.publicScheme,
      host: apiConfig.publicHost,
      port: apiConfig.publicPort,
    );
  }
}
