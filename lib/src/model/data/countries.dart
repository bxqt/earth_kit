part of 'data.dart';

class Countries {
  const Countries._();
  
  /// Filters all countries by the given [predicate]. Shorthand for calling `Countries.all.where(predicate)`.
  static List<Country> where(bool Function(Country country) predicate) => all.where(predicate) as List<Country>;

  /// All countries that are available.
  static const List<Country> all = [aruba, afghanistan, angola, anguilla, albania, aland, andorra, unitedArabEmirates, argentina, armenia, americanSamoa, antarctica, ashmoreAndCartierIslands, frenchSouthernAndAntarcticLands, antiguaAndBarbuda, australia, austria, azerbaijan, burundi, belgium, benin, burkinaFaso, bangladesh, bulgaria, bahrain, theBahamas, bosniaAndHerzegovina, saintBarthelemy, belarus, belize, bermuda, bolivia, brazil, barbados, brunei, bhutan, botswana, centralAfricanRepublic, canada, switzerland, chile, china, ivoryCoast, cameroon, democraticRepublicOfTheCongo, republicOfTheCongo, cookIslands, colombia, comoros, caboVerde, costaRica, cuba, curacao, caymanIslands, northernCyprus, cyprus, czechia, germany, djibouti, dominica, denmark, dominicanRepublic, algeria, ecuador, egypt, eritrea, spain, estonia, ethiopia, finland, fiji, falklandIslands, france, faroeIslands, federatedStatesOfMicronesia, gabon, unitedKingdom, georgia, guernsey, ghana, guinea, gambia, guineaBissau, equatorialGuinea, greece, grenada, greenland, guatemala, guam, guyana, hongKong, heardIslandAndMcDonaldIslands, honduras, croatia, haiti, hungary, indonesia, isleOfMan, india, indianOceanTerritories, britishIndianOceanTerritory, ireland, iran, iraq, iceland, israel, italy, jamaica, jersey, jordan, japan, siachenGlacier, kazakhstan, kenya, kyrgyzstan, cambodia, kiribati, saintKittsAndNevis, southKorea, kosovo, kuwait, laos, lebanon, liberia, libya, saintLucia, liechtenstein, sriLanka, lesotho, lithuania, luxembourg, latvia, macao, saintMartin, morocco, monaco, moldova, madagascar, maldives, mexico, marshallIslands, macedonia, mali, malta, myanmar, montenegro, mongolia, northernMarianaIslands, mozambique, mauritania, montserrat, mauritius, malawi, malaysia, namibia, newCaledonia, niger, norfolkIsland, nigeria, nicaragua, niue, netherlands, norway, nepal, nauru, newZealand, oman, pakistan, panama, pitcairnIslands, peru, philippines, palau, papuaNewGuinea, poland, puertoRico, northKorea, portugal, paraguay, palestine, frenchPolynesia, qatar, romania, russia, rwanda, westernSahara, saudiArabia, sudan, southSudan, senegal, singapore, southGeorgiaAndTheIslands, saintHelena, solomonIslands, sierraLeone, elSalvador, sanMarino, somaliland, somalia, saintPierreAndMiquelon, republicOfSerbia, saoTomeAndPrincipe, suriname, slovakia, slovenia, sweden, swaziland, sintMaarten, seychelles, syria, turksAndCaicosIslands, chad, togo, thailand, tajikistan, turkmenistan, eastTimor, tonga, trinidadAndTobago, tunisia, turkey, taiwan, unitedRepublicOfTanzania, uganda, ukraine, uruguay, usa, uzbekistan, vatican, saintVincentAndTheGrenadines, venezuela, britishVirginIslands, unitedStatesVirginIslands, vietnam, vanuatu, wallisAndFutuna, samoa, yemen, southAfrica, zambia, zimbabwe];

  /// All current member states of the Europen Union.
  static const List<Country> eu = [austria, belgium, bulgaria, croatia, cyprus, czechia, denmark, estonia, finland, france, germany, greece, hungary, ireland, italy, latvia, lithuania, luxembourg, malta, netherlands, poland, portugal, romania, slovakia, slovenia, spain, sweden];

  /// All countries that belong geographically to North America.
  static const List<Country> northAmerica = [aruba, anguilla, antiguaAndBarbuda, theBahamas, saintBarthelemy, belize, bermuda, barbados, canada, costaRica, cuba, curacao, caymanIslands, dominica, dominicanRepublic, grenada, greenland, guatemala, honduras, haiti, jamaica, saintKittsAndNevis, saintLucia, saintMartin, mexico, montserrat, nicaragua, panama, puertoRico, elSalvador, saintPierreAndMiquelon, sintMaarten, turksAndCaicosIslands, trinidadAndTobago, usa, saintVincentAndTheGrenadines, britishVirginIslands, unitedStatesVirginIslands];

  /// All countries that belong geographically to Asia.
  static const List<Country> asia = [afghanistan, unitedArabEmirates, armenia, azerbaijan, bangladesh, bahrain, brunei, bhutan, china, northernCyprus, cyprus, georgia, hongKong, indonesia, india, indianOceanTerritories, iran, iraq, israel, jordan, japan, siachenGlacier, kazakhstan, kyrgyzstan, cambodia, southKorea, kuwait, laos, lebanon, sriLanka, macao, myanmar, mongolia, malaysia, nepal, oman, pakistan, philippines, northKorea, palestine, qatar, saudiArabia, singapore, syria, thailand, tajikistan, turkmenistan, eastTimor, turkey, taiwan, uzbekistan, vietnam, yemen];

  /// All countries that belong geographically to Africa.
  static const List<Country> africa = [angola, burundi, benin, burkinaFaso, botswana, centralAfricanRepublic, ivoryCoast, cameroon, democraticRepublicOfTheCongo, republicOfTheCongo, comoros, caboVerde, djibouti, algeria, egypt, eritrea, ethiopia, gabon, ghana, guinea, gambia, guineaBissau, equatorialGuinea, kenya, liberia, libya, lesotho, morocco, madagascar, mali, mozambique, mauritania, malawi, namibia, niger, nigeria, rwanda, westernSahara, sudan, southSudan, senegal, sierraLeone, somaliland, somalia, saoTomeAndPrincipe, swaziland, chad, togo, tunisia, unitedRepublicOfTanzania, uganda, southAfrica, zambia, zimbabwe];

  /// All countries that belong geographically to Europe.
  static const List<Country> europe = [albania, aland, andorra, austria, belgium, bulgaria, bosniaAndHerzegovina, belarus, switzerland, czechia, germany, denmark, spain, estonia, finland, france, faroeIslands, unitedKingdom, guernsey, greece, croatia, hungary, isleOfMan, ireland, iceland, italy, jersey, kosovo, liechtenstein, lithuania, luxembourg, latvia, monaco, moldova, macedonia, malta, montenegro, netherlands, norway, poland, portugal, romania, russia, sanMarino, republicOfSerbia, slovakia, slovenia, sweden, ukraine, vatican];

  /// All countries that belong geographically to South America.
  static const List<Country> southAmerica = [argentina, bolivia, brazil, chile, colombia, ecuador, falklandIslands, guyana, peru, paraguay, suriname, uruguay, venezuela];

  /// All countries that belong geographically to Oceania.
  static const List<Country> oceania = [americanSamoa, ashmoreAndCartierIslands, australia, cookIslands, fiji, federatedStatesOfMicronesia, guam, kiribati, marshallIslands, northernMarianaIslands, newCaledonia, norfolkIsland, niue, nauru, newZealand, pitcairnIslands, palau, papuaNewGuinea, frenchPolynesia, solomonIslands, tonga, vanuatu, wallisAndFutuna, samoa];

  /// All countries that belong geographically to Open Ocean.
  static const List<Country> openOcean = [frenchSouthernAndAntarcticLands, heardIslandAndMcDonaldIslands, britishIndianOceanTerritory, maldives, mauritius, southGeorgiaAndTheIslands, saintHelena, seychelles];

  /// ISO-A2 to Country mappings.
  static const Map<String, Country> isoA2 = {'AW':Countries.aruba,'AF':Countries.afghanistan,'AO':Countries.angola,'AI':Countries.anguilla,'AL':Countries.albania,'AX':Countries.aland,'AD':Countries.andorra,'AE':Countries.unitedArabEmirates,'AR':Countries.argentina,'AM':Countries.armenia,'AS':Countries.americanSamoa,'AQ':Countries.antarctica,'TF':Countries.frenchSouthernAndAntarcticLands,'AG':Countries.antiguaAndBarbuda,'AU':Countries.australia,'AT':Countries.austria,'AZ':Countries.azerbaijan,'BI':Countries.burundi,'BE':Countries.belgium,'BJ':Countries.benin,'BF':Countries.burkinaFaso,'BD':Countries.bangladesh,'BG':Countries.bulgaria,'BH':Countries.bahrain,'BS':Countries.theBahamas,'BA':Countries.bosniaAndHerzegovina,'BL':Countries.saintBarthelemy,'BY':Countries.belarus,'BZ':Countries.belize,'BM':Countries.bermuda,'BO':Countries.bolivia,'BR':Countries.brazil,'BB':Countries.barbados,'BN':Countries.brunei,'BT':Countries.bhutan,'BW':Countries.botswana,'CF':Countries.centralAfricanRepublic,'CA':Countries.canada,'CH':Countries.switzerland,'CL':Countries.chile,'CN':Countries.china,'CI':Countries.ivoryCoast,'CM':Countries.cameroon,'CD':Countries.democraticRepublicOfTheCongo,'CG':Countries.republicOfTheCongo,'CK':Countries.cookIslands,'CO':Countries.colombia,'KM':Countries.comoros,'CV':Countries.caboVerde,'CR':Countries.costaRica,'CU':Countries.cuba,'CW':Countries.curacao,'KY':Countries.caymanIslands,'CY':Countries.cyprus,'CZ':Countries.czechia,'DE':Countries.germany,'DJ':Countries.djibouti,'DM':Countries.dominica,'DK':Countries.denmark,'DO':Countries.dominicanRepublic,'DZ':Countries.algeria,'EC':Countries.ecuador,'EG':Countries.egypt,'ER':Countries.eritrea,'ES':Countries.spain,'EE':Countries.estonia,'ET':Countries.ethiopia,'FI':Countries.finland,'FJ':Countries.fiji,'FK':Countries.falklandIslands,'FO':Countries.faroeIslands,'FM':Countries.federatedStatesOfMicronesia,'GA':Countries.gabon,'GB':Countries.unitedKingdom,'GE':Countries.georgia,'GG':Countries.guernsey,'GH':Countries.ghana,'GN':Countries.guinea,'GM':Countries.gambia,'GW':Countries.guineaBissau,'GQ':Countries.equatorialGuinea,'GR':Countries.greece,'GD':Countries.grenada,'GL':Countries.greenland,'GT':Countries.guatemala,'GU':Countries.guam,'GY':Countries.guyana,'HK':Countries.hongKong,'HM':Countries.heardIslandAndMcDonaldIslands,'HN':Countries.honduras,'HR':Countries.croatia,'HT':Countries.haiti,'HU':Countries.hungary,'ID':Countries.indonesia,'IM':Countries.isleOfMan,'IN':Countries.india,'IO':Countries.britishIndianOceanTerritory,'IE':Countries.ireland,'IR':Countries.iran,'IQ':Countries.iraq,'IS':Countries.iceland,'IL':Countries.israel,'IT':Countries.italy,'JM':Countries.jamaica,'JE':Countries.jersey,'JO':Countries.jordan,'JP':Countries.japan,'KZ':Countries.kazakhstan,'KE':Countries.kenya,'KG':Countries.kyrgyzstan,'KH':Countries.cambodia,'KI':Countries.kiribati,'KN':Countries.saintKittsAndNevis,'KR':Countries.southKorea,'KW':Countries.kuwait,'LA':Countries.laos,'LB':Countries.lebanon,'LR':Countries.liberia,'LY':Countries.libya,'LC':Countries.saintLucia,'LI':Countries.liechtenstein,'LK':Countries.sriLanka,'LS':Countries.lesotho,'LT':Countries.lithuania,'LU':Countries.luxembourg,'LV':Countries.latvia,'MO':Countries.macao,'MF':Countries.saintMartin,'MA':Countries.morocco,'MC':Countries.monaco,'MD':Countries.moldova,'MG':Countries.madagascar,'MV':Countries.maldives,'MX':Countries.mexico,'MH':Countries.marshallIslands,'MK':Countries.macedonia,'ML':Countries.mali,'MT':Countries.malta,'MM':Countries.myanmar,'ME':Countries.montenegro,'MN':Countries.mongolia,'MP':Countries.northernMarianaIslands,'MZ':Countries.mozambique,'MR':Countries.mauritania,'MS':Countries.montserrat,'MU':Countries.mauritius,'MW':Countries.malawi,'MY':Countries.malaysia,'NA':Countries.namibia,'NC':Countries.newCaledonia,'NE':Countries.niger,'NF':Countries.norfolkIsland,'NG':Countries.nigeria,'NI':Countries.nicaragua,'NU':Countries.niue,'NL':Countries.netherlands,'NP':Countries.nepal,'NR':Countries.nauru,'NZ':Countries.newZealand,'OM':Countries.oman,'PK':Countries.pakistan,'PA':Countries.panama,'PN':Countries.pitcairnIslands,'PE':Countries.peru,'PH':Countries.philippines,'PW':Countries.palau,'PG':Countries.papuaNewGuinea,'PL':Countries.poland,'PR':Countries.puertoRico,'KP':Countries.northKorea,'PT':Countries.portugal,'PY':Countries.paraguay,'PS':Countries.palestine,'PF':Countries.frenchPolynesia,'QA':Countries.qatar,'RO':Countries.romania,'RU':Countries.russia,'RW':Countries.rwanda,'EH':Countries.westernSahara,'SA':Countries.saudiArabia,'SD':Countries.sudan,'SS':Countries.southSudan,'SN':Countries.senegal,'SG':Countries.singapore,'GS':Countries.southGeorgiaAndTheIslands,'SH':Countries.saintHelena,'SB':Countries.solomonIslands,'SL':Countries.sierraLeone,'SV':Countries.elSalvador,'SM':Countries.sanMarino,'SO':Countries.somalia,'PM':Countries.saintPierreAndMiquelon,'RS':Countries.republicOfSerbia,'ST':Countries.saoTomeAndPrincipe,'SR':Countries.suriname,'SK':Countries.slovakia,'SI':Countries.slovenia,'SE':Countries.sweden,'SZ':Countries.swaziland,'SX':Countries.sintMaarten,'SC':Countries.seychelles,'SY':Countries.syria,'TC':Countries.turksAndCaicosIslands,'TD':Countries.chad,'TG':Countries.togo,'TH':Countries.thailand,'TJ':Countries.tajikistan,'TM':Countries.turkmenistan,'TL':Countries.eastTimor,'TO':Countries.tonga,'TT':Countries.trinidadAndTobago,'TN':Countries.tunisia,'TR':Countries.turkey,'TW':Countries.taiwan,'TZ':Countries.unitedRepublicOfTanzania,'UG':Countries.uganda,'UA':Countries.ukraine,'UY':Countries.uruguay,'US':Countries.usa,'UZ':Countries.uzbekistan,'VA':Countries.vatican,'VC':Countries.saintVincentAndTheGrenadines,'VE':Countries.venezuela,'VG':Countries.britishVirginIslands,'VI':Countries.unitedStatesVirginIslands,'VN':Countries.vietnam,'VU':Countries.vanuatu,'WF':Countries.wallisAndFutuna,'WS':Countries.samoa,'YE':Countries.yemen,'ZA':Countries.southAfrica,'ZM':Countries.zambia,'ZW':Countries.zimbabwe};

