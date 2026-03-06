// ignore_for_file: feature_hardcoded_ui_string

enum RecomendedFaction {
  marquiseDeCat,
  eyrieDynasties,
  woodlandAlliance,
  vagabond,
  riverfolkCompany,
  theLizardCult,
  undergroundDuchy,
  corvidConspiracy,
  lordOfTheHundreds,
  keepersInIron,
}

enum PurchasedExpansions {
  baseGame,
  riverfolkExpansion,
  underworldExpansion,
  marauderExpansion;

  List<RecomendedFaction> get factionsInBox {
    return switch (this) {
      PurchasedExpansions.baseGame => [
        RecomendedFaction.marquiseDeCat,
        RecomendedFaction.eyrieDynasties,
        RecomendedFaction.woodlandAlliance,
        RecomendedFaction.vagabond,
      ],
      PurchasedExpansions.riverfolkExpansion => [
        RecomendedFaction.riverfolkCompany,
        RecomendedFaction.theLizardCult,
      ],
      PurchasedExpansions.underworldExpansion => [
        RecomendedFaction.undergroundDuchy,
        RecomendedFaction.corvidConspiracy,
      ],
      PurchasedExpansions.marauderExpansion => [
        RecomendedFaction.lordOfTheHundreds,
        RecomendedFaction.keepersInIron,
      ],
    };
  }
}

enum AmountOfPlayersInMatch {
  two,
  three,
  four,
  five,
  six;

  int get asInt {
    return switch (this) {
      AmountOfPlayersInMatch.two => 2,
      AmountOfPlayersInMatch.three => 3,
      AmountOfPlayersInMatch.four => 4,
      AmountOfPlayersInMatch.five => 5,
      AmountOfPlayersInMatch.six => 6,
    };
  }
}

List<RecomendedFactionComposition> getRecommendedFactionsToPlay({
  required AmountOfPlayersInMatch amountOfPlayersInMatch,
  required List<PurchasedExpansions> purchasedExpansions,
}) {
  final factionsAvailableToPlay = purchasedExpansions
      .expand((expansion) => expansion.factionsInBox)
      .toSet();

  final compositionsForPlayerCount = _content[amountOfPlayersInMatch] ?? [];
  final hasSecondVagabond = purchasedExpansions.contains(
    PurchasedExpansions.riverfolkExpansion,
  );

  return compositionsForPlayerCount.where((composition) {
    // A second Vagabond is represented by the Vagabond appearing twice in the
    // same composition. Those lineups should only be shown when the user owns
    // the Riverfolk Expansion, because that box provides the second Vagabond
    // components.
    final vagabondCount = composition.factions
        .where((faction) => faction == RecomendedFaction.vagabond)
        .length;

    if (vagabondCount > 1 && !hasSecondVagabond) {
      return false;
    }

    return composition.factions.every(
      (faction) => factionsAvailableToPlay.contains(faction),
    );
  }).toList();
}

class RecomendedFactionComposition {
  // The amount of players in the match for which this composition is recommended. This is relevant because some compositions are better for certain player counts, and worse for others.
  final AmountOfPlayersInMatch amountOfPlayersInMatch;

  // The factions that are part of this composition. The order is not relevant, but the presence of a faction is.
  final List<RecomendedFaction> factions;

  // Description of why this composition of factions will deliver a good experience.
  // Can be short like around 3 lines of text.
  final String frenchDescription;
  final String englishDescription;
  final String germanDescription;
  final String spanishDescription;
  final String brazilianPortugueseDescription;

  RecomendedFactionComposition({
    required this.amountOfPlayersInMatch,
    required this.factions,
    required this.frenchDescription,
    required this.englishDescription,
    required this.germanDescription,
    required this.spanishDescription,
    required this.brazilianPortugueseDescription,
  }) : assert(
         factions.length == amountOfPlayersInMatch.asInt,
         'The amount of factions in the composition should be equal to the amount of players in the match, which is $amountOfPlayersInMatch',
       );
}

class _LocalizedDescription {
  final String english;
  final String french;
  final String german;
  final String spanish;
  final String brazilianPortuguese;

  const _LocalizedDescription({
    required this.english,
    required this.french,
    required this.german,
    required this.spanish,
    required this.brazilianPortuguese,
  });
}

