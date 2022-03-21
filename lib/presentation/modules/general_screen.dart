import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/logic/cubit/states.dart';

import '../../logic/cubit/cubit.dart';
import '../../shared/components/components.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, StateNews>(
      listener: (context, state) {},
      builder: (context, state) {
        List<NewsModel> news = CubitNews.getCubit(context).newsGeneral;
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
        } else if (state is NewsGeneralLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetNewsGeneralErrorState) {
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