  /// ISO-A3 to Country mappings.
  static const Map<String, Country> isoA3 = {'ABW':Countries.aruba,'AFG':Countries.afghanistan,'AGO':Countries.angola,'AIA':Countries.anguilla,'ALB':Countries.albania,'ALA':Countries.aland,'AND':Countries.andorra,'ARE':Countries.unitedArabEmirates,'ARG':Countries.argentina,'ARM':Countries.armenia,'ASM':Countries.americanSamoa,'ATA':Countries.antarctica,'ATF':Countries.frenchSouthernAndAntarcticLands,'ATG':Countries.antiguaAndBarbuda,'AUS':Countries.australia,'AUT':Countries.austria,'AZE':Countries.azerbaijan,'BDI':Countries.burundi,'BEL':Countries.belgium,'BEN':Countries.benin,'BFA':Countries.burkinaFaso,'BGD':Countries.bangladesh,'BGR':Countries.bulgaria,'BHR':Countries.bahrain,'BHS':Countries.theBahamas,'BIH':Countries.bosniaAndHerzegovina,'BLM':Countries.saintBarthelemy,'BLR':Countries.belarus,'BLZ':Countries.belize,'BMU':Countries.bermuda,'BOL':Countries.bolivia,'BRA':Countries.brazil,'BRB':Countries.barbados,'BRN':Countries.brunei,'BTN':Countries.bhutan,'BWA':Countries.botswana,'CAF':Countries.centralAfricanRepublic,'CAN':Countries.canada,'CHE':Countries.switzerland,'CHL':Countries.chile,'CHN':Countries.china,'CIV':Countries.ivoryCoast,'CMR':Countries.cameroon,'COD':Countries.democraticRepublicOfTheCongo,'COG':Countries.republicOfTheCongo,'COK':Countries.cookIslands,'COL':Countries.colombia,'COM':Countries.comoros,'CPV':Countries.caboVerde,'CRI':Countries.costaRica,'CUB':Countries.cuba,'CUW':Countries.curacao,'CYM':Countries.caymanIslands,'CYP':Countries.cyprus,'CZE':Countries.czechia,'DEU':Countries.germany,'DJI':Countries.djibouti,'DMA':Countries.dominica,'DNK':Countries.denmark,'DOM':Countries.dominicanRepublic,'DZA':Countries.algeria,'ECU':Countries.ecuador,'EGY':Countries.egypt,'ERI':Countries.eritrea,'ESP':Countries.spain,'EST':Countries.estonia,'ETH':Countries.ethiopia,'FIN':Countries.finland,'FJI':Countries.fiji,'FLK':Countries.falklandIslands,'FRO':Countries.faroeIslands,'FSM':Countries.federatedStatesOfMicronesia,'GAB':Countries.gabon,'GBR':Countries.unitedKingdom,'GEO':Countries.georgia,'GGY':Countries.guernsey,'GHA':Countries.ghana,'GIN':Countries.guinea,'GMB':Countries.gambia,'GNB':Countries.guineaBissau,'GNQ':Countries.equatorialGuinea,'GRC':Countries.greece,'GRD':Countries.grenada,'GRL':Countries.greenland,'GTM':Countries.guatemala,'GUM':Countries.guam,'GUY':Countries.guyana,'HKG':Countries.hongKong,'HMD':Countries.heardIslandAndMcDonaldIslands,'HND':Countries.honduras,'HRV':Countries.croatia,'HTI':Countries.haiti,'HUN':Countries.hungary,'IDN':Countries.indonesia,'IMN':Countries.isleOfMan,'IND':Countries.india,'IOT':Countries.britishIndianOceanTerritory,'IRL':Countries.ireland,'IRN':Countries.iran,'IRQ':Countries.iraq,'ISL':Countries.iceland,'ISR':Countries.israel,'ITA':Countries.italy,'JAM':Countries.jamaica,'JEY':Countries.jersey,'JOR':Countries.jordan,'JPN':Countries.japan,'KAZ':Countries.kazakhstan,'KEN':Countries.kenya,'KGZ':Countries.kyrgyzstan,'KHM':Countries.cambodia,'KIR':Countries.kiribati,'KNA':Countries.saintKittsAndNevis,'KOR':Countries.southKorea,'KWT':Countries.kuwait,'LAO':Countries.laos,'LBN':Countries.lebanon,'LBR':Countries.liberia,'LBY':Countries.libya,'LCA':Countries.saintLucia,'LIE':Countries.liechtenstein,'LKA':Countries.sriLanka,'LSO':Countries.lesotho,'LTU':Countries.lithuania,'LUX':Countries.luxembourg,'LVA':Countries.latvia,'MAC':Countries.macao,'MAF':Countries.saintMartin,'MAR':Countries.morocco,'MCO':Countries.monaco,'MDA':Countries.moldova,'MDG':Countries.madagascar,'MDV':Countries.maldives,'MEX':Countries.mexico,'MHL':Countries.marshallIslands,'MKD':Countries.macedonia,'MLI':Countries.mali,'MLT':Countries.malta,'MMR':Countries.myanmar,'MNE':Countries.montenegro,'MNG':Countries.mongolia,'MNP':Countries.northernMarianaIslands,'MOZ':Countries.mozambique,'MRT':Countries.mauritania,'MSR':Countries.montserrat,'MUS':Countries.mauritius,'MWI':Countries.malawi,'MYS':Countries.malaysia,'NAM':Countries.namibia,'NCL':Countries.newCaledonia,'NER':Countries.niger,'NFK':Countries.norfolkIsland,'NGA':Countries.nigeria,'NIC':Countries.nicaragua,'NIU':Countries.niue,'NLD':Countries.netherlands,'NPL':Countries.nepal,'NRU':Countries.nauru,'NZL':Countries.newZealand,'OMN':Countries.oman,'PAK':Countries.pakistan,'PAN':Countries.panama,'PCN':Countries.pitcairnIslands,'PER':Countries.peru,'PHL':Countries.philippines,'PLW':Countries.palau,'PNG':Countries.papuaNewGuinea,'POL':Countries.poland,'PRI':Countries.puertoRico,'PRK':Countries.northKorea,'PRT':Countries.portugal,'PRY':Countries.paraguay,'PSE':Countries.palestine,'PYF':Countries.frenchPolynesia,'QAT':Countries.qatar,'ROU':Countries.romania,'RUS':Countries.russia,'RWA':Countries.rwanda,'ESH':Countries.westernSahara,'SAU':Countries.saudiArabia,'SDN':Countries.sudan,'SSD':Countries.southSudan,'SEN':Countries.senegal,'SGP':Countries.singapore,'SGS':Countries.southGeorgiaAndTheIslands,'SHN':Countries.saintHelena,'SLB':Countries.solomonIslands,'SLE':Countries.sierraLeone,'SLV':Countries.elSalvador,'SMR':Countries.sanMarino,'SOM':Countries.somalia,'SPM':Countries.saintPierreAndMiquelon,'SRB':Countries.republicOfSerbia,'STP':Countries.saoTomeAndPrincipe,'SUR':Countries.suriname,'SVK':Countries.slovakia,'SVN':Countries.slovenia,'SWE':Countries.sweden,'SWZ':Countries.swaziland,'SXM':Countries.sintMaarten,'SYC':Countries.seychelles,'SYR':Countries.syria,'TCA':Countries.turksAndCaicosIslands,'TCD':Countries.chad,'TGO':Countries.togo,'THA':Countries.thailand,'TJK':Countries.tajikistan,'TKM':Countries.turkmenistan,'TLS':Countries.eastTimor,'TON':Countries.tonga,'TTO':Countries.trinidadAndTobago,'TUN':Countries.tunisia,'TUR':Countries.turkey,'TWN':Countries.taiwan,'TZA':Countries.unitedRepublicOfTanzania,'UGA':Countries.uganda,'UKR':Countries.ukraine,'URY':Countries.uruguay,'USA':Countries.usa,'UZB':Countries.uzbekistan,'VAT':Countries.vatican,'VCT':Countries.saintVincentAndTheGrenadines,'VEN':Countries.venezuela,'VGB':Countries.britishVirginIslands,'VIR':Countries.unitedStatesVirginIslands,'VNM':Countries.vietnam,'VUT':Countries.vanuatu,'WLF':Countries.wallisAndFutuna,'WSM':Countries.samoa,'YEM':Countries.yemen,'ZAF':Countries.southAfrica,'ZMB':Countries.zambia,'ZWE':Countries.zimbabwe};

  static const Country aruba = Country(
    name: 'Aruba',
    code: 'AW',
    isoA3: 'ABW',
    continent: Continent.northAmerica,
    medianGDP: 2516,
    population: 115120,
    economy: Economy.developing,
    bbox: BBox(C(12.42, -70.07), C(12.61, -69.9)),
  );

  static const Country afghanistan = Country(
    name: 'Afghanistan',
    code: 'AF',
    isoA3: 'AFG',
    continent: Continent.asia,
    medianGDP: 64080,
    population: 34124811,
    economy: Economy.developing,
    bbox: BBox(C(29.39, 60.49), C(38.46, 74.89)),
  );

  static const Country angola = Country(
    name: 'Angola',
    code: 'AO',
    isoA3: 'AGO',
    continent: Continent.africa,
    medianGDP: 189000,
    population: 29310273,
    economy: Economy.developing,
    bbox: BBox(C(-18.02, 11.74), C(-5.855, 24.05)),
  );

  static const Country anguilla = Country(
    name: 'Anguilla',
    code: 'AI',
    isoA3: 'AIA',
    continent: Continent.northAmerica,
    medianGDP: 175,
    population: 17087,
    economy: Economy.developing,
    bbox: BBox(C(18.17, -63.16), C(18.27, -62.98)),
  );

  static const Country albania = Country(
    name: 'Albania',
    code: 'AL',
    isoA3: 'ALB',
    continent: Continent.europe,
    medianGDP: 33900,
    population: 3047987,
    economy: Economy.developing,
    bbox: BBox(C(39.65, 19.28), C(42.65, 21.03)),
  );

