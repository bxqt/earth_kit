part of 'data.dart';

/// [River] constants that can be used to apply a custom [RiverStyle]
/// to a given River or multiple Rivers.
/// 
/// All rivers were read out from the
/// (50m natural earth rivers geoJson)[https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_50m_rivers.geojson]
abstract class Rivers {
  /// Filters all rivers by the given [predicate]. Shorthand for calling `Rivers.all.where(predicate).toList()`.
  static List<River> where(bool Function(River river) predicate) => all.where(predicate).toList();

  /// Maps each River to a [Stroke].
  static Map<River, Stroke> map(Stroke Function(River river) iterator) =>
      Map.fromIterable(all, value: (value) => iterator(value));

  static const List<River> all = [kama, abay, alFurat, alabama, albany, albertNile, amur, angara, atbara, athabasca, back, biya, chattahoochee, churchill, colorado, columbia, coppermine, dalalven, dniester, dnieper, don, blueNile, ertis, firat, gan, grande, han, huang, indus, jordan, kemijoki, klamath, krishna, laGrandeRiviere, mackenzie, madison, mahanaNadi, mississippi, missouri, blackVolta, murray, whiteVolta, naryn, nelson, neva, niger, nile, ob, orange, ord, ottawa, panamaCanal, paranaiba, parana, peace, pit, rDesOutaouais, rainy, rhein, rhone, rioGrande, rupert, rioGrandeDeSantiago, sacramento, sanJoaquin, sanJuan, saskatchewan, sassandra, savannah, semliki, shire, shishhidGol, snake, southSaskatchewan, suezCanal, sukhona, sutlej, svir, syrDarya, saoFrancisco, tajo, tennessee, teslin, thelon, tocantins, tugaloo, ural, vaal, verkhniyYenisey, victoriaNile, vilyuy, vistula, volga, volta, vorma, vuoksi, waikato, winnipeg, yuan, zambezi, aldan, allegheny, amazonas, amuDarya, anadyr, araguaia, ergun, arkansas, ayeyarwady, bafing, bahrElZeraf, mountainNile, whiteNile, bamingui, barito, barwon, benue, borcea, bracoMenor, brahmaputra, branco, bratulChillia, bratulSfintuGheorghe, bratulSulina, brazos, busira, bykovskayaProtoka, benoue, bioBio, caqueta, yangtze, chari, chattooga, chenab, chixoy, chubut, chulyshman, coco, congo, copper, cubango, culuene, dadu, daly, damiettaBranch, danube, darling, zapadnayaDvina, desaguadero, dicle, digul, dihang, dnepre, doubleMountainForkBrazos, drava, duero, ebro, elbe, irtysh, euphrates, ferencCsatorna, finlay, fitzroy, fraser, ganges, ariege, genala, gharrafCanal, gila, glama, godavari, greatPeeDee, guapore, gotaAlv, hailar, helmand, holston, red, hongshui, yellow, hudson, ideriyn, indaia, indigirka, indragi, irrawaddyDelta, ishikari, ismailiyaCanal, japura, jequitinhonha, jubba, juruena, kadei, kafue, kagera, kamchatka, kapuas, kasai, katherine, kayan, kem, khatanga, kheta, kibali, kokemaenjoki, kolyma, konqi, koukourou, koyukuk, kuskokwim, kwango, kyzylKhem, mekong, lek, lena, liao, liard, limpopo, lom, nizhnyayaTunguska, lualaba, madeira, madreDeDios, magdalena, malyyYenisey, mamberamo, mamore, mananantanana, mangoky, damqogkanbab, maranon, mendoza, meta, min, mitchell, nForkKuskokwim, nanpan, narmada, nederrijn, negro, neuquen, niagara, nmai, northSaskatchewan, nu, salween, oder, ohio, okavango, olenekskayaProtoka, olenek, omo, orinoco, ouham, pamir, panj, paraiba, pechora, pendOreille, pilcomayo, po, porcupine, potomac, purari, purus, panuco, quan, rhine, rosettaBranch, ruki, ruvuma, sBranchPotomac, saintJohn, salado, sanaga, sangha, santaCruz, seine, selengeSelenga, setit, shattAlArab, shiquan, skeena, slave, sungari, soroksariDuna, sprague, stClair, stLawrence, stikine, susitna, severnayaDvina, senegal, tanana, tapajos, tarim, taritatu, taz, tagus, thames, tigris, tisa, tisza, tobol, tom, tongtian, trofimovskayaProtoka, tshuapa, tumatskayaProtoka, tuotuo, ubangi, ucayali, uele, uruguay, usumacinta, verde, vychegda, waal, wabash, waitaki, weir, willamette, xarMoron, xi, xiliao, xingu, xun, yadkin, yamuna, yarkant, yenisey, yukon, za, garonne, loire];

  /// Kama river
  static const River kama = River(
    name: 'Kama',
    englishName: 'Kama',
    bbox: BBox(C(55.11, 49.25), C(55.7, 51.94)),
    zoom: 5.0,
  );

  /// Abay river
  static const River abay = River(
    name: 'Abay',
    englishName: 'Abay',
    bbox: BBox(C(11.63, 37.11), C(11.91, 37.39)),
    zoom: 3.0,
  );

  /// Al Furat river
  static const River alFurat = River(
    name: 'Al Furat',
    englishName: 'Al Furat',
    bbox: BBox(C(35.86, 38.07), C(36.34, 38.56)),
    zoom: 3.0,
  );

  /// Alabama river
  static const River alabama = River(
    name: 'Alabama',
    englishName: 'Alabama',
    bbox: BBox(C(32.81, -86.52), C(33.03, -86.45)),
    zoom: 5.0,
  );

  /// Albany river
  static const River albany = River(
    name: 'Albany',
    englishName: 'Albany',
    bbox: BBox(C(51.0, -91.31), C(51.12, -90.42)),
    zoom: 5.0,
  );

  /// Albert Nile river
  static const River albertNile = River(
    name: 'Albert Nile',
    englishName: 'Albert Nile',
    bbox: BBox(C(2.193, 31.36), C(2.4, 31.47)),
    zoom: 2.0,
  );

  /// Amur river
  static const River amur = River(
    name: 'Amur',
    englishName: 'Amur',
    bbox: BBox(C(49.76, 136.8), C(50.45, 137.1)),
    zoom: 3.0,
  );

  /// Angara river
  static const River angara = River(
    name: 'Angara',
    englishName: 'Angara',
    bbox: BBox(C(53.11, 101.8), C(56.29, 103.4)),
    zoom: 2.1,
  );

  /// Atbara river
  static const River atbara = River(
    name: 'Atbara',
    englishName: 'Atbara',
    bbox: BBox(C(14.62, 35.9), C(14.94, 35.92)),
    zoom: 5.0,
  );

  /// Athabasca river
  static const River athabasca = River(
    name: 'Athabasca',
    englishName: 'Athabasca',
    bbox: BBox(C(58.69, -111.3), C(58.79, -111.0)),
    zoom: 4.7,
  );

  /// Back river
  static const River back = River(
    name: 'Back',
    englishName: 'Back',
    bbox: BBox(C(65.87, -101.8), C(66.08, -98.66)),
    zoom: 5.0,
  );

  /// Biya river
  static const River biya = River(
    name: 'Biya',
    englishName: 'Biya',
    bbox: BBox(C(51.36, 87.39), C(51.76, 87.76)),
    zoom: 5.0,
  );

  /// Chattahoochee river
  static const River chattahoochee = River(
    name: 'Chattahoochee',
    englishName: 'Chattahoochee',
    bbox: BBox(C(31.64, -85.12), C(32.05, -85.06)),
    zoom: 5.0,
  );

  /// Churchill river
  static const River churchill = River(
    name: 'Churchill',
    englishName: 'Churchill',
    bbox: BBox(C(53.13, -64.71), C(53.38, -64.68)),
    zoom: 5.0,
  );

  /// Colorado river
  static const River colorado = River(
    name: 'Colorado',
    englishName: 'Colorado',
    bbox: BBox(C(35.83, -114.7), C(36.2, -113.6)),
    zoom: 4.7,
  );

  /// Columbia river
  static const River columbia = River(
    name: 'Columbia',
    englishName: 'Columbia',
    bbox: BBox(C(49.34, -118.1), C(49.8, -117.9)),
    zoom: 3.0,
  );

  /// Coppermine river
  static const River coppermine = River(
    name: 'Coppermine',
    englishName: 'Coppermine',
    bbox: BBox(C(64.96, -114.4), C(65.64, -112.3)),
    zoom: 5.0,
  );

  /// Dalälven river
  static const River dalalven = River(
    name: 'Dalälven',
    englishName: 'Dalälven',
    bbox: BBox(C(60.16, 16.5), C(60.51, 17.42)),
    zoom: 5.0,
  );

  /// Dniester river
  static const River dniester = River(
    name: 'Dniester',
    englishName: 'Dniester',
    bbox: BBox(C(46.1, 30.26), C(46.32, 30.48)),
    zoom: 5.0,
  );

  /// Dnipro river
  static const River dnieper = River(
    name: 'Dnipro',
    englishName: 'Dnieper',
    bbox: BBox(C(46.83, 33.54), C(47.84, 35.15)),
    zoom: 4.0,
  );

  /// Don river
  static const River don = River(
    name: 'Don',
    englishName: 'Don',
    bbox: BBox(C(47.6, 42.11), C(49.51, 43.98)),
    zoom: 5.0,
  );

  /// El Bahr el Azraq river
  static const River blueNile = River(
    name: 'El Bahr el Azraq',
    englishName: 'Blue Nile',
    bbox: BBox(C(11.3, 34.38), C(11.78, 34.78)),
    zoom: 3.0,
  );

  /// Ertis river
  static const River ertis = River(
    name: 'Ertis',
    englishName: 'Ertis',
    bbox: BBox(C(47.73, 83.36), C(49.64, 84.36)),
    zoom: 2.1,
  );

  /// Firat river
  static const River firat = River(
    name: 'Firat',
    englishName: 'Firat',
    bbox: BBox(C(38.81, 38.74), C(39.08, 38.81)),
    zoom: 3.0,
  );

  /// Gan river
  static const River gan = River(
    name: 'Gan',
    englishName: 'Gan',
    bbox: BBox(C(29.28, 116.0), C(29.75, 116.2)),
    zoom: 5.0,
  );

