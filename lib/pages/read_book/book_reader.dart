import 'package:flipshelf/models/book.dart';
import 'package:flutter/material.dart';

class BookReader extends StatefulWidget {
  const BookReader({super.key});

  @override
  State<BookReader> createState() => _BookPageState();
}

class _BookPageState extends State<BookReader> {
  Book? book;
  bool isLoading = true;
  double _currentSliderValue = 16.0;
  final double _maxFontSize = 28.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadBook();
  }

  Future<void> _loadBook() async {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Book) {
      setState(() {
        book = args;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // show loader while loading book content
    if (isLoading) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                  // color: Colors.black,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 12),
                      Text("Loading book content"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // show msg if no book is null
    if (book == null) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                  // color: Colors.black,
                ),
              ),
              const Expanded(child: Center(child: Text('Book not found'))),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              // Top row with back btn and options
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          book!.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          book!.author,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
            ),

            // TODO: Book preview content here
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "This is sample book content. The font size will change based on the slider value. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.justify,

                    style: TextStyle(
                      fontSize: _currentSliderValue,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            _navBar(context),
          ],
        ),
      ),
      // bottom bar with font size slider
      // bottomNavigationBar: _navBar(context),
    );
  }

  Container _navBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Text(
              "Font size",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color.fromARGB(255, 212, 85, 85),
                  inactiveTrackColor: Colors.grey[600],
                  thumbColor: Color.fromARGB(255, 212, 85, 85),
                  overlayColor: Colors.transparent,
                  valueIndicatorColor: Color.fromARGB(255, 212, 85, 85),
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  showValueIndicator: ShowValueIndicator.always,
                ),

                child: Slider(
                  value: _currentSliderValue,
                  min: 12.0,
                  max: _maxFontSize,
                  label: '${_currentSliderValue.round()}px',
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
