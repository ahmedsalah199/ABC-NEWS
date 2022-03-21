import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/logic/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<CubitNews, StateNews>(
      listener: (context, state) {},
      builder: (context, state) {
        List<NewsModel> news = CubitNews.getCubit(context).newsSearch;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 56,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Search'),
                    prefixIcon: Icon(Icons.search_outlined),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  controller: searchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Search must not to be Empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    CubitNews.getCubit(context).getSearchNews(value);
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context,index)=> buildNewsItem(news, index,context),
                  separatorBuilder: (context,index)=> const SizedBox(height: 10,),
                  itemCount: news.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
