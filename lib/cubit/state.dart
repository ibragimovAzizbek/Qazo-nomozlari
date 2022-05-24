abstract class AppState {
  AppState();
}

class AppInitial extends AppState {
  AppInitial();
}

class LoadingState extends AppState {
  LoadingState();
}

class ComplateState extends AppState {
  var data;
  ComplateState({this.data});
}

class ErrorState extends AppState {
  String msg;
  ErrorState({required this.msg});
}
