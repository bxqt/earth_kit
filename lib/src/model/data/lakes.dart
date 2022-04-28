part of 'data.dart';

/// [Lake] constants that can be used to apply a custom [LakeStyle]
/// to a given Lake or multiple Lakes.
/// 
/// All lakes were read out from the
/// (50m natural earth lakes geoJson)[https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_50m_lakes.geojson]
abstract class Lakes {
  /// Filters all lakes by the given [predicate]. Shorthand for calling `Lakes.all.where(predicate).toList()`.
  static List<Lake> where(bool Function(Lake lake) predicate) => all.where(predicate).toList();

  /// Maps each lake to a [Color].
  static Map<Lake, Color> map(Color Function(Lake lake) iterator) =>
      Map.fromIterable(all, value: (value) => iterator(value));

  /// All lakes that are visible on a 50m earth vector.
  static const List<Lake> all = [malaren, lakeLadoga, lakeBalkhash, aralSea, lAlbert, lakeTanganyika, lErie, lakeChad, lakeMalawi, lakeVictoria, lakeBaikal, lakeWinnipeg, greatSlaveLake, lOntario, greatBearLake, lStClair, vanern, lagoaMinim, lakeOkeechobee, lagoDeNicaragua, lakeTana, lagoTiticaca, lakeOnega, greatSaltLake, lakeMichigan, lakeSuperior, lakeHuron, wollastonL, lakeManitoba, lakeWinnipegosis, lakeAthabasca, lMistassini, resManicouagan, iJsselmeer, syvash, rybinskRes, issykKul, lakeOfTheWoods, lakeNipigon, reindeerLake, lakeSaimaa, oneidaL, iliamnaLake, lTahoe, lZaysan, lakeWinnebago, nettillingLake, lakeTurkana, dubawntLake, bakerLake, kaliningradskiyZaliv, zalevWislany, lakeChamplain, churchillL, saltonSea, lacLaMartre, lagoBuenosAires, lagoLlanquihue, hongzeHu, hovsgolNuur, uvsNuur, paijanne, lacMoeru, lakeKhanka, tonleSap, qinghaiHu, oYarrotoVtoroye, lakeSrednyeKuyto, lakeTharthar, razzazaLake, deadSea, pskoyskoyeO, lacStJean, cayugaL, kainjiReservoir, lakeUrmia, creeLake, kasbaL, sarygamyshKoli, lChany, alakol, lacALEauClaire, lakeNipissing, hulunNur, lBangweulu, inarijarvi, oulujarvi, lakePeipus, lKivu, lEdward, taiHu, lagunaMarChiquita, kakhovkaReservoir, kremenchukReservoir, resDeLaGrande3, resDeLaGrande2, lagoEnriquillo, lSakami, lagoArgentino, namCo, lakeTuz, scottL, oNerpichye, oYarrotoPervoye, oNeyto, oYambuto, lakeVygozero, lakeSegozerskoye, pielinen, lakePyaozero, lakeTopozero, bostenHu, lIlmen, poyangHu, daguanHu, longHu, liangziHu, silingCo, harUsNuur, lakeTaupo, lopNur, samaraReservoir, lakeGeneva, loughNeagh, vattern, lakeVan, yellowstoneLake, teshekpukLake, flatheadLake, lakeMead, lakePowell, southernIndianLake, lakeClare, smallwoodRes, lakeTaymyr, represaDeSobradinho, lagoDeIzabal, oMogotoyevo, ayakkumHu, storsjon, lStJoseph, lRukwa, namNgumReservoir, resGouin, gaoyouHu, oPyasino, danauToba, hjalmaren, lBienville, lBeloye, vanBlommesteinMeer, lakeManyara, lakeAbaya, akkajaure, lakeBalaton, fingerLakes, bearLake, utahLake, leechL, lacDesMilleLacs, resBaskatong, lagoRanco, troutLake, lagoViedma, lacTumba, poHu, buyrNuur, nganglaRingeo, tangraYumco, oKulundinskoye, siletitengizKoli, ubinskoyeL, lakeKovdozero, lakeTekapo, lakePukaki, lakeOhau, oBustakh, yamzhoYumco, oTenis, oChernoye, oBolshoyeMorskoye, oChukochye, shijiuHu, hongHu, vortsJarv, chaoHu, lakeRossignol, grandLake, gooseLake, pyramidLake, lakeSevan, weishanHu, huangtangHu, millertonLake, bluenoseL, resPipmuacan, grandL, colvilleL, hottahL, bigTroutL, troutL, lAbitibi, islandL, lNaococane, lacLaRonge, milleLacsLake, lWinnipesaukee, lakeSimcoe, godsL, hohXilHu, lakeHammar, malheurLake, tikchikLakes, hyargasNuur, lakeAssal, rainyLake, willistonL, splitLake, ftPeckLake, lakeSakakawea, lakeOahe, teslinL, lowerArrowLake, lakePendOreille, lakeChelan, blackLake, lakeLouise, lowerRedL, upperRedL, yathkyedLake, amadjuakLake, amistadRes, lagoDeChapala, lagoDeManagua, itaipuReservoir, lGatun, lakeKariba, lakeKyoga, lakeNasser, bodensee, pyhajarvi, seaOfGalilee, lakeArgyle, ngoringHu, gyaringHu, toktogulRes, langaCo, mapamYumco, lakeVolta, bratskRes, oKhantayskoye, oKeta, oLama, uddjaure, stornavan, lakeHabbaniyah, lakeSkadar, aylmerL, clintonColdenL, lakeFrancisCase, falconLake, lIleALaCrosse, wholdaiaL, tehekL, resDeCaniapiscau, kentuckyLake, jStromThurmondLake, kinbasketLake, lakeGeorge, lakeHavasu, shastaLake, pointLake, upperKlamathLake, harneyLake, chiputneticookLakes, represaDeTucuri, tresMariasReservoir, lagoColhueHuapi, shardaraBogeni, vilyuyRes, oKrasnoye, biwaKo, aishikLake, lakeClark, wheelerLake, uuregNuur, banggongCo, tengizKoli, qusmurynKoli, femunden, lakeDisappointment, lakeMackay, lakeGairdner, lakeTorrens, lakeBarlee, lakeFrome, lakeEyreSouth, lakeEyreNorth];

  /// Mälaren
  static const Lake malaren = Lake(
    name: 'Mälaren',
    nameAlt: null,
    bbox: BBox(C(59.27, 16.04), C(59.62, 17.98)),
    zoom: 2,
  );

  /// Lake Ladoga
  static const Lake lakeLadoga = Lake(
    name: 'Lake Ladoga',
    nameAlt: null,
    bbox: BBox(C(59.91, 29.82), C(61.78, 32.94)),
    zoom: 1,
  );

  /// Lake Balkhash
  static const Lake lakeBalkhash = Lake(
    name: 'Lake Balkhash',
    nameAlt: null,
    bbox: BBox(C(44.99, 73.44), C(46.82, 79.25)),
    zoom: 1,
  );

  /// Aral Sea
  static const Lake aralSea = Lake(
    name: 'Aral Sea',
    nameAlt: null,
    bbox: BBox(C(44.15, 58.23), C(46.78, 61.28)),
    zoom: 1,
  );

  /// L. Albert
  static const Lake lAlbert = Lake(
    name: 'L. Albert',
    nameAlt: null,
    bbox: BBox(C(1.021, 30.39), C(2.401, 31.47)),
    zoom: 1,
  );

  /// Lake Tanganyika
  static const Lake lakeTanganyika = Lake(
    name: 'Lake Tanganyika',
    nameAlt: null,
    bbox: BBox(C(-8.791, 29.06), C(-3.338, 31.2)),
    zoom: 1,
  );

  /// L. Erie
  static const Lake lErie = Lake(
    name: 'L. Erie',
    nameAlt: null,
    bbox: BBox(C(41.4, -83.46), C(43.11, -78.87)),
    zoom: 1,
  );

  /// Lake Chad
  static const Lake lakeChad = Lake(
    name: 'Lake Chad',
    nameAlt: null,
    bbox: BBox(C(12.88, 14.26), C(13.24, 14.74)),
    zoom: 1,
  );

  /// Lake Malawi
  static const Lake lakeMalawi = Lake(
    name: 'Lake Malawi',
    nameAlt: 'Lake Nyasa',
    bbox: BBox(C(-14.4, 33.91), C(-9.495, 35.28)),
    zoom: 1,
  );

  /// Lake Victoria
  static const Lake lakeVictoria = Lake(
    name: 'Lake Victoria',
    nameAlt: null,
    bbox: BBox(C(-2.985, 31.66), C(0.472, 34.81)),
    zoom: 1,
  );

  /// Lake Baikal
  static const Lake lakeBaikal = Lake(
    name: 'Lake Baikal',
    nameAlt: null,
    bbox: BBox(C(51.48, 103.7), C(55.78, 110.0)),
    zoom: 1,
  );

  /// Lake Winnipeg
  static const Lake lakeWinnipeg = Lake(
    name: 'Lake Winnipeg',
    nameAlt: null,
    bbox: BBox(C(50.4, -99.24), C(54.41, -96.29)),
    zoom: 1,
  );

  /// Great Slave Lake
  static const Lake greatSlaveLake = Lake(
    name: 'Great Slave Lake',
    nameAlt: null,
    bbox: BBox(C(60.84, -117.7), C(62.95, -108.9)),
    zoom: 1,
  );

  /// L. Ontario
  static const Lake lOntario = Lake(
    name: 'L. Ontario',
    nameAlt: null,
    bbox: BBox(C(43.2, -79.77), C(44.49, -75.78)),
    zoom: 1,
  );

  /// Great Bear Lake
  static const Lake greatBearLake = Lake(
    name: 'Great Bear Lake',
    nameAlt: null,
    bbox: BBox(C(64.83, -125.1), C(67.03, -117.5)),
    zoom: 1,
  );

  /// L. St. Clair
  static const Lake lStClair = Lake(
    name: 'L. St. Clair',
    nameAlt: null,
    bbox: BBox(C(42.28, -83.1), C(42.7, -82.41)),
    zoom: 1,
  );

