import 'package:flutter/material.dart';
import 'package:watchez/utils/app_colors.dart';
import 'package:watchez/utils/app_styles.dart';
import 'package:watchez/utils/app_testdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<String> categories = AppTestdata.categories;
  late TabController _tabController;
  int tabCurrentIndex = 0;
  int navCurrentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: categories.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "What do you want to watch?",
                        style: AppStyles.h2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          hintText: "Search",
                          hintStyle: AppStyles.textFieldStyle.copyWith(
                              color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            const BorderSide(color: Colors.black87, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildTopFilms(),
                    _buildTabBar(_tabController),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 400, // Adjust height as needed
                      child: _buildTabBarView(_tabController),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      onTap: (int newIndex) {
        setState(() {
          navCurrentIndex = newIndex;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/home.png'),
            color: navCurrentIndex == 0 ? Colors.white : AppColors.greyColor,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage('assets/images/save.png'),
            color: navCurrentIndex == 1 ? Colors.white : AppColors.greyColor,
          ),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            color: navCurrentIndex == 2 ? Colors.white : AppColors.greyColor,
          ),
          label: "Personal",
        ),
      ],
      backgroundColor: const Color(0xff242A32),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: navCurrentIndex,
      selectedLabelStyle: AppStyles.h4.copyWith(fontSize: 13),
      iconSize: 18,
      elevation: 1,
    );
  }

  Widget _buildTopFilms() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of images
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/movie-1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar(TabController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TabBar(
        controller: controller,
        tabs: categories.map((category) => Tab(text: category)).toList(),
        dividerColor: AppColors.backgroundColor,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.greyColor,
        indicatorColor: AppColors.greyColor,
        isScrollable: true,
      ),
    );
  }

  Widget _buildTabBarView(TabController controller) {
    return TabBarView(
      controller: controller,
      children: categories.map((category) {
        return Center(child: Text(category, style: TextStyle(color: AppColors.orangeColor)));
      }).toList(),
    );
  }
}
