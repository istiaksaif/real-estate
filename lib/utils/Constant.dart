class Constant {
  static const String appName = 'Real Estate';

  static const String PRIVACY_URL = 'https://dbugstation.com/';
  static const String TERMS_URL = 'https://dbugstation.com/';
  static const String FAQ_URL = 'https://dbugstation.com/';
  static const String FEEDBACK_URL = 'https://dbugstation.com/';

  static const String AdmobAppId = 'ca-app-pub-3940256099942544~3347511713';
  static const String OPEN_ADS = "ca-app-pub-3940256099942544/3419835294";

  static const String ADMIN_PANEL_URL = 'https://vid-mates.com';

  static const String ADMIN_PANEL_PATH = '/shobuj/LiveTvMini';

  static const String ADS_TYPE = 'server';

  static const String POST_PANEL_URL = '$ADMIN_PANEL_PATH/public/api/get_posts';
  static const String CATEGORY_PANEL_URL =
      '$ADMIN_PANEL_PATH/public/api/get_category_index';
  static const String CATEGORY_IMAGE_URL =
      '$ADMIN_PANEL_PATH/public/upload/category/';
  static const String VIDEO_IMAGE_URL =
      '$ADMIN_PANEL_PATH/public/upload/video/';
  static const String CATEGORY_ALL_ITEM_URL =
      '$ADMIN_PANEL_PATH/public/api/get_category_posts';
  static const String SLIDERS_PANEL_URL =
      '$ADMIN_PANEL_PATH/public/api/get_slide';
  static const String SLIDER_IMAGE_URL =
      '$ADMIN_PANEL_PATH/public/upload/slider/';
  static const String ADS_URL =
      '$ADMIN_PANEL_URL$ADMIN_PANEL_PATH/public/api/advertisement';

  //send/save fcm token
  static const String POST_FCM_TOKEN =
      '$ADMIN_PANEL_URL$ADMIN_PANEL_PATH/public/api/store-token';
  static const String POST_VIDEO_COUNT =
      '$ADMIN_PANEL_URL$ADMIN_PANEL_PATH/public/api/item_view_count';
  static const String POST_SLIDER_VIDEO_COUNT =
      '$ADMIN_PANEL_URL$ADMIN_PANEL_PATH/public/api/slider_view_count';

  static const String OpenAds = "OpenAds";
  static const String GOPENAPP = "gopeenApp";
  static const String MYPREFERENCE = "mypref";
  static const String ADSKEY = "adsKey";

  static const String ADMOB_APP_ID = "admob_app_id";
  static const String BANNER_ADS = "banner_ads";
  static const String INTER_ADS = "inter_ads";
  static const String NATIVE_ADS = "admob_native";
  static const String REWARD_ADS = "admob_reward";
  static const String APPNEX_INTER = "appnex_inter";
  static const String APPNEX_BANNER = "appnex_banner";
  static const String UNITY_APP_APP_ID = "unity_app_id";
  static const String STARTAPP_APP_ID = "startapp_app_id";
  static const String IRON_APP_ID = "iron_appKey";
  static const String GBANNER_ID = "gbanner_id";
  static const String GINTERS_ID = "ginters_id";
  static const String GNATIVE_ID = "gnative_id";
  static const String FBBANNER_ID = "fbbanner_id";
  static const String FBINTERS_ID = "fbinters_id";
  static const String FBNATIVE_ADS = "fb_native";
  static const String FBREWARD_ADS = "fb_reward";

  static const String Ads_Interval = "ads_interval";

  static const String DISMISS = "1";
  static const String FAILED = "0";

  static const String youtube = "Youtube";
  static const String upload = "Upload";

  static bool isPhoneNumber(String input) {
    final RegExp regex = RegExp(r'^\+?[0-9]{10,}$');
    return regex.hasMatch(input);
  }

  static bool isEmailAddress(String input) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(input);
  }
}