  static const Country aland = Country(
    name: 'Aland',
    code: 'AX',
    isoA3: 'ALA',
    continent: Continent.europe,
    medianGDP: 1563,
    population: 27153,
    economy: Economy.developedNonG7,
    bbox: BBox(C(60.08, 19.67), C(60.41, 20.26)),
  );

  static const Country andorra = Country(
    name: 'Andorra',
    code: 'AD',
    isoA3: 'AND',
    continent: Continent.europe,
    medianGDP: 3327,
    population: 85702,
    economy: Economy.developedNonG7,
    bbox: BBox(C(42.43, 1.415), C(42.64, 1.74)),
  );

  static const Country unitedArabEmirates = Country(
    name: 'United Arab Emirates',
    code: 'AE',
    isoA3: 'ARE',
    continent: Continent.asia,
    medianGDP: 667200,
    population: 6072475,
    economy: Economy.developing,
    bbox: BBox(C(22.62, 51.57), C(26.07, 56.39)),
  );

  static const Country argentina = Country(
    name: 'Argentina',
    code: 'AR',
    isoA3: 'ARG',
    continent: Continent.southAmerica,
    medianGDP: 879400,
    population: 44293293,
    economy: Economy.emergingG20,
    bbox: BBox(C(-52.36, -73.58), C(-21.8, -53.67)),
  );

  static const Country armenia = Country(
    name: 'Armenia',
    code: 'AM',
    isoA3: 'ARM',
    continent: Continent.asia,
    medianGDP: 26300,
    population: 3045191,
    economy: Economy.developing,
    bbox: BBox(C(38.87, 43.44), C(41.29, 46.58)),
  );

  static const Country americanSamoa = Country(
    name: 'American Samoa',
    code: 'AS',
    isoA3: 'ASM',
    continent: Continent.oceania,
    medianGDP: 711,
    population: 51504,
    economy: Economy.developing,
    bbox: BBox(C(-14.36, -170.8), C(-14.26, -170.6)),
  );

  static const Country antarctica = Country(
    name: 'Antarctica',
    code: 'AQ',
    isoA3: 'ATA',
    continent: Continent.antarctica,
    medianGDP: 810,
    population: 4050,
    economy: Economy.developing,
    bbox: BBox(C(-90.0, -180.0), C(-63.23, 180.0)),
  );

  static const Country ashmoreAndCartierIslands = Country(
    name: 'Ashmore and Cartier Islands',
    code: '-99',
    isoA3: '-99',
    continent: Continent.oceania,
    medianGDP: 0,
    population: 0,
    economy: Economy.developing,
    bbox: BBox(C(-12.44, 123.6), C(-12.42, 123.6)),
  );

  static const Country frenchSouthernAndAntarcticLands = Country(
    name: 'French Southern and Antarctic Lands',
    code: 'TF',
    isoA3: 'ATF',
    continent: Continent.openOcean,
    medianGDP: 16,
    population: 140,
    economy: Economy.developing,
    bbox: BBox(C(-49.71, 68.77), C(-48.66, 70.56)),
  );

  static const Country antiguaAndBarbuda = Country(
    name: 'Antigua and Barbuda',
    code: 'AG',
    isoA3: 'ATG',
    continent: Continent.northAmerica,
    medianGDP: 2171,
    population: 94731,
    economy: Economy.developing,
    bbox: BBox(C(17.0, -61.89), C(17.17, -61.69)),
  );

  static const Country australia = Country(
    name: 'Australia',
    code: 'AU',
    isoA3: 'AUS',
    continent: Continent.oceania,
    medianGDP: 1189000,
    population: 23232413,
    economy: Economy.developedNonG7,
    bbox: BBox(C(-39.15, 113.2), C(-10.71, 153.6)),
  );

  static const Country austria = Country(
    name: 'Austria',
    code: 'AT',
    isoA3: 'AUT',
    continent: Continent.europe,
    medianGDP: 416600,
    population: 8754413,
    economy: Economy.developedNonG7,
    bbox: BBox(C(46.4, 9.524), C(49.0, 17.15)),
  );

  static const Country azerbaijan = Country(
    name: 'Azerbaijan',
    code: 'AZ',
    isoA3: 'AZE',
    continent: Continent.asia,
    medianGDP: 167900,
    population: 9961396,
    economy: Economy.developing,
    bbox: BBox(C(38.4, 45.0), C(41.89, 50.37)),
  );

  static const Country burundi = Country(
    name: 'Burundi',
    code: 'BI',
    isoA3: 'BDI',
    continent: Continent.africa,
    medianGDP: 7892,
    population: 11466756,
    economy: Economy.developing,
    bbox: BBox(C(-4.456, 29.01), C(-2.313, 30.81)),
  );

  static const Country belgium = Country(
    name: 'Belgium',
    code: 'BE',
    isoA3: 'BEL',
    continent: Continent.europe,
    medianGDP: 508600,
    population: 11491346,
    economy: Economy.developedNonG7,
    bbox: BBox(C(49.51, 2.525), C(51.49, 6.364)),
  );

  static const Country benin = Country(
    name: 'Benin',
    code: 'BJ',
    isoA3: 'BEN',
    continent: Continent.africa,
    medianGDP: 24310,
    population: 11038805,
    economy: Economy.developing,
    bbox: BBox(C(6.217, 0.7634), C(12.38, 3.834)),
  );

  static const Country burkinaFaso = Country(
    name: 'Burkina Faso',
    code: 'BF',
    isoA3: 'BFA',
    continent: Continent.africa,
    medianGDP: 32990,
    population: 20107509,
    economy: Economy.developing,
    bbox: BBox(C(9.425, -5.524), C(15.08, 2.389)),
  );

  static const Country bangladesh = Country(
    name: 'Bangladesh',
    code: 'BD',
    isoA3: 'BGD',
    continent: Continent.asia,
    medianGDP: 628400,
    population: 157826578,
    economy: Economy.developing,
    bbox: BBox(C(20.79, 88.02), C(26.57, 92.63)),
  );

  static const Country bulgaria = Country(
    name: 'Bulgaria',
    code: 'BG',
    isoA3: 'BGR',
    continent: Continent.europe,
    medianGDP: 143100,
    population: 7101510,
    economy: Economy.developedNonG7,
    bbox: BBox(C(41.24, 22.34), C(44.24, 28.59)),
  );

  static const Country bahrain = Country(
    name: 'Bahrain',
    code: 'BH',
    isoA3: 'BHR',
    continent: Continent.asia,
    medianGDP: 66370,
    population: 1410942,
    economy: Economy.developing,
    bbox: BBox(C(25.81, 50.45), C(26.25, 50.62)),
  );

  static const Country theBahamas = Country(
    name: 'The Bahamas',
    code: 'BS',
    isoA3: 'BHS',
    continent: Continent.northAmerica,
    medianGDP: 9066,
    population: 329988,
    economy: Economy.developing,
    bbox: BBox(C(24.29, -78.44), C(25.2, -77.74)),
  );

  static const Country bosniaAndHerzegovina = Country(
    name: 'Bosnia and Herzegovina',
    code: 'BA',
    isoA3: 'BIH',
    continent: Continent.europe,
    medianGDP: 42530,
    population: 3856181,
    economy: Economy.developing,
    bbox: BBox(C(42.56, 15.74), C(45.28, 19.58)),
  );

  static const Country saintBarthelemy = Country(
    name: 'Saint Barthelemy',
    code: 'BL',
    isoA3: 'BLM',
    continent: Continent.northAmerica,
    medianGDP: 255,
    population: 7184,
    economy: Economy.developedNonG7,
    bbox: BBox(C(17.88, -62.88), C(17.92, -62.8)),
  );

  static const Country belarus = Country(
    name: 'Belarus',
    code: 'BY',
    isoA3: 'BLR',
    continent: Continent.europe,
    medianGDP: 165400,
    population: 9549747,
    economy: Economy.developing,
    bbox: BBox(C(51.27, 23.18), C(56.15, 32.71)),
  );

  static const Country belize = Country(
    name: 'Belize',
    code: 'BZ',
    isoA3: 'BLZ',
    continent: Continent.northAmerica,
    medianGDP: 3088,
    population: 360346,
    economy: Economy.developing,
    bbox: BBox(C(15.89, -89.24), C(18.48, -88.09)),
  );

  static const Country bermuda = Country(
    name: 'Bermuda',
    code: 'BM',
    isoA3: 'BMU',
    continent: Continent.northAmerica,
    medianGDP: 5198,
    population: 70864,
    economy: Economy.developedNonG7,
    bbox: BBox(C(32.26, -64.86), C(32.39, -64.67)),
  );

  static const Country bolivia = Country(
    name: 'Bolivia',
    code: 'BO',
    isoA3: 'BOL',
    continent: Continent.southAmerica,
    medianGDP: 78350,
    population: 11138234,
    economy: Economy.emergingG20,
    bbox: BBox(C(-22.89, -69.65), C(-9.71, -57.5)),
  );

  static const Country brazil = Country(
    name: 'Brazil',
    code: 'BR',
    isoA3: 'BRA',
    continent: Continent.southAmerica,
    medianGDP: 3081000,
    population: 207353391,
    economy: Economy.emergingBRIC,
    bbox: BBox(C(-33.74, -74.0), C(5.258, -34.81)),
  );

  static const Country barbados = Country(
    name: 'Barbados',
    code: 'BB',
    isoA3: 'BRB',
    continent: Continent.northAmerica,
    medianGDP: 4804,
    population: 292336,
    economy: Economy.developing,
    bbox: BBox(C(13.06, -59.65), C(13.32, -59.43)),
  );

  static const Country brunei = Country(
    name: 'Brunei',
    code: 'BN',
    isoA3: 'BRN',
    continent: Continent.asia,
    medianGDP: 33730,
    population: 443593,
    economy: Economy.developing,
    bbox: BBox(C(4.024, 114.1), C(5.022, 115.0)),
  );

  static const Country bhutan = Country(
    name: 'Bhutan',
    code: 'BT',
    isoA3: 'BTN',
    continent: Continent.asia,
    medianGDP: 6432,
    population: 758288,
    economy: Economy.developing,
    bbox: BBox(C(26.7, 88.74), C(28.31, 92.08)),
  );

  static const Country botswana = Country(
    name: 'Botswana',
    code: 'BW',
    isoA3: 'BWA',
    continent: Continent.africa,
    medianGDP: 35900,
    population: 2214858,
    economy: Economy.developing,
    bbox: BBox(C(-26.85, 19.98), C(-17.79, 29.36)),
  );

  static const Country centralAfricanRepublic = Country(
    name: 'Central African Republic',
    code: 'CF',
    isoA3: 'CAF',
    continent: Continent.africa,
    medianGDP: 3206,
    population: 5625118,
    economy: Economy.developing,
    bbox: BBox(C(2.27, 14.43), C(11.0, 27.4)),
  );

  static const Country canada = Country(
    name: 'Canada',
    code: 'CA',
    isoA3: 'CAN',
    continent: Continent.northAmerica,
    medianGDP: 1674000,
    population: 35623680,
    economy: Economy.developedG7,
    bbox: BBox(C(41.67, -141.0), C(71.99, -55.67)),
  );

  static const Country switzerland = Country(
    name: 'Switzerland',
    code: 'CH',
    isoA3: 'CHE',
    continent: Continent.europe,
    medianGDP: 496300,
    population: 8236303,
    economy: Economy.developedNonG7,
    bbox: BBox(C(45.83, 5.97), C(47.78, 10.45)),
  );

  static const Country chile = Country(
    name: 'Chile',
    code: 'CL',
    isoA3: 'CHL',
    continent: Continent.southAmerica,
    medianGDP: 436100,
    population: 17789267,
    economy: Economy.emergingG20,
    bbox: BBox(C(-53.88, -75.71), C(-17.51, -67.01)),
  );

  static const Country china = Country(
    name: 'China',
    code: 'CN',
    isoA3: 'CHN',
    continent: Continent.asia,
    medianGDP: 21140000,
    population: 1379302771,
    economy: Economy.emergingBRIC,
    bbox: BBox(C(20.26, 73.61), C(53.56, 134.8)),
  );

  static const Country ivoryCoast = Country(
    name: 'Ivory Coast',
    code: 'CI',
    isoA3: 'CIV',
    continent: Continent.africa,
    medianGDP: 87120,
    population: 24184810,
    economy: Economy.developing,
    bbox: BBox(C(4.351, -8.604), C(10.72, -2.506)),
  );

  static const Country cameroon = Country(
    name: 'Cameroon',
    code: 'CM',
    isoA3: 'CMR',
    continent: Continent.africa,
    medianGDP: 77240,
    population: 24994885,
    economy: Economy.developing,
    bbox: BBox(C(1.676, 8.533), C(13.08, 16.18)),
  );