  /// Vänern
  static const Lake vanern = Lake(
    name: 'Vänern',
    nameAlt: null,
    bbox: BBox(C(58.37, 12.31), C(59.39, 14.09)),
    zoom: 1.7,
  );

  /// Lagoa Minim
  static const Lake lagoaMinim = Lake(
    name: 'Lagoa Minim',
    nameAlt: null,
    bbox: BBox(C(-33.56, -53.62), C(-32.2, -52.59)),
    zoom: 1.7,
  );

  /// Lake Okeechobee
  static const Lake lakeOkeechobee = Lake(
    name: 'Lake Okeechobee',
    nameAlt: null,
    bbox: BBox(C(26.69, -81.08), C(27.18, -80.62)),
    zoom: 1.7,
  );

  /// Lago de Nicaragua
  static const Lake lagoDeNicaragua = Lake(
    name: 'Lago de Nicaragua',
    nameAlt: null,
    bbox: BBox(C(11.04, -85.91), C(12.11, -84.77)),
    zoom: 1.7,
  );

  /// Lake Tana
  static const Lake lakeTana = Lake(
    name: 'Lake Tana',
    nameAlt: null,
    bbox: BBox(C(11.63, 37.0), C(12.3, 37.59)),
    zoom: 1.7,
  );

  /// Lago Titicaca
  static const Lake lagoTiticaca = Lake(
    name: 'Lago Titicaca',
    nameAlt: null,
    bbox: BBox(C(-16.59, -70.02), C(-15.26, -68.59)),
    zoom: 1.7,
  );

  /// Lake Onega
  static const Lake lakeOnega = Lake(
    name: 'Lake Onega',
    nameAlt: null,
    bbox: BBox(C(60.87, 33.94), C(62.92, 36.43)),
    zoom: 1.7,
  );

  /// Great Salt Lake
  static const Lake greatSaltLake = Lake(
    name: 'Great Salt Lake',
    nameAlt: null,
    bbox: BBox(C(40.7, -113.0), C(41.67, -112.0)),
    zoom: 1.7,
  );

  /// Lake Michigan
  static const Lake lakeMichigan = Lake(
    name: 'Lake Michigan',
    nameAlt: null,
    bbox: BBox(C(41.64, -88.03), C(46.11, -84.76)),
    zoom: 1.7,
  );

  /// Lake Superior
  static const Lake lakeSuperior = Lake(
    name: 'Lake Superior',
    nameAlt: null,
    bbox: BBox(C(46.44, -92.11), C(49.0, -84.34)),
    zoom: 1.7,
  );

  /// Lake Huron
  static const Lake lakeHuron = Lake(
    name: 'Lake Huron',
    nameAlt: null,
    bbox: BBox(C(43.02, -84.76), C(46.56, -79.68)),
    zoom: 1.7,
  );

  /// Wollaston L.
  static const Lake wollastonL = Lake(
    name: 'Wollaston L.',
    nameAlt: null,
    bbox: BBox(C(57.69, -103.8), C(58.55, -102.8)),
    zoom: 2,
  );

  /// Lake Manitoba
  static const Lake lakeManitoba = Lake(
    name: 'Lake Manitoba',
    nameAlt: null,
    bbox: BBox(C(50.2, -99.55), C(51.78, -97.95)),
    zoom: 2,
  );

  /// Lake Winnipegosis
  static const Lake lakeWinnipegosis = Lake(
    name: 'Lake Winnipegosis',
    nameAlt: null,
    bbox: BBox(C(51.59, -101.1), C(53.17, -99.62)),
    zoom: 2,
  );

  /// Lake Athabasca
  static const Lake lakeAthabasca = Lake(
    name: 'Lake Athabasca',
    nameAlt: null,
    bbox: BBox(C(58.5, -111.3), C(59.6, -106.0)),
    zoom: 2,
  );

  /// L. Mistassini
  static const Lake lMistassini = Lake(
    name: 'L. Mistassini',
    nameAlt: null,
    bbox: BBox(C(50.04, -74.22), C(51.4, -72.69)),
    zoom: 2,
  );

  /// Rés. Manicouagan
  static const Lake resManicouagan = Lake(
    name: 'Rés. Manicouagan',
    nameAlt: null,
    bbox: BBox(C(50.72, -69.25), C(51.88, -68.2)),
    zoom: 2,
  );

  /// IJsselmeer
  static const Lake iJsselmeer = Lake(
    name: 'IJsselmeer',
    nameAlt: null,
    bbox: BBox(C(52.25, 5.014), C(53.06, 5.87)),
    zoom: 2,
  );

  /// Syvash
  static const Lake syvash = Lake(
    name: 'Syvash',
    nameAlt: null,
    bbox: BBox(C(45.26, 33.7), C(46.27, 35.44)),
    zoom: 2,
  );

  /// Rybinsk Res.
  static const Lake rybinskRes = Lake(
    name: 'Rybinsk Res.',
    nameAlt: null,
    bbox: BBox(C(58.02, 37.15), C(59.21, 39.01)),
    zoom: 2,
  );

  /// Issyk-Kul
  static const Lake issykKul = Lake(
    name: 'Issyk-Kul',
    nameAlt: 'Ysyk Köl',
    bbox: BBox(C(42.17, 76.22), C(42.73, 78.3)),
    zoom: 2,
  );

  /// Lake of the Woods
  static const Lake lakeOfTheWoods = Lake(
    name: 'Lake of the Woods',
    nameAlt: null,
    bbox: BBox(C(48.86, -95.32), C(49.99, -94.04)),
    zoom: 2,
  );

  /// Lake Nipigon
  static const Lake lakeNipigon = Lake(
    name: 'Lake Nipigon',
    nameAlt: null,
    bbox: BBox(C(49.39, -89.09), C(50.29, -88.03)),
    zoom: 2,
  );

  /// Reindeer Lake
  static const Lake reindeerLake = Lake(
    name: 'Reindeer Lake',
    nameAlt: null,
    bbox: BBox(C(56.28, -103.3), C(58.11, -101.5)),
    zoom: 2,
  );

  /// Lake Saimaa
  static const Lake lakeSaimaa = Lake(
    name: 'Lake Saimaa',
    nameAlt: null,
    bbox: BBox(C(61.07, 26.9), C(63.58, 29.98)),
    zoom: 2,
  );

  /// Oneida L.
  static const Lake oneidaL = Lake(
    name: 'Oneida L.',
    nameAlt: null,
    bbox: BBox(C(43.18, -76.1), C(43.26, -75.73)),
    zoom: 3,
  );

  /// Iliamna Lake
  static const Lake iliamnaLake = Lake(
    name: 'Iliamna Lake',
    nameAlt: null,
    bbox: BBox(C(59.33, -155.9), C(59.79, -154.0)),
    zoom: 3,
  );

  /// L. Tahoe
  static const Lake lTahoe = Lake(
    name: 'L. Tahoe',
    nameAlt: null,
    bbox: BBox(C(38.95, -120.1), C(39.25, -119.9)),
    zoom: 3,
  );

  /// L. Zaysan
  static const Lake lZaysan = Lake(
    name: 'L. Zaysan',
    nameAlt: null,
    bbox: BBox(C(47.7, 83.03), C(49.73, 84.52)),
    zoom: 3,
  );

  /// Lake Winnebago
  static const Lake lakeWinnebago = Lake(
    name: 'Lake Winnebago',
    nameAlt: null,
    bbox: BBox(C(43.81, -88.52), C(44.2, -88.32)),
    zoom: 3,
  );

  /// Nettilling Lake
  static const Lake nettillingLake = Lake(
    name: 'Nettilling Lake',
    nameAlt: null,
    bbox: BBox(C(65.95, -71.44), C(67.03, -69.22)),
    zoom: 3,
  );

  /// Lake Turkana
  static const Lake lakeTurkana = Lake(
    name: 'Lake Turkana',
    nameAlt: null,
    bbox: BBox(C(2.405, 35.85), C(4.654, 36.7)),
    zoom: 3,
  );

  /// Dubawnt Lake
  static const Lake dubawntLake = Lake(
    name: 'Dubawnt Lake',
    nameAlt: null,
    bbox: BBox(C(62.66, -102.2), C(63.55, -100.6)),
    zoom: 3,
  );

  /// Baker Lake
  static const Lake bakerLake = Lake(
    name: 'Baker Lake',
    nameAlt: null,
    bbox: BBox(C(64.0, -96.27), C(64.32, -94.22)),
    zoom: 3,
  );

  /// Kaliningradskiy Zaliv
  static const Lake kaliningradskiyZaliv = Lake(
    name: 'Kaliningradskiy Zaliv',
    nameAlt: null,
    bbox: BBox(C(54.43, 19.72), C(54.71, 20.4)),
    zoom: 3,
  );

  /// Zalev Wislany
  static const Lake zalevWislany = Lake(
    name: 'Zalev Wislany',
    nameAlt: null,
    bbox: BBox(C(54.27, 19.25), C(54.48, 19.76)),
    zoom: 3,
  );

  /// Lake Champlain
  static const Lake lakeChamplain = Lake(
    name: 'Lake Champlain',
    nameAlt: null,
    bbox: BBox(C(43.76, -73.45), C(45.08, -73.09)),
    zoom: 3,
  );

  /// Churchill L.
  static const Lake churchillL = Lake(
    name: 'Churchill L.',
    nameAlt: null,
    bbox: BBox(C(55.55, -109.2), C(56.81, -108.1)),
    zoom: 3,
  );

  /// Salton Sea
  static const Lake saltonSea = Lake(
    name: 'Salton Sea',
    nameAlt: null,
    bbox: BBox(C(33.14, -116.1), C(33.52, -115.6)),
    zoom: 3,
  );

  /// Lac la Martre
  static const Lake lacLaMartre = Lake(
    name: 'Lac la Martre',
    nameAlt: null,
    bbox: BBox(C(63.11, -118.6), C(63.57, -117.3)),
    zoom: 3,
  );

  /// Lago Buenos Aires
  static const Lake lagoBuenosAires = Lake(
    name: 'Lago Buenos Aires',
    nameAlt: null,
    bbox: BBox(C(-47.01, -72.9), C(-46.3, -71.17)),
    zoom: 3,
  );

