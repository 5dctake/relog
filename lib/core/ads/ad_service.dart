import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_service.g.dart';

class AdService {
  InterstitialAd? _interstitialAd;
  
  // 本番用ユニットID
  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1389375416993430/4693131150';
    } else {
      return 'ca-app-pub-1389375416993430/7642039764';
    }
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAd({required Function onAdDismissed}) {
    if (_interstitialAd == null) {
      onAdDismissed();
      loadInterstitialAd(); // 次回のためにロード
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        loadInterstitialAd();
        onAdDismissed();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        loadInterstitialAd();
        onAdDismissed();
      },
    );

    _interstitialAd!.show();
    _interstitialAd = null;
  }
}

@riverpod
AdService adService(AdServiceRef ref) {
  final service = AdService();
  service.loadInterstitialAd();
  return service;
}