  static const Country democraticRepublicOfTheCongo = Country(
    name: 'Democratic Republic of the Congo',
    code: 'CD',
    isoA3: 'COD',
    continent: Continent.africa,
    medianGDP: 66010,
    population: 83301151,
    economy: Economy.developing,
    bbox: BBox(C(-13.45, 12.21), C(5.312, 31.27)),
  );

  static const Country republicOfTheCongo = Country(
    name: 'Republic of the Congo',
    code: 'CG',
    isoA3: 'COG',
    continent: Continent.africa,
    medianGDP: 30270,
    population: 4954674,
    economy: Economy.developing,
    bbox: BBox(C(-5.004, 11.13), C(3.687, 18.62)),
  );

  static const Country cookIslands = Country(
    name: 'Cook Islands',
    code: 'CK',
    isoA3: 'COK',
    continent: Continent.oceania,
    medianGDP: 244,
    population: 9290,
    economy: Economy.developing,
    bbox: BBox(C(-21.25, -159.8), C(-21.19, -159.7)),
  );

  static const Country colombia = Country(
    name: 'Colombia',
    code: 'CO',
    isoA3: 'COL',
    continent: Continent.southAmerica,
    medianGDP: 688000,
    population: 47698524,
    economy: Economy.developing,
    bbox: BBox(C(-4.236, -79.03), C(12.43, -66.88)),
  );

  static const Country comoros = Country(
    name: 'Comoros',
    code: 'KM',
    isoA3: 'COM',
    continent: Continent.africa,
    medianGDP: 1259,
    population: 808080,
    economy: Economy.developing,
    bbox: BBox(C(-12.36, 44.22), C(-12.07, 44.53)),
  );

  static const Country caboVerde = Country(
    name: 'Cabo Verde',
    code: 'CV',
    isoA3: 'CPV',
    continent: Continent.africa,
    medianGDP: 3583,
    population: 560899,
    economy: Economy.developing,
    bbox: BBox(C(14.92, -23.79), C(15.33, -23.44)),
  );

  static const Country costaRica = Country(
    name: 'Costa Rica',
    code: 'CR',
    isoA3: 'CRI',
    continent: Continent.northAmerica,
    medianGDP: 79260,
    population: 4930258,
    economy: Economy.emergingG20,
    bbox: BBox(C(8.071, -85.91), C(11.19, -82.56)),
  );

  static const Country cuba = Country(
    name: 'Cuba',
    code: 'CU',
    isoA3: 'CUB',
    continent: Continent.northAmerica,
    medianGDP: 132900,
    population: 11147407,
    economy: Economy.emergingG20,
    bbox: BBox(C(19.86, -84.89), C(23.19, -74.14)),
  );

  static const Country curacao = Country(
    name: 'Curaçao',
    code: 'CW',
    isoA3: 'CUW',
    continent: Continent.northAmerica,
    medianGDP: 3128,
    population: 149648,
    economy: Economy.developing,
    bbox: BBox(C(12.05, -69.16), C(12.38, -68.75)),
  );

  static const Country caymanIslands = Country(
    name: 'Cayman Islands',
    code: 'KY',
    isoA3: 'CYM',
    continent: Continent.northAmerica,
    medianGDP: 2507,
    population: 58441,
    economy: Economy.emergingG20,
    bbox: BBox(C(19.27, -81.42), C(19.38, -81.11)),
  );

  static const Country northernCyprus = Country(
    name: 'Northern Cyprus',
    code: '-99',
    isoA3: '-99',
    continent: Continent.asia,
    medianGDP: 3600,
    population: 265100,
    economy: Economy.developing,
    bbox: BBox(C(35.0, 32.71), C(35.66, 34.56)),
  );

  static const Country cyprus = Country(
    name: 'Cyprus',
    code: 'CY',
    isoA3: 'CYP',
    continent: Continent.asia,
    medianGDP: 29260,
    population: 1221549,
    economy: Economy.developing,
    bbox: BBox(C(34.57, 32.3), C(35.18, 34.05)),
  );

  static const Country czechia = Country(
    name: 'Czechia',
    code: 'CZ',
    isoA3: 'CZE',
    continent: Continent.europe,
    medianGDP: 350900,
    population: 10674723,
    economy: Economy.developedNonG7,
    bbox: BBox(C(48.58, 12.09), C(51.04, 18.83)),
  );

  static const Country germany = Country(
    name: 'Germany',
    code: 'DE',
    isoA3: 'DEU',
    continent: Continent.europe,
    medianGDP: 3979000,
    population: 80594017,
    economy: Economy.developedG7,
    bbox: BBox(C(47.28, 5.858), C(54.9, 15.02)),
  );

  static const Country djibouti = Country(
    name: 'Djibouti',
    code: 'DJ',
    isoA3: 'DJI',
    continent: Continent.africa,
    medianGDP: 3345,
    population: 865267,
    economy: Economy.developing,
    bbox: BBox(C(10.94, 41.76), C(12.71, 43.41)),
  );

  static const Country dominica = Country(
    name: 'Dominica',
    code: 'DM',
    isoA3: 'DMA',
    continent: Continent.northAmerica,
    medianGDP: 812,
    population: 73897,
    economy: Economy.developing,
    bbox: BBox(C(15.23, -61.48), C(15.63, -61.25)),
  );

  static const Country denmark = Country(
    name: 'Denmark',
    code: 'DK',
    isoA3: 'DNK',
    continent: Continent.europe,
    medianGDP: 264800,
    population: 5605948,
    economy: Economy.developedNonG7,
    bbox: BBox(C(54.81, 8.121), C(57.74, 10.93)),
  );

  static const Country dominicanRepublic = Country(
    name: 'Dominican Republic',
    code: 'DO',
    isoA3: 'DOM',
    continent: Continent.northAmerica,
    medianGDP: 161900,
    population: 10734247,
    economy: Economy.developing,
    bbox: BBox(C(17.64, -72.0), C(19.91, -68.34)),
  );

  static const Country algeria = Country(
    name: 'Algeria',
    code: 'DZ',
    isoA3: 'DZA',
    continent: Continent.africa,
    medianGDP: 609400,
    population: 40969443,
    economy: Economy.developing,
    bbox: BBox(C(18.99, -8.683), C(37.09, 11.97)),
  );

  static const Country ecuador = Country(
    name: 'Ecuador',
    code: 'EC',
    isoA3: 'ECU',
    continent: Continent.southAmerica,
    medianGDP: 182400,
    population: 16290913,
    economy: Economy.developing,
    bbox: BBox(C(-4.991, -80.96), C(1.455, -75.25)),
  );

  static const Country egypt = Country(
    name: 'Egypt',
    code: 'EG',
    isoA3: 'EGY',
    continent: Continent.africa,
    medianGDP: 1105000,
    population: 97041072,
    economy: Economy.emergingG20,
    bbox: BBox(C(21.99, 24.7), C(31.65, 36.87)),
  );

  static const Country eritrea = Country(
    name: 'Eritrea',
    code: 'ER',
    isoA3: 'ERI',
    continent: Continent.africa,
    medianGDP: 9169,
    population: 5918919,
    economy: Economy.developing,
    bbox: BBox(C(12.38, 36.43), C(18.01, 43.12)),
  );

  static const Country spain = Country(
    name: 'Spain',
    code: 'ES',
    isoA3: 'ESP',
    continent: Continent.europe,
    medianGDP: 1690000,
    population: 48958159,
    economy: Economy.developedNonG7,
    bbox: BBox(C(36.03, -9.236), C(43.76, 3.307)),
  );

  static const Country estonia = Country(
    name: 'Estonia',
    code: 'EE',
    isoA3: 'EST',
    continent: Continent.europe,
    medianGDP: 38700,
    population: 1251581,
    economy: Economy.developedNonG7,
    bbox: BBox(C(57.53, 23.43), C(59.64, 28.15)),
  );

  static const Country ethiopia = Country(
    name: 'Ethiopia',
    code: 'ET',
    isoA3: 'ETH',
    continent: Continent.africa,
    medianGDP: 174700,
    population: 105350020,
    economy: Economy.developing,
    bbox: BBox(C(3.456, 33.0), C(14.85, 47.98)),
  );

  static const Country finland = Country(
    name: 'Finland',
    code: 'FI',
    isoA3: 'FIN',
    continent: Continent.europe,
    medianGDP: 224137,
    population: 5491218,
    economy: Economy.developedNonG7,
    bbox: BBox(C(59.82, 20.62), C(70.06, 31.54)),
  );

  static const Country fiji = Country(
    name: 'Fiji',
    code: 'FJ',
    isoA3: 'FJI',
    continent: Continent.oceania,
    medianGDP: 8374,
    population: 920938,
    economy: Economy.developing,
    bbox: BBox(C(-16.98, 178.5), C(-16.15, 180.0)),
  );

  static const Country falklandIslands = Country(
    name: 'Falkland Islands',
    code: 'FK',
    isoA3: 'FLK',
    continent: Continent.southAmerica,
    medianGDP: 282,
    population: 2931,
    economy: Economy.developedNonG7,
    bbox: BBox(C(-52.19, -60.96), C(-51.35, -59.27)),
  );

  static const Country france = Country(
    name: 'France',
    code: '-99',
    isoA3: '-99',
    continent: Continent.europe,
    medianGDP: 2699000,
    population: 67106161,
    economy: Economy.developedG7,
    bbox: BBox(C(42.34, -4.763), C(51.1, 8.14)),
  );

  static const Country faroeIslands = Country(
    name: 'Faroe Islands',
    code: 'FO',
    isoA3: 'FRO',
    continent: Continent.europe,
    medianGDP: 2001,
    population: 50730,
    economy: Economy.developedNonG7,
    bbox: BBox(C(61.95, -7.172), C(62.32, -6.631)),
  );

  static const Country federatedStatesOfMicronesia = Country(
    name: 'Federated States of Micronesia',
    code: 'FM',
    isoA3: 'FSM',
    continent: Continent.oceania,
    medianGDP: 314,
    population: 104196,
    economy: Economy.developing,
    bbox: BBox(C(7.333, 151.6), C(7.39, 151.7)),
  );

  static const Country gabon = Country(
    name: 'Gabon',
    code: 'GA',
    isoA3: 'GAB',
    continent: Continent.africa,
    medianGDP: 35980,
    population: 1772255,
    economy: Economy.developing,
    bbox: BBox(C(-3.916, 8.703), C(2.302, 14.48)),
  );

  static const Country unitedKingdom = Country(
    name: 'United Kingdom',
    code: 'GB',
    isoA3: 'GBR',
    continent: Continent.europe,
    medianGDP: 2788000,
    population: 64769452,
    economy: Economy.developedG7,
    bbox: BBox(C(50.02, -6.134), C(58.65, 1.747)),
  );

  static const Country georgia = Country(
    name: 'Georgia',
    code: 'GE',
    isoA3: 'GEO',
    continent: Continent.asia,
    medianGDP: 37270,
    population: 4926330,
    economy: Economy.developing,
    bbox: BBox(C(41.07, 39.98), C(43.57, 46.67)),
  );

  static const Country guernsey = Country(
    name: 'Guernsey',
    code: 'GG',
    isoA3: 'GGY',
    continent: Continent.europe,
    medianGDP: 3465,
    population: 66502,
    economy: Economy.developedNonG7,
    bbox: BBox(C(49.43, -2.646), C(49.51, -2.512)),
  );

  static const Country ghana = Country(
    name: 'Ghana',
    code: 'GH',
    isoA3: 'GHA',
    continent: Continent.africa,
    medianGDP: 120800,
    population: 27499924,
    economy: Economy.developing,
    bbox: BBox(C(4.762, -3.244), C(11.17, 1.187)),
  );

  static const Country guinea = Country(
    name: 'Guinea',
    code: 'GN',
    isoA3: 'GIN',
    continent: Continent.africa,
    medianGDP: 16080,
    population: 12413867,
    economy: Economy.developing,
    bbox: BBox(C(7.216, -15.05), C(12.67, -7.681)),
  );

  static const Country gambia = Country(
    name: 'Gambia',
    code: 'GM',
    isoA3: 'GMB',
    continent: Continent.africa,
    medianGDP: 3387,
    population: 2051363,
    economy: Economy.developing,
    bbox: BBox(C(13.06, -16.82), C(13.81, -13.83)),
  );

  static const Country guineaBissau = Country(
    name: 'Guinea-Bissau',
    code: 'GW',
    isoA3: 'GNB',
    continent: Continent.africa,
    medianGDP: 2851,
    population: 1792338,
    economy: Economy.developing,
    bbox: BBox(C(10.94, -16.71), C(12.68, -13.67)),
  );