  /// Grande river
  static const River grande = River(
    name: 'Grande',
    englishName: 'Grande',
    bbox: BBox(C(-21.09, -46.33), C(-20.67, -45.2)),
    zoom: 4.7,
  );

  /// Han river
  static const River han = River(
    name: 'Han',
    englishName: 'Han',
    bbox: BBox(C(32.57, 111.0), C(32.74, 111.5)),
    zoom: 5.0,
  );

  /// Huang river
  static const River huang = River(
    name: 'Huang',
    englishName: 'Huang',
    bbox: BBox(C(34.84, 97.07), C(34.93, 97.29)),
    zoom: 3.0,
  );

  /// Indus river
  static const River indus = River(
    name: 'Indus',
    englishName: 'Indus',
    bbox: BBox(C(34.09, 72.71), C(34.62, 72.85)),
    zoom: 3.0,
  );

  /// Jordan river
  static const River jordan = River(
    name: 'Jordan',
    englishName: 'Jordan',
    bbox: BBox(C(31.33, 35.42), C(31.77, 35.56)),
    zoom: 5.0,
  );

  /// Kemijoki river
  static const River kemijoki = River(
    name: 'Kemijoki',
    englishName: 'Kemijoki',
    bbox: BBox(C(66.47, 27.36), C(66.76, 27.52)),
    zoom: 5.0,
  );

  /// Klamath river
  static const River klamath = River(
    name: 'Klamath',
    englishName: 'Klamath',
    bbox: BBox(C(42.25, -121.9), C(42.48, -121.8)),
    zoom: 4.7,
  );

  /// Krishna river
  static const River krishna = River(
    name: 'Krishna',
    englishName: 'Krishna',
    bbox: BBox(C(16.23, 79.0), C(16.58, 79.31)),
    zoom: 5.0,
  );

  /// La Grande Rivière river
  static const River laGrandeRiviere = River(
    name: 'La Grande Rivière',
    englishName: 'La Grande Rivière',
    bbox: BBox(C(53.63, -77.42), C(53.8, -74.43)),
    zoom: 4.0,
  );

  /// Mackenzie river
  static const River mackenzie = River(
    name: 'Mackenzie',
    englishName: 'Mackenzie',
    bbox: BBox(C(61.05, -117.7), C(61.34, -113.7)),
    zoom: 2.1,
  );

  /// Madison river
  static const River madison = River(
    name: 'Madison',
    englishName: 'Madison',
    bbox: BBox(C(44.76, -111.3), C(44.87, -111.1)),
    zoom: 2.0,
  );

  /// Mahäna Nadï river
  static const River mahanaNadi = River(
    name: 'Mahäna Nadï',
    englishName: 'Mahäna Nadï',
    bbox: BBox(C(21.52, 83.3), C(21.74, 83.86)),
    zoom: 5.0,
  );

  /// Mississippi river
  static const River mississippi = River(
    name: 'Mississippi',
    englishName: 'Mississippi',
    bbox: BBox(C(47.41, -94.33), C(47.46, -94.09)),
    zoom: 4.7,
  );

  /// Missouri river
  static const River missouri = River(
    name: 'Missouri',
    englishName: 'Missouri',
    bbox: BBox(C(44.43, -100.8), C(46.71, -100.3)),
    zoom: 2.0,
  );

  /// Mouhoun river
  static const River blackVolta = River(
    name: 'Mouhoun',
    englishName: 'Black Volta',
    bbox: BBox(C(8.631, -1.713), C(8.762, -0.9762)),
    zoom: 4.7,
  );

  /// Murray river
  static const River murray = River(
    name: 'Murray',
    englishName: 'Murray',
    bbox: BBox(C(-36.11, 147.0), C(-36.04, 147.3)),
    zoom: 4.0,
  );

  /// Nakanbé river
  static const River whiteVolta = River(
    name: 'Nakanbé',
    englishName: 'White Volta',
    bbox: BBox(C(8.661, -1.155), C(9.117, -0.9742)),
    zoom: 5.0,
  );

  /// Naryn river
  static const River naryn = River(
    name: 'Naryn',
    englishName: 'Naryn',
    bbox: BBox(C(41.67, 72.65), C(41.79, 73.3)),
    zoom: 4.7,
  );

  /// Nelson river
  static const River nelson = River(
    name: 'Nelson',
    englishName: 'Nelson',
    bbox: BBox(C(50.98, -98.02), C(54.08, -96.6)),
    zoom: 5.0,
  );

  /// Neva river
  static const River neva = River(
    name: 'Neva',
    englishName: 'Neva',
    bbox: BBox(C(59.95, 31.04), C(60.23, 31.41)),
    zoom: 4.7,
  );

  /// Niger river
  static const River niger = River(
    name: 'Niger',
    englishName: 'Niger',
    bbox: BBox(C(9.865, 4.529), C(10.61, 4.657)),
    zoom: 3.0,
  );

  /// Nile river
  static const River nile = River(
    name: 'Nile',
    englishName: 'Nile',
    bbox: BBox(C(21.61, 31.09), C(23.99, 32.91)),
    zoom: 2.0,
  );

  /// Ob river
  static const River ob = River(
    name: 'Ob',
    englishName: 'Ob',
    bbox: BBox(C(53.89, 81.33), C(54.85, 83.03)),
    zoom: 4.0,
  );

  /// Orange river
  static const River orange = River(
    name: 'Orange',
    englishName: 'Orange',
    bbox: BBox(C(-30.66, 25.51), C(-30.55, 25.97)),
    zoom: 5.0,
  );

  /// Ord river
  static const River ord = River(
    name: 'Ord',
    englishName: 'Ord',
    bbox: BBox(C(-16.79, 128.7), C(-16.13, 128.8)),
    zoom: 5.0,
  );

  /// Ottawa river
  static const River ottawa = River(
    name: 'Ottawa',
    englishName: 'Ottawa',
    bbox: BBox(C(46.83, -79.56), C(47.58, -79.17)),
    zoom: 5.0,
  );

  /// Panama Canal river
  static const River panamaCanal = River(
    name: 'Panama Canal',
    englishName: 'Panama Canal',
    bbox: BBox(C(9.104, -79.92), C(9.267, -79.69)),
    zoom: 5.0,
  );

  /// Paranaíba river
  static const River paranaiba = River(
    name: 'Paranaíba',
    englishName: 'Paranaíba',
    bbox: BBox(C(-19.02, -50.5), C(-18.61, -49.79)),
    zoom: 4.0,
  );

  /// Paraná river
  static const River parana = River(
    name: 'Paraná',
    englishName: 'Paraná',
    bbox: BBox(C(-22.45, -52.96), C(-21.42, -51.94)),
    zoom: 4.0,
  );

  /// Peace river
  static const River peace = River(
    name: 'Peace',
    englishName: 'Peace',
    bbox: BBox(C(56.0, -124.8), C(56.76, -122.2)),
    zoom: 2.1,
  );

  /// Pit river
  static const River pit = River(
    name: 'Pit',
    englishName: 'Pit',
    bbox: BBox(C(40.76, -122.4), C(40.78, -122.1)),
    zoom: 5.0,
  );

  /// R. des Outaouais river
  static const River rDesOutaouais = River(
    name: 'R. des Outaouais',
    englishName: 'R. des Outaouais',
    bbox: BBox(C(47.48, -77.32), C(47.57, -76.93)),
    zoom: 5.0,
  );

  /// Rainy river
  static const River rainy = River(
    name: 'Rainy',
    englishName: 'Rainy',
    bbox: BBox(C(48.83, -91.63), C(48.91, -91.32)),
    zoom: 5.0,
  );

  /// Rhein river
  static const River rhein = River(
    name: 'Rhein',
    englishName: 'Rhein',
    bbox: BBox(C(47.66, 8.881), C(47.67, 9.128)),
    zoom: 4.0,
  );

  /// Rhône river
  static const River rhone = River(
    name: 'Rhône',
    englishName: 'Rhône',
    bbox: BBox(C(46.2, 6.133), C(46.44, 6.866)),
    zoom: 5.0,
  );

  /// Rio Grande river
  static const River rioGrande = River(
    name: 'Rio Grande',
    englishName: 'Rio Grande',
    bbox: BBox(C(26.56, -99.46), C(27.06, -99.17)),
    zoom: 4.0,
  );

  /// Rupert river
  static const River rupert = River(
    name: 'Rupert',
    englishName: 'Rupert',
    bbox: BBox(C(51.37, -75.2), C(51.45, -74.82)),
    zoom: 5.0,
  );

  /// Río Grande de Santiago river
  static const River rioGrandeDeSantiago = River(
    name: 'Río Grande de Santiago',
    englishName: 'Río Grande de Santiago',
    bbox: BBox(C(21.78, -105.1), C(21.82, -105.0)),
    zoom: 5.0,
  );

  /// Sacramento river
  static const River sacramento = River(
    name: 'Sacramento',
    englishName: 'Sacramento',
    bbox: BBox(C(40.72, -122.4), C(40.76, -122.4)),
    zoom: 4.7,
  );

  /// San Joaquin river
  static const River sanJoaquin = River(
    name: 'San Joaquin',
    englishName: 'San Joaquin',
    bbox: BBox(C(37.0, -119.7), C(37.06, -119.6)),
    zoom: 5.0,
  );

  /// San Juan river
  static const River sanJuan = River(
    name: 'San Juan',
    englishName: 'San Juan',
    bbox: BBox(C(11.12, -85.87), C(12.1, -84.77)),
    zoom: 4.7,
  );

  /// Saskatchewan river
  static const River saskatchewan = River(
    name: 'Saskatchewan',
    englishName: 'Saskatchewan',
    bbox: BBox(C(53.16, -100.3), C(53.59, -99.33)),
    zoom: 4.0,
  );

  /// Sassandra river
  static const River sassandra = River(
    name: 'Sassandra',
    englishName: 'Sassandra',
    bbox: BBox(C(6.264, -7.057), C(7.041, -6.989)),
    zoom: 5.0,
  );

  /// Savannah river
  static const River savannah = River(
    name: 'Savannah',
    englishName: 'Savannah',
    bbox: BBox(C(33.66, -82.59), C(34.02, -82.21)),
    zoom: 5.0,
  );

  /// Semliki river
  static const River semliki = River(
    name: 'Semliki',
    englishName: 'Semliki',
    bbox: BBox(C(1.239, 30.48), C(2.193, 31.37)),
    zoom: 5.0,
  );