RecomendedFactionComposition _composition({
  required AmountOfPlayersInMatch players,
  required List<RecomendedFaction> factions,
  required _LocalizedDescription description,
}) {
  return RecomendedFactionComposition(
    amountOfPlayersInMatch: players,
    factions: factions,
    frenchDescription: description.french,
    englishDescription: description.english,
    germanDescription: description.german,
    spanishDescription: description.spanish,
    brazilianPortugueseDescription: description.brazilianPortuguese,
  );
}

// These short texts are intentionally generic, because the UI already shows the
// faction list. The goal is to explain why the composition shape works:
// board pressure at low player counts, disruptive factions in the middle, and
// lighter presences like Riverfolk / Vagabond becoming more valuable as the
// table gets more crowded.
const _duelClassic = _LocalizedDescription(
  english:
      "A clean 2-player duel. Both factions strongly occupy the map, fight for rule, and keep the game lively without needing a more evasive faction.",
  french:
      "Un duel à 2 joueurs très propre. Les deux factions occupent fortement la carte, se battent pour le contrôle et gardent la partie vivante sans avoir besoin d’une faction plus insaisissable.",
  german:
      "Ein sauberes Duell für 2 Spieler. Beide Fraktionen besetzen den Plan stark, kämpfen um Herrschaft und halten das Spiel lebendig, ohne dass eine ausweichendere Fraktion nötig ist.",
  spanish:
      "Un duelo de 2 jugadores muy limpio. Ambas facciones ocupan el mapa con fuerza, pelean por el control y mantienen la partida viva sin necesitar una facción más escurridiza.",
  brazilianPortuguese:
      "Um duelo de 2 jogadores bem limpo. As duas facções ocupam o mapa com força, disputam domínio e mantêm a partida viva sem precisar de uma facção mais escorregadia.",
);

const _duelTerritory = _LocalizedDescription(
  english:
      "Another strong 2-player duel. One side establishes territory early while the other grows into a second board-focused engine, so the map never feels empty.",
  french:
      "Un autre très bon duel à 2 joueurs. Un camp s’installe tôt sur le territoire pendant que l’autre devient un second moteur centré sur le plateau, donc la carte ne paraît jamais vide.",
  german:
      "Noch ein starkes Duell für 2 Spieler. Eine Seite besetzt früh Territorium, während die andere zu einer zweiten planorientierten Macht heranwächst, sodass der Wald nie leer wirkt.",
  spanish:
      "Otro duelo muy sólido para 2 jugadores. Un bando establece territorio pronto mientras el otro crece como un segundo motor centrado en el mapa, así que el tablero nunca se siente vacío.",
  brazilianPortuguese:
      "Outro duelo muito forte para 2 jogadores. Um lado estabelece território cedo, enquanto o outro cresce como um segundo motor focado no mapa, então a floresta nunca parece vazia.",
);

const _duelRelics = _LocalizedDescription(
  english:
      "A board-focused duel where both factions want space and battles matter. The Keepers add a different scoring angle without reducing pressure on the map.",
  french:
      "Un duel centré sur le plateau où les deux factions veulent de l’espace et où les combats comptent vraiment. Les Gardiens ajoutent une autre façon de marquer sans réduire la pression sur la carte.",
  german:
      "Ein planfokussiertes Duell, in dem beide Fraktionen Platz wollen und Kämpfe wirklich wichtig sind. Die Hüter bringen einen anderen Wertungswinkel hinein, ohne den Druck auf dem Plan zu verringern.",
  spanish:
      "Un duelo muy centrado en el mapa, donde ambas facciones quieren espacio y las batallas importan de verdad. Los Guardianes añaden otra forma de puntuar sin bajar la presión sobre el tablero.",
  brazilianPortuguese:
      "Um duelo focado no mapa, em que as duas facções querem espaço e as batalhas importam de verdade. Os Guardiões trazem outra forma de pontuar sem reduzir a pressão sobre o tabuleiro.",
);

