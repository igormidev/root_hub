import 'package:jaspr/jaspr.dart';

import 'account_deletion_request_page.dart';
import 'analytics_dashboard_page.dart';
import 'legal_document_page.dart';
import 'match_redirect_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    final pathSegments = Uri.base.pathSegments;
    final isPrivacyRoute = pathSegments.any(
      (segment) => segment.toLowerCase() == 'privacy',
    );
    final isTermsRoute = pathSegments.any(
      (segment) => segment.toLowerCase() == 'terms',
    );
    final isAnalyticsRoute = pathSegments.any(
      (segment) => segment.toLowerCase() == 'analytics',
    );
    final isAccountDeletionRoute = pathSegments.any(
      (segment) => segment.toLowerCase() == 'account-deletion',
    );
    final isAccountDeletionSuccessRoute = pathSegments.any(
      (segment) => segment.toLowerCase() == 'success',
    );

    if (isPrivacyRoute) {
      return const LegalDocumentPage(type: LegalDocumentType.privacy);
    }

    if (isTermsRoute) {
      return const LegalDocumentPage(type: LegalDocumentType.terms);
    }

    if (isAnalyticsRoute) {
      return const AnalyticsDashboardPage();
    }

    if (isAccountDeletionRoute) {
      return AccountDeletionRequestPage(
        showSuccessState: isAccountDeletionSuccessRoute,
      );
    }

    return const MatchRedirectPage();
  }
}