  /// Lago Llanquihue
  static const Lake lagoLlanquihue = Lake(
    name: 'Lago Llanquihue',
    nameAlt: null,
    bbox: BBox(C(-41.29, -72.99), C(-40.97, -72.6)),
    zoom: 3,
  );

  /// Hongze Hu
  static const Lake hongzeHu = Lake(
    name: 'Hongze Hu',
    nameAlt: null,
    bbox: BBox(C(32.88, 117.8), C(33.64, 118.9)),
    zoom: 3,
  );

  /// Hövsgöl Nuur
  static const Lake hovsgolNuur = Lake(
    name: 'Hövsgöl Nuur',
    nameAlt: null,
    bbox: BBox(C(50.49, 100.2), C(51.61, 100.8)),
    zoom: 3,
  );

  /// Uvs Nuur
  static const Lake uvsNuur = Lake(
    name: 'Uvs Nuur',
    nameAlt: null,
    bbox: BBox(C(50.01, 92.24), C(50.66, 93.36)),
    zoom: 3,
  );

  /// Päijänne
  static const Lake paijanne = Lake(
    name: 'Päijänne',
    nameAlt: null,
    bbox: BBox(C(60.96, 25.19), C(63.22, 27.09)),
    zoom: 3,
  );

  /// Lac Moeru
  static const Lake lacMoeru = Lake(
    name: 'Lac Moeru',
    nameAlt: null,
    bbox: BBox(C(-9.505, 28.32), C(-8.513, 29.13)),
    zoom: 3,
  );

  /// Lake Khanka
  static const Lake lakeKhanka = Lake(
    name: 'Lake Khanka',
    nameAlt: 'Xingkai Hu,  Ozero Khanka',
    bbox: BBox(C(44.53, 132.0), C(45.33, 132.8)),
    zoom: 3,
  );

  /// Tonle Sap
  static const Lake tonleSap = Lake(
    name: 'Tonle Sap',
    nameAlt: null,
    bbox: BBox(C(12.43, 103.7), C(13.25, 104.6)),
    zoom: 3,
  );

  /// Qinghai Hu
  static const Lake qinghaiHu = Lake(
    name: 'Qinghai Hu',
    nameAlt: null,
    bbox: BBox(C(36.56, 99.65), C(37.22, 100.8)),
    zoom: 3,
  );

  /// O. Yarroto Vtoroye
  static const Lake oYarrotoVtoroye = Lake(
    name: 'O. Yarroto Vtoroye',
    nameAlt: 'L. Yarroto Vtoroye',
    bbox: BBox(C(67.99, 70.93), C(68.1, 71.38)),
    zoom: 3,
  );

  /// Lake Srednye Kuyto
  static const Lake lakeSrednyeKuyto = Lake(
    name: 'Lake Srednye Kuyto',
    nameAlt: null,
    bbox: BBox(C(64.86, 30.36), C(65.18, 31.95)),
    zoom: 3,
  );

  /// Lake Tharthar
  static const Lake lakeTharthar = Lake(
    name: 'Lake Tharthar',
    nameAlt: null,
    bbox: BBox(C(33.71, 43.07), C(34.33, 43.49)),
    zoom: 3,
  );

  /// Razzaza Lake
  static const Lake razzazaLake = Lake(
    name: 'Razzaza Lake',
    nameAlt: null,
    bbox: BBox(C(32.53, 43.42), C(33.08, 43.88)),
    zoom: 3,
  );

  /// Dead Sea
  static const Lake deadSea = Lake(
    name: 'Dead Sea',
    nameAlt: null,
    bbox: BBox(C(31.33, 35.4), C(31.77, 35.59)),
    zoom: 3,
  );

  /// Pskoyskoye O.
  static const Lake pskoyskoyeO = Lake(
    name: 'Pskoyskoye O.',
    nameAlt: null,
    bbox: BBox(C(57.86, 27.5), C(58.21, 28.17)),
    zoom: 3,
  );

  /// Lac St.-Jean
  static const Lake lacStJean = Lake(
    name: 'Lac St.-Jean',
    nameAlt: null,
    bbox: BBox(C(48.44, -72.33), C(48.76, -71.77)),
    zoom: 4,
  );

  /// Cayuga L.
  static const Lake cayugaL = Lake(
    name: 'Cayuga L.',
    nameAlt: null,
    bbox: BBox(C(42.43, -77.2), C(42.65, -77.06)),
    zoom: 4,
  );

  /// Kainji Reservoir
  static const Lake kainjiReservoir = Lake(
    name: 'Kainji Reservoir',
    nameAlt: null,
    bbox: BBox(C(9.865, 4.4), C(10.64, 4.685)),
    zoom: 4,
  );

  /// Lake Urmia
  static const Lake lakeUrmia = Lake(
    name: 'Lake Urmia',
    nameAlt: null,
    bbox: BBox(C(37.13, 45.02), C(38.26, 45.86)),
    zoom: 4,
  );

  /// Cree Lake
  static const Lake creeLake = Lake(
    name: 'Cree Lake',
    nameAlt: null,
    bbox: BBox(C(57.22, -107.1), C(57.71, -106.1)),
    zoom: 4,
  );

  /// Kasba L.
  static const Lake kasbaL = Lake(
    name: 'Kasba L.',
    nameAlt: null,
    bbox: BBox(C(59.93, -102.6), C(60.65, -101.8)),
    zoom: 4,
  );

  /// Sarygamysh Köli
  static const Lake sarygamyshKoli = Lake(
    name: 'Sarygamysh Köli',
    nameAlt: null,
    bbox: BBox(C(41.57, 57.05), C(42.33, 57.87)),
    zoom: 4,
  );

  /// L. Chany
  static const Lake lChany = Lake(
    name: 'L. Chany',
    nameAlt: null,
    bbox: BBox(C(54.61, 76.73), C(55.06, 78.05)),
    zoom: 4,
  );

  /// Alaköl
  static const Lake alakol = Lake(
    name: 'Alaköl',
    nameAlt: null,
    bbox: BBox(C(45.76, 81.4), C(46.46, 82.13)),
    zoom: 4,
  );

  /// Lac à l’ Eau Claire
  static const Lake lacALEauClaire = Lake(
    name: 'Lac à l’ Eau Claire',
    nameAlt: null,
    bbox: BBox(C(55.94, -74.82), C(56.34, -73.99)),
    zoom: 4,
  );

  /// Lake Nipissing
  static const Lake lakeNipissing = Lake(
    name: 'Lake Nipissing',
    nameAlt: null,
    bbox: BBox(C(46.16, -80.45), C(46.36, -79.44)),
    zoom: 4,
  );

  /// Hulun Nur
  static const Lake hulunNur = Lake(
    name: 'Hulun Nur',
    nameAlt: null,
    bbox: BBox(C(48.56, 117.0), C(49.35, 118.0)),
    zoom: 4,
  );

  /// L. Bangweulu
  static const Lake lBangweulu = Lake(
    name: 'L. Bangweulu',
    nameAlt: null,
    bbox: BBox(C(-11.42, 29.5), C(-10.88, 30.02)),
    zoom: 4,
  );

  /// Inarijärvi
  static const Lake inarijarvi = Lake(
    name: 'Inarijärvi',
    nameAlt: null,
    bbox: BBox(C(68.71, 27.16), C(69.42, 28.76)),
    zoom: 4,
  );

  /// Oulujärvi
  static const Lake oulujarvi = Lake(
    name: 'Oulujärvi',
    nameAlt: null,
    bbox: BBox(C(64.12, 26.78), C(64.53, 28.19)),
    zoom: 4,
  );

  /// Lake Peipus
  static const Lake lakePeipus = Lake(
    name: 'Lake Peipus',
    nameAlt: 'Lake Peipsi-Pihkva',
    bbox: BBox(C(58.18, 26.97), C(59.01, 27.82)),
    zoom: 4,
  );

  /// L. Kivu
  static const Lake lKivu = Lake(
    name: 'L. Kivu',
    nameAlt: null,
    bbox: BBox(C(-2.448, 28.85), C(-1.605, 29.36)),
    zoom: 4,
  );

  /// L. Edward
  static const Lake lEdward = Lake(
    name: 'L. Edward',
    nameAlt: null,
    bbox: BBox(C(-0.6399, 29.33), C(-0.1197, 29.89)),
    zoom: 4,
  );

  /// Tai Hu
  static const Lake taiHu = Lake(
    name: 'Tai Hu',
    nameAlt: null,
    bbox: BBox(C(30.94, 119.9), C(31.53, 120.6)),
    zoom: 4,
  );

  /// Laguna Mar Chiquita
  static const Lake lagunaMarChiquita = Lake(
    name: 'Laguna Mar Chiquita',
    nameAlt: null,
    bbox: BBox(C(-30.92, -62.98), C(-30.52, -62.23)),
    zoom: 4,
  );

  /// Kakhovka Reservoir
  static const Lake kakhovkaReservoir = Lake(
    name: 'Kakhovka Reservoir',
    nameAlt: null,
    bbox: BBox(C(46.82, 33.54), C(47.84, 35.3)),
    zoom: 4,
  );

  /// Kremenchuk Reservoir
  static const Lake kremenchukReservoir = Lake(
    name: 'Kremenchuk Reservoir',
    nameAlt: null,
    bbox: BBox(C(48.99, 31.89), C(49.57, 33.19)),
    zoom: 4,
  );

  /// Rés. de La Grande 3
  static const Lake resDeLaGrande3 = Lake(
    name: 'Rés. de La Grande 3',
    nameAlt: null,
    bbox: BBox(C(53.47, -76.12), C(53.9, -74.43)),
    zoom: 4,
  );

  /// Rés. de La Grande 2
  static const Lake resDeLaGrande2 = Lake(
    name: 'Rés. de La Grande 2',
    nameAlt: null,
    bbox: BBox(C(53.49, -77.69), C(54.19, -76.09)),
    zoom: 4,
  );

  /// Lago Enriquillo
  static const Lake lagoEnriquillo = Lake(
    name: 'Lago Enriquillo',
    nameAlt: null,
    bbox: BBox(C(18.42, -71.79), C(18.55, -71.51)),
    zoom: 4,
  );

