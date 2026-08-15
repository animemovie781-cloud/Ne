class Language {
  final String code;
  final String name;
  final String nativeName;
  final String categoryPath;

  Language({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.categoryPath,
  });

  static List<Language> get languages => [
        Language(
          code: 'hi',
          name: 'Hindi',
          nativeName: 'हिन्दी',
          categoryPath: '/category/language/hindi',
        ),
        Language(
          code: 'ta',
          name: 'Tamil',
          nativeName: 'தமிழ்',
          categoryPath: '/category/language/tamil',
        ),
        Language(
          code: 'te',
          name: 'Telugu',
          nativeName: 'తెలుగు',
          categoryPath: '/category/language/telugu',
        ),
        Language(
          code: 'bn',
          name: 'Bengali',
          nativeName: 'বাংলা',
          categoryPath: '/category/language/bengali',
        ),
        Language(
          code: 'ml',
          name: 'Malayalam',
          nativeName: 'മലയാളം',
          categoryPath: '/category/language/malayalam',
        ),
        Language(
          code: 'kn',
          name: 'Kannada',
          nativeName: 'ಕನ್ನಡ',
          categoryPath: '/category/language/kannada',
        ),
        Language(
          code: 'en',
          name: 'English',
          nativeName: 'English',
          categoryPath: '/category/language/english',
        ),
        Language(
          code: 'ja',
          name: 'Japanese',
          nativeName: '日本語',
          categoryPath: '/category/language/japanese',
        ),
        Language(
          code: 'ko',
          name: 'Korean',
          nativeName: '한국어',
          categoryPath: '/category/language/korean',
        ),
      ];
}
