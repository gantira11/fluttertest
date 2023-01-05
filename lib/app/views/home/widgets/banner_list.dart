import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/banner/banner_bloc.dart';
import '../home_page.dart';

class BannerList extends StatelessWidget {
  const BannerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is BannerError) {
          return Text(state.error);
        }

        if (state is BannerFetched) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...state.listBanner.map(
                  (data) => BannerListItem(data: data),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
