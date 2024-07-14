
  List<String> markets = ["BIST 30","BIST 100","Yıldız Pazar","Ana Pazar"];
  List<String> bist30Stocks = [
    'AKBNK', 'ASELS', 'ENJSA', 'GARAN', 'HALKB',
    //'ISCTR', 'KCHOL', 'KOZAL', 'PETKM', 'SAHOL',
    //'SASA', 'THYAO', 'TUPRS', 'VESTL', 'YKBNK',
   // 'ADANA', 'AFYON', 'ANACM', 'BIMAS', 'CCOLA',
   // 'CEYLN', 'DOHOL', 'EKGYO', 'EREGL', 'FROTO',
   // 'GOLTS', 'ICBCT', 'SISE', 'TKFEN', 'TTKOM',
  ];
  List<String> bist100Stocks = [
    'AKBNK', 'ASELS', 'ENJSA', 'GARAN', 'HALKB',
    'ISCTR', 'KCHOL', 'KOZAL', 'PETKM', 'SAHOL',
    'SASA', 'THYAO', 'TUPRS', 'VESTL', 'YKBNK',
    'ADANA', 'AFYON', 'ANACM', 'BIMAS', 'CCOLA',
    'CEYLN', 'DOHOL', 'EKGYO', 'EREGL', 'FROTO',
    'GOLTS', 'ICBCT', 'SISE', 'TKFEN', 'TTKOM',
    'ALARK', 'ARCLK', 'AYGAZ', 'BANVT', 'BJKAS',
    'BRISA', 'CIMSA', 'DEVA', 'DGKLB', 'ECILC',
    'ECZYT', 'EGEEN', 'EKGYO', 'ENKAI', 'ENKAI',
    'EUKYO', 'FROTO', 'GOLTS', 'ICBCT', 'SISE',
    'KOZAL', 'PETKM', 'TKFEN', 'TUPRS', 'TTKOM',
    'ALGYO', 'ARCLK', 'AYGAZ', 'BIMAS', 'CCOLA',
    'CEMTS', 'DESA', 'DGKLB', 'ECILC', 'ECZYT',
    'EGEEN', 'ENJSA', 'ENKAI', 'ENKAI', 'EREGL',
    'ISFIN', 'KAREL', 'KRDMD', 'MAALT', 'MNDRS',
    'NETAS', 'PGSUS', 'QNBFL', 'SAHOL', 'SASA',
    'THYAO', 'TMSN', 'TTRAK', 'ULKER', 'USAK',
  ];
  List<String> yildizPazar = [
    "BINHO", "A1CAP", "ADELA", "ADESE", "ADGYO",
    "AFYON", "AGHOL", "AGESA", "AGROTA", "AHGAZA",
    "AKBNK", "AKCNS", "AKFGY", "AKFYE", "AKSGY",
    "AKSA", "AKSEN", "AKGRT", "ALCAR", "ALGYO",
    "ALARK", "ALBRK", "ALCTL", "ALFAS", "ALKIM",
    "ALTNY", "ALVES", "ANSGR", "AEFES", "ANHYT",
    "ASUZU", "ARCLK", "ARDYZ", "ARENA", "ASGYO",
    "ASELS", "ASTOR", "ATAKP", "ATATP", "AVPGY",
    "AYDEM", "AYGAZ", "AZTEK", "BAGFS", "BASGZ",
    "BTCIM", "BSOKE", "BERA", "BIENY", "BIMAS",
    "BIOEN", "BRKVY", "BRLSM", "BIZIM", "BOBET",
    "BORSK", "BORLS", "BRSAN", "BRYAT", "BFREN",
    "BRISA", "BUCIM", "BIGCH", "CRFS", "CCOLA",
    "CVKM", "CWEN", "CANTE", "CEMAS", "CEMTS",
    "CMBTN", "CIMSA", "DAPGM", "DESA", "DEVA",
    "DOHOL", "DGNMO", "EKGYO", "EMAK", "ENJSA",
    "ENERY", "ENKAI", "ERBOS", "ERCB", "EREGL",
    "ESCAR", "ESCOM", "TEZOL", "EUREN", "EUPWR",
    "FENER", "FROTO", "FORTE", "FZLGY", "GWIND",
    "GSRAY", "GEDIK", "GLCV", "GOODY", "GOKNR",
    "GOLT", "GOZDE", "GRTRK", "GSDH", "GUBRF",
    "GRSEL", "SAHOL", "HLGYO", "HRKET", "HATSN",
    "HEDEF", "HEKTS", "HTTB", "HORO", "HUNER",
    "ENTRA", "INVEO", "INVES", "IEYHO", "IHA",
    "IMAS", "INDES", "INFO", "IPEKE", "ISDMR",
    "ISFIN", "ISGYO", "ISMEN", "ISSEN", "IZENR",
    "IZMD", "JANTS", "KLKIM", "KLSER", "KRDMA",
    "KRDMB", "KRDMD", "KAREL", "KARSN", "KARTN",
    "KTLEV", "KATMR", "KAYSE", "KERV", "KRVGD",
    "KZBGY", "KLGYO", "KLRHO", "KMPUR", "KBORU",
    "KZGYO", "KTSK", "KONYA", "KONKA", "KORDS",
    "KOTON", "KOZA", "KOZAA", "KOPOL", "KUYAS",
    "KCHOL", "KOCMT", "KONT", "KONYA", "KONK",
    "KORDS", "KRDMD", "LIDER", "LILAK", "LMKDC",
    "LOGO", "LRS", "MAGN", "MAALTM", "MRGYO",
    "MAVI", "MEDTR", "MEGT", "MIATK", "MGROS",
    "MIPAZ", "MPARK", "MOBTL", "MOGAN", "NATEN",
    "NTGAZ", "NTHOL", "NETAS", "NUHCM", "OBAM",
    "ODAS", "ODINE", "ORGE", "OTKAR", "OYAKC",
    "OYYA", "OZKGY", "PNLS", "PAPIL", "PARSN",
    "PATEK", "PASEU", "PSGYO", "PGSU"
  ];
  List<String> anaPazar = ["AVOD","ACSEL","AKYHO","AKENR","ATEKS","AKSUE","ALKA","AYCES","ALKLC","ALMAD","ANGEN","ANELE","ARSAN","ARTMS","ARZUM","ATAGY","AGYO","AVGYO","AVHOL","AYEN","BAKAB","BNTAS","BANVT","BARMA","BEGYO","BYDNR","BAYRK","BRKSN","BJKAS","BEYAZ","BLCYT","BMSTL","BMSCH","BOSSA","BURCE","BURVA","BVSAN","CEOEM","CONSE","COSMO","CRDFA","CELHA","CUSAN","DAGI","DARDL","DGATE","DMSAS","DENGE","DZGYO","DERIM","DERHL","DESPC","DNISI","DITAS","DMRGD","DOCER","DOFER","DOBUR","DOGUB","DOKTA","DURDO","DYOBY","EDATA","EDIP","EGSER","EPLAS","ENSRI","ERSAN","ERSU","ESEN","ETILR","EYGYO","FADE","FMIZP","FLAP","FONET","FORMT","FRIGO","GEDZA","GENTS","GZMI","GMTAS","GLBMD","GSDDE","GLRYH","HATEK","HDFGS","HKTM","HUBVC","HURGZ","ICBCT","ICUGS","INGRM","ISKPL","IHEVA","IHLGM","IHGZT","IHLAS","IHYAY","INTEM","ISGSY","ISYAT","IZINV","IZFAS","KFEIN","KAPLM","KRTEK","KARYE","KLMSN","KLSYN","KNFRT","KGYO","KRPLS","KRGYO","KRSTL","KRONT","KUTPO","LIDFA","LINK","LKMNH","LUKSK","MACKO","MAKIM","MAKTK","MANAS","MRSHL","MARTI","MTRKS","MZHLD","MEGAP","MEKAG","MNDRS","MEPET","MERCN","MERIT","MERKO","METUR","METRO","MHRGY","MSGYO","MNDTR","EGEP","NIBAS","NUGYO","OBASE","OFSYM","ONCSM","ONRYT","ORCAY","OSMEN","OSTIM","OYAYO","OYLUM","OZGYO","OZRDN","OZSUB","OZYSR","PAMEL","PAGYO","PRDGS","PRKME","PCILT","PENGD","PSDT","PKENT","PINSU","PKART","PLTUR","PRZMA","RNPOL","RODRG","RTALB","RUBNS","SAFKR","SANFM","SANKO","SAMAT","SEKUR","SELVA","SEYKM","SILVR","SKYLP","SMART","SKTAS","SEKFK","SEGYO","SKYMD","TEKTU","TMPOL","TERA","TGSA","TLMAN","TDGYO","TUCLK","MARBL","TRILC","PRKAB","TURGG","ULUF","ULUSE","UNLU","VKFYO","VANGD","VERTU"
  ];
  List<String> altPazar = [];
  class StockItem {
    final String symbol;
    final String time;
    final String value;
    final bool isUp;
    final String percentage;

    StockItem({
      required this.symbol,
      required this.time,
      required this.value,
      required this.isUp,
      required this.percentage,
    });
  }