  static const Country equatorialGuinea = Country(
    name: 'Equatorial Guinea',
    code: 'GQ',
    isoA3: 'GNQ',
    continent: Continent.africa,
    medianGDP: 31770,
    population: 778358,
    economy: Economy.developing,
    bbox: BBox(C(0.9601, 9.386), C(2.304, 11.34)),
  );

  static const Country greece = Country(
    name: 'Greece',
    code: 'GR',
    isoA3: 'GRC',
    continent: Continent.europe,
    medianGDP: 290500,
    population: 10768477,
    economy: Economy.developedNonG7,
    bbox: BBox(C(36.45, 20.0), C(41.74, 26.62)),
  );

  static const Country grenada = Country(
    name: 'Grenada',
    code: 'GD',
    isoA3: 'GRD',
    continent: Continent.northAmerica,
    medianGDP: 1511,
    population: 111724,
    economy: Economy.developing,
    bbox: BBox(C(12.01, -61.78), C(12.24, -61.61)),
  );

  static const Country greenland = Country(
    name: 'Greenland',
    code: 'GL',
    isoA3: 'GRL',
    continent: Continent.northAmerica,
    medianGDP: 2173,
    population: 57713,
    economy: Economy.developedNonG7,
    bbox: BBox(C(59.82, -72.82), C(83.6, -11.43)),
  );

  static const Country guatemala = Country(
    name: 'Guatemala',
    code: 'GT',
    isoA3: 'GTM',
    continent: Continent.northAmerica,
    medianGDP: 131800,
    population: 15460732,
    economy: Economy.developing,
    bbox: BBox(C(13.74, -92.24), C(17.82, -88.23)),
  );

  static const Country guam = Country(
    name: 'Guam',
    code: 'GU',
    isoA3: 'GUM',
    continent: Continent.oceania,
    medianGDP: 4882,
    population: 167358,
    economy: Economy.developing,
    bbox: BBox(C(13.26, 144.6), C(13.62, 144.9)),
  );

  static const Country guyana = Country(
    name: 'Guyana',
    code: 'GY',
    isoA3: 'GUY',
    continent: Continent.southAmerica,
    medianGDP: 6093,
    population: 737718,
    economy: Economy.developing,
    bbox: BBox(C(1.201, -61.39), C(8.549, -56.48)),
  );

  static const Country hongKong = Country(
    name: 'Hong Kong',
    code: 'HK',
    isoA3: 'HKG',
    continent: Continent.asia,
    medianGDP: 427400,
    population: 7191503,
    economy: Economy.developing,
    bbox: BBox(C(22.3, 113.9), C(22.56, 114.3)),
  );

  static const Country heardIslandAndMcDonaldIslands = Country(
    name: 'Heard Island and McDonald Islands',
    code: 'HM',
    isoA3: 'HMD',
    continent: Continent.openOcean,
    medianGDP: 0,
    population: 0,
    economy: Economy.developing,
    bbox: BBox(C(-53.18, 73.25), C(-52.97, 73.84)),
  );

  static const Country honduras = Country(
    name: 'Honduras',
    code: 'HN',
    isoA3: 'HND',
    continent: Continent.northAmerica,
    medianGDP: 43190,
    population: 9038741,
    economy: Economy.developing,
    bbox: BBox(C(12.98, -89.36), C(16.02, -83.16)),
  );

  static const Country croatia = Country(
    name: 'Croatia',
    code: 'HR',
    isoA3: 'HRV',
    continent: Continent.europe,
    medianGDP: 94240,
    population: 4292095,
    economy: Economy.developedNonG7,
    bbox: BBox(C(42.94, 13.52), C(46.53, 19.4)),
  );

  static const Country haiti = Country(
    name: 'Haiti',
    code: 'HT',
    isoA3: 'HTI',
    continent: Continent.northAmerica,
    medianGDP: 19340,
    population: 10646714,
    economy: Economy.developing,
    bbox: BBox(C(18.04, -74.48), C(19.93, -71.65)),
  );

  static const Country hungary = Country(
    name: 'Hungary',
    code: 'HU',
    isoA3: 'HUN',
    continent: Continent.europe,
    medianGDP: 267600,
    population: 9850845,
    economy: Economy.developedNonG7,
    bbox: BBox(C(45.75, 16.09), C(48.55, 22.88)),
  );

  static const Country indonesia = Country(
    name: 'Indonesia',
    code: 'ID',
    isoA3: 'IDN',
    continent: Continent.asia,
    medianGDP: 3028000,
    population: 260580739,
    economy: Economy.emergingMIKT,
    bbox: BBox(C(-4.17, 108.9), C(4.371, 119.0)),
  );

  static const Country isleOfMan = Country(
    name: 'Isle of Man',
    code: 'IM',
    isoA3: 'IMN',
    continent: Continent.europe,
    medianGDP: 7428,
    population: 88815,
    economy: Economy.developedNonG7,
    bbox: BBox(C(54.06, -4.785), C(54.41, -4.338)),
  );

  static const Country india = Country(
    name: 'India',
    code: 'IN',
    isoA3: 'IND',
    continent: Continent.asia,
    medianGDP: 8721000,
    population: 1281935911,
    economy: Economy.emergingBRIC,
    bbox: BBox(C(8.078, 68.17), C(35.5, 97.34)),
  );

  static const Country indianOceanTerritories = Country(
    name: 'Indian Ocean Territories',
    code: '-99',
    isoA3: '-99',
    continent: Continent.asia,
    medianGDP: 42,
    population: 2801,
    economy: Economy.developedNonG7,
    bbox: BBox(C(-12.2, 96.83), C(-12.13, 96.87)),
  );

  static const Country britishIndianOceanTerritory = Country(
    name: 'British Indian Ocean Territory',
    code: 'IO',
    isoA3: 'IOT',
    continent: Continent.openOcean,
    medianGDP: 160,
    population: 4000,
    economy: Economy.developedNonG7,
    bbox: BBox(C(-7.435, 72.35), C(-7.22, 72.5)),
  );

  static const Country ireland = Country(
    name: 'Ireland',
    code: 'IE',
    isoA3: 'IRL',
    continent: Continent.europe,
    medianGDP: 322000,
    population: 5011102,
    economy: Economy.developedNonG7,
    bbox: BBox(C(51.47, -10.39), C(55.37, -6.027)),
  );

  static const Country iran = Country(
    name: 'Iran',
    code: 'IR',
    isoA3: 'IRN',
    continent: Continent.asia,
    medianGDP: 1459000,
    population: 82021564,
    economy: Economy.emergingG20,
    bbox: BBox(C(25.1, 44.02), C(39.77, 63.31)),
  );

  static const Country iraq = Country(
    name: 'Iraq',
    code: 'IQ',
    isoA3: 'IRQ',
    continent: Continent.asia,
    medianGDP: 596700,
    population: 39192111,
    economy: Economy.developing,
    bbox: BBox(C(29.06, 38.77), C(37.37, 48.55)),
  );

  static const Country iceland = Country(
    name: 'Iceland',
    code: 'IS',
    isoA3: 'ISL',
    continent: Continent.europe,
    medianGDP: 16150,
    population: 339747,
    economy: Economy.developedNonG7,
    bbox: BBox(C(63.41, -24.48), C(66.53, -13.56)),
  );

  static const Country israel = Country(
    name: 'Israel',
    code: 'IL',
    isoA3: 'ISR',
    continent: Continent.asia,
    medianGDP: 297000,
    population: 8299706,
    economy: Economy.developedNonG7,
    bbox: BBox(C(29.48, 34.25), C(33.43, 35.91)),
  );

  static const Country italy = Country(
    name: 'Italy',
    code: 'IT',
    isoA3: 'ITA',
    continent: Continent.europe,
    medianGDP: 2221000,
    population: 62137802,
    economy: Economy.developedG7,
    bbox: BBox(C(37.94, 6.628), C(47.08, 18.49)),
  );

  static const Country jamaica = Country(
    name: 'Jamaica',
    code: 'JM',
    isoA3: 'JAM',
    continent: Continent.northAmerica,
    medianGDP: 25390,
    population: 2990561,
    economy: Economy.developing,
    bbox: BBox(C(17.71, -78.34), C(18.52, -76.21)),
  );

  static const Country jersey = Country(
    name: 'Jersey',
    code: 'JE',
    isoA3: 'JEY',
    continent: Continent.europe,
    medianGDP: 5080,
    population: 98840,
    economy: Economy.developedNonG7,
    bbox: BBox(C(49.17, -2.236), C(49.27, -2.01)),
  );

  static const Country jordan = Country(
    name: 'Jordan',
    code: 'JO',
    isoA3: 'JOR',
    continent: Continent.asia,
    medianGDP: 86190,
    population: 10248069,
    economy: Economy.developing,
    bbox: BBox(C(29.19, 34.95), C(33.37, 39.29)),
  );

  static const Country japan = Country(
    name: 'Japan',
    code: 'JP',
    isoA3: 'JPN',
    continent: Continent.asia,
    medianGDP: 4932000,
    population: 126451398,
    economy: Economy.developedG7,
    bbox: BBox(C(33.49, 130.9), C(41.51, 142.0)),
  );

  static const Country siachenGlacier = Country(
    name: 'Siachen Glacier',
    code: '-99',
    isoA3: '-99',
    continent: Continent.asia,
    medianGDP: 15,
    population: 6000,
    economy: Economy.developing,
    bbox: BBox(C(35.11, 76.77), C(35.66, 77.8)),
  );

  static const Country kazakhstan = Country(
    name: 'Kazakhstan',
    code: 'KZ',
    isoA3: 'KAZ',
    continent: Continent.asia,
    medianGDP: 460700,
    population: 18556698,
    economy: Economy.developing,
    bbox: BBox(C(40.61, 46.61), C(55.39, 87.32)),
  );

  static const Country kenya = Country(
    name: 'Kenya',
    code: 'KE',
    isoA3: 'KEN',
    continent: Continent.africa,
    medianGDP: 152700,
    population: 47615739,
    economy: Economy.emergingG20,
    bbox: BBox(C(-4.692, 33.9), C(5.492, 41.88)),
  );

  static const Country kyrgyzstan = Country(
    name: 'Kyrgyzstan',
    code: 'KG',
    isoA3: 'KGZ',
    continent: Continent.asia,
    medianGDP: 21010,
    population: 5789122,
    economy: Economy.developing,
    bbox: BBox(C(39.21, 69.23), C(43.24, 80.25)),
  );

  static const Country cambodia = Country(
    name: 'Cambodia',
    code: 'KH',
    isoA3: 'KHM',
    continent: Continent.asia,
    medianGDP: 58940,
    population: 16204486,
    economy: Economy.developing,
    bbox: BBox(C(10.41, 102.3), C(14.71, 107.6)),
  );

  static const Country kiribati = Country(
    name: 'Kiribati',
    code: 'KI',
    isoA3: 'KIR',
    continent: Continent.oceania,
    medianGDP: 211,
    population: 108145,
    economy: Economy.developing,
    bbox: BBox(C(-2.856, -171.7), C(-2.761, -171.6)),
  );

  static const Country saintKittsAndNevis = Country(
    name: 'Saint Kitts and Nevis',
    code: 'KN',
    isoA3: 'KNA',
    continent: Continent.northAmerica,
    medianGDP: 1427,
    population: 52715,
    economy: Economy.developing,
    bbox: BBox(C(17.22, -62.84), C(17.4, -62.63)),
  );

  static const Country southKorea = Country(
    name: 'South Korea',
    code: 'KR',
    isoA3: 'KOR',
    continent: Continent.asia,
    medianGDP: 1929000,
    population: 51181299,
    economy: Economy.emergingMIKT,
    bbox: BBox(C(34.31, 126.2), C(38.62, 129.6)),
  );

  static const Country kosovo = Country(
    name: 'Kosovo',
    code: 'XK',
    isoA3: '-99',
    continent: Continent.europe,
    medianGDP: 18490,
    population: 1895250,
    economy: Economy.developing,
    bbox: BBox(C(41.85, 20.03), C(43.26, 21.75)),
  );

  static const Country kuwait = Country(
    name: 'Kuwait',
    code: 'KW',
    isoA3: 'KWT',
    continent: Continent.asia,
    medianGDP: 301100,
    population: 2875422,
    economy: Economy.developing,
    bbox: BBox(C(28.53, 46.53), C(30.1, 48.44)),
  );

  static const Country laos = Country(
    name: 'Laos',
    code: 'LA',
    isoA3: 'LAO',
    continent: Continent.asia,
    medianGDP: 40960,
    population: 7126706,
    economy: Economy.developing,
    bbox: BBox(C(13.92, 100.1), C(22.5, 107.7)),
  );

  static const Country lebanon = Country(
    name: 'Lebanon',
    code: 'LB',
    isoA3: 'LBN',
    continent: Continent.asia,
    medianGDP: 85160,
    population: 6229794,
    economy: Economy.developing,
    bbox: BBox(C(33.08, 35.11), C(34.68, 36.58)),
  );