  /// L. Sakami
  static const Lake lSakami = Lake(
    name: 'L. Sakami',
    nameAlt: null,
    bbox: BBox(C(52.97, -76.94), C(53.48, -76.5)),
    zoom: 4,
  );

  /// Lago Argentino
  static const Lake lagoArgentino = Lake(
    name: 'Lago Argentino',
    nameAlt: null,
    bbox: BBox(C(-50.62, -73.3), C(-49.98, -71.98)),
    zoom: 4,
  );

  /// Nam Co
  static const Lake namCo = Lake(
    name: 'Nam Co',
    nameAlt: null,
    bbox: BBox(C(30.52, 90.29), C(30.92, 91.01)),
    zoom: 4,
  );

  /// Lake Tuz
  static const Lake lakeTuz = Lake(
    name: 'Lake Tuz',
    nameAlt: null,
    bbox: BBox(C(38.52, 33.16), C(39.13, 33.67)),
    zoom: 4,
  );

  /// Scott L.
  static const Lake scottL = Lake(
    name: 'Scott L.',
    nameAlt: null,
    bbox: BBox(C(59.8, -106.4), C(60.23, -105.7)),
    zoom: 4,
  );

  /// O. Nerpich'ye
  static const Lake oNerpichye = Lake(
    name: "O. Nerpich'ye",
    nameAlt: "L. Nerpich'ye",
    bbox: BBox(C(69.23, 159.8), C(69.38, 160.5)),
    zoom: 4,
  );

  /// O. Yarroto Pervoye
  static const Lake oYarrotoPervoye = Lake(
    name: 'O. Yarroto Pervoye',
    nameAlt: 'L. Yarroto Pervoye',
    bbox: BBox(C(67.87, 71.3), C(68.04, 71.79)),
    zoom: 4,
  );

  /// O. Neyto
  static const Lake oNeyto = Lake(
    name: 'O. Neyto',
    nameAlt: 'L. Neyto',
    bbox: BBox(C(70.01, 70.13), C(70.14, 70.51)),
    zoom: 4,
  );

  /// O. Yambuto
  static const Lake oYambuto = Lake(
    name: 'O. Yambuto',
    nameAlt: 'L. Yambuto',
    bbox: BBox(C(69.95, 70.75), C(70.14, 71.06)),
    zoom: 4,
  );

  /// Lake Vygozero
  static const Lake lakeVygozero = Lake(
    name: 'Lake Vygozero',
    nameAlt: null,
    bbox: BBox(C(62.92, 34.21), C(63.85, 35.41)),
    zoom: 4,
  );

  /// Lake Segozerskoye
  static const Lake lakeSegozerskoye = Lake(
    name: 'Lake Segozerskoye',
    nameAlt: null,
    bbox: BBox(C(63.19, 33.26), C(63.49, 34.07)),
    zoom: 4,
  );

  /// Pielinen
  static const Lake pielinen = Lake(
    name: 'Pielinen',
    nameAlt: null,
    bbox: BBox(C(62.72, 29.04), C(63.57, 30.33)),
    zoom: 4,
  );

  /// Lake Pyaozero
  static const Lake lakePyaozero = Lake(
    name: 'Lake Pyaozero',
    nameAlt: null,
    bbox: BBox(C(65.91, 30.65), C(66.27, 31.33)),
    zoom: 4,
  );

  /// Lake Topozero
  static const Lake lakeTopozero = Lake(
    name: 'Lake Topozero',
    nameAlt: null,
    bbox: BBox(C(65.39, 31.51), C(65.89, 32.71)),
    zoom: 4,
  );

  /// Bosten Hu
  static const Lake bostenHu = Lake(
    name: 'Bosten Hu',
    nameAlt: null,
    bbox: BBox(C(41.83, 86.73), C(42.11, 87.38)),
    zoom: 4,
  );

  /// L. Il’men’
  static const Lake lIlmen = Lake(
    name: 'L. Il’men’',
    nameAlt: null,
    bbox: BBox(C(58.14, 30.86), C(58.48, 31.69)),
    zoom: 4,
  );

  /// Poyang Hu
  static const Lake poyangHu = Lake(
    name: 'Poyang Hu',
    nameAlt: null,
    bbox: BBox(C(28.8, 116.0), C(29.75, 116.7)),
    zoom: 4,
  );

  /// Daguan Hu
  static const Lake daguanHu = Lake(
    name: 'Daguan Hu',
    nameAlt: null,
    bbox: BBox(C(29.96, 116.3), C(30.09, 116.5)),
    zoom: 4,
  );

  /// Long Hu
  static const Lake longHu = Lake(
    name: 'Long Hu',
    nameAlt: null,
    bbox: BBox(C(29.88, 116.0), C(30.06, 116.3)),
    zoom: 4,
  );

  /// Liangzi Hu
  static const Lake liangziHu = Lake(
    name: 'Liangzi Hu',
    nameAlt: null,
    bbox: BBox(C(30.08, 114.4), C(30.37, 114.6)),
    zoom: 4,
  );

  /// Siling Co
  static const Lake silingCo = Lake(
    name: 'Siling Co',
    nameAlt: null,
    bbox: BBox(C(31.6, 88.57), C(31.92, 89.32)),
    zoom: 4,
  );

  /// Har Us Nuur
  static const Lake harUsNuur = Lake(
    name: 'Har Us Nuur',
    nameAlt: null,
    bbox: BBox(C(47.77, 91.98), C(48.36, 92.8)),
    zoom: 4,
  );

  /// Lake Taupo
  static const Lake lakeTaupo = Lake(
    name: 'Lake Taupo',
    nameAlt: null,
    bbox: BBox(C(-38.95, 175.7), C(-38.68, 176.1)),
    zoom: 4,
  );

  /// Lop Nur
  static const Lake lopNur = Lake(
    name: 'Lop Nur',
    nameAlt: null,
    bbox: BBox(C(40.19, 90.09), C(40.83, 90.44)),
    zoom: 4,
  );

  /// Samara Reservoir
  static const Lake samaraReservoir = Lake(
    name: 'Samara Reservoir',
    nameAlt: 'Kuybyshev Reservoir',
    bbox: BBox(C(53.27, 48.38), C(55.83, 51.94)),
    zoom: 4,
  );

  /// Lake Geneva
  static const Lake lakeGeneva = Lake(
    name: 'Lake Geneva',
    nameAlt: 'Lac Léman',
    bbox: BBox(C(46.2, 6.133), C(46.53, 6.874)),
    zoom: 4,
  );

  /// Lough Neagh
  static const Lake loughNeagh = Lake(
    name: 'Lough Neagh',
    nameAlt: null,
    bbox: BBox(C(54.5, -6.585), C(54.72, -6.272)),
    zoom: 4,
  );

  /// Vättern
  static const Lake vattern = Lake(
    name: 'Vättern',
    nameAlt: null,
    bbox: BBox(C(57.8, 14.12), C(58.85, 14.97)),
    zoom: 4,
  );

  /// Lake Van
  static const Lake lakeVan = Lake(
    name: 'Lake Van',
    nameAlt: null,
    bbox: BBox(C(38.33, 42.35), C(38.99, 43.61)),
    zoom: 4,
  );

  /// Yellowstone Lake
  static const Lake yellowstoneLake = Lake(
    name: 'Yellowstone Lake',
    nameAlt: null,
    bbox: BBox(C(44.32, -110.6), C(44.57, -110.2)),
    zoom: 4,
  );

  /// Teshekpuk Lake
  static const Lake teshekpukLake = Lake(
    name: 'Teshekpuk Lake',
    nameAlt: null,
    bbox: BBox(C(70.48, -154.3), C(70.74, -152.9)),
    zoom: 4,
  );

  /// Flathead Lake
  static const Lake flatheadLake = Lake(
    name: 'Flathead Lake',
    nameAlt: null,
    bbox: BBox(C(47.71, -114.3), C(48.09, -114.0)),
    zoom: 4,
  );

  /// Lake Mead
  static const Lake lakeMead = Lake(
    name: 'Lake Mead',
    nameAlt: null,
    bbox: BBox(C(35.83, -114.8), C(36.52, -113.6)),
    zoom: 4,
  );

  /// Lake Powell
  static const Lake lakePowell = Lake(
    name: 'Lake Powell',
    nameAlt: null,
    bbox: BBox(C(36.92, -111.5), C(37.91, -110.4)),
    zoom: 4,
  );

  /// Southern Indian Lake
  static const Lake southernIndianLake = Lake(
    name: 'Southern Indian Lake',
    nameAlt: null,
    bbox: BBox(C(56.64, -99.69), C(57.65, -97.99)),
    zoom: 4,
  );

  /// Lake Clare
  static const Lake lakeClare = Lake(
    name: 'Lake Clare',
    nameAlt: null,
    bbox: BBox(C(58.3, -112.4), C(58.82, -111.7)),
    zoom: 4,
  );

  /// Smallwood Res.
  static const Lake smallwoodRes = Lake(
    name: 'Smallwood Res.',
    nameAlt: null,
    bbox: BBox(C(53.42, -66.62), C(55.1, -63.1)),
    zoom: 4,
  );

  /// Lake Taymyr
  static const Lake lakeTaymyr = Lake(
    name: 'Lake Taymyr',
    nameAlt: null,
    bbox: BBox(C(73.84, 99.51), C(75.16, 105.3)),
    zoom: 4,
  );

  /// Represa de Sobradinho
  static const Lake represaDeSobradinho = Lake(
    name: 'Represa de Sobradinho',
    nameAlt: null,
    bbox: BBox(C(-11.26, -43.16), C(-9.004, -40.82)),
    zoom: 4,
  );

  /// Lago de Izabal
  static const Lake lagoDeIzabal = Lake(
    name: 'Lago de Izabal',
    nameAlt: null,
    bbox: BBox(C(15.38, -89.39), C(15.77, -88.84)),
    zoom: 4.7,
  );

  /// O. Mogotoyevo
  static const Lake oMogotoyevo = Lake(
    name: 'O. Mogotoyevo',
    nameAlt: 'L. Mogotoyevo',
    bbox: BBox(C(71.91, 148.9), C(72.16, 149.3)),
    zoom: 4.7,
  );

