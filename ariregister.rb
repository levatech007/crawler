class Ariregister
  require 'selenium-webdriver'
  require 'csv'

  done = []
  reg_nrs = [12722997,12723005,12723407,12724915,12724950,12725174,12725441,12725820,12725889,12726179,12726297,12726653,12727339,12727374,12727397,12727500,12728132,12728534,12728712,12729456,12729539,12729640,12729893,12729982,12730076,12730873,12731045,12731163,12731329,12732702,12733050,12733083,12733280,12733392,12733742,12734316,12734747,12734764,12734888,12735155,12735451,12735468,12735971,12737243,12737378,12737510,12737527,12737533,12737562,12737786,12737869,12738142,12738372,12738633,12739041,12739271,12739391,12739704,12739874,12740038,12740110,12740216,12741196,12741374,12742238,12742296,12742652,12743143,12743396,12743605,12743663,12743870,12743982,12744007,12744042,12745515,12746503,12746710,12746905,12746911,12747187,12747193,12747922,12748407,12748459,12748650,12749660,12750203,12750829,12750864,12750887,12751065,12751527,12751616,12752426,12752515,12753242,12753495,12753503,12753851,12754371,12754552,12756051,12756134,12756186,12756476,12756520,12756565,12757671,12759144,12759150,12759374,12759405,12759919,12760549,12760756,12761106,12761158,12761201,12761454,12761891,12762005,12762175,12762369,12762531,12762689,12763163,12764501,12764795,12765328,12765883,12766902,12766983,12767103,12767178,12767267,12767333,12767818,12768232,12768427,12768686,12769177,12769680,12770134,12770482,12770938,12771814,12771955,12772386,12772794,12773196,12773701,12773948,12774095,12774184,12774267,12774646,12775096,12776527,12776958,12777403,12777490,12777515,12777550,12778360,12778383,12778650,12778710,12778745,12778940,12779514,12779566,12780492,12780701,12780820,12781907,12782410,12782870,12783496,12783964,12785928,12785970,12786081,12786402,12786879,12787376,12787695,12788335,12788861,12788890,12788950,12788988,12789257,12789369,12789429,12789553,12790028,12790651,12790792,12790875,12791047,12791455,12791490,12791515,12791811,12792213,12792802,12794465,12794821,12795022,12795878,12795967,12796010,12796085,12796234,12796263,12796794,12797423,12797937,12798405,12799540,12799698,12799818,12799942,12800645,12801159,12801314,12801366,12801550,12801716,12802147,12802383,12803307,12803460,12803678,12804815,12804873,12805312,12805559,12805571,12805654,12805737,12806240,12806688,12807498,12807653,12807682,12808575,12809617,12809942,12810017,12810037,12811086,12811666,12811726,12812878,12813375,12813501,12813553,12813665,12814653,12815322,12815368,12816126,12816155,12816400,12816681,12816801,12817114,12817166,12817203,12817806,12818993,12819018,12819225,12819581,12819656,12819828,12820091,12820116,12820257,12820470,12820487,12820725,12821110,12821334,12821601,12821699,12821736,12821937,12823333,12823356,12823406,12823557,12823698,12823712,12823818,12824097,12824108,12824522,12824924,12827101,12827420,12827495,12827839,12828000,12828313,12828454,12829146,12829962,12830497,12830770,12832102,12832415,12832622,12832645,12832846,12833691,12833975,12834704,12835201,12836152,12836301,12836620,12836689,12838004,12838010,12838056,12838228,12838257,12838725,12838808,12839156,12839363,12839558,12841147,12841182,12841271,12841319,12841510,12842135,12842359,12842508,12843011,12843637,12844281,12844654,12845085,12845180,12845978,12846251,12846564,12847227,12847440,12848505,12848638,12849479,12849605,12850413,12850471,12850850,12851134,12851230,12851364,12851507,12851513,12851648,12851714,12852731,12853601,12853653,12854546,12854670,12854977,12855103,12856189,12857415,12857906,12857929,12859213,12859360,12859745,12860009,12861138,12861210,12861492,12861523,12862221,12862238,12862592,12862646,12862793,12862994,12863054,12863172,12863249,12863427,12863545,12863663,12863812,12864243,12864438,12864668,12865047,12865716,12866101,12866118,12866348,12867690,12868063,12868241,12868850,12868896,12869051,12869186,12869973,12870172,12870456,12871444,12871912,12872320,12872366,12872389,12872449,12872573,12872644,12872828,12873408,12874052,12874558,12874572,12875011,12875229,12876200,12876513,12877091,12877501,12877820,12877872,12878191,12879010,12879185,12879517,12880354,12880710,12880868,12880992,12881589,12881595,12881632,12881690,12881827,12881945,12882904,12883832,12883967,12883996,12884576,12884613,12885222,12885506,12885707,12885854,12886003,12886109,12886368,12886902,12887333,12888143,12888189,12888226,12888522,12889409,12890542,12890654,12891056,12891085,12892334,12892432,12892618,12893026,12893486,12894103,12895440,12896651,12896711,12897314,12897604,12898532,12899980,12900252,12900619,12902328,12903345,12903374,12903523,12903606,12904020,12904209,12904333,12905189,12905634,12906102,12906881,12907225,12907314,12907642,12907656,12907975,12908182,12908302,12908383,12908609,12908986,12909017,12909537,12910345,12911119,12912396,12912491,12912752,12912858,12914260,12914685,12914886,12915851,12916017,12916158,12916224,12916617,12917531,12919197,12919263,12919276,12919330,12920088,12920438,12921082,12921277,12922070,12922489,12922584,12922845,12923448,12923589,12924146,12924264,12924353,12924423,12924620,12925111,12925358,12925619,12925683,12925795,12925810,12926263,12926464,12927038,12927498,12928351,12928859,12929824,12930261,12930371,12930916,12931778,12933300,12933493,12934666,12935894,12936020,12936072,12936959,12937539,12937999,12938042,12938254,12938450,12938533,12938711,12938763,12938786,12938831,12939219,12939432,12939662,12939716,12940056,12940286,12940317,12940435,12940501,12940524,12940984,12941096,12941156,12941363,12941452,12941647,12942032,12942693,12943126,12943623,12944723,12944752,12944963,12945013,12945504,12946194,12946679,12947265,12947377,12948394,12950652,12951195,12951462,12952311,12952450,12952763,12953024,12953030,12953260,12953745,12953998,12954621,12955264,12955715,12956181,12956790,12956910,12957766,12957832,12957849,12958056,12958429,12958694,12959274,12959400,12959669,12960099,12960194,12960797,12961396,12961555,12961621,12961762,12962081,12962187,12962260,12964097,12964246,12964588,12965332,12965561,12965702,12966239,12968161,12968505,12969427,12970382,12970643,12970962,12971111,12971364,12971720,12972234,12972257,12972760,12973021,12973162,12974013,12974188,12975729,12976091,12976440,12976864,12976953,12977390,12978277,12978314,12978418,12978604,12978840,12979839,12980251,12980794,12980897,12980920,12981380,12981397,12981463,12981761,12981826,12982617,12982712,12982787,12982793,12982920,12982965,12983195,12984154,12984355,12985538,12985937,12986029,12986087,12986101,12987193,12988092,12988407,12988531,12988531,12988666,12989134,12989223,12989418,12989430,12989737,12989795,12990213,12990255,12990717,12991023,12991059,12991102,12991390,12992515,12992704,12993087,12993621,12994299,12994313,12994425,12994499,12995092,12995206,12995519,12995548,12995821,12996950,12997381,12997719,12997777,12998742,12998877,12999061,12999115,12999196,12999204,12999322,12999517,12999747,13021974,13101979,13589625,14001865,14001931,14002008,14002534,14002706,14002818,14003568,14004036,14004088,14004467,14004740,14005024,14005231,14005780,14005923,14006561,14006963,14007224,14008040,14008560,14009186,14010060,14010108,14010380,14010657,14010918,14012001,14012515,14012834,14012975,14013383,14013704,14013957,14014187,14014572,14014785,14015293,14015778,14015985,14016200,14016772,14017040,14017234,14017688,14017748,14018311,14018896,14019210,14019865,14020064,14020360,14021307,14021537,14021750,14022086,14022502,14022896,14022991,14023022,14023364,14023482,14023750,14023772,14023921,14024501,14024866,14025877,14026262,14026894,14027089,14027095,14027468,14027758,14028456,14028545,14029740,14029800,14029875,14030157,14030223,14030269,14030594,14030890,14031777,14031984,14032742,14032953,14033011,14033339,14033664,14033828,14034528,14034592,14035114,14036148,14036734,14036970,14037685,14037716,14037886,14037900,14038319,14038590,14039559,14039589,14039603,14040018,14040138,14040368,14040718,14040842,14041057,14041439,14041623,14041706,14041787,14041863,14042019,14042918,14042924,14043483,14043792,14043929,14044685,14044706,14044828,14045182,14045259,14045816,14046572,14046603,14047028,14047152,14047181,14047198,14047287,14047689,14047985,14048329,14048424,14048507,14048698,14048849,14049056,14049659,14049760,14050160,14050214,14050987,14052578,14053767,14053810,14054175,14054413,14054655,14055387,14057297,14057742,14057771,14057877,14058061,14058322,14058492,14059356,14060098,14060543,14062111,14062335,14062418,14062571,14062683,14062884,14063271,14063688,14063889,14064966,14065279,14065575,14066289,14066617,14066801,14067752,14068036,14068332,14068763,14069018,14069455,14069917,14069998,14070607,14070702,14071280,14071400,14071512,14071618,14071630,14071788,14071995,14072457,14072658,14073273,14073592,14073959,14075119,14075326,14075444,14076292,14076705,14076751,14076934,14077167,14077549,14078193,14078282,14078566,14079429,14079608,14079887,14080008,14080758,14081373,14081781,14082125,14082349,14082444,14083403,14083478,14084207,14084377,14085744,14086376,14087235,14087683,14087766,14087996,14088056,14089009,14089498,14089529,14089825,14089914,14090159,14090892,14091319,14091615] # lisada registri koodid siia

  p "START: #{Time.now}"

  def self.info_ariregistrist(reg_nr)
    result = Array.new
    # set up Selenium
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    driver = Selenium::WebDriver.for :chrome, options: options

    # use <form name="liht" method="POST" action="/lihtparing"> to enter registration number
    driver.get('https://ariregister.rik.ee/lihtparing')
    element = driver.find_element(:name, "rkood")
    element.send_keys(reg_nr)
    element.submit

    # find table row with company information
    driver.find_elements(:xpath => "//table[@class='tbl_listing']/tbody/tr[2]/td").each do |r|
        result << r.text&.gsub(/[\r\n]+/, ' ') # some fields contain \n
    end

    CSV.open("result.csv", "a", {col_sep: ";"}) do |csv|
      csv << result
    end
    # keep track of registration numbers that have been processed
    CSV.open("done.csv", "a", {col_sep: ";"}) do |csv|
      csv << [reg_nr]
    end

    driver.quit

    p result
    # optimal time to avoid captcha
    sleep(rand(100..300))
  end

  reg_nrs.each do |reg_nr|
    begin
      info_ariregistrist(reg_nr) unless done.include?(reg_nr)
    rescue Selenium::WebDriver::Error::NoSuchElementError
      # program ran into captcha
      p "Rescued NoSuchElementError"
      p done
      sleep(rand(250..400))
      next
    end
  end

  p "END: #{Time.now}"
end
