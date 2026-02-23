const loadingPath = '/';
const onboardingPath = '/auth/onboarding';
const onboardingProfilePath = '/auth/onboarding/profile';
const loginPath = '/auth/login';
const dashboardPath = '/dashboard';
const dashboardFactionPath = '/dashboard/profile/faction';
const dashboardMatchCreatePath = '/dashboard/match/create';
const dashboardMatchCreateLocationPath = '/dashboard/match/create/location';
const dashboardMatchChatPath = '/dashboard/match/:matchId/chat';

String dashboardMatchChatPathForMatch(int matchId) =>
    '/dashboard/match/$matchId/chat';