  /// Shire river
  static const River shire = River(
    name: 'Shire',
    englishName: 'Shire',
    bbox: BBox(C(-14.76, 35.26), C(-14.5, 35.28)),
    zoom: 3.0,
  );

  /// Shishhid Gol river
  static const River shishhidGol = River(
    name: 'Shishhid Gol',
    englishName: 'Shishhid Gol',
    bbox: BBox(C(51.35, 99.31), C(51.41, 99.43)),
    zoom: 4.0,
  );

  /// Snake river
  static const River snake = River(
    name: 'Snake',
    englishName: 'Snake',
    bbox: BBox(C(43.21, -111.2), C(43.34, -111.0)),
    zoom: 4.0,
  );

  /// South Saskatchewan river
  static const River southSaskatchewan = River(
    name: 'South Saskatchewan',
    englishName: 'South Saskatchewan',
    bbox: BBox(C(50.64, -108.0), C(51.26, -106.7)),
    zoom: 5.0,
  );

  /// Suez Canal river
  static const River suezCanal = River(
    name: 'Suez Canal',
    englishName: 'Suez Canal',
    bbox: BBox(C(30.18, 32.36), C(30.42, 32.56)),
    zoom: 5.0,
  );

  /// Sukhona river
  static const River sukhona = River(
    name: 'Sukhona',
    englishName: 'Sukhona',
    bbox: BBox(C(59.53, 39.05), C(59.87, 39.8)),
    zoom: 4.0,
  );

  /// Sutlej river
  static const River sutlej = River(
    name: 'Sutlej',
    englishName: 'Sutlej',
    bbox: BBox(C(31.28, 76.44), C(31.42, 76.76)),
    zoom: 5.0,
  );

  /// Svir’ river
  static const River svir = River(
    name: 'Svir’',
    englishName: 'Svir’',
    bbox: BBox(C(60.23, 31.41), C(60.65, 32.82)),
    zoom: 4.7,
  );

  /// Syr Darya river
  static const River syrDarya = River(
    name: 'Syr Darya',
    englishName: 'Syr Darya',
    bbox: BBox(C(41.11, 67.99), C(41.25, 68.46)),
    zoom: 4.7,
  );

  /// São  Francisco river
  static const River saoFrancisco = River(
    name: 'São  Francisco',
    englishName: 'São  Francisco',
    bbox: BBox(C(-11.14, -43.15), C(-9.406, -40.82)),
    zoom: 4.0,
  );

  /// Tajo river
  static const River tajo = River(
    name: 'Tajo',
    englishName: 'Tajo',
    bbox: BBox(C(39.8, -5.996), C(39.85, -5.215)),
    zoom: 4.7,
  );

  /// Tennessee river
  static const River tennessee = River(
    name: 'Tennessee',
    englishName: 'Tennessee',
    bbox: BBox(C(35.95, -88.28), C(37.02, -87.95)),
    zoom: 4.7,
  );

  /// Teslin river
  static const River teslin = River(
    name: 'Teslin',
    englishName: 'Teslin',
    bbox: BBox(C(59.61, -133.2), C(60.45, -132.1)),
    zoom: 3.0,
  );

  /// Thelon river
  static const River thelon = River(
    name: 'Thelon',
    englishName: 'Thelon',
    bbox: BBox(C(64.49, -100.8), C(64.76, -97.1)),
    zoom: 4.7,
  );

  /// Tocantins river
  static const River tocantins = River(
    name: 'Tocantins',
    englishName: 'Tocantins',
    bbox: BBox(C(-5.335, -49.69), C(-3.835, -48.94)),
    zoom: 4.0,
  );

  /// Tugaloo river
  static const River tugaloo = River(
    name: 'Tugaloo',
    englishName: 'Tugaloo',
    bbox: BBox(C(34.37, -83.17), C(34.6, -82.82)),
    zoom: 5.0,
  );

  /// Ural river
  static const River ural = River(
    name: 'Ural',
    englishName: 'Ural',
    bbox: BBox(C(51.7, 58.63), C(52.2, 58.84)),
    zoom: 4.0,
  );

  /// Vaal river
  static const River vaal = River(
    name: 'Vaal',
    englishName: 'Vaal',
    bbox: BBox(C(-27.7, 25.62), C(-27.59, 26.09)),
    zoom: 4.0,
  );

  /// Verkhniy Yenisey river
  static const River verkhniyYenisey = River(
    name: 'Verkhniy Yenisey',
    englishName: 'Verkhniy Yenisey',
    bbox: BBox(C(53.74, 90.94), C(55.5, 92.41)),
    zoom: 4.0,
  );

  /// Victoria Nile river
  static const River victoriaNile = River(
    name: 'Victoria Nile',
    englishName: 'Victoria Nile',
    bbox: BBox(C(-0.9357, 31.77), C(0.4282, 33.26)),
    zoom: 2.0,
  );

  /// Vilyuy river
  static const River vilyuy = River(
    name: 'Vilyuy',
    englishName: 'Vilyuy',
    bbox: BBox(C(62.86, 109.6), C(63.48, 112.5)),
    zoom: 5.0,
  );

  /// Vistula river
  static const River vistula = River(
    name: 'Vistula',
    englishName: 'Vistula',
    bbox: BBox(C(49.93, 18.81), C(49.93, 18.94)),
    zoom: 4.7,
  );

  /// Volga river
  static const River volga = River(
    name: 'Volga',
    englishName: 'Volga',
    bbox: BBox(C(50.22, 45.66), C(51.77, 46.77)),
    zoom: 3.0,
  );

  /// Volta river
  static const River volta = River(
    name: 'Volta',
    englishName: 'Volta',
    bbox: BBox(C(6.338, -0.9762), C(8.662, 0.2306)),
    zoom: 4.7,
  );

  /// Vorma river
  static const River vorma = River(
    name: 'Vorma',
    englishName: 'Vorma',
    bbox: BBox(C(59.67, 11.16), C(59.91, 11.2)),
    zoom: 5.0,
  );

  /// Vuoksi river
  static const River vuoksi = River(
    name: 'Vuoksi',
    englishName: 'Vuoksi',
    bbox: BBox(C(60.57, 29.6), C(60.72, 30.48)),
    zoom: 5.0,
  );

  /// Waikato river
  static const River waikato = River(
    name: 'Waikato',
    englishName: 'Waikato',
    bbox: BBox(C(-38.94, 175.8), C(-38.69, 176.1)),
    zoom: 5.0,
  );

  /// Winnipeg river
  static const River winnipeg = River(
    name: 'Winnipeg',
    englishName: 'Winnipeg',
    bbox: BBox(C(48.86, -94.86), C(49.99, -94.51)),
    zoom: 5.0,
  );

  /// Yuan river
  static const River yuan = River(
    name: 'Yuan',
    englishName: 'Yuan',
    bbox: BBox(C(28.84, 112.0), C(29.03, 112.9)),
    zoom: 5.0,
  );

  /// Zambezi river
  static const River zambezi = River(
    name: 'Zambezi',
    englishName: 'Zambezi',
    bbox: BBox(C(-17.96, 27.02), C(-16.53, 28.76)),
    zoom: 3.0,
  );

  /// Aldan river
  static const River aldan = River(
    name: 'Aldan',
    englishName: 'Aldan',
    bbox: BBox(C(56.53, 123.1), C(63.49, 135.8)),
    zoom: 4.0,
  );

  /// Allegheny river
  static const River allegheny = River(
    name: 'Allegheny',
    englishName: 'Allegheny',
    bbox: BBox(C(40.45, -79.99), C(42.14, -77.86)),
    zoom: 3.0,
  );

  /// Amazonas river
  static const River amazonas = River(
    name: 'Amazonas',
    englishName: 'Amazonas',
    bbox: BBox(C(-4.445, -73.49), C(-1.552, -52.66)),
    zoom: 2.0,
  );

  /// Amu  Darya river
  static const River amuDarya = River(
    name: 'Amu  Darya',
    englishName: 'Amu  Darya',
    bbox: BBox(C(36.95, 59.09), C(43.29, 68.21)),
    zoom: 4.7,
  );

  /// Anadyr’ river
  static const River anadyr = River(
    name: 'Anadyr’',
    englishName: 'Anadyr’',
    bbox: BBox(C(64.68, 168.6), C(67.1, 174.5)),
    zoom: 5.0,
  );

  /// Araguaia river
  static const River araguaia = River(
    name: 'Araguaia',
    englishName: 'Araguaia',
    bbox: BBox(C(-17.85, -53.21), C(-5.303, -48.16)),
    zoom: 4.0,
  );

  /// Argun’ river
  static const River ergun = River(
    name: 'Argun’',
    englishName: 'Ergun',
    bbox: BBox(C(49.51, 117.9), C(53.32, 121.4)),
    zoom: 3.0,
  );

  /// Arkansas river
  static const River arkansas = River(
    name: 'Arkansas',
    englishName: 'Arkansas',
    bbox: BBox(C(33.8, -106.4), C(39.22, -91.08)),
    zoom: 4.0,
  );

  /// Ayeyarwady river
  static const River ayeyarwady = River(
    name: 'Ayeyarwady',
    englishName: 'Ayeyarwady',
    bbox: BBox(C(16.18, 94.74), C(25.7, 97.52)),
    zoom: 3.0,
  );

  /// Bafing river
  static const River bafing = River(
    name: 'Bafing',
    englishName: 'Bafing',
    bbox: BBox(C(10.52, -12.09), C(13.78, -10.22)),
    zoom: 4.0,
  );

  /// Bahr el  Zeraf river
  static const River bahrElZeraf = River(
    name: 'Bahr el  Zeraf',
    englishName: 'Bahr el  Zeraf',
    bbox: BBox(C(7.767, 30.54), C(9.426, 31.14)),
    zoom: 5.0,
  );

  /// Bahr el Jebel river
  static const River mountainNile = River(
    name: 'Bahr el Jebel',
    englishName: 'Mountain Nile',
    bbox: BBox(C(3.614, 31.15), C(6.83, 32.02)),
    zoom: 2.0,
  );

  /// Bahr el Jebel river
  static const River whiteNile = River(
    name: 'Bahr el Jebel',
    englishName: 'White Nile',
    bbox: BBox(C(6.83, 30.2), C(9.531, 31.15)),
    zoom: 2.0,
  );

  /// Bamingui river
  static const River bamingui = River(
    name: 'Bamingui',
    englishName: 'Bamingui',
    bbox: BBox(C(7.538, 18.89), C(8.836, 19.73)),
    zoom: 5.0,
  );