const _duelSlugfest = _LocalizedDescription(
  english:
      "An aggressive 2-player slugfest from the Marauder box. Both sides create immediate friction and score through visible board play.",
  french:
      "Un duel agressif issu de Maraude. Les deux camps créent tout de suite de la friction et marquent grâce à un jeu très visible sur le plateau.",
  german:
      "Ein aggressiver Schlagabtausch aus der Marauder-Erweiterung. Beide Seiten erzeugen sofort Reibung und punkten über sichtbares Spiel auf dem Plan.",
  spanish:
      "Un enfrentamiento agresivo de la expansión Marauder. Ambos bandos generan fricción desde el inicio y puntúan mediante juego visible sobre el mapa.",
  brazilianPortuguese:
      "Um confronto agressivo da expansão Marauder. Os dois lados criam atrito imediatamente e pontuam por meio de jogo visível no mapa.",
);

const _duelFastPressure = _LocalizedDescription(
  english:
      "Fast and violent, but still readable. The Cats anchor the map while the Warlord forces conflict from the opening turns.",
  french:
      "Rapide et violent, mais lisible. Les Chats ancrent la carte pendant que le Seigneur des Centaines force le conflit dès les premiers tours.",
  german:
      "Schnell und brutal, aber gut lesbar. Die Katzen verankern den Plan, während der Kriegsherr schon in den ersten Zügen Konflikte erzwingt.",
  spanish:
      "Rápido y violento, pero fácil de leer. Los Gatos anclan el mapa mientras el Señor de los Cientos fuerza el conflicto desde los primeros turnos.",
  brazilianPortuguese:
      "Rápido e violento, mas fácil de entender. Os Gatos ancoram o mapa enquanto o Senhor das Centenas força conflito desde os primeiros turnos.",
);

const _threeClassic = _LocalizedDescription(
  english:
      "A very reliable 3-player shape: two factions that strongly occupy the map plus one faction that punishes overextension. It creates good friction without overcrowding the board.",
  french:
      "Une structure 3 joueurs très fiable : deux factions qui occupent fortement la carte, plus une faction qui punit les excès. Cela crée de la tension sans surcharger le plateau.",
  german:
      "Eine sehr verlässliche 3-Spieler-Form: zwei Fraktionen mit starker Brettpräsenz plus eine Fraktion, die Überdehnung bestraft. Das sorgt für Reibung, ohne den Plan zu überfüllen.",
  spanish:
      "Una forma muy fiable de jugar a 3: dos facciones con fuerte presencia en el mapa y una facción que castiga a quien se sobreextiende. Genera buena tensión sin saturar el tablero.",
  brazilianPortuguese:
      "Uma estrutura de 3 jogadores muito confiável: duas facções com forte presença no mapa e uma facção que pune quem se estica demais. Isso cria boa tensão sem lotar o tabuleiro.",
);

const _threeDisruption = _LocalizedDescription(
  english:
      "Two board-filling factions keep the game grounded, while the third adds ambushes, revolts, or surprise pressure. It stays interactive without becoming chaotic.",
  french:
      "Deux factions qui remplissent la carte gardent la partie ancrée sur le plateau, tandis que la troisième ajoute embuscades, révoltes ou pression surprise. C’est interactif sans devenir chaotique.",
  german:
      "Zwei Fraktionen, die den Plan füllen, erden die Partie, während die dritte Hinterhalte, Aufstände oder überraschenden Druck einbringt. Das bleibt interaktiv, ohne chaotisch zu werden.",
  spanish:
      "Dos facciones que llenan el mapa mantienen la partida aterrizada, mientras la tercera añade emboscadas, revueltas o presión sorpresa. Sigue siendo interactiva sin volverse caótica.",
  brazilianPortuguese:
      "Duas facções que enchem o mapa mantêm a partida ancorada no tabuleiro, enquanto a terceira adiciona emboscadas, revoltas ou pressão surpresa. Continua interativa sem virar caos.",
);

const _threeMarket = _LocalizedDescription(
  english:
      "Two military factions give the table structure, and the third adds negotiation, mobility, or opportunism instead of more pieces. Great for groups that like table talk.",
  french:
      "Deux factions militaires donnent une structure à la table, et la troisième apporte négociation, mobilité ou opportunisme au lieu d’ajouter trop de pièces. Idéal pour les groupes qui aiment parler autour de la table.",
  german:
      "Zwei militärische Fraktionen geben dem Tisch Struktur, und die dritte bringt Verhandlungen, Mobilität oder Opportunismus statt noch mehr Figuren. Ideal für Gruppen, die viel Tischgespräch mögen.",
  spanish:
      "Dos facciones militares dan estructura a la mesa, y la tercera aporta negociación, movilidad u oportunismo en vez de más piezas. Ideal para grupos a los que les gusta hablar mucho durante la partida.",
  brazilianPortuguese:
      "Duas facções militares dão estrutura à mesa, e a terceira traz negociação, mobilidade ou oportunismo em vez de mais peças. Ótima para grupos que gostam de conversar bastante durante a partida.",
);

