import 'package:flipshelf/models/book.dart';
import 'package:flipshelf/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  String _searchQuery = '';
  bool _isSearching = false;

  final List<Book> books = [
    Book(
      id: "1",
      title: 'One Piece',
      author: 'Eiichiro Oda',
      coverColor: Color(0xFFB91C1C),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine",
      rating: 3,
      overview:
          "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation and as a critique......",
    ),
    Book(
      id: "2",
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      coverColor: Color(0xFF059669),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
      rating: 4,
      overview:
          "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
    ),
    Book(
      id: "3",
      title: 'Naruto',
      author: 'Masashi Kishimoto',
      coverColor: Color(0xFFDC2626),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
      rating: 4,
      overview:
          "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _isSearching = _searchQuery.isNotEmpty;
    });
  }

  List<Book> get filteredBooks {
    if (_searchQuery.isEmpty) {
      return books;
    }
    return books.where((book) {
      return book.title.toLowerCase().contains(_searchQuery) ||
          book.author.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  void _clearSearch() {
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            _buildTopBar(context, themeProvider),
            // Content
            _buildContent(context),
          ],
        ),
      ),
      // Bottom bar
    );
  }

  Widget _buildTopBar(BuildContext context, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildEnhancedSearchBar(context),
        ],
      ),
    );
  }

  Widget _buildEnhancedSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search books, authors...',
          hintStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.grey[500],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.grey[500],
          ),
          suffixIcon: _isSearching
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[500],
                  ),
                  onPressed: _clearSearch,
                )
              : Icon(
                  Icons.mic,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey[500],
                ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20)),
          ),
        ],
      ),
    );
  }
}
