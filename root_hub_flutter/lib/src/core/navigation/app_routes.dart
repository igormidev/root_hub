const loadingPath = '/';
const onboardingPath = '/auth/onboarding';
const onboardingProfilePath = '/auth/onboarding/profile';
const loginPath = '/auth/login';
const dashboardPath = '/dashboard';
const dashboardFactionPath = '/dashboard/profile/faction';
const dashboardReachCalculatorPath = '/dashboard/tools/reach-calculator';
const dashboardAdvancedSetupQuickguidePath = '/dashboard/tools/advanced-setup';
const dashboardSetupOrderPath = '/dashboard/tools/setup-order';
const dashboardMatchCreatePath = '/dashboard/match/create';
const dashboardMatchCreateLocationPath = '/dashboard/match/create/location';
const dashboardMatchChatPath = '/dashboard/match/:matchId/chat';

String dashboardMatchChatPathForMatch(int matchId) =>
    '/dashboard/match/$matchId/chat';