  /// Ayakkum Hu
  static const Lake ayakkumHu = Lake(
    name: 'Ayakkum Hu',
    nameAlt: null,
    bbox: BBox(C(37.49, 89.08), C(37.63, 89.65)),
    zoom: 4.7,
  );

  /// Storsjön
  static const Lake storsjon = Lake(
    name: 'Storsjön',
    nameAlt: null,
    bbox: BBox(C(62.83, 13.97), C(63.33, 14.67)),
    zoom: 4.7,
  );

  /// L. St. Joseph
  static const Lake lStJoseph = Lake(
    name: 'L. St. Joseph',
    nameAlt: null,
    bbox: BBox(C(50.92, -91.37), C(51.21, -90.43)),
    zoom: 4.7,
  );

  /// L. Rukwa
  static const Lake lRukwa = Lake(
    name: 'L. Rukwa',
    nameAlt: null,
    bbox: BBox(C(-8.09, 31.79), C(-7.585, 32.53)),
    zoom: 4.7,
  );

  /// Nam Ngum Reservoir
  static const Lake namNgumReservoir = Lake(
    name: 'Nam Ngum Reservoir',
    nameAlt: null,
    bbox: BBox(C(18.45, 102.5), C(18.76, 102.9)),
    zoom: 4.7,
  );

  /// Rés. Gouin
  static const Lake resGouin = Lake(
    name: 'Rés. Gouin',
    nameAlt: null,
    bbox: BBox(C(48.29, -75.41), C(48.8, -74.1)),
    zoom: 4.7,
  );

  /// Gaoyou Hu
  static const Lake gaoyouHu = Lake(
    name: 'Gaoyou Hu',
    nameAlt: null,
    bbox: BBox(C(32.69, 118.9), C(33.2, 119.4)),
    zoom: 4.7,
  );

  /// O. Pyasino
  static const Lake oPyasino = Lake(
    name: 'O. Pyasino',
    nameAlt: 'L. Pyasino',
    bbox: BBox(C(69.48, 87.35), C(70.1, 88.16)),
    zoom: 4.7,
  );

  /// Danau Toba
  static const Lake danauToba = Lake(
    name: 'Danau Toba',
    nameAlt: null,
    bbox: BBox(C(2.344, 98.53), C(2.876, 99.14)),
    zoom: 4.7,
  );

  /// Hjälmaren
  static const Lake hjalmaren = Lake(
    name: 'Hjälmaren',
    nameAlt: null,
    bbox: BBox(C(59.15, 15.34), C(59.32, 16.41)),
    zoom: 4.7,
  );

  /// L. Bienville
  static const Lake lBienville = Lake(
    name: 'L. Bienville',
    nameAlt: null,
    bbox: BBox(C(54.9, -73.6), C(55.28, -72.23)),
    zoom: 4.7,
  );

  /// L. Beloye
  static const Lake lBeloye = Lake(
    name: 'L. Beloye',
    nameAlt: null,
    bbox: BBox(C(60.08, 37.23), C(60.33, 38.0)),
    zoom: 4.7,
  );

  /// Van Blommestein Meer
  static const Lake vanBlommesteinMeer = Lake(
    name: 'Van Blommestein Meer',
    nameAlt: null,
    bbox: BBox(C(4.462, -55.33), C(4.999, -54.8)),
    zoom: 4.7,
  );

  /// Lake Manyara
  static const Lake lakeManyara = Lake(
    name: 'Lake Manyara',
    nameAlt: null,
    bbox: BBox(C(-3.757, 35.74), C(-3.416, 35.88)),
    zoom: 4.7,
  );

  /// Lake Äbaya
  static const Lake lakeAbaya = Lake(
    name: 'Lake Äbaya',
    nameAlt: null,
    bbox: BBox(C(6.014, 37.7), C(6.589, 38.14)),
    zoom: 4.7,
  );

  /// Akkajaure
  static const Lake akkajaure = Lake(
    name: 'Akkajaure',
    nameAlt: null,
    bbox: BBox(C(67.42, 17.13), C(67.79, 18.43)),
    zoom: 4.7,
  );

  /// Lake Balaton
  static const Lake lakeBalaton = Lake(
    name: 'Lake Balaton',
    nameAlt: null,
    bbox: BBox(C(46.72, 17.27), C(47.05, 18.16)),
    zoom: 4.7,
  );

  /// Finger Lakes
  static const Lake fingerLakes = Lake(
    name: 'Finger Lakes',
    nameAlt: null,
    bbox: BBox(C(42.69, -77.36), C(42.89, -77.24)),
    zoom: 4.7,
  );

  /// Bear Lake
  static const Lake bearLake = Lake(
    name: 'Bear Lake',
    nameAlt: null,
    bbox: BBox(C(41.87, -111.4), C(42.15, -111.3)),
    zoom: 4.7,
  );

  /// Utah Lake
  static const Lake utahLake = Lake(
    name: 'Utah Lake',
    nameAlt: null,
    bbox: BBox(C(40.06, -111.9), C(40.38, -111.7)),
    zoom: 4.7,
  );

  /// Leech L.
  static const Lake leechL = Lake(
    name: 'Leech L.',
    nameAlt: null,
    bbox: BBox(C(47.06, -94.62), C(47.28, -94.25)),
    zoom: 4.7,
  );

  /// Lac des Mille Lacs
  static const Lake lacDesMilleLacs = Lake(
    name: 'Lac des Mille Lacs',
    nameAlt: null,
    bbox: BBox(C(48.78, -90.69), C(48.97, -90.29)),
    zoom: 4.7,
  );

  /// Rés. Baskatong
  static const Lake resBaskatong = Lake(
    name: 'Rés. Baskatong',
    nameAlt: null,
    bbox: BBox(C(46.71, -76.03), C(47.0, -75.69)),
    zoom: 4.7,
  );

  /// Lago Ranco
  static const Lake lagoRanco = Lake(
    name: 'Lago Ranco',
    nameAlt: null,
    bbox: BBox(C(-40.3, -72.56), C(-40.13, -72.26)),
    zoom: 4.7,
  );

  /// Trout Lake
  static const Lake troutLake = Lake(
    name: 'Trout Lake',
    nameAlt: null,
    bbox: BBox(C(60.4, -121.6), C(60.77, -121.1)),
    zoom: 4.7,
  );

  /// Lago Viedma
  static const Lake lagoViedma = Lake(
    name: 'Lago Viedma',
    nameAlt: null,
    bbox: BBox(C(-49.78, -73.03), C(-49.44, -72.1)),
    zoom: 4.7,
  );

  /// Lac Tumba
  static const Lake lacTumba = Lake(
    name: 'Lac Tumba',
    nameAlt: null,
    bbox: BBox(C(-0.9888, 17.81), C(-0.6517, 18.13)),
    zoom: 4.7,
  );

  /// Po Hu
  static const Lake poHu = Lake(
    name: 'Po Hu',
    nameAlt: null,
    bbox: BBox(C(30.08, 116.3), C(30.25, 116.5)),
    zoom: 4.7,
  );

  /// Buyr Nuur
  static const Lake buyrNuur = Lake(
    name: 'Buyr Nuur',
    nameAlt: 'Buir Nur',
    bbox: BBox(C(47.67, 117.5), C(47.96, 117.9)),
    zoom: 4.7,
  );

  /// Ngangla Ringeo
  static const Lake nganglaRingeo = Lake(
    name: 'Ngangla Ringeo',
    nameAlt: null,
    bbox: BBox(C(31.45, 82.84), C(31.65, 83.34)),
    zoom: 4.7,
  );

  /// Tangra Yumco
  static const Lake tangraYumco = Lake(
    name: 'Tangra Yumco',
    nameAlt: null,
    bbox: BBox(C(30.8, 86.4), C(31.37, 86.78)),
    zoom: 4.7,
  );

  /// O. Kulundinskoye
  static const Lake oKulundinskoye = Lake(
    name: 'O. Kulundinskoye',
    nameAlt: 'L. Kulundinskoye',
    bbox: BBox(C(52.83, 79.39), C(53.14, 79.81)),
    zoom: 4.7,
  );

  /// Siletitengiz Köli
  static const Lake siletitengizKoli = Lake(
    name: 'Siletitengiz Köli',
    nameAlt: null,
    bbox: BBox(C(53.07, 72.92), C(53.4, 73.42)),
    zoom: 4.7,
  );

  /// Ubinskoye L.
  static const Lake ubinskoyeL = Lake(
    name: 'Ubinskoye L.',
    nameAlt: null,
    bbox: BBox(C(55.39, 79.82), C(55.56, 80.33)),
    zoom: 4.7,
  );

  /// Lake Kovdozero
  static const Lake lakeKovdozero = Lake(
    name: 'Lake Kovdozero',
    nameAlt: null,
    bbox: BBox(C(66.43, 31.55), C(66.91, 32.4)),
    zoom: 4.7,
  );

  /// Lake Tekapo
  static const Lake lakeTekapo = Lake(
    name: 'Lake Tekapo',
    nameAlt: null,
    bbox: BBox(C(-44.0, 170.5), C(-43.53, 170.7)),
    zoom: 4.7,
  );

  /// Lake Pukaki
  static const Lake lakePukaki = Lake(
    name: 'Lake Pukaki',
    nameAlt: null,
    bbox: BBox(C(-44.17, 170.1), C(-43.7, 170.2)),
    zoom: 4.7,
  );

  /// Lake Ohau
  static const Lake lakeOhau = Lake(
    name: 'Lake Ohau',
    nameAlt: null,
    bbox: BBox(C(-44.29, 169.9), C(-43.97, 170.0)),
    zoom: 4.7,
  );

  /// O. Bustakh
  static const Lake oBustakh = Lake(
    name: 'O. Bustakh',
    nameAlt: 'L. Bustakh',
    bbox: BBox(C(72.46, 141.6), C(72.61, 142.2)),
    zoom: 4.7,
  );

  /// Yamzho Yumco
  static const Lake yamzhoYumco = Lake(
    name: 'Yamzho Yumco',
    nameAlt: null,
    bbox: BBox(C(28.79, 90.39), C(29.21, 91.0)),
    zoom: 4.7,
  );

