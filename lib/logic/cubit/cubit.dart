import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/logic/cubit/states.dart';
import 'package:news_app/presentation/modules/general_screen.dart';
import 'package:news_app/presentation/modules/health_screen.dart';
import 'package:news_app/presentation/modules/science_screen.dart';
import 'package:news_app/presentation/modules/sports_screen.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/local/shared_preferences.dart';

class CubitNews extends Cubit<StateNews> {
  CubitNews() : super(InitialNewsState());
  static CubitNews getCubit(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const GeneralScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const HealthScreen(),
  ];

  List <NewsModel> newsSports = [] ;
  List <NewsModel> newsGeneral = [] ;
  List <NewsModel> newsScience = [] ;
  List <NewsModel> newsHealth = [] ;
  List <NewsModel> newsSearch = [] ;
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_outlined), label: 'General'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_outlined), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_outlined), label: 'Health'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if(index == 1) {
      getNewsSports();
    }
    else if (index == 2) {
      getNewsScience();
    }
    else if (index == 3) {
      getNewsHealth();
    }
    emit(ChangeBottomNavBarNewsState());
  }

  void getNewsSports() {
    emit(NewsSportsLoadingState());
    NewsRepository().getNews(query: {
      "apiKey": apiKey,
      "country": "eg",
      "category": "sports",
    } ,
      url: 'v2/top-headlines'
    ).then((news) {
      newsSports = news ;
      emit(GetNewsSportsSuccessState());
    }).catchError((error){
      debugPrint (error.toString());
      emit(GetNewsSportsErrorState());
    });
  }
  void getNewsHealth() {
    emit(NewsHealthLoadingState());
    NewsRepository().getNews(query: {
      "apiKey": apiKey,
      "country": "eg",
      "category": "health",
    },
        url: 'v2/top-headlines'
    ).then((news) {
      newsHealth = news ;
      emit(GetNewsHealthSuccessState());
    }).catchError((error){
      debugPrint (error.toString());
      emit(GetNewsHealthErrorState());
    });
  }
  void getNewsScience() {
    emit(NewsScienceLoadingState());
    NewsRepository().getNews(query: {
      "apiKey": apiKey,
      "country": "eg",
      "category": "science",
    },
        url: 'v2/top-headlines'
    ).then((news) {
      newsScience = news ;
      emit(GetNewsScienceSuccessState());
    }).catchError((error){
      debugPrint (error.toString());
      emit(GetNewsScienceErrorState());
    });
  }
  void getNewsGeneral() {
    emit(NewsGeneralLoadingState());
    NewsRepository().getNews(query: {
      "apiKey": apiKey,
      "country": "eg",
      "category": "general",
    },
        url: 'v2/top-headlines'
    ).then((news) {
      newsGeneral = news ;
      emit(GetNewsGeneralSuccessState());
    }).catchError((error){
      debugPrint (error.toString());
      emit(GetNewsGeneralErrorState());
    });
  }
  void getSearchNews(String search) {
    emit(NewsSearchLoadingState());
    NewsRepository().getNews(query: {
      "apiKey": apiKey,
      "language": "ar",
      "q": search,
    },
        url: 'v2/everything'
    ).then((news) {
      newsSearch = news ;
      emit(GetNewsSearchSuccessState());
    }).catchError((error){
      debugPrint (error.toString());
      emit(GetNewsSearchErrorState());
    });
  }

  bool isLight = true ;
  void changeAppMode() {
    isLight = ! isLight ;
    SharedPreferencesData.putData(isLight: isLight);
    emit(ChangeThemeModeState());
  }


}
