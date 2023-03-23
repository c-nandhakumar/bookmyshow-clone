import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "title text": "It All Starts Here",
          'recommended movies': 'Recommended Movies',
          'top rated movies': 'Top Rated Movies',
          'tv shows': 'TV Shows'
        },
        'hi_IN': {
          'title text': 'यह सब यहाँ शुरू होता है',
          'recommended movies': 'अनुशंसित फिल्में',
          'top rated movies': 'शीर्ष रेटेड फिल्में',
          'tv shows': 'टीवी शो'
        },
        'ta_IN': {
          'title text': 'எல்லாம் இங்கே தொடங்குகிறது',
          'recommended movies': 'பரிந்துரைக்கப்பட்ட திரைப்படங்கள்',
          'top rated movies': 'சிறந்த தரமதிப்பீடு பெற்ற திரைப்படங்கள்',
          'tv shows': 'தொலைக்காட்சி நிகழ்ச்சிகள்'
        }
      };
}
