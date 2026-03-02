import 'package:jaspr/jaspr.dart';

import 'analytics_dashboard_page.dart';
import 'match_redirect_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    final pathSegments = Uri.base.pathSegments;
    final isAnalyticsRoute = pathSegments.any(
      (segment) => segment.toLowerCase() == 'analytics',
    );

    if (isAnalyticsRoute) {
      return const AnalyticsDashboardPage();
    }

    return const MatchRedirectPage();
  }
}