  /// O. Tenis
  static const Lake oTenis = Lake(
    name: 'O. Tenis',
    nameAlt: 'L. Tenis',
    bbox: BBox(C(56.06, 71.62), C(56.21, 72.01)),
    zoom: 4.7,
  );

  /// O. Chërnoye
  static const Lake oChernoye = Lake(
    name: 'O. Chërnoye',
    nameAlt: 'L. Chërnoye',
    bbox: BBox(C(55.71, 67.3), C(55.87, 67.68)),
    zoom: 4.7,
  );

  /// O. Bol’shoye Morskoye
  static const Lake oBolshoyeMorskoye = Lake(
    name: 'O. Bol’shoye Morskoye',
    nameAlt: 'L. Bol’shoye Morskoye',
    bbox: BBox(C(69.99, 158.5), C(70.14, 158.9)),
    zoom: 4.7,
  );

  /// O. Chukoch’ye
  static const Lake oChukochye = Lake(
    name: 'O. Chukoch’ye',
    nameAlt: 'L. Chukoch’ye',
    bbox: BBox(C(69.35, 160.0), C(69.54, 160.4)),
    zoom: 4.7,
  );

  /// Shijiu Hu
  static const Lake shijiuHu = Lake(
    name: 'Shijiu Hu',
    nameAlt: null,
    bbox: BBox(C(31.39, 118.7), C(31.55, 119.0)),
    zoom: 4.7,
  );

  /// Hong Hu
  static const Lake hongHu = Lake(
    name: 'Hong Hu',
    nameAlt: null,
    bbox: BBox(C(29.75, 113.2), C(29.95, 113.5)),
    zoom: 4.7,
  );

  /// Vorts Järv
  static const Lake vortsJarv = Lake(
    name: 'Vorts Järv',
    nameAlt: null,
    bbox: BBox(C(58.14, 25.93), C(58.4, 26.14)),
    zoom: 4.7,
  );

  /// Chao Hu
  static const Lake chaoHu = Lake(
    name: 'Chao Hu',
    nameAlt: null,
    bbox: BBox(C(31.45, 117.3), C(31.71, 117.9)),
    zoom: 4.7,
  );

  /// Lake Rossignol
  static const Lake lakeRossignol = Lake(
    name: 'Lake Rossignol',
    nameAlt: null,
    bbox: BBox(C(44.15, -65.2), C(44.27, -64.96)),
    zoom: 4.7,
  );

  /// Grand Lake
  static const Lake grandLake = Lake(
    name: 'Grand Lake',
    nameAlt: null,
    bbox: BBox(C(45.86, -66.19), C(46.1, -65.92)),
    zoom: 4.7,
  );

  /// Goose Lake
  static const Lake gooseLake = Lake(
    name: 'Goose Lake',
    nameAlt: null,
    bbox: BBox(C(41.79, -120.5), C(42.11, -120.3)),
    zoom: 4.7,
  );

  /// Pyramid Lake
  static const Lake pyramidLake = Lake(
    name: 'Pyramid Lake',
    nameAlt: null,
    bbox: BBox(C(39.87, -119.7), C(40.21, -119.4)),
    zoom: 4.7,
  );

  /// Lake Sevan
  static const Lake lakeSevan = Lake(
    name: 'Lake Sevan',
    nameAlt: 'Lake Sevana',
    bbox: BBox(C(40.15, 44.97), C(40.61, 45.66)),
    zoom: 4.7,
  );

  /// Weishan Hu
  static const Lake weishanHu = Lake(
    name: 'Weishan Hu',
    nameAlt: null,
    bbox: BBox(C(34.5, 117.1), C(34.73, 117.3)),
    zoom: 4.7,
  );

  /// Huangtang Hu
  static const Lake huangtangHu = Lake(
    name: 'Huangtang Hu',
    nameAlt: null,
    bbox: BBox(C(29.9, 114.1), C(30.14, 114.3)),
    zoom: 4.7,
  );

  /// Millerton Lake
  static const Lake millertonLake = Lake(
    name: 'Millerton Lake',
    nameAlt: null,
    bbox: BBox(C(37.0, -119.7), C(37.06, -119.6)),
    zoom: 4.7,
  );

  /// Bluenose L.
  static const Lake bluenoseL = Lake(
    name: 'Bluenose L.',
    nameAlt: null,
    bbox: BBox(C(68.25, -119.9), C(68.75, -119.5)),
    zoom: 4.7,
  );

  /// Rés. Pipmuacan
  static const Lake resPipmuacan = Lake(
    name: 'Rés. Pipmuacan',
    nameAlt: null,
    bbox: BBox(C(49.33, -70.96), C(49.89, -69.78)),
    zoom: 4.7,
  );

  /// Grand L.
  static const Lake grandL = Lake(
    name: 'Grand L.',
    nameAlt: null,
    bbox: BBox(C(48.64, -58.01), C(49.34, -56.93)),
    zoom: 4.7,
  );

  /// Colville L.
  static const Lake colvilleL = Lake(
    name: 'Colville L.',
    nameAlt: null,
    bbox: BBox(C(67.06, -126.2), C(67.31, -125.7)),
    zoom: 4.7,
  );

  /// Hottah L.
  static const Lake hottahL = Lake(
    name: 'Hottah L.',
    nameAlt: null,
    bbox: BBox(C(64.78, -118.8), C(65.29, -118.1)),
    zoom: 4.7,
  );

  /// Big Trout L.
  static const Lake bigTroutL = Lake(
    name: 'Big Trout L.',
    nameAlt: null,
    bbox: BBox(C(53.68, -90.36), C(53.89, -89.61)),
    zoom: 4.7,
  );

  /// Trout L.
  static const Lake troutL = Lake(
    name: 'Trout L.',
    nameAlt: null,
    bbox: BBox(C(51.03, -93.48), C(51.3, -93.07)),
    zoom: 4.7,
  );

  /// L. Abitibi
  static const Lake lAbitibi = Lake(
    name: 'L. Abitibi',
    nameAlt: null,
    bbox: BBox(C(48.45, -80.18), C(48.93, -79.23)),
    zoom: 4.7,
  );

  /// Island L.
  static const Lake islandL = Lake(
    name: 'Island L.',
    nameAlt: null,
    bbox: BBox(C(53.71, -94.95), C(53.99, -94.0)),
    zoom: 4.7,
  );

  /// L. Naococane
  static const Lake lNaococane = Lake(
    name: 'L. Naococane',
    nameAlt: null,
    bbox: BBox(C(52.61, -70.98), C(53.06, -70.4)),
    zoom: 4.7,
  );

  /// Lac la Ronge
  static const Lake lacLaRonge = Lake(
    name: 'Lac la Ronge',
    nameAlt: null,
    bbox: BBox(C(54.92, -105.3), C(55.31, -104.4)),
    zoom: 4.7,
  );

  /// Mille Lacs Lake
  static const Lake milleLacsLake = Lake(
    name: 'Mille Lacs Lake',
    nameAlt: null,
    bbox: BBox(C(46.14, -93.8), C(46.36, -93.51)),
    zoom: 4.7,
  );

  /// L. Winnipesaukee
  static const Lake lWinnipesaukee = Lake(
    name: 'L. Winnipesaukee',
    nameAlt: null,
    bbox: BBox(C(43.53, -71.44), C(43.72, -71.21)),
    zoom: 4.7,
  );

  /// Lake Simcoe
  static const Lake lakeSimcoe = Lake(
    name: 'Lake Simcoe',
    nameAlt: null,
    bbox: BBox(C(44.23, -79.58), C(44.7, -79.16)),
    zoom: 4.7,
  );

  /// Gods L.
  static const Lake godsL = Lake(
    name: 'Gods L.',
    nameAlt: null,
    bbox: BBox(C(54.41, -94.77), C(54.85, -93.65)),
    zoom: 4.7,
  );

  /// Hoh Xil Hu
  static const Lake hohXilHu = Lake(
    name: 'Hoh Xil Hu',
    nameAlt: null,
    bbox: BBox(C(35.53, 90.95), C(35.65, 91.32)),
    zoom: 4.7,
  );

  /// Lake Hammar
  static const Lake lakeHammar = Lake(
    name: 'Lake Hammar',
    nameAlt: null,
    bbox: BBox(C(30.66, 46.71), C(30.92, 47.61)),
    zoom: 4.7,
  );

  /// Malheur Lake
  static const Lake malheurLake = Lake(
    name: 'Malheur Lake',
    nameAlt: null,
    bbox: BBox(C(43.24, -118.9), C(43.43, -118.6)),
    zoom: 4.7,
  );

  /// Tikchik Lakes
  static const Lake tikchikLakes = Lake(
    name: 'Tikchik Lakes',
    nameAlt: null,
    bbox: BBox(C(59.16, -159.1), C(59.34, -158.9)),
    zoom: 4.7,
  );

  /// Hyargas Nuur
  static const Lake hyargasNuur = Lake(
    name: 'Hyargas Nuur',
    nameAlt: null,
    bbox: BBox(C(48.99, 92.83), C(49.32, 93.8)),
    zoom: 4.7,
  );

  /// Lake Assal
  static const Lake lakeAssal = Lake(
    name: 'Lake Assal',
    nameAlt: null,
    bbox: BBox(C(11.63, 42.4), C(11.71, 42.45)),
    zoom: 4.7,
  );

  /// Rainy Lake
  static const Lake rainyLake = Lake(
    name: 'Rainy Lake',
    nameAlt: null,
    bbox: BBox(C(48.35, -93.61), C(48.93, -92.43)),
    zoom: 4.7,
  );

  /// Williston L.
  static const Lake willistonL = Lake(
    name: 'Williston L.',
    nameAlt: null,
    bbox: BBox(C(55.18, -124.8), C(56.76, -122.2)),
    zoom: 4.7,
  );

  /// Split Lake
  static const Lake splitLake = Lake(
    name: 'Split Lake',
    nameAlt: null,
    bbox: BBox(C(56.06, -96.57), C(56.3, -95.84)),
    zoom: 4.7,
  );

