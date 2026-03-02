class MatchShareLinkBuilder {
  static Uri buildLandingUri({
    required String serverHost,
    required int matchId,
    required String location,
    required String day,
    required String hour,
  }) {
    final hostUri = Uri.tryParse(serverHost);
    final fallbackUri = Uri.parse('https://localhost:8080/');
    final resolvedHost = hostUri ?? fallbackUri;

    final hasStandardPort =
        (resolvedHost.scheme == 'https' &&
            resolvedHost.hasPort &&
            resolvedHost.port == 443) ||
        (resolvedHost.scheme == 'http' &&
            resolvedHost.hasPort &&
            resolvedHost.port == 80);
    final port = resolvedHost.hasPort && !hasStandardPort
        ? resolvedHost.port
        : null;

    return Uri(
      scheme: resolvedHost.scheme.isEmpty ? 'https' : resolvedHost.scheme,
      host: resolvedHost.host.isEmpty ? fallbackUri.host : resolvedHost.host,
      port: port,
      path: '/join/',
      queryParameters: <String, String>{
        'matchId': matchId.toString(),
        if (location.trim().isNotEmpty) 'location': location.trim(),
        if (day.trim().isNotEmpty) 'day': day.trim(),
        if (hour.trim().isNotEmpty) 'hour': hour.trim(),
      },
    );
  }
}
