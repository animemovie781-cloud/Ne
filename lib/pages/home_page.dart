import 'package:flutter/material.dart';
import '../models/anime.dart';
import '../models/language.dart';
import '../utils/theme.dart';
import '../widgets/anime_card.dart';
import '../widgets/language_selector.dart';
import '../data/dummy_data.dart';
import 'search_page.dart';
import 'anime_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Anime> _filteredAnime = dummyAnimeList;
  String _selectedLanguage = 'All';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterAnime);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterAnime() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAnime = dummyAnimeList.where((anime) {
        final matchesSearch = anime.title.toLowerCase().contains(query) ||
            anime.description.toLowerCase().contains(query);
        final matchesLanguage = _selectedLanguage == 'All' ||
            anime.language == _selectedLanguage;
        return matchesSearch && matchesLanguage;
      }).toList();
    });
  }

  void _selectLanguage(Language lang) {
    setState(() {
      _selectedLanguage = lang.name;
    });
    _filterAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.body,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    LanguageSelector(onLanguageSelected: _selectLanguage),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Popular Anime'),
                    const SizedBox(height: 12),
                    _buildAnimeGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.body,
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.search_rounded, color: AppTheme.text, size: 20),
                    ),
                    Expanded(
                      child: Text(
                        'Search anime...',
                        style: TextStyle(color: AppTheme.text.withOpacity(0.6), fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
            ),
            child: const Icon(Icons.filter_list_rounded, color: AppTheme.primaryLight, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 24,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimeGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _filteredAnime.length,
      itemBuilder: (context, index) {
        return AnimeCard(
          anime: _filteredAnime[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimeDetailPage(anime: _filteredAnime[index]),
              ),
            );
          },
        );
      },
    );
  }
}