  static const Country liberia = Country(
    name: 'Liberia',
    code: 'LR',
    isoA3: 'LBR',
    continent: Continent.africa,
    medianGDP: 3881,
    population: 4689021,
    economy: Economy.developing,
    bbox: BBox(C(4.351, -11.51), C(8.538, -7.4)),
  );

  static const Country libya = Country(
    name: 'Libya',
    code: 'LY',
    isoA3: 'LBY',
    continent: Continent.africa,
    medianGDP: 90890,
    population: 6653210,
    economy: Economy.developing,
    bbox: BBox(C(19.5, 9.31), C(33.18, 25.15)),
  );

  static const Country saintLucia = Country(
    name: 'Saint Lucia',
    code: 'LC',
    isoA3: 'LCA',
    continent: Continent.northAmerica,
    medianGDP: 2083,
    population: 164994,
    economy: Economy.developing,
    bbox: BBox(C(13.72, -61.07), C(14.09, -60.89)),
  );

  static const Country liechtenstein = Country(
    name: 'Liechtenstein',
    code: 'LI',
    isoA3: 'LIE',
    continent: Continent.europe,
    medianGDP: 4978,
    population: 38244,
    economy: Economy.developedNonG7,
    bbox: BBox(C(47.06, 9.479), C(47.27, 9.611)),
  );

  static const Country sriLanka = Country(
    name: 'Sri Lanka',
    code: 'LK',
    isoA3: 'LKA',
    continent: Continent.asia,
    medianGDP: 236700,
    population: 22409381,
    economy: Economy.developing,
    bbox: BBox(C(5.949, 79.71), C(9.813, 81.88)),
  );

  static const Country lesotho = Country(
    name: 'Lesotho',
    code: 'LS',
    isoA3: 'LSO',
    continent: Continent.africa,
    medianGDP: 6019,
    population: 1958042,
    economy: Economy.developing,
    bbox: BBox(C(-30.64, 27.05), C(-28.58, 29.39)),
  );

  static const Country lithuania = Country(
    name: 'Lithuania',
    code: 'LT',
    isoA3: 'LTU',
    continent: Continent.europe,
    medianGDP: 85620,
    population: 2823859,
    economy: Economy.developedNonG7,
    bbox: BBox(C(53.89, 21.05), C(56.41, 26.78)),
  );

  static const Country luxembourg = Country(
    name: 'Luxembourg',
    code: 'LU',
    isoA3: 'LUX',
    continent: Continent.europe,
    medianGDP: 58740,
    population: 594130,
    economy: Economy.developedNonG7,
    bbox: BBox(C(49.45, 5.725), C(50.17, 6.494)),
  );

  static const Country latvia = Country(
    name: 'Latvia',
    code: 'LV',
    isoA3: 'LVA',
    continent: Continent.europe,
    medianGDP: 50650,
    population: 1944643,
    economy: Economy.developedNonG7,
    bbox: BBox(C(55.67, 21.01), C(58.06, 28.2)),
  );

  static const Country macao = Country(
    name: 'Macao',
    code: 'MO',
    isoA3: 'MAC',
    continent: Continent.asia,
    medianGDP: 63220,
    population: 601969,
    economy: Economy.developing,
    bbox: BBox(C(22.2, 113.5), C(22.25, 113.5)),
  );

  static const Country saintMartin = Country(
    name: 'Saint Martin',
    code: 'MF',
    isoA3: 'MAF',
    continent: Continent.northAmerica,
    medianGDP: 562,
    population: 32125,
    economy: Economy.developing,
    bbox: BBox(C(18.07, -63.12), C(18.12, -63.01)),
  );

  static const Country morocco = Country(
    name: 'Morocco',
    code: 'MA',
    isoA3: 'MAR',
    continent: Continent.africa,
    medianGDP: 282800,
    population: 33986655,
    economy: Economy.developing,
    bbox: BBox(C(21.42, -17.0), C(35.93, -1.066)),
  );

  static const Country monaco = Country(
    name: 'Monaco',
    code: 'MC',
    isoA3: 'MCO',
    continent: Continent.europe,
    medianGDP: 7672,
    population: 30645,
    economy: Economy.developedNonG7,
    bbox: BBox(C(43.73, 7.378), C(43.77, 7.439)),
  );

  static const Country moldova = Country(
    name: 'Moldova',
    code: 'MD',
    isoA3: 'MDA',
    continent: Continent.europe,
    medianGDP: 18540,
    population: 3474121,
    economy: Economy.developing,
    bbox: BBox(C(45.45, 26.62), C(48.48, 30.13)),
  );

  static const Country madagascar = Country(
    name: 'Madagascar',
    code: 'MG',
    isoA3: 'MDG',
    continent: Continent.africa,
    medianGDP: 36860,
    population: 25054161,
    economy: Economy.developing,
    bbox: BBox(C(-25.57, 43.26), C(-12.08, 50.48)),
  );

  static const Country maldives = Country(
    name: 'Maldives',
    code: 'MV',
    isoA3: 'MDV',
    continent: Continent.openOcean,
    medianGDP: 5407,
    population: 392709,
    economy: Economy.developing,
    bbox: BBox(C(4.155, 73.47), C(4.248, 73.53)),
  );

  static const Country mexico = Country(
    name: 'Mexico',
    code: 'MX',
    isoA3: 'MEX',
    continent: Continent.northAmerica,
    medianGDP: 2307000,
    population: 124574795,
    economy: Economy.emergingMIKT,
    bbox: BBox(C(14.55, -117.1), C(32.72, -86.77)),
  );

  static const Country marshallIslands = Country(
    name: 'Marshall Islands',
    code: 'MH',
    isoA3: 'MHL',
    continent: Continent.oceania,
    medianGDP: 180,
    population: 74539,
    economy: Economy.developing,
    bbox: BBox(C(7.069, 171.0), C(7.172, 171.4)),
  );

  static const Country macedonia = Country(
    name: 'Macedonia',
    code: 'MK',
    isoA3: 'MKD',
    continent: Continent.europe,
    medianGDP: 29520,
    population: 2103721,
    economy: Economy.developing,
    bbox: BBox(C(40.85, 20.45), C(42.36, 23.01)),
  );

  static const Country mali = Country(
    name: 'Mali',
    code: 'ML',
    isoA3: 'MLI',
    continent: Continent.africa,
    medianGDP: 38090,
    population: 17885245,
    economy: Economy.developing,
    bbox: BBox(C(10.14, -12.28), C(25.0, 4.235)),
  );

  static const Country malta = Country(
    name: 'Malta',
    code: 'MT',
    isoA3: 'MLT',
    continent: Continent.europe,
    medianGDP: 16320,
    population: 416338,
    economy: Economy.developedNonG7,
    bbox: BBox(C(35.82, 14.35), C(35.98, 14.57)),
  );

  static const Country myanmar = Country(
    name: 'Myanmar',
    code: 'MM',
    isoA3: 'MMR',
    continent: Continent.asia,
    medianGDP: 311100,
    population: 55123814,
    economy: Economy.developing,
    bbox: BBox(C(10.03, 92.18), C(28.52, 101.1)),
  );

  static const Country montenegro = Country(
    name: 'Montenegro',
    code: 'ME',
    isoA3: 'MNE',
    continent: Continent.europe,
    medianGDP: 10610,
    population: 642550,
    economy: Economy.developing,
    bbox: BBox(C(41.87, 18.44), C(43.54, 20.35)),
  );

  static const Country mongolia = Country(
    name: 'Mongolia',
    code: 'MN',
    isoA3: 'MNG',
    continent: Continent.asia,
    medianGDP: 37000,
    population: 3068243,
    economy: Economy.developing,
    bbox: BBox(C(41.6, 87.74), C(52.12, 119.9)),
  );

  static const Country northernMarianaIslands = Country(
    name: 'Northern Mariana Islands',
    code: 'MP',
    isoA3: 'MNP',
    continent: Continent.oceania,
    medianGDP: 682,
    population: 52263,
    economy: Economy.developing,
    bbox: BBox(C(15.11, 145.7), C(15.27, 145.8)),
  );

  static const Country mozambique = Country(
    name: 'Mozambique',
    code: 'MZ',
    isoA3: 'MOZ',
    continent: Continent.africa,
    medianGDP: 35010,
    population: 26573706,
    economy: Economy.developing,
    bbox: BBox(C(-26.86, 30.22), C(-10.46, 40.84)),
  );

  static const Country mauritania = Country(
    name: 'Mauritania',
    code: 'MR',
    isoA3: 'MRT',
    continent: Continent.africa,
    medianGDP: 16710,
    population: 3758571,
    economy: Economy.developing,
    bbox: BBox(C(14.75, -17.06), C(27.29, -4.823)),
  );

  static const Country montserrat = Country(
    name: 'Montserrat',
    code: 'MS',
    isoA3: 'MSR',
    continent: Continent.northAmerica,
    medianGDP: 44,
    population: 5292,
    economy: Economy.developing,
    bbox: BBox(C(16.68, -62.22), C(16.81, -62.15)),
  );

  static const Country mauritius = Country(
    name: 'Mauritius',
    code: 'MU',
    isoA3: 'MUS',
    continent: Continent.openOcean,
    medianGDP: 25850,
    population: 1356388,
    economy: Economy.developing,
    bbox: BBox(C(-20.51, 57.32), C(-19.99, 57.79)),
  );

  static const Country malawi = Country(
    name: 'Malawi',
    code: 'MW',
    isoA3: 'MWI',
    continent: Continent.africa,
    medianGDP: 21200,
    population: 19196246,
    economy: Economy.developing,
    bbox: BBox(C(-17.13, 32.67), C(-9.395, 35.89)),
  );

  static const Country malaysia = Country(
    name: 'Malaysia',
    code: 'MY',
    isoA3: 'MYS',
    continent: Continent.asia,
    medianGDP: 863000,
    population: 31381992,
    economy: Economy.developing,
    bbox: BBox(C(0.862, 109.5), C(6.99, 119.3)),
  );

  static const Country namibia = Country(
    name: 'Namibia',
    code: 'NA',
    isoA3: 'NAM',
    continent: Continent.africa,
    medianGDP: 25990,
    population: 2484780,
    economy: Economy.developing,
    bbox: BBox(C(-28.94, 11.72), C(-16.97, 25.26)),
  );

  static const Country newCaledonia = Country(
    name: 'New Caledonia',
    code: 'NC',
    isoA3: 'NCL',
    continent: Continent.oceania,
    medianGDP: 10770,
    population: 279070,
    economy: Economy.developing,
    bbox: BBox(C(-22.38, 164.0), C(-20.14, 167.0)),
  );

  static const Country niger = Country(
    name: 'Niger',
    code: 'NE',
    isoA3: 'NER',
    continent: Continent.africa,
    medianGDP: 20150,
    population: 19245344,
    economy: Economy.developing,
    bbox: BBox(C(11.7, 0.1639), C(23.52, 15.96)),
  );

  static const Country norfolkIsland = Country(
    name: 'Norfolk Island',
    code: 'NF',
    isoA3: 'NFK',
    continent: Continent.oceania,
    medianGDP: 33,
    population: 2210,
    economy: Economy.developing,
    bbox: BBox(C(-29.1, 167.9), C(-29.01, 168.0)),
  );

  static const Country nigeria = Country(
    name: 'Nigeria',
    code: 'NG',
    isoA3: 'NGA',
    continent: Continent.africa,
    medianGDP: 1089000,
    population: 190632261,
    economy: Economy.emergingG20,
    bbox: BBox(C(4.277, 2.686), C(13.87, 14.63)),
  );

  static const Country nicaragua = Country(
    name: 'Nicaragua',
    code: 'NI',
    isoA3: 'NIC',
    continent: Continent.northAmerica,
    medianGDP: 33550,
    population: 6025951,
    economy: Economy.developing,
    bbox: BBox(C(10.74, -87.67), C(15.01, -83.16)),
  );

  static const Country niue = Country(
    name: 'Niue',
    code: 'NU',
    isoA3: 'NIU',
    continent: Continent.oceania,
    medianGDP: 10,
    population: 1626,
    economy: Economy.developing,
    bbox: BBox(C(-19.14, -169.9), C(-18.97, -169.8)),
  );

  static const Country netherlands = Country(
    name: 'Netherlands',
    code: 'NL',
    isoA3: 'NLD',
    continent: Continent.europe,
    medianGDP: 870800,
    population: 17084719,
    economy: Economy.developedNonG7,
    bbox: BBox(C(50.75, 3.449), C(53.44, 7.197)),
  );

  static const Country norway = Country(
    name: 'Norway',
    code: '-99',
    isoA3: '-99',
    continent: Continent.europe,
    medianGDP: 364700,
    population: 5320045,
    economy: Economy.developedNonG7,
    bbox: BBox(C(58.02, 4.91), C(71.09, 30.96)),
  );