  /// Barito river
  static const River barito = River(
    name: 'Barito',
    englishName: 'Barito',
    bbox: BBox(C(-3.377, 114.1), C(0.5648, 114.9)),
    zoom: 5.0,
  );

  /// Barwon river
  static const River barwon = River(
    name: 'Barwon',
    englishName: 'Barwon',
    bbox: BBox(C(-30.12, 147.4), C(-28.56, 150.5)),
    zoom: 3.0,
  );

  /// Benue river
  static const River benue = River(
    name: 'Benue',
    englishName: 'Benue',
    bbox: BBox(C(7.788, 6.776), C(9.497, 11.92)),
    zoom: 4.0,
  );

  /// Borcea river
  static const River borcea = River(
    name: 'Borcea',
    englishName: 'Borcea',
    bbox: BBox(C(44.14, 27.27), C(44.74, 27.93)),
    zoom: 2.1,
  );

  /// Braco Menor river
  static const River bracoMenor = River(
    name: 'Braco Menor',
    englishName: 'Braco Menor',
    bbox: BBox(C(-12.85, -50.48), C(-9.73, -49.89)),
    zoom: 4.0,
  );

  /// Brahmaputra river
  static const River brahmaputra = River(
    name: 'Brahmaputra',
    englishName: 'Brahmaputra',
    bbox: BBox(C(24.33, 89.61), C(28.0, 95.44)),
    zoom: 2.1,
  );

  /// Branco river
  static const River branco = River(
    name: 'Branco',
    englishName: 'Branco',
    bbox: BBox(C(-1.389, -63.78), C(3.717, -60.52)),
    zoom: 5.0,
  );

  /// Bratul Chillia river
  static const River bratulChillia = River(
    name: 'Bratul Chillia',
    englishName: 'Bratul Chillia',
    bbox: BBox(C(45.18, 28.76), C(45.42, 29.71)),
    zoom: 2.1,
  );

  /// Bratul Sfintu Gheorghe river
  static const River bratulSfintuGheorghe = River(
    name: 'Bratul Sfintu Gheorghe',
    englishName: 'Bratul Sfintu Gheorghe',
    bbox: BBox(C(44.92, 28.88), C(45.18, 29.61)),
    zoom: 2.1,
  );

  /// Bratul Sulina river
  static const River bratulSulina = River(
    name: 'Bratul Sulina',
    englishName: 'Bratul Sulina',
    bbox: BBox(C(45.15, 28.88), C(45.18, 29.68)),
    zoom: 2.1,
  );

  /// Brazos river
  static const River brazos = River(
    name: 'Brazos',
    englishName: 'Brazos',
    bbox: BBox(C(28.9, -100.5), C(33.58, -95.38)),
    zoom: 5.0,
  );

  /// Busira river
  static const River busira = River(
    name: 'Busira',
    englishName: 'Busira',
    bbox: BBox(C(-0.2944, 18.95), C(-0.1047, 20.75)),
    zoom: 5.0,
  );

  /// Bykovskaya Protoka river
  static const River bykovskayaProtoka = River(
    name: 'Bykovskaya Protoka',
    englishName: 'Bykovskaya Protoka',
    bbox: BBox(C(72.29, 126.7), C(72.52, 127.7)),
    zoom: 2.0,
  );

  /// Bénoué river
  static const River benoue = River(
    name: 'Bénoué',
    englishName: 'Bénoué',
    bbox: BBox(C(7.777, 11.92), C(9.506, 14.0)),
    zoom: 4.0,
  );

  /// Bío-Bío river
  static const River bioBio = River(
    name: 'Bío-Bío',
    englishName: 'Bío-Bío',
    bbox: BBox(C(-38.77, -73.13), C(-36.79, -71.13)),
    zoom: 4.7,
  );

  /// Caquetá river
  static const River caqueta = River(
    name: 'Caquetá',
    englishName: 'Caquetá',
    bbox: BBox(C(-1.53, -76.54), C(1.33, -69.46)),
    zoom: 4.7,
  );

  /// Chang Jiang river
  static const River yangtze = River(
    name: 'Chang Jiang',
    englishName: 'Yangtze',
    bbox: BBox(C(28.62, 103.9), C(31.06, 113.1)),
    zoom: 2.0,
  );

  /// Chari river
  static const River chari = River(
    name: 'Chari',
    englishName: 'Chari',
    bbox: BBox(C(8.816, 15.08), C(12.08, 18.89)),
    zoom: 5.0,
  );

  /// Chattooga river
  static const River chattooga = River(
    name: 'Chattooga',
    englishName: 'Chattooga',
    bbox: BBox(C(34.71, -83.36), C(35.08, -83.12)),
    zoom: 5.0,
  );

  /// Chenab river
  static const River chenab = River(
    name: 'Chenab',
    englishName: 'Chenab',
    bbox: BBox(C(31.18, 72.14), C(33.37, 77.44)),
    zoom: 5.0,
  );

  /// Chixoy river
  static const River chixoy = River(
    name: 'Chixoy',
    englishName: 'Chixoy',
    bbox: BBox(C(15.02, -91.3), C(16.39, -90.42)),
    zoom: 4.7,
  );

  /// Chubut river
  static const River chubut = River(
    name: 'Chubut',
    englishName: 'Chubut',
    bbox: BBox(C(-43.85, -70.9), C(-42.62, -65.05)),
    zoom: 5.0,
  );

  /// Chulyshman river
  static const River chulyshman = River(
    name: 'Chulyshman',
    englishName: 'Chulyshman',
    bbox: BBox(C(50.5, 87.74), C(51.36, 89.66)),
    zoom: 5.0,
  );

  /// Coco river
  static const River coco = River(
    name: 'Coco',
    englishName: 'Coco',
    bbox: BBox(C(13.42, -86.84), C(15.01, -83.16)),
    zoom: 5.0,
  );

  /// Congo river
  static const River congo = River(
    name: 'Congo',
    englishName: 'Congo',
    bbox: BBox(C(-5.882, 13.07), C(2.178, 24.29)),
    zoom: 2.1,
  );

  /// Copper river
  static const River copper = River(
    name: 'Copper',
    englishName: 'Copper',
    bbox: BBox(C(60.67, -145.4), C(62.7, -143.7)),
    zoom: 5.0,
  );

  /// Cubango river
  static const River cubango = River(
    name: 'Cubango',
    englishName: 'Cubango',
    bbox: BBox(C(-18.06, 16.15), C(-12.63, 21.5)),
    zoom: 5.0,
  );

  /// Culuene river
  static const River culuene = River(
    name: 'Culuene',
    englishName: 'Culuene',
    bbox: BBox(C(-14.98, -54.61), C(-11.44, -52.88)),
    zoom: 4.7,
  );

  /// Dadu river
  static const River dadu = River(
    name: 'Dadu',
    englishName: 'Dadu',
    bbox: BBox(C(29.24, 100.1), C(33.01, 103.7)),
    zoom: 5.0,
  );

  /// Daly river
  static const River daly = River(
    name: 'Daly',
    englishName: 'Daly',
    bbox: BBox(C(-14.71, 130.3), C(-13.3, 131.8)),
    zoom: 5.0,
  );

  /// Damietta Branch river
  static const River damiettaBranch = River(
    name: 'Damietta Branch',
    englishName: 'Damietta Branch',
    bbox: BBox(C(30.15, 31.08), C(31.53, 31.84)),
    zoom: 2.0,
  );

  /// Danube river
  static const River danube = River(
    name: 'Danube',
    englishName: 'Danube',
    bbox: BBox(C(43.67, 17.21), C(48.06, 28.76)),
    zoom: 2.1,
  );

  /// Darling river
  static const River darling = River(
    name: 'Darling',
    englishName: 'Darling',
    bbox: BBox(C(-34.12, 141.9), C(-29.93, 147.4)),
    zoom: 3.0,
  );

  /// Daugava river
  static const River zapadnayaDvina = River(
    name: 'Daugava',
    englishName: 'Zapadnaya Dvina',
    bbox: BBox(C(55.07, 24.05), C(57.07, 32.32)),
    zoom: 4.7,
  );

  /// Desaguadero river
  static const River desaguadero = River(
    name: 'Desaguadero',
    englishName: 'Desaguadero',
    bbox: BBox(C(-38.8, -67.36), C(-32.4, -64.97)),
    zoom: 5.0,
  );

  /// Dicle river
  static const River dicle = River(
    name: 'Dicle',
    englishName: 'Dicle',
    bbox: BBox(C(37.06, 39.64), C(38.42, 42.38)),
    zoom: 4.0,
  );

  /// Digul river
  static const River digul = River(
    name: 'Digul',
    englishName: 'Digul',
    bbox: BBox(C(-7.252, 139.2), C(-4.856, 140.7)),
    zoom: 5.0,
  );

  /// Dihang river
  static const River dihang = River(
    name: 'Dihang',
    englishName: 'Dihang',
    bbox: BBox(C(28.0, 94.36), C(29.88, 95.42)),
    zoom: 2.1,
  );

  /// Dnepre river
  static const River dnepre = River(
    name: 'Dnepre',
    englishName: 'Dnepre',
    bbox: BBox(C(54.92, 33.39), C(55.87, 33.89)),
    zoom: 4.0,
  );

  /// Double Mountain Fork Brazos river
  static const River doubleMountainForkBrazos = River(
    name: 'Double Mountain Fork Brazos',
    englishName: 'Double Mountain Fork Brazos',
    bbox: BBox(C(32.9, -101.7), C(33.54, -100.5)),
    zoom: 5.0,
  );

  /// Drava river
  static const River drava = River(
    name: 'Drava',
    englishName: 'Drava',
    bbox: BBox(C(45.56, 13.82), C(47.4, 18.95)),
    zoom: 5.0,
  );

  /// Duero river
  static const River duero = River(
    name: 'Duero',
    englishName: 'Duero',
    bbox: BBox(C(41.06, -8.675), C(41.93, -2.357)),
    zoom: 5.0,
  );

  /// Ebro river
  static const River ebro = River(
    name: 'Ebro',
    englishName: 'Ebro',
    bbox: BBox(C(40.72, -4.189), C(43.01, 0.8911)),
    zoom: 4.7,
  );

  /// Elbe river
  static const River elbe = River(
    name: 'Elbe',
    englishName: 'Elbe',
    bbox: BBox(C(50.03, 13.18), C(51.47, 15.89)),
    zoom: 4.7,
  );

