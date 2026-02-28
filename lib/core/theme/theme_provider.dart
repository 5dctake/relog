import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme {
  natural('ナチュラル'),
  pop('ポップ'),
  dreamySky('クリア');

  final String label;
  const AppTheme(this.label);
}

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  static const _themeKey = 'selected_theme';

  ThemeNotifier() : super(AppTheme.natural) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeIndex = prefs.getInt(_themeKey);
    if (savedThemeIndex != null && savedThemeIndex >= 0 && savedThemeIndex < AppTheme.values.length) {
      state = AppTheme.values[savedThemeIndex];
    }
  }

  Future<void> setTheme(AppTheme theme) async {
    state = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, theme.index);
  }

  ThemeData getThemeData() {
    switch (state) {
      case AppTheme.natural:
        return _buildTheme(
          primary: const Color(0xFFA8D5BA), // くすみグリーン
          surface: const Color(0xFFF5F5F5), // ホワイトグレー
          secondary: const Color(0xFFFFB385), // くすみオレンジ
        );
      case AppTheme.pop:
        return _buildTheme(
          primary: const Color(0xFFFF6B6B), // ビビッドピンク
          surface: const Color(0xFFFFE66D), // イエロー
          secondary: const Color(0xFF4ECDC4), // ミント
        );
      case AppTheme.dreamySky:
        return _buildTheme(
          primary: const Color(0xFF87CEFA), // スカイブルー
          surface: const Color(0xFFE0FFFF), // ライトシアン
          secondary: const Color(0xFF4682B4), // スチールブルー
        );
    }
  }

  ThemeData _buildTheme({
    required Color primary,
    required Color surface,
    required Color secondary,
  }) {
    // 視認性を高めるため、基本のテキストカラーをダークグレーに
    final baseTextTheme = GoogleFonts.mPlusRounded1cTextTheme().apply(
      bodyColor: const Color(0xFF333333),
      displayColor: const Color(0xFF333333),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      scaffoldBackgroundColor: surface,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white, // プライマリカラー上では白抜き文字でコントラストを担保
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.mPlusRounded1c(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 2,
          textStyle: GoogleFonts.mPlusRounded1c(fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: baseTextTheme,
      cardTheme: const CardThemeData(
        color: Colors.white, // 背景と同化しないように純白に
        elevation: 2,
        shadowColor: Colors.black26, // 影を少し強めに
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white, // 背景と同化しないように入力欄を白く
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: primary.withValues(alpha: 0.2),
        labelStyle: GoogleFonts.mPlusRounded1c(
          color: const Color(0xFF333333),
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black.withValues(alpha: 0.05),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey.shade400,
        elevation: 8,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Color(0xFF333333),
      ),
    );
  }
}