  static const Country nepal = Country(
    name: 'Nepal',
    code: 'NP',
    isoA3: 'NPL',
    continent: Continent.asia,
    medianGDP: 71520,
    population: 29384297,
    economy: Economy.developing,
    bbox: BBox(C(26.36, 80.05), C(30.39, 88.16)),
  );

  static const Country nauru = Country(
    name: 'Nauru',
    code: 'NR',
    isoA3: 'NRU',
    continent: Continent.oceania,
    medianGDP: 151,
    population: 9642,
    economy: Economy.developing,
    bbox: BBox(C(-0.5508, 166.9), C(-0.4894, 167.0)),
  );

  static const Country newZealand = Country(
    name: 'New Zealand',
    code: 'NZ',
    isoA3: 'NZL',
    continent: Continent.oceania,
    medianGDP: 174800,
    population: 4510327,
    economy: Economy.developedNonG7,
    bbox: BBox(C(-46.63, 166.5), C(-40.49, 174.4)),
  );

  static const Country oman = Country(
    name: 'Oman',
    code: 'OM',
    isoA3: 'OMN',
    continent: Continent.asia,
    medianGDP: 173100,
    population: 3424386,
    economy: Economy.developing,
    bbox: BBox(C(16.65, 51.98), C(24.98, 59.84)),
  );

  static const Country pakistan = Country(
    name: 'Pakistan',
    code: 'PK',
    isoA3: 'PAK',
    continent: Continent.asia,
    medianGDP: 988200,
    population: 204924861,
    economy: Economy.emergingG20,
    bbox: BBox(C(23.75, 60.84), C(37.04, 77.05)),
  );

  static const Country panama = Country(
    name: 'Panama',
    code: 'PA',
    isoA3: 'PAN',
    continent: Continent.northAmerica,
    medianGDP: 93120,
    population: 3753142,
    economy: Economy.developing,
    bbox: BBox(C(7.22, -83.03), C(9.598, -77.2)),
  );

  static const Country pitcairnIslands = Country(
    name: 'Pitcairn Islands',
    code: 'PN',
    isoA3: 'PCN',
    continent: Continent.oceania,
    medianGDP: 0,
    population: 54,
    economy: Economy.developing,
    bbox: BBox(C(-24.41, -128.4), C(-24.32, -128.3)),
  );

  static const Country peru = Country(
    name: 'Peru',
    code: 'PE',
    isoA3: 'PER',
    continent: Continent.southAmerica,
    medianGDP: 410400,
    population: 31036656,
    economy: Economy.emergingG20,
    bbox: BBox(C(-18.35, -81.34), C(-0.04175, -68.69)),
  );

  static const Country philippines = Country(
    name: 'Philippines',
    code: 'PH',
    isoA3: 'PHL',
    continent: Continent.asia,
    medianGDP: 801900,
    population: 104256076,
    economy: Economy.emergingG20,
    bbox: BBox(C(12.57, 119.8), C(18.62, 124.1)),
  );

  static const Country palau = Country(
    name: 'Palau',
    code: 'PW',
    isoA3: 'PLW',
    continent: Continent.oceania,
    medianGDP: 276,
    population: 21431,
    economy: Economy.developing,
    bbox: BBox(C(7.361, 134.5), C(7.712, 134.7)),
  );

  static const Country papuaNewGuinea = Country(
    name: 'Papua New Guinea',
    code: 'PG',
    isoA3: 'PNG',
    continent: Continent.oceania,
    medianGDP: 28020,
    population: 6909701,
    economy: Economy.developing,
    bbox: BBox(C(-10.65, 140.9), C(-2.61, 150.8)),
  );

  static const Country poland = Country(
    name: 'Poland',
    code: 'PL',
    isoA3: 'POL',
    continent: Continent.europe,
    medianGDP: 1052000,
    population: 38476269,
    economy: Economy.developedNonG7,
    bbox: BBox(C(49.02, 14.13), C(54.84, 24.11)),
  );

  static const Country puertoRico = Country(
    name: 'Puerto Rico',
    code: 'PR',
    isoA3: 'PRI',
    continent: Continent.northAmerica,
    medianGDP: 131000,
    population: 3351827,
    economy: Economy.developing,
    bbox: BBox(C(17.95, -67.26), C(18.52, -65.62)),
  );

  static const Country northKorea = Country(
    name: 'North Korea',
    code: 'KP',
    isoA3: 'PRK',
    continent: Continent.asia,
    medianGDP: 40000,
    population: 25248140,
    economy: Economy.developing,
    bbox: BBox(C(37.72, 124.3), C(43.0, 130.7)),
  );

  static const Country portugal = Country(
    name: 'Portugal',
    code: 'PT',
    isoA3: 'PRT',
    continent: Continent.europe,
    medianGDP: 297100,
    population: 10839514,
    economy: Economy.developedNonG7,
    bbox: BBox(C(37.01, -9.48), C(42.14, -6.213)),
  );

  static const Country paraguay = Country(
    name: 'Paraguay',
    code: 'PY',
    isoA3: 'PRY',
    continent: Continent.southAmerica,
    medianGDP: 64670,
    population: 6943739,
    economy: Economy.emergingG20,
    bbox: BBox(C(-27.55, -62.65), C(-19.29, -54.24)),
  );

  static const Country palestine = Country(
    name: 'Palestine',
    code: 'PS',
    isoA3: 'PSE',
    continent: Continent.asia,
    medianGDP: 21221,
    population: 4543126,
    economy: Economy.developing,
    bbox: BBox(C(31.35, 34.87), C(32.53, 35.57)),
  );

  static const Country frenchPolynesia = Country(
    name: 'French Polynesia',
    code: 'PF',
    isoA3: 'PYF',
    continent: Continent.oceania,
    medianGDP: 5490,
    population: 287881,
    economy: Economy.developing,
    bbox: BBox(C(-17.88, -140.9), C(-17.67, -140.6)),
  );

  static const Country qatar = Country(
    name: 'Qatar',
    code: 'QA',
    isoA3: 'QAT',
    continent: Continent.asia,
    medianGDP: 334500,
    population: 2314307,
    economy: Economy.developing,
    bbox: BBox(C(24.56, 50.75), C(26.15, 51.61)),
  );

  static const Country romania = Country(
    name: 'Romania',
    code: 'RO',
    isoA3: 'ROU',
    continent: Continent.europe,
    medianGDP: 441000,
    population: 21529967,
    economy: Economy.developedNonG7,
    bbox: BBox(C(43.67, 20.24), C(48.26, 29.71)),
  );

  static const Country russia = Country(
    name: 'Russia',
    code: 'RU',
    isoA3: 'RUS',
    continent: Continent.europe,
    medianGDP: 3745000,
    population: 142257519,
    economy: Economy.emergingBRIC,
    bbox: BBox(C(41.2, 27.35), C(77.73, 180.0)),
  );

  static const Country rwanda = Country(
    name: 'Rwanda',
    code: 'RW',
    isoA3: 'RWA',
    continent: Continent.africa,
    medianGDP: 21970,
    population: 11901484,
    economy: Economy.developing,
    bbox: BBox(C(-2.809, 28.86), C(-1.063, 30.88)),
  );

  static const Country westernSahara = Country(
    name: 'Western Sahara',
    code: 'EH',
    isoA3: 'ESH',
    continent: Continent.africa,
    medianGDP: 907,
    population: 603253,
    economy: Economy.developing,
    bbox: BBox(C(20.81, -17.1), C(27.66, -8.682)),
  );

  static const Country saudiArabia = Country(
    name: 'Saudi Arabia',
    code: 'SA',
    isoA3: 'SAU',
    continent: Continent.asia,
    medianGDP: 1731000,
    population: 28571770,
    economy: Economy.developedNonG7,
    bbox: BBox(C(16.37, 34.62), C(32.12, 55.64)),
  );

  static const Country sudan = Country(
    name: 'Sudan',
    code: 'SD',
    isoA3: 'SDN',
    continent: Continent.africa,
    medianGDP: 176300,
    population: 37345935,
    economy: Economy.developing,
    bbox: BBox(C(8.666, 21.83), C(22.2, 38.61)),
  );

  static const Country southSudan = Country(
    name: 'South Sudan',
    code: 'SS',
    isoA3: 'SSD',
    continent: Continent.africa,
    medianGDP: 20880,
    population: 13026129,
    economy: Economy.developing,
    bbox: BBox(C(3.491, 24.15), C(12.22, 35.27)),
  );

  static const Country senegal = Country(
    name: 'Senegal',
    code: 'SN',
    isoA3: 'SEN',
    continent: Continent.africa,
    medianGDP: 39720,
    population: 14668522,
    economy: Economy.developing,
    bbox: BBox(C(12.33, -17.54), C(16.68, -11.38)),
  );

  static const Country singapore = Country(
    name: 'Singapore',
    code: 'SG',
    isoA3: 'SGP',
    continent: Continent.asia,
    medianGDP: 487900,
    population: 5888926,
    economy: Economy.developing,
    bbox: BBox(C(1.265, 103.7), C(1.447, 104.0)),
  );

  static const Country southGeorgiaAndTheIslands = Country(
    name: 'South Georgia and the Islands',
    code: 'GS',
    isoA3: 'SGS',
    continent: Continent.openOcean,
    medianGDP: 0,
    population: 30,
    economy: Economy.developing,
    bbox: BBox(C(-54.87, -38.02), C(-53.98, -35.8)),
  );

  static const Country saintHelena = Country(
    name: 'Saint Helena',
    code: 'SH',
    isoA3: 'SHN',
    continent: Continent.openOcean,
    medianGDP: 31,
    population: 7828,
    economy: Economy.developing,
    bbox: BBox(C(-7.976, -14.41), C(-7.883, -14.3)),
  );

  static const Country solomonIslands = Country(
    name: 'Solomon Islands',
    code: 'SB',
    isoA3: 'SLB',
    continent: Continent.oceania,
    medianGDP: 1198,
    population: 647581,
    economy: Economy.developing,
    bbox: BBox(C(-8.557, 158.5), C(-7.545, 159.9)),
  );

  static const Country sierraLeone = Country(
    name: 'Sierra Leone',
    code: 'SL',
    isoA3: 'SLE',
    continent: Continent.africa,
    medianGDP: 10640,
    population: 6163195,
    economy: Economy.developing,
    bbox: BBox(C(6.907, -13.29), C(9.997, -10.28)),
  );

  static const Country elSalvador = Country(
    name: 'El Salvador',
    code: 'SV',
    isoA3: 'SLV',
    continent: Continent.northAmerica,
    medianGDP: 54790,
    population: 6172011,
    economy: Economy.developing,
    bbox: BBox(C(13.16, -90.11), C(14.43, -87.72)),
  );

  static const Country sanMarino = Country(
    name: 'San Marino',
    code: 'SM',
    isoA3: 'SMR',
    continent: Continent.europe,
    medianGDP: 2023,
    population: 33537,
    economy: Economy.developedNonG7,
    bbox: BBox(C(43.89, 12.4), C(43.99, 12.51)),
  );

  static const Country somaliland = Country(
    name: 'Somaliland',
    code: '-99',
    isoA3: '-99',
    continent: Continent.africa,
    medianGDP: 12250,
    population: 3500000,
    economy: Economy.developing,
    bbox: BBox(C(7.997, 42.66), C(11.5, 48.94)),
  );

  static const Country somalia = Country(
    name: 'Somalia',
    code: 'SO',
    isoA3: 'SOM',
    continent: Continent.africa,
    medianGDP: 4719,
    population: 7531386,
    economy: Economy.developing,
    bbox: BBox(C(-1.695, 40.96), C(11.98, 51.39)),
  );

  static const Country saintPierreAndMiquelon = Country(
    name: 'Saint Pierre and Miquelon',
    code: 'PM',
    isoA3: 'SPM',
    continent: Continent.northAmerica,
    medianGDP: 215,
    population: 5533,
    economy: Economy.developedNonG7,
    bbox: BBox(C(46.8, -56.39), C(47.1, -56.26)),
  );

  static const Country republicOfSerbia = Country(
    name: 'Republic of Serbia',
    code: 'RS',
    isoA3: 'SRB',
    continent: Continent.europe,
    medianGDP: 101800,
    population: 7111024,
    economy: Economy.developing,
    bbox: BBox(C(42.24, 18.84), C(46.17, 22.98)),
  );

  static const Country saoTomeAndPrincipe = Country(
    name: 'Sao Tome and Principe',
    code: 'ST',
    isoA3: 'STP',
    continent: Continent.africa,
    medianGDP: 694,
    population: 201025,
    economy: Economy.developing,
    bbox: BBox(C(0.04736, 6.468), C(0.4044, 6.75)),
  );