  /// Ertix river
  static const River irtysh = River(
    name: 'Ertix',
    englishName: 'Irtysh',
    bbox: BBox(C(46.99, 85.27), C(48.02, 90.33)),
    zoom: 2.1,
  );

  /// Euphrates river
  static const River euphrates = River(
    name: 'Euphrates',
    englishName: 'Euphrates',
    bbox: BBox(C(31.31, 40.99), C(34.51, 45.47)),
    zoom: 3.0,
  );

  /// Ferenc Csatorna river
  static const River ferencCsatorna = River(
    name: 'Ferenc Csatorna',
    englishName: 'Ferenc Csatorna',
    bbox: BBox(C(45.84, 18.84), C(46.27, 18.92)),
    zoom: 5.0,
  );

  /// Finlay river
  static const River finlay = River(
    name: 'Finlay',
    englishName: 'Finlay',
    bbox: BBox(C(56.76, -127.2), C(57.67, -124.8)),
    zoom: 5.0,
  );

  /// Fitzroy river
  static const River fitzroy = River(
    name: 'Fitzroy',
    englishName: 'Fitzroy',
    bbox: BBox(C(-18.49, 123.6), C(-17.38, 127.2)),
    zoom: 5.0,
  );

  /// Fraser river
  static const River fraser = River(
    name: 'Fraser',
    englishName: 'Fraser',
    bbox: BBox(C(49.13, -123.1), C(54.25, -118.3)),
    zoom: 4.7,
  );

  /// Ganges river
  static const River ganges = River(
    name: 'Ganges',
    englishName: 'Ganges',
    bbox: BBox(C(24.83, 78.02), C(30.89, 87.94)),
    zoom: 3.0,
  );

  /// Ariège river
  static const River ariege = River(
    name: 'Ariège',
    englishName: 'Ariège',
    bbox: BBox(C(42.63, 1.454), C(43.42, 1.825)),
    zoom: 5.0,
  );

  /// Genala river
  static const River genala = River(
    name: 'Genala',
    englishName: 'Genala',
    bbox: BBox(C(4.324, 38.72), C(6.605, 41.97)),
    zoom: 5.0,
  );

  /// Gharraf Canal river
  static const River gharrafCanal = River(
    name: 'Gharraf Canal',
    englishName: 'Gharraf Canal',
    bbox: BBox(C(30.96, 45.81), C(32.5, 46.41)),
    zoom: 4.0,
  );

  /// Gila river
  static const River gila = River(
    name: 'Gila',
    englishName: 'Gila',
    bbox: BBox(C(32.66, -111.3), C(33.58, -108.1)),
    zoom: 5.0,
  );

  /// Glomma river
  static const River glama = River(
    name: 'Glomma',
    englishName: 'Glåma',
    bbox: BBox(C(60.52, 10.62), C(62.69, 12.03)),
    zoom: 5.0,
  );

  /// Godävari river
  static const River godavari = River(
    name: 'Godävari',
    englishName: 'Godävari',
    bbox: BBox(C(16.94, 73.65), C(20.04, 81.74)),
    zoom: 4.7,
  );

  /// Great Pee Dee river
  static const River greatPeeDee = River(
    name: 'Great Pee Dee',
    englishName: 'Great Pee Dee',
    bbox: BBox(C(33.4, -80.48), C(36.23, -79.11)),
    zoom: 5.0,
  );

  /// Guaporé river
  static const River guapore = River(
    name: 'Guaporé',
    englishName: 'Guaporé',
    bbox: BBox(C(-11.91, -65.45), C(-10.39, -65.03)),
    zoom: 3.0,
  );

  /// Göta älv river
  static const River gotaAlv = River(
    name: 'Göta älv',
    englishName: 'Göta älv',
    bbox: BBox(C(57.76, 11.73), C(58.37, 12.33)),
    zoom: 5.0,
  );

  /// Hailar river
  static const River hailar = River(
    name: 'Hailar',
    englishName: 'Hailar',
    bbox: BBox(C(49.19, 117.9), C(49.85, 122.3)),
    zoom: 3.0,
  );

  /// Helmand river
  static const River helmand = River(
    name: 'Helmand',
    englishName: 'Helmand',
    bbox: BBox(C(30.19, 61.6), C(34.57, 68.49)),
    zoom: 5.0,
  );

  /// Holston river
  static const River holston = River(
    name: 'Holston',
    englishName: 'Holston',
    bbox: BBox(C(35.87, -83.97), C(37.01, -81.42)),
    zoom: 4.7,
  );

  /// Hong river
  static const River red = River(
    name: 'Hong',
    englishName: 'Red',
    bbox: BBox(C(20.29, 100.2), C(25.44, 106.5)),
    zoom: 5.0,
  );

  /// Hongshui river
  static const River hongshui = River(
    name: 'Hongshui',
    englishName: 'Hongshui',
    bbox: BBox(C(23.66, 106.9), C(25.22, 109.5)),
    zoom: 4.0,
  );

  /// Huang river
  static const River yellow = River(
    name: 'Huang',
    englishName: 'Yellow',
    bbox: BBox(C(35.02, 114.8), C(37.82, 119.0)),
    zoom: 3.0,
  );

  /// Hudson river
  static const River hudson = River(
    name: 'Hudson',
    englishName: 'Hudson',
    bbox: BBox(C(41.25, -74.18), C(44.1, -73.62)),
    zoom: 5.0,
  );

  /// Ideriyn river
  static const River ideriyn = River(
    name: 'Ideriyn',
    englishName: 'Ideriyn',
    bbox: BBox(C(48.0, 97.41), C(49.26, 100.7)),
    zoom: 2.1,
  );

  /// Indaiá river
  static const River indaia = River(
    name: 'Indaiá',
    englishName: 'Indaiá',
    bbox: BBox(C(-20.35, -46.5), C(-19.05, -45.09)),
    zoom: 4.0,
  );

  /// Indigirka river
  static const River indigirka = River(
    name: 'Indigirka',
    englishName: 'Indigirka',
    bbox: BBox(C(62.77, 141.9), C(71.23, 150.1)),
    zoom: 4.7,
  );

  /// Indragi river
  static const River indragi = River(
    name: 'Indragi',
    englishName: 'Indragi',
    bbox: BBox(C(-0.6749, 100.6), C(-0.3307, 103.4)),
    zoom: 5.0,
  );

  /// Irrawaddy Delta river
  static const River irrawaddyDelta = River(
    name: 'Irrawaddy Delta',
    englishName: 'Irrawaddy Delta',
    bbox: BBox(C(15.99, 94.66), C(17.74, 95.47)),
    zoom: 2.1,
  );

  /// Ishikari river
  static const River ishikari = River(
    name: 'Ishikari',
    englishName: 'Ishikari',
    bbox: BBox(C(43.13, 141.4), C(43.89, 143.1)),
    zoom: 5.0,
  );

  /// Ismailiya Canal river
  static const River ismailiyaCanal = River(
    name: 'Ismailiya Canal',
    englishName: 'Ismailiya Canal',
    bbox: BBox(C(30.12, 31.24), C(30.59, 32.3)),
    zoom: 5.0,
  );

  /// Japurá river
  static const River japura = River(
    name: 'Japurá',
    englishName: 'Japurá',
    bbox: BBox(C(-3.222, -69.46), C(-1.231, -64.77)),
    zoom: 4.7,
  );

  /// Jequitinhonha river
  static const River jequitinhonha = River(
    name: 'Jequitinhonha',
    englishName: 'Jequitinhonha',
    bbox: BBox(C(-18.29, -43.67), C(-15.82, -38.89)),
    zoom: 5.0,
  );

  /// Jubba river
  static const River jubba = River(
    name: 'Jubba',
    englishName: 'Jubba',
    bbox: BBox(C(-0.2507, 41.97), C(4.324, 42.75)),
    zoom: 5.0,
  );

  /// Juruena river
  static const River juruena = River(
    name: 'Juruena',
    englishName: 'Juruena',
    bbox: BBox(C(-14.53, -59.08), C(-10.98, -58.62)),
    zoom: 4.7,
  );

  /// Kadéï river
  static const River kadei = River(
    name: 'Kadéï',
    englishName: 'Kadéï',
    bbox: BBox(C(1.654, 14.24), C(5.865, 16.26)),
    zoom: 5.0,
  );

  /// Kafue river
  static const River kafue = River(
    name: 'Kafue',
    englishName: 'Kafue',
    bbox: BBox(C(-15.95, 25.95), C(-11.63, 28.97)),
    zoom: 5.0,
  );

  /// Kagera river
  static const River kagera = River(
    name: 'Kagera',
    englishName: 'Kagera',
    bbox: BBox(C(-3.365, 29.59), C(-0.9357, 31.77)),
    zoom: 2.0,
  );

  /// Kamchatka river
  static const River kamchatka = River(
    name: 'Kamchatka',
    englishName: 'Kamchatka',
    bbox: BBox(C(54.08, 157.6), C(56.4, 162.5)),
    zoom: 5.0,
  );

  /// Kapuas river
  static const River kapuas = River(
    name: 'Kapuas',
    englishName: 'Kapuas',
    bbox: BBox(C(-0.3525, 109.1), C(1.201, 113.5)),
    zoom: 5.0,
  );

  /// Kasai river
  static const River kasai = River(
    name: 'Kasai',
    englishName: 'Kasai',
    bbox: BBox(C(-11.25, 16.19), C(-3.052, 22.31)),
    zoom: 3.0,
  );

  /// Katherine river
  static const River katherine = River(
    name: 'Katherine',
    englishName: 'Katherine',
    bbox: BBox(C(-14.71, 131.8), C(-13.3, 133.2)),
    zoom: 5.0,
  );

  /// Kayan river
  static const River kayan = River(
    name: 'Kayan',
    englishName: 'Kayan',
    bbox: BBox(C(1.76, 114.8), C(2.929, 117.6)),
    zoom: 5.0,
  );

  /// Kem river
  static const River kem = River(
    name: 'Kem',
    englishName: 'Kem',
    bbox: BBox(C(63.77, 31.57), C(64.75, 32.39)),
    zoom: 5.0,
  );

  /// Khatanga river
  static const River khatanga = River(
    name: 'Khatanga',
    englishName: 'Khatanga',
    bbox: BBox(C(71.95, 102.1), C(72.78, 105.1)),
    zoom: 5.0,
  );

