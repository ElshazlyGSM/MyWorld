abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsBrightnessSwitchState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessDataSuccessState extends NewsStates {}

class NewsGetBusinessDataErrorState extends NewsStates {
  final String error;

  NewsGetBusinessDataErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsDataSuccessState extends NewsStates {}

class NewsGetSportsDataErrorState extends NewsStates {
  final String error;

  NewsGetSportsDataErrorState(this.error);
}

class NewsGetSciencesLoadingState extends NewsStates {}

class NewsGetSciencesDataSuccessState extends NewsStates {}

class NewsGetSciencesDataErrorState extends NewsStates {
  final String error;

  NewsGetSciencesDataErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchDataSuccessState extends NewsStates {}

class NewsGetSearchDataErrorState extends NewsStates {
  final String error;

  NewsGetSearchDataErrorState(this.error);
}