  /// Ft. Peck Lake
  static const Lake ftPeckLake = Lake(
    name: 'Ft. Peck Lake',
    nameAlt: null,
    bbox: BBox(C(47.39, -108.2), C(48.03, -106.2)),
    zoom: 4.7,
  );

  /// Lake Sakakawea
  static const Lake lakeSakakawea = Lake(
    name: 'Lake Sakakawea',
    nameAlt: null,
    bbox: BBox(C(47.46, -103.8), C(48.18, -101.1)),
    zoom: 4.7,
  );

  /// Lake Oahe
  static const Lake lakeOahe = Lake(
    name: 'Lake Oahe',
    nameAlt: null,
    bbox: BBox(C(44.42, -101.2), C(46.71, -100.3)),
    zoom: 4.7,
  );

  /// Teslin L.
  static const Lake teslinL = Lake(
    name: 'Teslin L.',
    nameAlt: null,
    bbox: BBox(C(59.6, -133.2), C(60.45, -132.1)),
    zoom: 4.7,
  );

  /// Lower Arrow Lake
  static const Lake lowerArrowLake = Lake(
    name: 'Lower Arrow Lake',
    nameAlt: null,
    bbox: BBox(C(49.34, -118.2), C(49.8, -117.9)),
    zoom: 4.7,
  );

  /// Lake Pend Oreille
  static const Lake lakePendOreille = Lake(
    name: 'Lake Pend Oreille',
    nameAlt: null,
    bbox: BBox(C(47.96, -116.6), C(48.3, -116.2)),
    zoom: 4.7,
  );

  /// Lake Chelan
  static const Lake lakeChelan = Lake(
    name: 'Lake Chelan',
    nameAlt: null,
    bbox: BBox(C(47.85, -120.6), C(48.28, -120.0)),
    zoom: 4.7,
  );

  /// Black Lake
  static const Lake blackLake = Lake(
    name: 'Black Lake',
    nameAlt: null,
    bbox: BBox(C(58.92, -105.9), C(59.3, -104.9)),
    zoom: 4.7,
  );

  /// Lake Louise
  static const Lake lakeLouise = Lake(
    name: 'Lake Louise',
    nameAlt: null,
    bbox: BBox(C(62.28, -146.7), C(62.51, -146.5)),
    zoom: 4.7,
  );

  /// Lower Red L.
  static const Lake lowerRedL = Lake(
    name: 'Lower Red L.',
    nameAlt: null,
    bbox: BBox(C(47.89, -95.27), C(48.07, -94.78)),
    zoom: 4.7,
  );

  /// Upper Red L.
  static const Lake upperRedL = Lake(
    name: 'Upper Red L.',
    nameAlt: null,
    bbox: BBox(C(48.06, -95.03), C(48.2, -94.56)),
    zoom: 4.7,
  );

  /// Yathkyed Lake
  static const Lake yathkyedLake = Lake(
    name: 'Yathkyed Lake',
    nameAlt: null,
    bbox: BBox(C(62.42, -98.46), C(62.98, -97.31)),
    zoom: 4.7,
  );

  /// Amadjuak Lake
  static const Lake amadjuakLake = Lake(
    name: 'Amadjuak Lake',
    nameAlt: null,
    bbox: BBox(C(64.58, -72.05), C(65.41, -70.38)),
    zoom: 4.7,
  );

  /// Amistad Res.
  static const Lake amistadRes = Lake(
    name: 'Amistad Res.',
    nameAlt: null,
    bbox: BBox(C(29.46, -101.3), C(29.65, -100.9)),
    zoom: 4.7,
  );

  /// Lago de Chapala
  static const Lake lagoDeChapala = Lake(
    name: 'Lago de Chapala',
    nameAlt: null,
    bbox: BBox(C(20.12, -103.4), C(20.33, -102.7)),
    zoom: 4.7,
  );

  /// Lago de Managua
  static const Lake lagoDeManagua = Lake(
    name: 'Lago de Managua',
    nameAlt: null,
    bbox: BBox(C(12.17, -86.59), C(12.48, -86.1)),
    zoom: 4.7,
  );

  /// Itaipú Reservoir
  static const Lake itaipuReservoir = Lake(
    name: 'Itaipú Reservoir',
    nameAlt: null,
    bbox: BBox(C(-25.44, -54.79), C(-24.07, -54.18)),
    zoom: 4.7,
  );

  /// L. Gatún
  static const Lake lGatun = Lake(
    name: 'L. Gatún',
    nameAlt: null,
    bbox: BBox(C(9.016, -80.08), C(9.32, -79.67)),
    zoom: 4.7,
  );

  /// Lake Kariba
  static const Lake lakeKariba = Lake(
    name: 'Lake Kariba',
    nameAlt: null,
    bbox: BBox(C(-17.96, 27.02), C(-16.49, 28.99)),
    zoom: 4.7,
  );

  /// Lake Kyoga
  static const Lake lakeKyoga = Lake(
    name: 'Lake Kyoga',
    nameAlt: null,
    bbox: BBox(C(1.223, 32.54), C(1.731, 33.49)),
    zoom: 4.7,
  );

  /// Lake Nasser
  static const Lake lakeNasser = Lake(
    name: 'Lake Nasser',
    nameAlt: null,
    bbox: BBox(C(21.61, 31.09), C(23.99, 33.01)),
    zoom: 4.7,
  );

  /// Bodensee
  static const Lake bodensee = Lake(
    name: 'Bodensee',
    nameAlt: 'Lake Constance',
    bbox: BBox(C(47.51, 9.113), C(47.78, 9.731)),
    zoom: 4.7,
  );

  /// Pyhäjärvi
  static const Lake pyhajarvi = Lake(
    name: 'Pyhäjärvi',
    nameAlt: null,
    bbox: BBox(C(61.26, 23.35), C(62.27, 24.73)),
    zoom: 4.7,
  );

  /// Sea of Galilee
  static const Lake seaOfGalilee = Lake(
    name: 'Sea of Galilee',
    nameAlt: null,
    bbox: BBox(C(32.72, 35.53), C(32.9, 35.64)),
    zoom: 4.7,
  );

  /// Lake Argyle
  static const Lake lakeArgyle = Lake(
    name: 'Lake Argyle',
    nameAlt: null,
    bbox: BBox(C(-16.79, 128.5), C(-16.08, 129.0)),
    zoom: 4.7,
  );

  /// Ngoring Hu
  static const Lake ngoringHu = Lake(
    name: 'Ngoring Hu',
    nameAlt: null,
    bbox: BBox(C(34.79, 97.55), C(35.09, 97.89)),
    zoom: 4.7,
  );

  /// Gyaring Hu
  static const Lake gyaringHu = Lake(
    name: 'Gyaring Hu',
    nameAlt: null,
    bbox: BBox(C(34.83, 97.06), C(35.02, 97.47)),
    zoom: 4.7,
  );

  /// Toktogul Res.
  static const Lake toktogulRes = Lake(
    name: 'Toktogul Res.',
    nameAlt: 'Toktogul Suu Saktagychy',
    bbox: BBox(C(41.66, 72.64), C(41.9, 73.3)),
    zoom: 4.7,
  );

  /// La’nga Co
  static const Lake langaCo = Lake(
    name: 'La’nga Co',
    nameAlt: null,
    bbox: BBox(C(30.61, 81.13), C(30.86, 81.31)),
    zoom: 4.7,
  );

  /// Mapam Yumco
  static const Lake mapamYumco = Lake(
    name: 'Mapam Yumco',
    nameAlt: null,
    bbox: BBox(C(30.59, 81.37), C(30.78, 81.58)),
    zoom: 4.7,
  );

  /// Lake Volta
  static const Lake lakeVolta = Lake(
    name: 'Lake Volta',
    nameAlt: null,
    bbox: BBox(C(6.338, -1.715), C(9.117, 0.3201)),
    zoom: 4.7,
  );

  /// Bratsk Res.
  static const Lake bratskRes = Lake(
    name: 'Bratsk Res.',
    nameAlt: 'Bratskoye Vdkhr.',
    bbox: BBox(C(53.11, 101.3), C(56.35, 103.7)),
    zoom: 5,
  );

  /// O. Khantayskoye
  static const Lake oKhantayskoye = Lake(
    name: 'O. Khantayskoye',
    nameAlt: 'L. Khantayskoye',
    bbox: BBox(C(68.24, 89.31), C(68.51, 92.33)),
    zoom: 5,
  );

  /// O. Keta
  static const Lake oKeta = Lake(
    name: 'O. Keta',
    nameAlt: 'L. Keta',
    bbox: BBox(C(68.7, 89.55), C(68.86, 91.71)),
    zoom: 5,
  );

  /// O. Lama
  static const Lake oLama = Lake(
    name: 'O. Lama',
    nameAlt: 'L. Lama',
    bbox: BBox(C(69.32, 88.83), C(69.63, 91.56)),
    zoom: 5,
  );

  /// Uddjaure
  static const Lake uddjaure = Lake(
    name: 'Uddjaure',
    nameAlt: null,
    bbox: BBox(C(65.85, 17.35), C(66.2, 18.01)),
    zoom: 5,
  );

  /// Stornavan
  static const Lake stornavan = Lake(
    name: 'Stornavan',
    nameAlt: null,
    bbox: BBox(C(65.62, 17.97), C(65.88, 18.51)),
    zoom: 5,
  );

  /// Lake Habbaniyah
  static const Lake lakeHabbaniyah = Lake(
    name: 'Lake Habbaniyah',
    nameAlt: null,
    bbox: BBox(C(33.19, 43.3), C(33.44, 43.6)),
    zoom: 5,
  );

  /// Lake Skadar
  static const Lake lakeSkadar = Lake(
    name: 'Lake Skadar',
    nameAlt: 'Lake Scutari',
    bbox: BBox(C(42.08, 19.1), C(42.29, 19.48)),
    zoom: 5,
  );

  /// Aylmer L.
  static const Lake aylmerL = Lake(
    name: 'Aylmer L.',
    nameAlt: null,
    bbox: BBox(C(63.95, -109.6), C(64.41, -107.9)),
    zoom: 5,
  );