  /// Kheta river
  static const River kheta = River(
    name: 'Kheta',
    englishName: 'Kheta',
    bbox: BBox(C(69.84, 92.22), C(71.43, 99.51)),
    zoom: 5.0,
  );

  /// Kibali river
  static const River kibali = River(
    name: 'Kibali',
    englishName: 'Kibali',
    bbox: BBox(C(2.333, 28.59), C(3.598, 30.44)),
    zoom: 3.0,
  );

  /// Kokemäenjoki river
  static const River kokemaenjoki = River(
    name: 'Kokemäenjoki',
    englishName: 'Kokemäenjoki',
    bbox: BBox(C(61.21, 21.6), C(61.58, 22.58)),
    zoom: 5.0,
  );

  /// Kolyma river
  static const River kolyma = River(
    name: 'Kolyma',
    englishName: 'Kolyma',
    bbox: BBox(C(61.45, 145.2), C(68.79, 160.9)),
    zoom: 4.0,
  );

  /// Konqi river
  static const River konqi = River(
    name: 'Konqi',
    englishName: 'Konqi',
    bbox: BBox(C(40.63, 86.37), C(41.31, 89.39)),
    zoom: 5.0,
  );

  /// Koukourou river
  static const River koukourou = River(
    name: 'Koukourou',
    englishName: 'Koukourou',
    bbox: BBox(C(7.026, 19.73), C(7.538, 20.93)),
    zoom: 5.0,
  );

  /// Koyukuk river
  static const River koyukuk = River(
    name: 'Koyukuk',
    englishName: 'Koyukuk',
    bbox: BBox(C(64.85, -157.8), C(68.04, -150.7)),
    zoom: 5.0,
  );

  /// Kuskokwim river
  static const River kuskokwim = River(
    name: 'Kuskokwim',
    englishName: 'Kuskokwim',
    bbox: BBox(C(60.68, -161.9), C(63.08, -154.7)),
    zoom: 5.0,
  );

  /// Kwango river
  static const River kwango = River(
    name: 'Kwango',
    englishName: 'Kwango',
    bbox: BBox(C(-11.26, 16.51), C(-3.2, 18.8)),
    zoom: 5.0,
  );

  /// Kyzyl-Khem river
  static const River kyzylKhem = River(
    name: 'Kyzyl-Khem',
    englishName: 'Kyzyl-Khem',
    bbox: BBox(C(51.29, 95.78), C(51.52, 98.0)),
    zoom: 4.0,
  );

  /// Lancang river
  static const River mekong = River(
    name: 'Lancang',
    englishName: 'Mekong',
    bbox: BBox(C(17.82, 96.94), C(31.97, 102.2)),
    zoom: 2.1,
  );

  /// Lek river
  static const River lek = River(
    name: 'Lek',
    englishName: 'Lek',
    bbox: BBox(C(51.9, 4.085), C(51.99, 5.331)),
    zoom: 4.0,
  );

  /// Lena river
  static const River lena = River(
    name: 'Lena',
    englishName: 'Lena',
    bbox: BBox(C(53.84, 105.1), C(60.77, 120.6)),
    zoom: 2.0,
  );

  /// Liao river
  static const River liao = River(
    name: 'Liao',
    englishName: 'Liao',
    bbox: BBox(C(40.69, 122.1), C(43.48, 123.8)),
    zoom: 5.0,
  );

  /// Liard river
  static const River liard = River(
    name: 'Liard',
    englishName: 'Liard',
    bbox: BBox(C(59.31, -131.4), C(61.86, -121.2)),
    zoom: 5.0,
  );

  /// Limpopo river
  static const River limpopo = River(
    name: 'Limpopo',
    englishName: 'Limpopo',
    bbox: BBox(C(-25.19, 26.96), C(-22.15, 33.63)),
    zoom: 5.0,
  );

  /// Lom river
  static const River lom = River(
    name: 'Lom',
    englishName: 'Lom',
    bbox: BBox(C(4.933, 13.13), C(6.698, 14.7)),
    zoom: 5.0,
  );

  /// Lower Tunguska river
  static const River nizhnyayaTunguska = River(
    name: 'Lower Tunguska',
    englishName: 'Nizhnyaya Tunguska',
    bbox: BBox(C(57.8, 92.08), C(64.44, 108.6)),
    zoom: 4.7,
  );

  /// Lualaba river
  static const River lualaba = River(
    name: 'Lualaba',
    englishName: 'Lualaba',
    bbox: BBox(C(-11.74, 25.41), C(-8.272, 26.44)),
    zoom: 2.1,
  );

  /// Madeira river
  static const River madeira = River(
    name: 'Madeira',
    englishName: 'Madeira',
    bbox: BBox(C(-10.39, -65.42), C(-3.342, -58.69)),
    zoom: 3.0,
  );

  /// Madre de Dios river
  static const River madreDeDios = River(
    name: 'Madre de Dios',
    englishName: 'Madre de Dios',
    bbox: BBox(C(-12.66, -72.17), C(-10.39, -65.4)),
    zoom: 5.0,
  );

  /// Magdalena river
  static const River magdalena = River(
    name: 'Magdalena',
    englishName: 'Magdalena',
    bbox: BBox(C(1.896, -76.51), C(8.15, -73.79)),
    zoom: 4.0,
  );

  /// Malyy Yenisey river
  static const River malyyYenisey = River(
    name: 'Malyy Yenisey',
    englishName: 'Malyy Yenisey',
    bbox: BBox(C(51.29, 94.46), C(51.73, 95.78)),
    zoom: 4.0,
  );

  /// Mamberamo river
  static const River mamberamo = River(
    name: 'Mamberamo',
    englishName: 'Mamberamo',
    bbox: BBox(C(-3.202, 137.8), C(-1.484, 138.7)),
    zoom: 5.0,
  );

  /// Mamoré river
  static const River mamore = River(
    name: 'Mamoré',
    englishName: 'Mamoré',
    bbox: BBox(C(-15.86, -65.3), C(-11.91, -64.66)),
    zoom: 3.0,
  );

  /// Mananantanana river
  static const River mananantanana = River(
    name: 'Mananantanana',
    englishName: 'Mananantanana',
    bbox: BBox(C(-22.01, 45.65), C(-21.28, 47.17)),
    zoom: 5.0,
  );

  /// Mangoky river
  static const River mangoky = River(
    name: 'Mangoky',
    englishName: 'Mangoky',
    bbox: BBox(C(-21.89, 43.54), C(-21.32, 45.65)),
    zoom: 5.0,
  );

  /// Maquan river
  static const River damqogkanbab = River(
    name: 'Maquan',
    englishName: 'Damqogkanbab',
    bbox: BBox(C(29.13, 82.4), C(30.41, 87.66)),
    zoom: 2.1,
  );

  /// Marañón river
  static const River maranon = River(
    name: 'Marañón',
    englishName: 'Marañón',
    bbox: BBox(C(-9.913, -78.72), C(-4.433, -73.49)),
    zoom: 4.7,
  );

  /// Mendoza river
  static const River mendoza = River(
    name: 'Mendoza',
    englishName: 'Mendoza',
    bbox: BBox(C(-32.35, -70.14), C(-31.28, -69.42)),
    zoom: 5.0,
  );

  /// Meta river
  static const River meta = River(
    name: 'Meta',
    englishName: 'Meta',
    bbox: BBox(C(3.958, -73.92), C(6.29, -67.42)),
    zoom: 5.0,
  );

  /// Min river
  static const River min = River(
    name: 'Min',
    englishName: 'Min',
    bbox: BBox(C(28.78, 103.7), C(29.54, 104.6)),
    zoom: 5.0,
  );

  /// Mitchell river
  static const River mitchell = River(
    name: 'Mitchell',
    englishName: 'Mitchell',
    bbox: BBox(C(-16.48, 141.6), C(-15.2, 143.5)),
    zoom: 5.0,
  );

  /// N. Fork Kuskokwim river
  static const River nForkKuskokwim = River(
    name: 'N. Fork Kuskokwim',
    englishName: 'N. Fork Kuskokwim',
    bbox: BBox(C(63.08, -154.7), C(64.33, -151.7)),
    zoom: 5.0,
  );

  /// Nanpan river
  static const River nanpan = River(
    name: 'Nanpan',
    englishName: 'Nanpan',
    bbox: BBox(C(23.8, 103.1), C(25.88, 106.9)),
    zoom: 4.0,
  );

  /// Narmada river
  static const River narmada = River(
    name: 'Narmada',
    englishName: 'Narmada',
    bbox: BBox(C(21.75, 73.11), C(23.13, 81.57)),
    zoom: 5.0,
  );

  /// Nederrijn river
  static const River nederrijn = River(
    name: 'Nederrijn',
    englishName: 'Nederrijn',
    bbox: BBox(C(51.87, 5.331), C(51.98, 6.039)),
    zoom: 4.0,
  );

  /// Negro river
  static const River negro = River(
    name: 'Negro',
    englishName: 'Negro',
    bbox: BBox(C(-3.158, -70.34), C(2.833, -59.9)),
    zoom: 3.0,
  );

  /// Neuquén river
  static const River neuquen = River(
    name: 'Neuquén',
    englishName: 'Neuquén',
    bbox: BBox(C(-38.97, -70.8), C(-36.53, -68.01)),
    zoom: 4.0,
  );

  /// Niagara river
  static const River niagara = River(
    name: 'Niagara',
    englishName: 'Niagara',
    bbox: BBox(C(43.11, -79.07), C(43.28, -79.06)),
    zoom: 3.0,
  );

  /// Nmai river
  static const River nmai = River(
    name: 'Nmai',
    englishName: 'Nmai',
    bbox: BBox(C(25.62, 97.52), C(28.42, 98.37)),
    zoom: 3.0,
  );

  /// North Saskatchewan river
  static const River northSaskatchewan = River(
    name: 'North Saskatchewan',
    englishName: 'North Saskatchewan',
    bbox: BBox(C(51.99, -117.1), C(54.04, -108.3)),
    zoom: 4.0,
  );

  /// Nu river
  static const River nu = River(
    name: 'Nu',
    englishName: 'Nu',
    bbox: BBox(C(20.95, 96.6), C(30.45, 99.09)),
    zoom: 4.0,
  );

  /// Nu river
  static const River salween = River(
    name: 'Nu',
    englishName: 'Salween',
    bbox: BBox(C(30.44, 91.52), C(31.94, 96.6)),
    zoom: 4.0,
  );