const _threeBloodbath = _LocalizedDescription(
  english:
      "A high-conflict 3-player lineup with constant battles and very little downtime. Best for players who want a sharper, more tactical game.",
  french:
      "Une table à 3 joueurs très conflictuelle, avec des combats constants et très peu de temps mort. Parfait pour les joueurs qui veulent une partie plus tranchante et tactique.",
  german:
      "Eine sehr konfliktlastige 3-Spieler-Besetzung mit ständigen Kämpfen und kaum Leerlauf. Am besten für Gruppen, die ein schärferes, taktischeres Spiel wollen.",
  spanish:
      "Una mesa de 3 jugadores muy conflictiva, con batallas constantes y casi sin respiro. Ideal para quienes quieren una partida más afilada y táctica.",
  brazilianPortuguese:
      "Uma mesa de 3 jogadores com muito conflito, batalhas constantes e quase nenhum tempo morto. Ideal para quem quer uma partida mais afiada e tática.",
);

const _threePressure = _LocalizedDescription(
  english:
      "Each faction attacks the table from a different angle, but there is still enough board presence to keep everyone honest. Good for experienced groups that want variety.",
  french:
      "Chaque faction attaque la table sous un angle différent, tout en gardant assez de présence sur le plateau pour que tout le monde se surveille. Très bien pour des groupes expérimentés qui veulent de la variété.",
  german:
      "Jede Fraktion greift den Tisch aus einem anderen Winkel an, und trotzdem bleibt genug Brettpräsenz, damit alle ehrlich bleiben. Gut für erfahrene Gruppen, die Abwechslung wollen.",
  spanish:
      "Cada facción presiona a la mesa desde un ángulo distinto, pero sigue habiendo suficiente presencia en el mapa para que nadie juegue sin oposición. Muy buena para grupos con experiencia que quieren variedad.",
  brazilianPortuguese:
      "Cada facção pressiona a mesa de um ângulo diferente, mas ainda existe presença suficiente no mapa para ninguém jogar sem resposta. Muito boa para grupos experientes que querem variedade.",
);

const _fourCore = _LocalizedDescription(
  english:
      "The classic 4-player Root table. Two factions shape the main board struggle while the others attack openings from different angles.",
  french:
      "La table Root classique à 4 joueurs. Deux factions structurent la lutte principale sur le plateau pendant que les autres exploitent les ouvertures sous des angles différents.",
  german:
      "Der klassische Root-Tisch für 4 Spieler. Zwei Fraktionen prägen den zentralen Kampf auf dem Plan, während die anderen offene Stellen aus unterschiedlichen Winkeln ausnutzen.",
  spanish:
      "La mesa clásica de Root a 4 jugadores. Dos facciones marcan la lucha principal en el mapa mientras las demás aprovechan los huecos desde ángulos distintos.",
  brazilianPortuguese:
      "A mesa clássica de Root para 4 jogadores. Duas facções moldam a disputa principal no mapa enquanto as outras exploram as aberturas por ângulos diferentes.",
);

const _fourBalanced = _LocalizedDescription(
  english:
      "A proven 4-player pattern: strong map presence, one disruptive faction to check leaders, and one more mobile or social faction to keep interaction high.",
  french:
      "Une structure 4 joueurs éprouvée : une forte présence sur la carte, une faction perturbatrice pour freiner le leader, et une faction plus mobile ou plus sociale pour garder beaucoup d’interaction.",
  german:
      "Ein bewährtes 4-Spieler-Muster: starke Präsenz auf dem Plan, eine störende Fraktion zum Einbremsen der Führenden und eine mobilere oder sozialere Fraktion für viel Interaktion.",
  spanish:
      "Un patrón probado para 4 jugadores: buena presencia en el mapa, una facción disruptiva para frenar al líder y una facción más móvil o social para mantener mucha interacción.",
  brazilianPortuguese:
      "Um padrão testado para 4 jogadores: boa presença no mapa, uma facção disruptiva para frear o líder e uma facção mais móvel ou social para manter muita interação.",
);