  /// Clinton-Colden L.
  static const Lake clintonColdenL = Lake(
    name: 'Clinton-Colden L.',
    nameAlt: null,
    bbox: BBox(C(63.78, -107.9), C(64.13, -107.1)),
    zoom: 5,
  );

  /// Lake Francis Case
  static const Lake lakeFrancisCase = Lake(
    name: 'Lake Francis Case',
    nameAlt: null,
    bbox: BBox(C(43.06, -99.47), C(43.99, -98.56)),
    zoom: 5,
  );

  /// Falcon Lake
  static const Lake falconLake = Lake(
    name: 'Falcon Lake',
    nameAlt: null,
    bbox: BBox(C(26.56, -99.46), C(27.06, -99.11)),
    zoom: 5,
  );

  /// L. Île-á-la-Crosse
  static const Lake lIleALaCrosse = Lake(
    name: 'L. Île-á-la-Crosse',
    nameAlt: null,
    bbox: BBox(C(55.21, -108.0), C(55.92, -107.7)),
    zoom: 5,
  );

  /// Wholdaia L.
  static const Lake wholdaiaL = Lake(
    name: 'Wholdaia L.',
    nameAlt: null,
    bbox: BBox(C(60.34, -104.6), C(61.03, -103.6)),
    zoom: 5,
  );

  /// Tehek L.
  static const Lake tehekL = Lake(
    name: 'Tehek L.',
    nameAlt: null,
    bbox: BBox(C(64.76, -96.03), C(65.04, -95.25)),
    zoom: 5,
  );

  /// Rés. de Caniapiscau
  static const Lake resDeCaniapiscau = Lake(
    name: 'Rés. de Caniapiscau',
    nameAlt: null,
    bbox: BBox(C(53.95, -70.14), C(54.38, -69.27)),
    zoom: 5,
  );

  /// Kentucky Lake
  static const Lake kentuckyLake = Lake(
    name: 'Kentucky Lake',
    nameAlt: null,
    bbox: BBox(C(35.95, -88.28), C(37.02, -87.91)),
    zoom: 5,
  );

  /// J. Strom Thurmond Lake
  static const Lake jStromThurmondLake = Lake(
    name: 'J. Strom Thurmond Lake',
    nameAlt: 'Clarks Hill Lake',
    bbox: BBox(C(33.64, -82.59), C(34.02, -82.19)),
    zoom: 5,
  );

  /// Kinbasket Lake
  static const Lake kinbasketLake = Lake(
    name: 'Kinbasket Lake',
    nameAlt: null,
    bbox: BBox(C(52.06, -119.1), C(52.74, -118.2)),
    zoom: 5,
  );

  /// Lake George
  static const Lake lakeGeorge = Lake(
    name: 'Lake George',
    nameAlt: null,
    bbox: BBox(C(29.2, -81.68), C(29.51, -81.53)),
    zoom: 5,
  );

  /// Lake Havasu
  static const Lake lakeHavasu = Lake(
    name: 'Lake Havasu',
    nameAlt: null,
    bbox: BBox(C(34.24, -114.4), C(34.54, -114.1)),
    zoom: 5,
  );

  /// Shasta Lake
  static const Lake shastaLake = Lake(
    name: 'Shasta Lake',
    nameAlt: null,
    bbox: BBox(C(40.72, -122.4), C(40.87, -122.1)),
    zoom: 5,
  );

  /// Point Lake
  static const Lake pointLake = Lake(
    name: 'Point Lake',
    nameAlt: null,
    bbox: BBox(C(64.95, -114.4), C(65.68, -112.2)),
    zoom: 5,
  );

  /// Upper Klamath Lake
  static const Lake upperKlamathLake = Lake(
    name: 'Upper Klamath Lake',
    nameAlt: null,
    bbox: BBox(C(42.25, -122.1), C(42.6, -121.8)),
    zoom: 5,
  );

  /// Harney Lake
  static const Lake harneyLake = Lake(
    name: 'Harney Lake',
    nameAlt: null,
    bbox: BBox(C(43.16, -119.2), C(43.31, -119.0)),
    zoom: 5,
  );

  /// Chiputneticook Lakes
  static const Lake chiputneticookLakes = Lake(
    name: 'Chiputneticook Lakes',
    nameAlt: null,
    bbox: BBox(C(45.59, -67.86), C(45.76, -67.45)),
    zoom: 5,
  );

  /// Represa de Tucurí
  static const Lake represaDeTucuri = Lake(
    name: 'Represa de Tucurí',
    nameAlt: null,
    bbox: BBox(C(-5.388, -49.87), C(-3.835, -48.94)),
    zoom: 5,
  );

  /// Três Marias Reservoir
  static const Lake tresMariasReservoir = Lake(
    name: 'Três Marias Reservoir',
    nameAlt: null,
    bbox: BBox(C(-19.05, -45.52), C(-18.2, -44.9)),
    zoom: 5,
  );

  /// Lago Colhué Huapi
  static const Lake lagoColhueHuapi = Lake(
    name: 'Lago Colhué Huapi',
    nameAlt: null,
    bbox: BBox(C(-45.66, -68.98), C(-45.26, -68.57)),
    zoom: 5,
  );

  /// Shardara Bögeni
  static const Lake shardaraBogeni = Lake(
    name: 'Shardara Bögeni',
    nameAlt: null,
    bbox: BBox(C(41.05, 67.93), C(41.25, 68.46)),
    zoom: 5,
  );

  /// Vilyuy Res.
  static const Lake vilyuyRes = Lake(
    name: 'Vilyuy Res.',
    nameAlt: 'Vilyuyskoye Res.',
    bbox: BBox(C(61.78, 109.6), C(63.63, 112.5)),
    zoom: 5,
  );

  /// O. Krasnoye
  static const Lake oKrasnoye = Lake(
    name: 'O. Krasnoye',
    nameAlt: 'L. Krasnoye',
    bbox: BBox(C(64.43, 174.2), C(64.7, 174.8)),
    zoom: 5,
  );

  /// Biwa Ko
  static const Lake biwaKo = Lake(
    name: 'Biwa Ko',
    nameAlt: null,
    bbox: BBox(C(35.0, 135.9), C(35.47, 136.3)),
    zoom: 5,
  );

  /// Aishik Lake
  static const Lake aishikLake = Lake(
    name: 'Aishik Lake',
    nameAlt: null,
    bbox: BBox(C(61.23, -137.5), C(61.65, -137.0)),
    zoom: 5,
  );

  /// Lake Clark
  static const Lake lakeClark = Lake(
    name: 'Lake Clark',
    nameAlt: null,
    bbox: BBox(C(60.04, -154.8), C(60.44, -153.6)),
    zoom: 5,
  );

  /// Wheeler Lake
  static const Lake wheelerLake = Lake(
    name: 'Wheeler Lake',
    nameAlt: null,
    bbox: BBox(C(34.57, -87.7), C(34.85, -86.9)),
    zoom: 5,
  );

  /// Üüreg Nuur
  static const Lake uuregNuur = Lake(
    name: 'Üüreg Nuur',
    nameAlt: null,
    bbox: BBox(C(50.08, 90.89), C(50.21, 91.13)),
    zoom: 5,
  );

  /// Banggong Co
  static const Lake banggongCo = Lake(
    name: 'Banggong Co',
    nameAlt: null,
    bbox: BBox(C(33.68, 78.44), C(33.97, 78.98)),
    zoom: 5,
  );

  /// Tengiz Köli
  static const Lake tengizKoli = Lake(
    name: 'Tengiz Köli',
    nameAlt: null,
    bbox: BBox(C(50.18, 68.69), C(50.72, 69.62)),
    zoom: 5,
  );

  /// Qusmuryn Köli
  static const Lake qusmurynKoli = Lake(
    name: 'Qusmuryn Köli',
    nameAlt: null,
    bbox: BBox(C(52.52, 64.5), C(52.91, 64.98)),
    zoom: 5,
  );

  /// Femunden
  static const Lake femunden = Lake(
    name: 'Femunden',
    nameAlt: null,
    bbox: BBox(C(61.93, 11.74), C(62.05, 11.8)),
    zoom: 5,
  );

  /// Lake Disappointment
  static const Lake lakeDisappointment = Lake(
    name: 'Lake Disappointment',
    nameAlt: null,
    bbox: BBox(C(-23.68, 122.6), C(-23.25, 122.9)),
    zoom: 5.7,
  );

  /// Lake Mackay
  static const Lake lakeMackay = Lake(
    name: 'Lake Mackay',
    nameAlt: null,
    bbox: BBox(C(-22.68, 128.3), C(-22.0, 129.2)),
    zoom: 5.7,
  );

  /// Lake Gairdner
  static const Lake lakeGairdner = Lake(
    name: 'Lake Gairdner',
    nameAlt: null,
    bbox: BBox(C(-32.33, 135.4), C(-31.06, 136.3)),
    zoom: 5.7,
  );

  /// Lake Torrens
  static const Lake lakeTorrens = Lake(
    name: 'Lake Torrens',
    nameAlt: null,
    bbox: BBox(C(-31.9, 137.2), C(-30.18, 138.1)),
    zoom: 5.7,
  );

  /// Lake Barlee
  static const Lake lakeBarlee = Lake(
    name: 'Lake Barlee',
    nameAlt: null,
    bbox: BBox(C(-29.58, 119.1), C(-28.88, 120.0)),
    zoom: 6,
  );

  /// Lake Frome
  static const Lake lakeFrome = Lake(
    name: 'Lake Frome',
    nameAlt: null,
    bbox: BBox(C(-31.13, 139.5), C(-30.32, 140.0)),
    zoom: 5.7,
  );

  /// Lake Eyre South
  static const Lake lakeEyreSouth = Lake(
    name: 'Lake Eyre South',
    nameAlt: null,
    bbox: BBox(C(-29.47, 137.1), C(-29.13, 137.7)),
    zoom: 6,
  );

  /// Lake Eyre North
  static const Lake lakeEyreNorth = Lake(
    name: 'Lake Eyre North',
    nameAlt: null,
    bbox: BBox(C(-29.1, 136.8), C(-27.86, 138.0)),
    zoom: 5.6,
  );
}
