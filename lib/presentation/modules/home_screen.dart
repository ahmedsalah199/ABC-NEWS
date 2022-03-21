import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/cubit/states.dart';
import 'package:news_app/presentation/modules/search_screen.dart';
import 'package:news_app/presentation/widgets/my_drawer.dart';
import 'package:news_app/shared/components/components.dart';

import '../../logic/cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CubitNews, StateNews>(
            listener: (BuildContext context, StateNews states) {
            },
            builder: (BuildContext context, StateNews states) {
              var cubit = CubitNews.getCubit(context);
              return Scaffold(
                appBar: AppBar(
                  title: const Text("ABC News"),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: const Icon(
                          Icons.search_outlined,
                          size: 30,
                        ),
                        onPressed: () {
                          navigatorTo(context,  const SearchScreen());
                          cubit.newsSearch = [] ;
                        }),
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                  items: cubit.bottomNavigationBarItem,
                ),
                drawer: const MyDrawer(),
              );
            });
  }
}
