import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

import 'core/database/app_config_repository.dart';
import 'features/logs/presentation/logs_list_screen.dart';
import 'features/report/presentation/monthly_report_screen.dart';
import 'features/settings/presentation/settings_screen.dart';
import 'core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 広告の初期化をバックグラウンドで開始し、起動をブロックしないようにする
  MobileAds.instance.initialize();
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the themeProvider to rebuild when the theme changes
    ref.watch(themeProvider);
    final themeData = ref.read(themeProvider.notifier).getThemeData();

    return MaterialApp(
      title: 'ReLog',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
        Locale('ja'),
        Locale('en', 'US'),
      ],
      // localeを固定せず、システム設定を優先させる（日本語を最優先に含めることで解決を図る）
      home: const MainScreen(),
    );
  }
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  static const List<Widget> _screens = [
    LogsListScreen(),
    MonthlyReportScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _checkMonthChange();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _checkMonthChange() async {
    final repository = await ref.read(appConfigRepositoryProvider.future);
    final config = await repository.getConfig();
    
    final now = DateTime.now();
    final currentMonthStr = DateFormat('yyyy-MM').format(now);
    
    // 最後に表示した月と現在の月が異なる場合
    if (config.lastReportViewedMonth != currentMonthStr) {
      // 月替わり通知（レポートタブへ切り替え）
      setState(() {
        _selectedIndex = 1; 
      });
      if (_pageController.hasClients) {
        _pageController.jumpToPage(1);
      }
      // 設定を更新して次回以降は出さないようにする
      await repository.updateLastReportViewedMonth(currentMonthStr);
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ログ'),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: 'レポート'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}
