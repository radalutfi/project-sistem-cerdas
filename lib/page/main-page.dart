import 'package:flutter/material.dart';
import '../fragment/fragment_generate_image.dart';
import '../fragment/fragment_generate_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4942E4),
        centerTitle: true,
        title: const Text(
          "ChatBot Gemini Ai",
          style: TextStyle(color: Colors.white),
        ),
        bottom: setTabBar(),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          FragmentGenerateText(),
          FragmentGenerateImage(),
        ],
      ),
    );
  }

  TabBar setTabBar() {
    return TabBar(
        controller: tabController,
        labelColor: Colors.white,
        indicatorColor: Colors.white,
        unselectedLabelColor: Color(0xff180161),
        tabs: const [
          Tab(
            text: 'Generate Text',
            icon: Icon(Icons.text_fields),
          ),
          Tab(
            text: 'Generate Image',
            icon: Icon(Icons.image_search),
          )
        ]);
  }
}