const _fourEconomy = _LocalizedDescription(
  english:
      "This mix keeps solid military anchors on the map and lets Riverfolk or Vagabond turn the table’s openings into deals, mobility, and counterplay.",
  french:
      "Cette composition garde de solides ancrages militaires sur la carte et permet à la Compagnie de la Rivière ou au Vagabond de transformer les ouvertures en accords, en mobilité et en contre-jeu.",
  german:
      "Diese Mischung hält solide militärische Anker auf dem Plan und lässt Flussvolk oder Vagabund offene Stellen in Handel, Mobilität und Gegenangriffe verwandeln.",
  spanish:
      "Esta mezcla mantiene anclas militares sólidas en el mapa y permite que Compañía Fluvial o Vagabundo conviertan los huecos de la mesa en tratos, movilidad y contraataque.",
  brazilianPortuguese:
      "Essa mistura mantém âncoras militares sólidas no mapa e deixa Companhia do Rio ou Vagabundo transformarem as brechas da mesa em negócios, mobilidade e contra-jogo.",
);

const _fourHeavy = _LocalizedDescription(
  english:
      "Three board-focused factions make the map tense and competitive, while the last seat stops the game from becoming one-dimensional.",
  french:
      "Trois factions très centrées sur le plateau rendent la carte tendue et compétitive, tandis que la dernière évite que la partie devienne trop linéaire.",
  german:
      "Drei planorientierte Fraktionen machen die Karte angespannt und umkämpft, während der letzte Platz verhindert, dass die Partie eindimensional wird.",
  spanish:
      "Tres facciones muy centradas en el tablero vuelven el mapa tenso y competitivo, mientras que la última evita que la partida se vuelva unidimensional.",
  brazilianPortuguese:
      "Três facções muito focadas no tabuleiro deixam o mapa tenso e competitivo, enquanto o último assento impede que a partida fique unidimensional.",
);

const _fourTight = _LocalizedDescription(
  english:
      "This lineup uses factions that can handle a dense board, so it stays interactive even when the map fills quickly.",
  french:
      "Cette composition utilise des factions capables de gérer un plateau dense, donc elle reste interactive même quand la carte se remplit vite.",
  german:
      "Diese Besetzung nutzt Fraktionen, die mit einem dichten Plan umgehen können, und bleibt deshalb auch dann interaktiv, wenn der Wald schnell voll wird.",
  spanish:
      "Esta combinación usa facciones que soportan bien un tablero denso, así que sigue siendo interactiva incluso cuando el mapa se llena rápido.",
  brazilianPortuguese:
      "Essa composição usa facções que lidam bem com um tabuleiro denso, então ela continua interativa mesmo quando o mapa enche rápido.",
);

const _fiveVagabondSeat = _LocalizedDescription(
  english:
      "This is basically a strong 4-player board plus a Vagabond. That is a common 5-player pattern because the extra seat adds interaction without consuming too much space.",
  french:
      "C’est en pratique une très bonne table à 4 joueurs à laquelle on ajoute un Vagabond. C’est un schéma fréquent à 5 joueurs, car le siège supplémentaire ajoute de l’interaction sans prendre trop de place.",
  german:
      "Im Grunde ist das ein starkes 4-Spieler-Brett plus ein Vagabund. Das ist ein häufiges 5-Spieler-Muster, weil der zusätzliche Platz mehr Interaktion bringt, ohne zu viel Raum zu verbrauchen.",
  spanish:
      "En la práctica, esto es una mesa fuerte de 4 jugadores más un Vagabundo. Es un patrón muy común a 5 porque el asiento extra añade interacción sin consumir demasiado espacio.",
  brazilianPortuguese:
      "Na prática, isso é uma mesa forte de 4 jogadores com um Vagabundo a mais. Esse é um padrão comum em 5 jogadores, porque o assento extra adiciona interação sem consumir espaço demais.",
);

