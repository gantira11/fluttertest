import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/views/profile/profile_page.dart';

import '../../bloc/banner/banner_bloc.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/text_styles.dart';
import '../../models/banner_model.dart';
import 'widgets/banner_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  @override
  void initState() {
    context.read<BannerBloc>().add(FetchBanner());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: [
          // HomePage
          Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.GAP_SIZE_DEFAULT,
                    ),
                    child: Text(
                      'Home',
                      style: TextStyles.TEXT_HEADING.copyWith(
                        fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                      ),
                    ),
                  ),
                  const BannerList(),
                ],
              ),
            ),
          ),

          // Profile Page
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.app),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.person),
          ),
        ],
        currentIndex: tabIndex,
        onTap: (value) => setState(() {
          tabIndex = value;
        }),
      ),
    );
  }
}

class BannerListItem extends StatelessWidget {
  const BannerListItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final BannerModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.all(
        Dimensions.GAP_SIZE_SMALL,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.GREY.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              data.imageUrl,
            ),
          ),
          const SizedBox(
            height: Dimensions.GAP_SIZE_DEFAULT,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.GAP_SIZE_DEFAULT,
            ),
            child: Text(
              data.title,
              style: TextStyles.TEXT_HEADING,
            ),
          ),
          const SizedBox(
            height: Dimensions.GAP_SIZE_SMALL,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.GAP_SIZE_DEFAULT,
            ),
            child: Text(data.description),
          ),
          const SizedBox(height: Dimensions.GAP_SIZE_DEFAULT)
        ],
      ),
    );
  }
}
