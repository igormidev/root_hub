import 'package:root_hub_client/root_hub_client.dart';

extension MatchPodiumPlayerCountExtension on MatchPodium {
  int get playerCount {
    switch (this) {
      case MatchPodium.firstPlace:
        return 1;
      case MatchPodium.secondPlace:
        return 2;
      case MatchPodium.thirdPlace:
        return 3;
      case MatchPodium.fourthPlace:
        return 4;
      case MatchPodium.fifthPlace:
        return 5;
      case MatchPodium.sixthPlace:
        return 6;
    }
  }
}

MatchPodium matchPodiumFromPlayerCount(int playersCount) {
  switch (playersCount) {
    case 1:
      return MatchPodium.firstPlace;
    case 2:
      return MatchPodium.secondPlace;
    case 3:
      return MatchPodium.thirdPlace;
    case 4:
      return MatchPodium.fourthPlace;
    case 5:
      return MatchPodium.fifthPlace;
    case 6:
      return MatchPodium.sixthPlace;
    default:
      throw ArgumentError(
        'Player count must be between 1 and 6. Received: $playersCount',
      );
  }
}