  /// Oder river
  static const River oder = River(
    name: 'Oder',
    englishName: 'Oder',
    bbox: BBox(C(49.64, 14.13), C(53.64, 18.32)),
    zoom: 4.0,
  );

  /// Ohio river
  static const River ohio = River(
    name: 'Ohio',
    englishName: 'Ohio',
    bbox: BBox(C(38.41, -85.19), C(40.69, -79.99)),
    zoom: 3.0,
  );

  /// Okavango river
  static const River okavango = River(
    name: 'Okavango',
    englishName: 'Okavango',
    bbox: BBox(C(-21.26, 23.37), C(-19.68, 24.74)),
    zoom: 5.0,
  );

  /// Olenekskaya Protoka river
  static const River olenekskayaProtoka = River(
    name: 'Olenekskaya Protoka',
    englishName: 'Olenekskaya Protoka',
    bbox: BBox(C(72.29, 122.8), C(72.91, 126.7)),
    zoom: 2.0,
  );

  /// Olenëk river
  static const River olenek = River(
    name: 'Olenëk',
    englishName: 'Olenëk',
    bbox: BBox(C(67.12, 105.0), C(72.98, 123.7)),
    zoom: 5.0,
  );

  /// Omo river
  static const River omo = River(
    name: 'Omo',
    englishName: 'Omo',
    bbox: BBox(C(4.539, 35.91), C(9.151, 37.6)),
    zoom: 5.0,
  );

  /// Orinoco river
  static const River orinoco = River(
    name: 'Orinoco',
    englishName: 'Orinoco',
    bbox: BBox(C(2.153, -67.86), C(8.642, -62.15)),
    zoom: 3.0,
  );

  /// Ouham river
  static const River ouham = River(
    name: 'Ouham',
    englishName: 'Ouham',
    bbox: BBox(C(6.264, 15.32), C(9.316, 18.29)),
    zoom: 5.0,
  );

  /// Pamir river
  static const River pamir = River(
    name: 'Pamir',
    englishName: 'Pamir',
    bbox: BBox(C(37.03, 72.66), C(37.47, 73.6)),
    zoom: 4.7,
  );

  /// Panj river
  static const River panj = River(
    name: 'Panj',
    englishName: 'Panj',
    bbox: BBox(C(36.68, 68.21), C(38.46, 72.66)),
    zoom: 4.7,
  );

  /// Paraiba river
  static const River paraiba = River(
    name: 'Paraiba',
    englishName: 'Paraiba',
    bbox: BBox(C(-23.4, -46.02), C(-22.1, -43.14)),
    zoom: 5.0,
  );

  /// Pechora river
  static const River pechora = River(
    name: 'Pechora',
    englishName: 'Pechora',
    bbox: BBox(C(61.7, 52.13), C(67.7, 59.29)),
    zoom: 4.0,
  );

  /// Pend Oreille river
  static const River pendOreille = River(
    name: 'Pend Oreille',
    englishName: 'Pend Oreille',
    bbox: BBox(C(48.18, -117.7), C(49.03, -116.6)),
    zoom: 5.0,
  );

  /// Pilcomayo river
  static const River pilcomayo = River(
    name: 'Pilcomayo',
    englishName: 'Pilcomayo',
    bbox: BBox(C(-25.33, -66.44), C(-19.12, -57.64)),
    zoom: 5.0,
  );

  /// Po river
  static const River po = River(
    name: 'Po',
    englishName: 'Po',
    bbox: BBox(C(44.66, 7.11), C(45.22, 12.52)),
    zoom: 5.0,
  );

  /// Porcupine river
  static const River porcupine = River(
    name: 'Porcupine',
    englishName: 'Porcupine',
    bbox: BBox(C(65.65, -145.5), C(67.65, -137.5)),
    zoom: 5.0,
  );

  /// Potomac river
  static const River potomac = River(
    name: 'Potomac',
    englishName: 'Potomac',
    bbox: BBox(C(38.89, -78.33), C(39.69, -77.03)),
    zoom: 5.0,
  );

  /// Purari river
  static const River purari = River(
    name: 'Purari',
    englishName: 'Purari',
    bbox: BBox(C(-7.841, 143.5), C(-5.938, 145.3)),
    zoom: 5.0,
  );

  /// Purús river
  static const River purus = River(
    name: 'Purús',
    englishName: 'Purús',
    bbox: BBox(C(-10.91, -72.43), C(-3.676, -61.41)),
    zoom: 5.0,
  );

  /// Pánuco river
  static const River panuco = River(
    name: 'Pánuco',
    englishName: 'Pánuco',
    bbox: BBox(C(21.97, -98.59), C(22.28, -97.78)),
    zoom: 5.0,
  );

  /// Quan river
  static const River quan = River(
    name: 'Quan',
    englishName: 'Quan',
    bbox: BBox(C(23.4, 109.5), C(23.8, 110.1)),
    zoom: 4.0,
  );

  /// Rhine river
  static const River rhine = River(
    name: 'Rhine',
    englishName: 'Rhine',
    bbox: BBox(C(48.97, 4.985), C(51.89, 8.498)),
    zoom: 4.0,
  );

  /// Rosetta Branch river
  static const River rosettaBranch = River(
    name: 'Rosetta Branch',
    englishName: 'Rosetta Branch',
    bbox: BBox(C(30.12, 30.4), C(31.46, 31.24)),
    zoom: 2.0,
  );

  /// Ruki river
  static const River ruki = River(
    name: 'Ruki',
    englishName: 'Ruki',
    bbox: BBox(C(-0.2192, 18.18), C(0.08222, 18.95)),
    zoom: 5.0,
  );

  /// Ruvuma river
  static const River ruvuma = River(
    name: 'Ruvuma',
    englishName: 'Ruvuma',
    bbox: BBox(C(-11.72, 35.2), C(-10.46, 40.46)),
    zoom: 5.0,
  );

  /// S. Branch Potomac river
  static const River sBranchPotomac = River(
    name: 'S. Branch Potomac',
    englishName: 'S. Branch Potomac',
    bbox: BBox(C(38.41, -79.57), C(39.64, -78.33)),
    zoom: 5.0,
  );

  /// Saint John river
  static const River saintJohn = River(
    name: 'Saint John',
    englishName: 'Saint John',
    bbox: BBox(C(45.34, -70.26), C(47.35, -66.05)),
    zoom: 5.0,
  );

  /// Salado river
  static const River salado = River(
    name: 'Salado',
    englishName: 'Salado',
    bbox: BBox(C(-31.96, -65.87), C(-24.21, -60.61)),
    zoom: 5.0,
  );

  /// Sanaga river
  static const River sanaga = River(
    name: 'Sanaga',
    englishName: 'Sanaga',
    bbox: BBox(C(3.624, 9.766), C(4.993, 13.13)),
    zoom: 5.0,
  );

  /// Sangha river
  static const River sangha = River(
    name: 'Sangha',
    englishName: 'Sangha',
    bbox: BBox(C(-1.272, 16.09), C(1.654, 17.24)),
    zoom: 5.0,
  );

  /// Santa Cruz river
  static const River santaCruz = River(
    name: 'Santa Cruz',
    englishName: 'Santa Cruz',
    bbox: BBox(C(-50.24, -71.98), C(-50.0, -68.98)),
    zoom: 4.7,
  );

  /// Seine river
  static const River seine = River(
    name: 'Seine',
    englishName: 'Seine',
    bbox: BBox(C(47.58, 0.4393), C(49.49, 4.708)),
    zoom: 4.0,
  );

  /// Selenge (Selenga) river
  static const River selengeSelenga = River(
    name: 'Selenge (Selenga)',
    englishName: 'Selenge (Selenga)',
    bbox: BBox(C(49.26, 100.7), C(52.15, 107.6)),
    zoom: 2.1,
  );

  /// Setit river
  static const River setit = River(
    name: 'Setit',
    englishName: 'Setit',
    bbox: BBox(C(13.88, 35.86), C(14.62, 37.82)),
    zoom: 5.0,
  );

  /// Shatt al Arab river
  static const River shattAlArab = River(
    name: 'Shatt al Arab',
    englishName: 'Shatt al Arab',
    bbox: BBox(C(29.96, 47.47), C(30.97, 48.55)),
    zoom: 3.0,
  );

  /// Shiquan river
  static const River shiquan = River(
    name: 'Shiquan',
    englishName: 'Shiquan',
    bbox: BBox(C(31.4, 79.73), C(32.55, 81.64)),
    zoom: 3.0,
  );

  /// Skeena river
  static const River skeena = River(
    name: 'Skeena',
    englishName: 'Skeena',
    bbox: BBox(C(54.23, -129.6), C(57.08, -127.4)),
    zoom: 5.0,
  );

  /// Slave river
  static const River slave = River(
    name: 'Slave',
    englishName: 'Slave',
    bbox: BBox(C(59.01, -113.7), C(61.25, -111.4)),
    zoom: 2.1,
  );

  /// Songhua river
  static const River sungari = River(
    name: 'Songhua',
    englishName: 'Sungari',
    bbox: BBox(C(45.39, 124.7), C(46.83, 130.3)),
    zoom: 5.0,
  );

  /// Soroksari Duna river
  static const River soroksariDuna = River(
    name: 'Soroksari Duna',
    englishName: 'Soroksari Duna',
    bbox: BBox(C(47.03, 18.94), C(47.48, 19.1)),
    zoom: 5.0,
  );

  /// Sprague river
  static const River sprague = River(
    name: 'Sprague',
    englishName: 'Sprague',
    bbox: BBox(C(42.4, -121.9), C(42.58, -120.9)),
    zoom: 4.7,
  );

  /// St. Clair river
  static const River stClair = River(
    name: 'St. Clair',
    englishName: 'St. Clair',
    bbox: BBox(C(42.56, -82.65), C(43.02, -82.42)),
    zoom: 3.0,
  );

  /// St. Lawrence river
  static const River stLawrence = River(
    name: 'St. Lawrence',
    englishName: 'St. Lawrence',
    bbox: BBox(C(44.5, -75.79), C(45.0, -74.71)),
    zoom: 2.1,
  );

  /// Stikine river
  static const River stikine = River(
    name: 'Stikine',
    englishName: 'Stikine',
    bbox: BBox(C(56.63, -132.4), C(58.15, -127.6)),
    zoom: 4.7,
  );