  static const Country suriname = Country(
    name: 'Suriname',
    code: 'SR',
    isoA3: 'SUR',
    continent: Continent.southAmerica,
    medianGDP: 8547,
    population: 591919,
    economy: Economy.developing,
    bbox: BBox(C(1.842, -58.05), C(5.993, -53.99)),
  );

  static const Country slovakia = Country(
    name: 'Slovakia',
    code: 'SK',
    isoA3: 'SVK',
    continent: Continent.europe,
    medianGDP: 168800,
    population: 5445829,
    economy: Economy.developedNonG7,
    bbox: BBox(C(47.76, 16.86), C(49.6, 22.54)),
  );

  static const Country slovenia = Country(
    name: 'Slovenia',
    code: 'SI',
    isoA3: 'SVN',
    continent: Continent.europe,
    medianGDP: 68350,
    population: 1972126,
    economy: Economy.developedNonG7,
    bbox: BBox(C(45.43, 13.38), C(46.86, 16.52)),
  );

  static const Country sweden = Country(
    name: 'Sweden',
    code: 'SE',
    isoA3: 'SWE',
    continent: Continent.europe,
    medianGDP: 498100,
    population: 9960487,
    economy: Economy.developedNonG7,
    bbox: BBox(C(55.35, 11.15), C(69.04, 24.16)),
  );

  static const Country swaziland = Country(
    name: 'Swaziland',
    code: 'SZ',
    isoA3: 'SWZ',
    continent: Continent.africa,
    medianGDP: 11060,
    population: 1467152,
    economy: Economy.developing,
    bbox: BBox(C(-27.31, 30.79), C(-25.74, 32.11)),
  );

  static const Country sintMaarten = Country(
    name: 'Sint Maarten',
    code: 'SX',
    isoA3: 'SXM',
    continent: Continent.northAmerica,
    medianGDP: 366,
    population: 42083,
    economy: Economy.developing,
    bbox: BBox(C(18.02, -63.12), C(18.07, -63.01)),
  );

  static const Country seychelles = Country(
    name: 'Seychelles',
    code: 'SC',
    isoA3: 'SYC',
    continent: Continent.openOcean,
    medianGDP: 2608,
    population: 93920,
    economy: Economy.developing,
    bbox: BBox(C(-4.786, 55.38), C(-4.559, 55.54)),
  );

  static const Country syria = Country(
    name: 'Syria',
    code: 'SY',
    isoA3: 'SYR',
    continent: Continent.asia,
    medianGDP: 50280,
    population: 18028549,
    economy: Economy.developing,
    bbox: BBox(C(32.32, 35.76), C(37.3, 42.36)),
  );

  static const Country turksAndCaicosIslands = Country(
    name: 'Turks and Caicos Islands',
    code: 'TC',
    isoA3: 'TCA',
    continent: Continent.northAmerica,
    medianGDP: 632,
    population: 52570,
    economy: Economy.developing,
    bbox: BBox(C(21.76, -72.34), C(21.85, -72.14)),
  );

  static const Country chad = Country(
    name: 'Chad',
    code: 'TD',
    isoA3: 'TCD',
    continent: Continent.africa,
    medianGDP: 30590,
    population: 12075985,
    economy: Economy.developing,
    bbox: BBox(C(7.475, 13.45), C(23.45, 23.98)),
  );

  static const Country togo = Country(
    name: 'Togo',
    code: 'TG',
    isoA3: 'TGO',
    continent: Continent.africa,
    medianGDP: 11610,
    population: 7965055,
    economy: Economy.developing,
    bbox: BBox(C(6.089, -0.09019), C(11.12, 1.778)),
  );

  static const Country thailand = Country(
    name: 'Thailand',
    code: 'TH',
    isoA3: 'THA',
    continent: Continent.asia,
    medianGDP: 1161000,
    population: 68414135,
    economy: Economy.emergingG20,
    bbox: BBox(C(5.637, 97.37), C(20.42, 105.6)),
  );

  static const Country tajikistan = Country(
    name: 'Tajikistan',
    code: 'TJ',
    isoA3: 'TJK',
    continent: Continent.asia,
    medianGDP: 25810,
    population: 8468555,
    economy: Economy.developing,
    bbox: BBox(C(36.68, 67.35), C(41.04, 75.12)),
  );

  static const Country turkmenistan = Country(
    name: 'Turkmenistan',
    code: 'TM',
    isoA3: 'TKM',
    continent: Continent.asia,
    medianGDP: 94720,
    population: 5351277,
    economy: Economy.developing,
    bbox: BBox(C(35.17, 52.49), C(42.78, 66.63)),
  );

  static const Country eastTimor = Country(
    name: 'East Timor',
    code: 'TL',
    isoA3: 'TLS',
    continent: Continent.asia,
    medianGDP: 4975,
    population: 1291358,
    economy: Economy.developing,
    bbox: BBox(C(-9.512, 124.9), C(-8.316, 127.3)),
  );

  static const Country tonga = Country(
    name: 'Tonga',
    code: 'TO',
    isoA3: 'TON',
    continent: Continent.oceania,
    medianGDP: 557,
    population: 106479,
    economy: Economy.developing,
    bbox: BBox(C(-21.26, -175.4), C(-21.07, -175.1)),
  );

  static const Country trinidadAndTobago = Country(
    name: 'Trinidad and Tobago',
    code: 'TT',
    isoA3: 'TTO',
    continent: Continent.northAmerica,
    medianGDP: 43570,
    population: 1218208,
    economy: Economy.developing,
    bbox: BBox(C(10.06, -61.91), C(10.84, -60.92)),
  );

  static const Country tunisia = Country(
    name: 'Tunisia',
    code: 'TN',
    isoA3: 'TUN',
    continent: Continent.africa,
    medianGDP: 130800,
    population: 11403800,
    economy: Economy.developing,
    bbox: BBox(C(30.23, 7.496), C(37.34, 11.54)),
  );

  static const Country turkey = Country(
    name: 'Turkey',
    code: 'TR',
    isoA3: 'TUR',
    continent: Continent.asia,
    medianGDP: 1670000,
    population: 80845215,
    economy: Economy.emergingMIKT,
    bbox: BBox(C(35.83, 26.1), C(42.06, 44.82)),
  );

  static const Country taiwan = Country(
    name: 'Taiwan',
    code: 'TW',
    isoA3: 'TWN',
    continent: Continent.asia,
    medianGDP: 1127000,
    population: 23508428,
    economy: Economy.developedNonG7,
    bbox: BBox(C(21.93, 120.1), C(25.28, 121.9)),
  );

  static const Country unitedRepublicOfTanzania = Country(
    name: 'United Republic of Tanzania',
    code: 'TZ',
    isoA3: 'TZA',
    continent: Continent.africa,
    medianGDP: 150600,
    population: 53950935,
    economy: Economy.developing,
    bbox: BBox(C(-11.72, 29.32), C(-0.9949, 40.46)),
  );

  static const Country uganda = Country(
    name: 'Uganda',
    code: 'UG',
    isoA3: 'UGA',
    continent: Continent.africa,
    medianGDP: 84930,
    population: 39570125,
    economy: Economy.developing,
    bbox: BBox(C(-1.47, 29.56), C(4.22, 34.98)),
  );

  static const Country ukraine = Country(
    name: 'Ukraine',
    code: 'UA',
    isoA3: 'UKR',
    continent: Continent.europe,
    medianGDP: 352600,
    population: 44033874,
    economy: Economy.developing,
    bbox: BBox(C(45.23, 22.13), C(52.35, 40.13)),
  );

  static const Country uruguay = Country(
    name: 'Uruguay',
    code: 'UY',
    isoA3: 'URY',
    continent: Continent.southAmerica,
    medianGDP: 73250,
    population: 3360148,
    economy: Economy.emergingG20,
    bbox: BBox(C(-34.93, -58.44), C(-30.1, -53.13)),
  );

  static const Country usa = Country(
    name: 'United States of America',
    code: 'US',
    isoA3: 'USA',
    continent: Continent.northAmerica,
    medianGDP: 18560000,
    population: 326625791,
    economy: Economy.developedG7,
    bbox: BBox(C(25.13, -124.7), C(49.37, -66.99)),
  );

  static const Country uzbekistan = Country(
    name: 'Uzbekistan',
    code: 'UZ',
    isoA3: 'UZB',
    continent: Continent.asia,
    medianGDP: 202300,
    population: 29748859,
    economy: Economy.developing,
    bbox: BBox(C(37.17, 55.98), C(45.56, 73.14)),
  );

  static const Country vatican = Country(
    name: 'Vatican',
    code: 'VA',
    isoA3: 'VAT',
    continent: Continent.europe,
    medianGDP: 0,
    population: 1000,
    economy: Economy.developedNonG7,
    bbox: BBox(C(41.9, 12.43), C(41.91, 12.44)),
  );

  static const Country saintVincentAndTheGrenadines = Country(
    name: 'Saint Vincent and the Grenadines',
    code: 'VC',
    isoA3: 'VCT',
    continent: Continent.northAmerica,
    medianGDP: 1241,
    population: 102089,
    economy: Economy.developing,
    bbox: BBox(C(12.98, -61.28), C(13.05, -61.19)),
  );

  static const Country venezuela = Country(
    name: 'Venezuela',
    code: 'VE',
    isoA3: 'VEN',
    continent: Continent.southAmerica,
    medianGDP: 468600,
    population: 31304016,
    economy: Economy.emergingG20,
    bbox: BBox(C(0.688, -73.37), C(12.18, -59.83)),
  );

  static const Country britishVirginIslands = Country(
    name: 'British Virgin Islands',
    code: 'VG',
    isoA3: 'VGB',
    continent: Continent.northAmerica,
    medianGDP: 500,
    population: 35015,
    economy: Economy.developedNonG7,
    bbox: BBox(C(18.71, -64.41), C(18.75, -64.27)),
  );

  static const Country unitedStatesVirginIslands = Country(
    name: 'United States Virgin Islands',
    code: 'VI',
    isoA3: 'VIR',
    continent: Continent.northAmerica,
    medianGDP: 3792,
    population: 107268,
    economy: Economy.developing,
    bbox: BBox(C(17.7, -64.89), C(17.79, -64.58)),
  );

  static const Country vietnam = Country(
    name: 'Vietnam',
    code: 'VN',
    isoA3: 'VNM',
    continent: Continent.asia,
    medianGDP: 594900,
    population: 96160163,
    economy: Economy.emergingG20,
    bbox: BBox(C(8.583, 102.1), C(23.35, 109.4)),
  );

  static const Country vanuatu = Country(
    name: 'Vanuatu',
    code: 'VU',
    isoA3: 'VUT',
    continent: Continent.oceania,
    medianGDP: 723,
    population: 282814,
    economy: Economy.developing,
    bbox: BBox(C(-15.63, 166.5), C(-14.64, 167.2)),
  );

  static const Country wallisAndFutuna = Country(
    name: 'Wallis and Futuna',
    code: 'WF',
    isoA3: 'WLF',
    continent: Continent.oceania,
    medianGDP: 60,
    population: 15714,
    economy: Economy.developing,
    bbox: BBox(C(-14.32, -178.2), C(-14.23, -178.0)),
  );

  static const Country samoa = Country(
    name: 'Samoa',
    code: 'WS',
    isoA3: 'WSM',
    continent: Continent.oceania,
    medianGDP: 1046,
    population: 200108,
    economy: Economy.developing,
    bbox: BBox(C(-14.05, -172.0), C(-13.81, -171.4)),
  );

  static const Country yemen = Country(
    name: 'Yemen',
    code: 'YE',
    isoA3: 'YEM',
    continent: Continent.asia,
    medianGDP: 73450,
    population: 28036829,
    economy: Economy.developing,
    bbox: BBox(C(12.61, 42.66), C(19.0, 53.09)),
  );

  static const Country southAfrica = Country(
    name: 'South Africa',
    code: 'ZA',
    isoA3: 'ZAF',
    continent: Continent.africa,
    medianGDP: 739100,
    population: 54841552,
    economy: Economy.emergingG20,
    bbox: BBox(C(-34.79, 16.45), C(-22.15, 32.89)),
  );

  static const Country zambia = Country(
    name: 'Zambia',
    code: 'ZM',
    isoA3: 'ZMB',
    continent: Continent.africa,
    medianGDP: 65170,
    population: 15972000,
    economy: Economy.developing,
    bbox: BBox(C(-18.04, 21.98), C(-8.194, 33.66)),
  );

  static const Country zimbabwe = Country(
    name: 'Zimbabwe',
    code: 'ZW',
    isoA3: 'ZWE',
    continent: Continent.africa,
    medianGDP: 28330,
    population: 13805084,
    economy: Economy.emergingG20,
    bbox: BBox(C(-22.4, 25.22), C(-15.64, 33.01)),
  );
}