const _fiveOtters = _LocalizedDescription(
  english:
      "At 5 players, Riverfolk usually improve because there are more potential customers and much more table talk. The rest of the table still has enough presence to police the game.",
  french:
      "À 5 joueurs, la Compagnie de la Rivière devient souvent meilleure, parce qu’il y a plus de clients potentiels et beaucoup plus de négociation. Le reste de la table garde assez de présence pour contrôler la partie.",
  german:
      "Mit 5 Spielern wird das Flussvolk meist besser, weil es mehr mögliche Kundschaft und deutlich mehr Tischgespräche gibt. Der Rest des Tisches hat trotzdem genug Präsenz, um das Spiel zu kontrollieren.",
  spanish:
      "A 5 jugadores, la Compañía Fluvial suele mejorar porque hay más clientes potenciales y mucha más conversación en la mesa. Aun así, el resto de la mesa conserva suficiente presencia para vigilar la partida.",
  brazilianPortuguese:
      "Em 5 jogadores, a Companhia do Rio costuma melhorar porque há mais clientes em potencial e muito mais conversa na mesa. Mesmo assim, o resto da mesa mantém presença suficiente para policiar a partida.",
);

const _fiveBalanced = _LocalizedDescription(
  english:
      "This keeps enough map pressure to control the leaders, but leans toward flexible factions so 5 players do not make the board feel too cramped.",
  french:
      "Cette composition garde assez de pression sur la carte pour contrôler les leaders, mais penche vers des factions plus flexibles afin qu’une partie à 5 joueurs ne paraisse pas trop serrée.",
  german:
      "Diese Mischung hält genug Druck auf dem Plan, um die Führenden zu kontrollieren, setzt aber stärker auf flexible Fraktionen, damit sich 5 Spieler nicht zu eng anfühlen.",
  spanish:
      "Esta mezcla mantiene suficiente presión sobre el mapa para controlar a los líderes, pero se inclina hacia facciones flexibles para que 5 jugadores no hagan que el tablero se sienta demasiado apretado.",
  brazilianPortuguese:
      "Essa mistura mantém pressão suficiente no mapa para controlar os líderes, mas puxa para facções mais flexíveis para que 5 jogadores não deixem o tabuleiro apertado demais.",
);

const _fiveCardWar = _LocalizedDescription(
  english:
      "Several of these factions care a lot about cards, timing windows, or tactical counterplay, which makes for a rich 5-player table once everyone knows the basics.",
  french:
      "Plusieurs de ces factions dépendent beaucoup des cartes, des fenêtres de timing ou du contre-jeu tactique, ce qui donne une table à 5 joueurs très riche une fois que tout le monde connaît les bases.",
  german:
      "Mehrere dieser Fraktionen hängen stark von Karten, Timing-Fenstern oder taktischem Konterspiel ab. Das sorgt für einen sehr reichhaltigen 5-Spieler-Tisch, sobald alle die Grundlagen kennen.",
  spanish:
      "Varias de estas facciones dependen bastante de las cartas, de ventanas de timing o del contraataque táctico, lo que produce una mesa de 5 jugadores muy rica cuando todos conocen las bases.",
  brazilianPortuguese:
      "Várias dessas facções dependem bastante de cartas, janelas de timing ou contra-jogo tático, o que cria uma mesa de 5 jogadores muito rica quando todo mundo já conhece o básico.",
);

const _fiveExpansionOnly = _LocalizedDescription(
  english:
      "A good option for groups using mostly expansion factions. It keeps a healthy mix of board pressure and trickier factions instead of stuffing the map with too many armies.",
  french:
      "Une bonne option pour les groupes qui jouent surtout avec les factions d’extension. Elle garde un bon mélange entre pression sur le plateau et factions plus retorses, au lieu d’empiler trop d’armées.",
  german:
      "Eine gute Option für Gruppen, die vor allem mit Erweiterungsfraktionen spielen. Sie hält eine gesunde Mischung aus Brettdruck und trickreicheren Fraktionen, statt den Plan mit zu vielen Armeen zu stopfen.",
  spanish:
      "Una buena opción para grupos que juegan sobre todo con facciones de expansiones. Mantiene una mezcla sana entre presión sobre el mapa y facciones más tramposas, en lugar de llenar el tablero con demasiados ejércitos.",
  brazilianPortuguese:
      "Uma boa opção para grupos que jogam principalmente com facções de expansão. Ela mantém uma mistura saudável entre pressão no mapa e facções mais traiçoeiras, em vez de entupir o tabuleiro com exércitos demais.",
);