  /// Susitna river
  static const River susitna = River(
    name: 'Susitna',
    englishName: 'Susitna',
    bbox: BBox(C(61.31, -150.6), C(62.86, -146.7)),
    zoom: 5.0,
  );

  /// Severnaya Dvina river
  static const River severnayaDvina = River(
    name: 'Severnaya Dvina',
    englishName: 'Severnaya Dvina',
    bbox: BBox(C(60.75, 40.41), C(64.75, 46.62)),
    zoom: 4.0,
  );

  /// Sénégal river
  static const River senegal = River(
    name: 'Sénégal',
    englishName: 'Sénégal',
    bbox: BBox(C(13.78, -16.54), C(16.68, -10.89)),
    zoom: 4.0,
  );

  /// Tanana river
  static const River tanana = River(
    name: 'Tanana',
    englishName: 'Tanana',
    bbox: BBox(C(62.03, -152.0), C(65.17, -141.4)),
    zoom: 5.0,
  );

  /// Tapajós river
  static const River tapajos = River(
    name: 'Tapajós',
    englishName: 'Tapajós',
    bbox: BBox(C(-10.98, -58.66), C(-2.385, -54.64)),
    zoom: 4.7,
  );

  /// Tarim river
  static const River tarim = River(
    name: 'Tarim',
    englishName: 'Tarim',
    bbox: BBox(C(40.47, 80.89), C(41.83, 86.75)),
    zoom: 5.0,
  );

  /// Taritatu river
  static const River taritatu = River(
    name: 'Taritatu',
    englishName: 'Taritatu',
    bbox: BBox(C(-3.711, 138.7), C(-3.191, 140.3)),
    zoom: 5.0,
  );

  /// Taz river
  static const River taz = River(
    name: 'Taz',
    englishName: 'Taz',
    bbox: BBox(C(62.64, 78.59), C(67.58, 85.62)),
    zoom: 5.0,
  );

  /// Tejo river
  static const River tagus = River(
    name: 'Tejo',
    englishName: 'Tagus',
    bbox: BBox(C(39.08, -8.792), C(39.68, -7.118)),
    zoom: 4.7,
  );

  /// Thames river
  static const River thames = River(
    name: 'Thames',
    englishName: 'Thames',
    bbox: BBox(C(51.39, -2.022), C(51.76, 0.4245)),
    zoom: 5.0,
  );

  /// Tigris river
  static const River tigris = River(
    name: 'Tigris',
    englishName: 'Tigris',
    bbox: BBox(C(31.0, 42.38), C(37.06, 47.44)),
    zoom: 4.0,
  );

  /// Tisa river
  static const River tisa = River(
    name: 'Tisa',
    englishName: 'Tisa',
    bbox: BBox(C(45.13, 20.06), C(46.26, 20.31)),
    zoom: 5.0,
  );

  /// Tisza river
  static const River tisza = River(
    name: 'Tisza',
    englishName: 'Tisza',
    bbox: BBox(C(47.94, 21.34), C(48.41, 24.34)),
    zoom: 5.0,
  );

  /// Tobol river
  static const River tobol = River(
    name: 'Tobol',
    englishName: 'Tobol',
    bbox: BBox(C(51.44, 60.91), C(58.17, 68.22)),
    zoom: 4.7,
  );

  /// Tom’ river
  static const River tom = River(
    name: 'Tom’',
    englishName: 'Tom’',
    bbox: BBox(C(53.44, 84.44), C(56.91, 89.77)),
    zoom: 5.0,
  );

  /// Tongtian river
  static const River tongtian = River(
    name: 'Tongtian',
    englishName: 'Tongtian',
    bbox: BBox(C(31.69, 92.99), C(34.74, 98.54)),
    zoom: 2.0,
  );

  /// Trofimovskaya Protoka river
  static const River trofimovskayaProtoka = River(
    name: 'Trofimovskaya Protoka',
    englishName: 'Trofimovskaya Protoka',
    bbox: BBox(C(72.35, 126.4), C(73.27, 128.3)),
    zoom: 4.7,
  );

  /// Tshuapa river
  static const River tshuapa = River(
    name: 'Tshuapa',
    englishName: 'Tshuapa',
    bbox: BBox(C(-3.177, 20.75), C(-0.1912, 24.62)),
    zoom: 5.0,
  );

  /// Tumatskaya Protoka river
  static const River tumatskayaProtoka = River(
    name: 'Tumatskaya Protoka',
    englishName: 'Tumatskaya Protoka',
    bbox: BBox(C(72.35, 126.3), C(73.33, 126.7)),
    zoom: 4.7,
  );

  /// Tuotuo river
  static const River tuotuo = River(
    name: 'Tuotuo',
    englishName: 'Tuotuo',
    bbox: BBox(C(34.09, 90.79), C(34.32, 92.99)),
    zoom: 2.0,
  );

  /// Ubangi river
  static const River ubangi = River(
    name: 'Ubangi',
    englishName: 'Ubangi',
    bbox: BBox(C(-0.5491, 17.72), C(3.679, 18.62)),
    zoom: 3.0,
  );

  /// Ucayali river
  static const River ucayali = River(
    name: 'Ucayali',
    englishName: 'Ucayali',
    bbox: BBox(C(-15.34, -75.28), C(-4.445, -71.46)),
    zoom: 2.0,
  );

  /// Uele river
  static const River uele = River(
    name: 'Uele',
    englishName: 'Uele',
    bbox: BBox(C(3.402, 18.57), C(5.127, 28.59)),
    zoom: 3.0,
  );

  /// Uruguay river
  static const River uruguay = River(
    name: 'Uruguay',
    englishName: 'Uruguay',
    bbox: BBox(C(-32.47, -58.2), C(-27.08, -49.74)),
    zoom: 5.0,
  );

  /// Usumacinta river
  static const River usumacinta = River(
    name: 'Usumacinta',
    englishName: 'Usumacinta',
    bbox: BBox(C(16.39, -92.21), C(18.2, -90.42)),
    zoom: 4.7,
  );

  /// Verde river
  static const River verde = River(
    name: 'Verde',
    englishName: 'Verde',
    bbox: BBox(C(21.66, -100.3), C(22.12, -98.59)),
    zoom: 5.0,
  );

  /// Vychegda river
  static const River vychegda = River(
    name: 'Vychegda',
    englishName: 'Vychegda',
    bbox: BBox(C(61.29, 46.59), C(62.22, 53.69)),
    zoom: 4.7,
  );

  /// Waal river
  static const River waal = River(
    name: 'Waal',
    englishName: 'Waal',
    bbox: BBox(C(51.72, 3.979), C(51.85, 4.985)),
    zoom: 4.0,
  );

  /// Wabash river
  static const River wabash = River(
    name: 'Wabash',
    englishName: 'Wabash',
    bbox: BBox(C(37.79, -88.1), C(40.87, -84.64)),
    zoom: 5.0,
  );

  /// Waitaki river
  static const River waitaki = River(
    name: 'Waitaki',
    englishName: 'Waitaki',
    bbox: BBox(C(-44.91, 170.2), C(-44.0, 171.0)),
    zoom: 5.0,
  );

  /// Weir river
  static const River weir = River(
    name: 'Weir',
    englishName: 'Weir',
    bbox: BBox(C(-29.14, 150.5), C(-28.64, 151.9)),
    zoom: 3.0,
  );

  /// Willamette river
  static const River willamette = River(
    name: 'Willamette',
    englishName: 'Willamette',
    bbox: BBox(C(43.42, -123.2), C(45.67, -122.1)),
    zoom: 5.0,
  );

  /// Xar Moron river
  static const River xarMoron = River(
    name: 'Xar Moron',
    englishName: 'Xar Moron',
    bbox: BBox(C(42.59, 117.2), C(43.42, 120.8)),
    zoom: 5.0,
  );

  /// Xi river
  static const River xi = River(
    name: 'Xi',
    englishName: 'Xi',
    bbox: BBox(C(23.08, 111.3), C(23.48, 112.8)),
    zoom: 4.0,
  );

  /// Xiliao river
  static const River xiliao = River(
    name: 'Xiliao',
    englishName: 'Xiliao',
    bbox: BBox(C(43.42, 120.8), C(43.82, 123.6)),
    zoom: 5.0,
  );

  /// Xingu river
  static const River xingu = River(
    name: 'Xingu',
    englishName: 'Xingu',
    bbox: BBox(C(-11.44, -53.44), C(-3.861, -52.01)),
    zoom: 4.7,
  );

  /// Xun river
  static const River xun = River(
    name: 'Xun',
    englishName: 'Xun',
    bbox: BBox(C(23.4, 110.1), C(23.56, 111.3)),
    zoom: 4.0,
  );

  /// Yadkin river
  static const River yadkin = River(
    name: 'Yadkin',
    englishName: 'Yadkin',
    bbox: BBox(C(36.05, -81.58), C(36.26, -80.46)),
    zoom: 5.0,
  );

  /// Yamuna river
  static const River yamuna = River(
    name: 'Yamuna',
    englishName: 'Yamuna',
    bbox: BBox(C(25.29, 77.07), C(30.92, 81.9)),
    zoom: 5.0,
  );

  /// Yarkant river
  static const River yarkant = River(
    name: 'Yarkant',
    englishName: 'Yarkant',
    bbox: BBox(C(35.52, 75.94), C(40.47, 80.89)),
    zoom: 5.0,
  );

  /// Yenisey river
  static const River yenisey = River(
    name: 'Yenisey',
    englishName: 'Yenisey',
    bbox: BBox(C(58.1, 83.11), C(70.11, 93.0)),
    zoom: 4.0,
  );

  /// Yukon river
  static const River yukon = River(
    name: 'Yukon',
    englishName: 'Yukon',
    bbox: BBox(C(61.58, -163.3), C(66.61, -145.8)),
    zoom: 3.0,
  );

  /// Za river
  static const River za = River(
    name: 'Za',
    englishName: 'Za',
    bbox: BBox(C(31.97, 94.08), C(33.21, 96.94)),
    zoom: 2.1,
  );

  /// Garonne river
  static const River garonne = River(
    name: 'Garonne',
    englishName: 'Garonne',
    bbox: BBox(C(43.42, -0.5672), C(45.0, 1.454)),
    zoom: 5.0,
  );

  /// Loire river
  static const River loire = River(
    name: 'Loire',
    englishName: 'Loire',
    bbox: BBox(C(46.99, -1.743), C(47.89, 3.083)),
    zoom: 4.7,
  );
}
