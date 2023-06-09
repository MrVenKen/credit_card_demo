import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardService extends GetxController {
  String? cardNumber;
  String? bufferCardNumber = "";
  String bankName = "";
  String bankNameForPos = "";
  String cardMonth = "";
  String cardYear = "";
  String customerName = "";
  num? amount;
  num? cent;

  RxInt selectedTaksit = 0.obs;

//Taksit seçenekleri için kart numarasından banka adını tespit ediyor ve  Taksit Widgetına gönderiyor.
  bankNamePos() {
    if (cardNumber != null && cardNumber!.length > 5) {
      cardNumber = cardNumber!.substring(0, 6);
      if (akbank.contains(cardNumber)) {
        return bankNameForPos = "akbank";
      } else if (albaraka.contains(cardNumber)) {
        return bankNameForPos;
      } else if (anadoluBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (citiBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (denizbank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (eurobankTekfen.contains(cardNumber)) {
        return bankNameForPos;
      } else if (qnbFinansbank.contains(cardNumber)) {
        return bankNameForPos = "qnbFinansbank";
      } else if (hsbcBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (ingBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (kuveytTurk.contains(cardNumber)) {
        return bankNameForPos;
      } else if (milleniumBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (sekerbank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (turklandBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (garantiBBVA.contains(cardNumber)) {
        return bankNameForPos = "garanti";
      } else if (halkbank.contains(cardNumber)) {
        return bankNameForPos = "halkbank";
      } else if (turkiyeIsBankasi.contains(cardNumber)) {
        return bankNameForPos = "isbankasi";
      } else if (fortisBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (teb.contains(cardNumber)) {
        return bankNameForPos;
      } else if (turkishBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (turkiyeFinansKatilim.contains(cardNumber)) {
        return bankNameForPos;
      } else if (vakifbank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (yapiKrediBank.contains(cardNumber)) {
        return bankNameForPos = "yapikredi";
      } else if (ziraatBank.contains(cardNumber)) {
        return bankNameForPos = "ziraat";
      } else if (provusBilisim.contains(cardNumber)) {
        return bankNameForPos;
      } else if (ziraatKatilim.contains(cardNumber)) {
        return bankNameForPos;
      } else if (vakifKatilim.contains(cardNumber)) {
        return bankNameForPos;
      } else if (papara.contains(cardNumber)) {
        return bankNameForPos;
      } else if (fibaBanka.contains(cardNumber)) {
        return bankNameForPos;
      } else if (burganBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (alternatifBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (aktifYatirimBank.contains(cardNumber)) {
        return bankNameForPos;
      } else if (cardNumber!.length < 6) {
        bankNameForPos = "";
        return bankNameForPos;
      } else {
        bankNameForPos = "";
        return bankNameForPos;
      }
    } else {
      bankNameForPos = "";
      return bankNameForPos;
    }
  }

//Kart numarasının ilk iki hanesine göre kart türünün tespit edilmesi
  detectCardType() {
    if (cardNumber != null) {
      if (cardNumber!.startsWith('2') || cardNumber!.startsWith('5')) {
        return 'assets/payment/mastercard.png';
      } else if (cardNumber!.startsWith('4')) {
        return 'assets/payment/visa-white.png';
      } else if (cardNumber!.startsWith('3')) {
        return 'assets/payment/american_express.png';
      } else {
        return 'assets/payment/mastercard.png';
      }
    } else {
      return 'assets/payment/mastercard.png';
    }
  }

//Bankaya Göre Pos Ekranı Getirme
  posWidget() {
    if (cardNumber != null && cardNumber!.length > 5) {
      cardNumber = cardNumber!.substring(0, 6);
      if (akbank.indexOf(cardNumber) > -1) {
        print("Akbank");
        return Text("YourPosWidget");
      } else if (qnbFinansbank.indexOf(cardNumber) > -1) {
        print("Qnb");
        return Text("YourPosWidget");
      } else if (turkiyeIsBankasi.indexOf(cardNumber) > -1) {
        print("İş Bankası");
        return Text("YourPosWidget");
      } else if (garantiBBVA.indexOf(cardNumber) > -1) {
        print("Garanti");
        return Text("YourPosWidget");
      } else if (halkbank.indexOf(cardNumber) > -1) {
        print("HalkBank");
        return Text("YourPosWidget");
      } else if (ziraatBank.indexOf(cardNumber) > -1) {
        print("Ziraat");
        return Text("YourPosWidget");
      } else if (yapiKrediBank.indexOf(cardNumber) > -1) {
        print("Yapı Kredi");
        return Text("YourPosWidget");
      } else {
        print("Diğer");
        return Text("YourPosWidget");
      }
    } else {
      return AlertDialog(
        content: Container(
          height: Get.height * 0.1,
          width: Get.width * 0.3,
          color: Colors.white,
          child: const Center(
            child: Text("Lütfen Kart Numarası Giriniz"),
          ),
        ),
      );
    }
  }

//Kart numarasına göre banka adını getiriyor
  bankNameFromCardNo() {
    if (cardNumber != null && cardNumber!.length > 5) {
      cardNumber = cardNumber!.substring(0, 6);
      if (akbank.contains(cardNumber)) {
        return bankName = "AKBANK";
      } else if (albaraka.contains(cardNumber)) {
        return bankName = "ALBARAKA";
      } else if (anadoluBank.contains(cardNumber)) {
        return bankName = "ANADOLUBANK";
      } else if (citiBank.contains(cardNumber)) {
        return bankName = "CITIBANK";
      } else if (denizbank.contains(cardNumber)) {
        return bankName = "DENİZBANK";
      } else if (eurobankTekfen.contains(cardNumber)) {
        return bankName = "EUROBANK TKF";
      } else if (qnbFinansbank.contains(cardNumber)) {
        return bankName = "QNB FİNANSBANK";
      } else if (hsbcBank.contains(cardNumber)) {
        return bankName = "HSBC BANK";
      } else if (ingBank.contains(cardNumber)) {
        return bankName = "İNG BANK";
      } else if (kuveytTurk.contains(cardNumber)) {
        return bankName = "KUVEYTTÜRK";
      } else if (milleniumBank.contains(cardNumber)) {
        return bankName = "MILLENNIUM BANK";
      } else if (sekerbank.contains(cardNumber)) {
        return bankName = "ŞEKERBANK";
      } else if (turklandBank.contains(cardNumber)) {
        return bankName = "T-BANK";
      } else if (garantiBBVA.contains(cardNumber)) {
        return bankName = "GARANTİ BBVA";
      } else if (halkbank.contains(cardNumber)) {
        return bankName = "HALKBANK";
      } else if (turkiyeIsBankasi.contains(cardNumber)) {
        return bankName = "İŞ BANKASI";
      } else if (fortisBank.contains(cardNumber)) {
        return bankName = "TEB";
      } else if (teb.contains(cardNumber)) {
        return bankName = "TEB";
      } else if (turkishBank.contains(cardNumber)) {
        return bankName = "TURKISH BANK";
      } else if (turkiyeFinansKatilim.contains(cardNumber)) {
        return bankName = "TURKİYE FİNANS KATILIM BANKASI";
      } else if (vakifbank.contains(cardNumber)) {
        return bankName = "VAKIFBANK";
      } else if (yapiKrediBank.contains(cardNumber)) {
        return bankName = "YAPI KREDİ";
      } else if (ziraatBank.contains(cardNumber)) {
        return bankName = "ZİRAAT BANKASI";
      } else if (provusBilisim.contains(cardNumber)) {
        return bankName = "";
      } else if (ziraatKatilim.contains(cardNumber)) {
        return bankName = "ZİRAAT KATILIM";
      } else if (vakifKatilim.contains(cardNumber)) {
        return bankName = "VAKIF KATILIM";
      } else if (papara.contains(cardNumber)) {
        return bankName = "PAPARA";
      } else if (fibaBanka.contains(cardNumber)) {
        return bankName = "FİBABANKA";
      } else if (burganBank.contains(cardNumber)) {
        return bankName = "BURGAN BANK";
      } else if (alternatifBank.contains(cardNumber)) {
        return bankName = "ALTERNATİF BANK";
      } else if (aktifYatirimBank.contains(cardNumber)) {
        return bankName = "AKTİF YATIRIM BANK";
      } else if (cardNumber!.length < 6) {
        return bankName = "";
      } else {
        return bankName = "";
      }
    } else {
      return bankName = "";
    }
  }

//kart numarasına göre banka logosunu getiriyor
  detectBankFromNumber() {
    if (cardNumber != null && cardNumber!.length > 5) {
      cardNumber = cardNumber!.substring(0, 6);
      if (akbank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/akbank.png';
      }
      if (albaraka.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/albaraka.png';
      }
      if (anadoluBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/anadolubank.png';
      }
      if (citiBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/citibank.png';
      }
      if (denizbank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/denizbank.png';
      }
      if (eurobankTekfen.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/eurobank.png';
      }
      if (qnbFinansbank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/qnb.png';
      }
      if (hsbcBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/hsbc.png';
      }
      if (ingBank.indexOf(cardNumber) > -1) {
        bankName = "İNG BANK";
        return 'assets/bank_logo/ingbank.png';
      }
      if (kuveytTurk.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/kuveytturk.png';
      }
      if (milleniumBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/millennium.png';
      }
      if (sekerbank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/sekerbank.png';
      }
      if (turklandBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/tbank.png';
      }
      if (garantiBBVA.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/garanti.png';
      }
      if (halkbank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/halkbank.png';
      }
      if (turkiyeIsBankasi.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/is_bankasi.png';
      }
      if (fortisBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/teb.png';
      }
      if (teb.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/teb.png';
      }
      if (turkishBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/turkish_bank.png';
      }
      if (turkiyeFinansKatilim.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/turkiye_finans.png';
      }
      if (vakifbank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/vakifbank.png';
      }
      if (yapiKrediBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/yapikredi.png';
      }
      if (ziraatBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/ziraatbank.png';
      }
      if (provusBilisim.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/bank.png';
      }
      if (ziraatKatilim.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/ziraatKatilim.png';
      }
      if (vakifKatilim.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/vakifKatilim.png';
      }
      if (papara.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/papara.png';
      }
      if (fibaBanka.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/fibabanka.png';
      }
      if (burganBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/burganbank.png';
      }
      if (alternatifBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/alternatifbank.png';
      }
      if (aktifYatirimBank.indexOf(cardNumber) > -1) {
        return 'assets/bank_logo/aktifbank.png';
      } else {
        bankName = "";
        return 'assets/bank_logo/bank.png';
      }
    } else {
      bankName = "";
      return 'assets/bank_logo/bank.png';
    }
  }

//Banka Bin Listeleri !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//Ticari

  List ticariAkbank = [
    "425669",
    "552608",
    "552609",
    "553059",
  ];

  List ticariGarantiBBVA = [
    "403666",
    "427314",
    "427315",
    "448472",
    "462274",
    "467295",
    "486567",
    "533169",
    "540037",
    "547302",
    "553130",
    "558699",
  ];

  List ticariHalkbank = [
    "498852",
    "552879",
  ];

  List ticariIsBankasi = [
    "450803",
    "553058",
  ];

  List ticariYapiKredi = [
    "455359",
    "552645",
    "552659",
  ];

  List ticariZiraatBank = [
    "454287",
    "547287",
  ];

  List ticariQnbFinansBank = [
    "403082",
    "427311",
    "547567",
    "547800",
  ];

//Bireysel
  List akbank = [
    "413252",
    "474854",
    "589004",
    "516840",
    "516841",
    "474853",
    "521942",
    "432071",
    "432072",
    "435508",
    "435509",
    "493837",
    "512754",
    "520932",
    "521807",
    "524347",
    "542110",
    "557113",
    "557829",
    "535280",
    "979206",
    "979208",
    "979207",
    "550383",
    "479680",
    "479681",
    "534253",
    "535449",
  ];

  List albaraka = [
    "417715",
    "417716",
    "432284",
    "432285",
    "534264",
    "547234",
    "548232",
    "677397",
    "511583",
    "627510",
    "424935",
    "979226",
    "979227",
    "479671",
    "533973",
    "434572",
    "423002",
    "533796",
  ];

  List anadoluBank = [
    "425846",
    "425847",
    "425848",
    "441341",
    "522240",
    "522241",
    "554301",
    "558593",
    "676460",
    "535881",
    "425849",
    "603072",
    "979240",
  ];

  List citiBank = [
    "426391",
    "426392",
    "450050",
    "450051",
    "521376",
    "544127",
    "544445",
    "544460",
    "547712",
    "549220",
    "471509",
    "555087",
    "437897",
    "553493"
  ];

  List denizbank = [
    "403134",
    "408625",
    "409070",
    "411924",
    "423667",
    "424360",
    "424361",
    "441139",
    "460345",
    "460347",
    "462276",
    "472914",
    "489456",
    "510063",
    "510118",
    "510119",
    "512017",
    "512117",
    "514924",
    "520019",
    "520303",
    "543358",
    "543400",
    "543427",
    "546764",
    "554483",
    "558514",
    "426391",
    "450051",
    "521376",
    "544127",
    "549220",
    "462448",
    "522517",
    "529876",
    "516914",
    "523515",
    "489458",
    "465574",
    "483747",
    "558448",
    "670610",
    "516740",
    "544445",
    "472915",
    "462449",
    "113134",
    "544460",
    "547161",
    "552679",
    "558443",
    "558446",
    "558460",
    "601912",
    "979220",
    "113336",
    "426392",
    "450050",
    "460346",
    "476662",
    "489457",
    "508129",
    "516731",
    "517047",
    "529545",
    "530597",
    "531245",
    "533330",
    "549839",
  ];

  List eurobankTekfen = [
    "424407",
    "483013",
    "491373",
    "491374",
    "498516",
    "498517",
    "498518",
    "498519",
    "498520",
    "498521",
    "543943",
    "543944",
    "545863",
    "547680",
  ];

  List qnbFinansbank = [
    "402277",
    "402278",
    "402563",
    "409364",
    "410147",
    "413583",
    "414388",
    "415565",
    "422376",
    "423277",
    "423398",
    "435653",
    "441007",
    "444029",
    "499850",
    "499851",
    "499852",
    "519324",
    "521022",
    "521836",
    "529572",
    "531157",
    "545120",
    "545616",
    "545847",
    "677238",
    "516835",
    "406386",
    "415956",
    "420092",
    "431379",
    "442395",
    "459333",
    "498749",
    "499853",
    "530818",
    "542404",
    "601050",
    "479679",
    "526911",
    "401072",
    "979202",
    "979203",
  ];

  List fortisBank = [
    "427308",
    "438040",
    "450918",
    "455645",
    "525314",
    "542259",
    "545148",
    "547985",
    "549998",
    "550449",
    "552207",
  ];

  List hsbcBank = [
    "405913",
    "405917",
    "405918",
    "409071",
    "422629",
    "424909",
    "428240",
    "496019",
    "510005",
    "512651",
    "519399",
    "521045",
    "522054",
    "525413",
    "525795",
    "540643",
    "542254",
    "545183",
    "550472",
    "550473",
    "552143",
    "556030",
    "556031",
    "556033",
    "556034",
    "556665",
    "408969",
    "676401",
    "677193",
    "405903",
    "405919",
    "428240",
    "979214",
  ];

  List ingBank = [
    "400684",
    "408579",
    "414070",
    "420322",
    "420323",
    "420324",
    "455571",
    "480296",
    "490805",
    "490806",
    "490807",
    "510151",
    "532443",
    "540024",
    "540025",
    "542029",
    "542605",
    "542965",
    "542967",
    "547765",
    "548819",
    "554297",
    "554570",
    "526975",
    "535137",
    "676402",
    "408581",
    "490808",
    "526973",
    "550074",
    "603322",
    "676366",
    "514140",
    "979224",
    "479632",
    "479633",
    "517946",
    "979242",
    "531401",
    "550478",
    ""
  ];

  List kuveytTurk = [
    "402589",
    "402590",
    "402592",
    "403360",
    "403810",
    "410555",
    "410556",
    "424487",
    "431024",
    "511660",
    "512595",
    "518896",
    "520180",
    "525312",
    "547564",
    "402591",
    "677055",
    "527083",
    "979216",
    "483673",
    "483674",
  ];

  List milleniumBank = [
    "518679",
    "534913",
    "543624",
  ];

  List provusBilisim = [
    "492192",
    "512446",
    "515865",
    "520909",
    "521584",
    "474823",
    "554566",
    "516742",
    "528825",
    "359000",
    "404990",
    "515755",
    "515895",
    "528823",
    "533293",
    "539605",
    "549938",
    "677047",
    ""
  ];

  List sekerbank = [
    "403836",
    "409622",
    "411156",
    "411157",
    "411158",
    "411159",
    "411160",
    "433383",
    "433384",
    "494063",
    "494064",
    "521394",
    "521827",
    "525404",
    "530866",
    "539703",
    "547311",
    "549208",
    "549394",
    "423833",
    "459068",
    "676832",
    "527657",
    "459268",
    "489401",
    "589713",
    "516846",
    "519753",
    "421086",
    "979211",
    "510010",
  ];

  List garantiBBVA = [
    "403280",
    "404308",
    "413836",
    "426886",
    "426887",
    "426888",
    "428220",
    "428221",
    "432154",
    "461668",
    "467293",
    "467294",
    "474151",
    "482489",
    "482490",
    "482491",
    "487074",
    "487075",
    "489478",
    "490175",
    "492186",
    "492187",
    "492193",
    "493845",
    "514915",
    "520097",
    "520922",
    "520940",
    "520988",
    "521368",
    "521824",
    "521825",
    "521832",
    "522204",
    "528939",
    "528956",
    "534261",
    "540036",
    "540226",
    "540227",
    "540669",
    "540709",
    "541865",
    "542030",
    "544078",
    "545102",
    "546001",
    "552095",
    "554796",
    "554960",
    "557023",
    "557945",
    "405090",
    "426889",
    "409219",
    "420556",
    "420557",
    "540118",
    "524659",
    "676255",
    "676827",
    "517042",
    "516961",
    "410141",
    "401738",
    "405051",
    "428967",
    "428968",
    "489455",
    "516943",
    "517040",
    "517041",
    "517048",
    "517049",
    "526955",
    "543738",
    "548935",
    "589318",
    "670606",
    "676283",
    "676651",
    "535429",
    "554253",
    "554254",
    "998802",
    "601911",
    "603004",
    "603071",
    "603124",
    "603321",
    "603342",
    "603708",
    "627160",
    "627461",
    "627509",
    "627767",
    "629440",
    "638888",
    "685800",
    "690759",
    "911199",
    "940074",
    "955999",
    "979199",
    "998802",
    "979236",
    "349999",
    "374420",
    "374421",
    "374422",
    "374423",
    "374424",
    "374425",
    "374426",
    "374427",
    "375622",
    "375623",
    "375624",
    "375625",
    "375626",
    "375627",
    "375628",
    "375629",
    "375630",
    "375631",
    "377136",
    "377137",
    "379999",
    "479660",
    "479661",
    "479662",
    "479682",
    "535488",
    "622402",
    "627160",
    "979205",
  ];

  List halkbank = [
    "415514",
    "492094",
    "492095",
    "510056",
    "521378",
    "540435",
    "543081",
    "415515",
    "421030",
    "440776",
    "447505",
    "499821",
    "466260",
    "451454",
    "526289",
    "526290",
    "588843",
    "676258",
    "639001",
    "420578",
    "498850",
    "498851",
    "510164",
    "540284",
    "543039",
    "979212",
    "113012",
    "589072",
    "979210",
    "979244",
    "537500",
  ];

  List turkiyeIsBankasi = [
    "418342",
    "418343",
    "418344",
    "418345",
    "454318",
    "454358",
    "454359",
    "454360",
    "510152",
    "540667",
    "540668",
    "543771",
    "552096",
    "589283",
    "441076",
    "113064",
    "113334",
    "441075",
    "441077",
    "454314",
    "603125",
    "479610",
    "548237",
    "979204",
    "483602",
    "535514",
    "979233",
    "533803",
    "537475",
  ];

  List vakifbank = [
    "402940",
    "409084",
    "411724",
    "411942",
    "411943",
    "411944",
    "411979",
    "415792",
    "416757",
    "428945",
    "493840",
    "493841",
    "493846",
    "520017",
    "540045",
    "540046",
    "542119",
    "542798",
    "542804",
    "547244",
    "552101",
    "554548",
    "442671",
    "479909",
    "491005",
    "589311",
    "479908",
    "113015",
    "979209",
    "459252",
    "650052",
    "434530",
    "423478",
    "483612",
    "535576",
    "537504",
  ];

  List ziraatBank = [
    "413226",
    "444676",
    "444677",
    "444678",
    "453955",
    "453956",
    "454671",
    "454672",
    "454674",
    "454894",
    "540130",
    "540134",
    "541001",
    "541033",
    "542374",
    "469884",
    "533154",
    "404591",
    "512440",
    "447504",
    "407814",
    "476619",
    "534981",
    "530905",
    "676123",
    "676124",
    "528208",
    "531102",
    "516932",
    "527682",
    "523529",
    "546957",
    "549449",
    "482465",
    "979217",
    "513662",
    "979280",
  ];

  List teb = [
    "402458",
    "402459",
    "406015",
    "427707",
    "440247",
    "440273",
    "440293",
    "440294",
    "479227",
    "489494",
    "489495",
    "489496",
    "510138",
    "510139",
    "510221",
    "512753",
    "512803",
    "524346",
    "524839",
    "524840",
    "528920",
    "530853",
    "545124",
    "553090",
    "455645",
    "438040",
    "440274",
    "402142",
    "447503",
    "404315",
    "549998",
    "542259",
    "606329",
    "527026",
    "440295",
    "113032",
    "402299",
    "450918",
    "459026",
    "519780",
    "525314",
    "545148",
    "547985",
    "550449",
    "676406",
    "676578",
    "532581",
    "531531",
    "552207",
    "534538",
    "535217",
    "427308",
    "469188",
    "404350",
    "416350",
    "979223",
    "115032",
    "413528",
  ];

  List turkishBank = [
    "419389",
    "518599",
    "529939",
    "552098",
    "589288",
    "521594",
    "677522",
  ];

  List turkiyeFinansKatilim = [
    "404952",
    "411685",
    "428462",
    "435627",
    "435628",
    "521848",
    "537719",
    "549294",
    "400742",
    "511758",
    "435628",
    "606043",
    "485061",
    "552610",
    "459907",
    "511783",
    "441206",
    "424927",
    "424931",
    "435629",
    "470954",
    "479915",
    "479916",
    "479917",
    "485060",
    "498724",
    "677451",
    "498725",
    "512360",
    "528923",
    "627161",
    "416275",
    "979218",
  ];

  List turklandBank = [
    "548375",
    "603005",
    "676429",
    "979231",
  ];

  List yapiKrediBank = [
    "404809",
    "446212",
    "450634",
    "477959",
    "479794",
    "479795",
    "491205",
    "491206",
    "492128",
    "492130",
    "492131",
    "510054",
    "540061",
    "540062",
    "540063",
    "540122",
    "540129",
    "542117",
    "545103",
    "554422",
    "413382",
    "442106",
    "603797",
    "516888",
    "401522",
    "414392",
    "420342",
    "476625",
    "476626",
    "490983",
    "494314",
    "525864",
    "533913",
    "537833",
    "639004",
    "676166",
    "479620",
    "479612",
    "533913",
    "979215",
    "420343",
    "535601",
    "535602",
    "535435",
    "537518",
    "406281",
    "657366",
    "657998",
    "979241",
  ];

  List ziraatKatilim = [
    "416283",
    "670586",
    "539134",
    "979221",
  ];

  List vakifKatilim = [
    "670544",
    "535355",
    "483703",
    "483704",
    "979230",
  ];

  List papara = [
    "531389",
    "535925",
  ];

  List fibaBanka = [
    "522576",
    "517601",
    "468973",
    "534913",
    "543624",
    "518679",
    "603343",
    "522075",
    "522566",
    "527765",
    "559056",
    "979225",
    "677238",
    "516835",
  ];

  List burganBank = [
    "548434",
    "498518",
    "498521",
    "414941",
    "554034",
    "424407",
    "483013",
    "491373",
    "491374",
    "498516",
    "498517",
    "498520",
    "523759",
    "543943",
    "543944",
    "545863",
    "547680",
    "548202",
    "558379",
    "589298",
  ];

  List alternatifBank = [
    "466281",
    "466284",
    "558485",
    "670670",
    "466280",
    "466282",
    "466283",
    "500001",
    "516308",
    "516458",
    "522221",
    "544836",
    "627768",
    "516657",
    "416394",
    "512618",
    "979228",
    "654997",
    "366579",
    "365771",
    "365772",
    "365773",
  ];

  List aktifYatirimBank = [
    "453144",
    "581877",
    "671121",
    "535843",
    "532813",
    "453147",
    "504166",
    "453145",
    "453146",
    "453148",
    "453149",
    "500000",
    "528246",
    "534563",
    "671155",
    "979213",
    "517343",
    "534567",
    "515456",
  ];
}