const _sixLowFootprint = _LocalizedDescription(
  english:
      "At 6 players, factions that do not need many slots become very important. This lineup stays playable by pairing a small number of heavy map factions with lighter ones.",
  french:
      "À 6 joueurs, les factions qui demandent peu d’emplacements deviennent très importantes. Cette composition reste jouable en associant peu de grosses factions de plateau à des factions plus légères.",
  german:
      "Mit 6 Spielern sind Fraktionen wichtig, die nicht viele Felder beanspruchen. Diese Mischung bleibt spielbar, weil sie nur wenige schwere Brettfraktionen mit leichteren Fraktionen kombiniert.",
  spanish:
      "A 6 jugadores, las facciones que no necesitan muchos espacios se vuelven muy importantes. Esta composición sigue siendo jugable porque combina pocas facciones pesadas de mapa con facciones más ligeras.",
  brazilianPortuguese:
      "Em 6 jogadores, facções que não precisam de muitos espaços ficam muito importantes. Essa composição continua jogável porque combina poucas facções pesadas de mapa com facções mais leves.",
);

const _sixDoubleVagabond = _LocalizedDescription(
  english:
      "A strong 6-player pattern from community discussion: the second Vagabond helps the board breathe, while the heavier factions still provide enough policing.",
  french:
      "Un schéma 6 joueurs souvent recommandé par la communauté : le deuxième Vagabond laisse la carte respirer, pendant que les factions plus lourdes gardent assez de contrôle sur la partie.",
  german:
      "Ein starkes 6-Spieler-Muster aus vielen Community-Diskussionen: Der zweite Vagabund lässt den Plan atmen, während die schwereren Fraktionen trotzdem genug Kontrolle ausüben.",
  spanish:
      "Un patrón fuerte de 6 jugadores muy repetido en la comunidad: el segundo Vagabundo deja respirar al mapa, mientras las facciones más pesadas siguen aportando suficiente control.",
  brazilianPortuguese:
      "Um padrão forte de 6 jogadores muito citado pela comunidade: o segundo Vagabundo faz o mapa respirar, enquanto as facções mais pesadas ainda oferecem policiamento suficiente.",
);

const _sixBalanced = _LocalizedDescription(
  english:
      "Busy, but still balanced. The mix gives the table enough rule and enough disruption to keep a 6-player game interactive instead of clogged.",
  french:
      "Chargée, mais encore équilibrée. La composition donne assez de contrôle territorial et assez de perturbation pour qu’une partie à 6 joueurs reste interactive au lieu de se bloquer.",
  german:
      "Voll, aber noch ausgewogen. Die Mischung gibt dem Tisch genug Herrschaft und genug Störung, damit ein 6-Spieler-Spiel interaktiv bleibt statt zu verstopfen.",
  spanish:
      "Muy cargada, pero todavía equilibrada. La mezcla da suficiente dominio y suficiente disrupción para que una partida a 6 siga siendo interactiva y no se atasque.",
  brazilianPortuguese:
      "Cheia, mas ainda equilibrada. A mistura dá domínio e disrupção suficientes para que uma partida de 6 jogadores continue interativa em vez de travar.",
);

