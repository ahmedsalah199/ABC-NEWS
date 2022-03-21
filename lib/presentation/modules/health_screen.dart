import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/news_model.dart';
import '../../logic/cubit/cubit.dart';
import '../../logic/cubit/states.dart';
import '../../shared/components/components.dart';
class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, StateNews>(
      listener: (context, state) {},
      builder: (context, state) {
        List<NewsModel> news = CubitNews.getCubit(context).newsHealth;
        if (news.isNotEmpty) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildNewsItem(news, index,context),
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 10,
            ),
            itemCount: news.length,
          );
        } else if (news.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetNewsSportsErrorState) {
          return const Center(
              child: Text(
                'No internet connection available',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ));
        } else {
          return const Center(
            child: Text(
              'No internet connection available',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          );
        }
      },
    );

  }
}