const _sixTightExpansionOnly = _LocalizedDescription(
  english:
      "This is the tightest 6-player recommendation in the file. It works best for experienced groups: the roles make sense, but the board will still be crowded and timing matters a lot.",
  french:
      "C’est la recommandation 6 joueurs la plus serrée du fichier. Elle marche surtout pour des groupes expérimentés : les rôles ont du sens, mais la carte restera quand même très encombrée.",
  german:
      "Das ist die engste 6-Spieler-Empfehlung in dieser Datei. Sie funktioniert am besten für erfahrene Gruppen: Die Rollen passen, aber der Plan wird trotzdem sehr voll sein.",
  spanish:
      "Esta es la recomendación de 6 jugadores más apretada del archivo. Funciona mejor con grupos experimentados: los papeles tienen sentido, pero el mapa seguirá estando muy lleno.",
  brazilianPortuguese:
      "Esta é a recomendação de 6 jogadores mais apertada do arquivo. Ela funciona melhor com grupos experientes: os papéis fazem sentido, mas o mapa ainda vai ficar bem cheio.",
);
final Map<AmountOfPlayersInMatch, List<RecomendedFactionComposition>> _content =
    {
      AmountOfPlayersInMatch.two: [
        _composition(
          players: AmountOfPlayersInMatch.two,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
          ],
          description: _duelClassic,
        ),
        _composition(
          players: AmountOfPlayersInMatch.two,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
          ],
          description: _duelTerritory,
        ),
        _composition(
          players: AmountOfPlayersInMatch.two,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.keepersInIron,
          ],
          description: _duelRelics,
        ),
        _composition(
          players: AmountOfPlayersInMatch.two,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
          ],
          description: _duelSlugfest,
        ),
        _composition(
          players: AmountOfPlayersInMatch.two,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.marquiseDeCat,
          ],
          description: _duelFastPressure,
        ),
      ],
      AmountOfPlayersInMatch.three: [
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
          ],
          description: _threeClassic,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _threeDisruption,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.theLizardCult,
          ],
          description: _threeDisruption,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _threeMarket,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _threePressure,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _threePressure,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.vagabond,
          ],
          description: _threePressure,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.woodlandAlliance,
          ],
          description: _threeClassic,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.vagabond,
          ],
          description: _threeMarket,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _threeBloodbath,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.theLizardCult,
          ],
          description: _threeBloodbath,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.undergroundDuchy,
          ],
          description: _threeBloodbath,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _threePressure,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.keepersInIron,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _threePressure,
        ),
        _composition(
          players: AmountOfPlayersInMatch.three,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _threeMarket,
        ),
      ],
      AmountOfPlayersInMatch.four: [
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.vagabond,
          ],
          description: _fourCore,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _fourBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fourEconomy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
          ],
          description: _fourBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fourEconomy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _fourHeavy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
          ],
          description: _fourBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.theLizardCult,
          ],
          description: _fourEconomy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fourEconomy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.theLizardCult,
          ],
          description: _fourHeavy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.keepersInIron,
          ],
          description: _fourHeavy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.keepersInIron,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fourHeavy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _fourHeavy,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fourTight,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _fourBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.four,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
          ],
          description: _fourBalanced,
        ),
      ],
      AmountOfPlayersInMatch.five: [
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fiveOtters,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.woodlandAlliance,
          ],
          description: _fiveVagabondSeat,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fiveOtters,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.vagabond,
          ],
          description: _fiveBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.vagabond,
          ],
          description: _fiveOtters,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.eyrieDynasties,
          ],
          description: _fiveOtters,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.corvidConspiracy,
          ],
          description: _fiveBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.woodlandAlliance,
          ],
          description: _fiveCardWar,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.keepersInIron,
          ],
          description: _fiveBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.vagabond,
          ],
          description: _fiveVagabondSeat,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.keepersInIron,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fiveExpansionOnly,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fiveExpansionOnly,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.vagabond,
          ],
          description: _fiveVagabondSeat,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.vagabond,
          ],
          description: _fiveVagabondSeat,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _fiveOtters,
        ),
        _composition(
          players: AmountOfPlayersInMatch.five,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
          ],
          description: _fiveBalanced,
        ),
      ],
      AmountOfPlayersInMatch.six: [
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
          ],
          description: _sixBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.vagabond,
            RecomendedFaction.vagabond,
          ],
          description: _sixDoubleVagabond,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.vagabond,
            RecomendedFaction.vagabond,
          ],
          description: _sixDoubleVagabond,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _sixLowFootprint,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _sixLowFootprint,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _sixLowFootprint,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.marquiseDeCat,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _sixBalanced,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.vagabond,
            RecomendedFaction.vagabond,
          ],
          description: _sixDoubleVagabond,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.woodlandAlliance,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.vagabond,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _sixLowFootprint,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.eyrieDynasties,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.riverfolkCompany,
            RecomendedFaction.vagabond,
            RecomendedFaction.vagabond,
          ],
          description: _sixDoubleVagabond,
        ),
        _composition(
          players: AmountOfPlayersInMatch.six,
          factions: [
            RecomendedFaction.lordOfTheHundreds,
            RecomendedFaction.undergroundDuchy,
            RecomendedFaction.keepersInIron,
            RecomendedFaction.theLizardCult,
            RecomendedFaction.corvidConspiracy,
            RecomendedFaction.riverfolkCompany,
          ],
          description: _sixTightExpansionOnly,
        ),
      ],
    };
