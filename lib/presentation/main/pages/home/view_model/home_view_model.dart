import 'dart:async';
import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import 'package:app/domain/usecase/home_usecase.dart';
import 'package:app/presentation/base/base_view_model.dart';

import '../../../../../domain/models/models.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_rendererImpl.dart';

class HomeViewModel extends BaseViewModel {
  final StreamController _homeViewObjectsStreamController =
      BehaviorSubject<HomeViewObject>();

  HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputHomeData.add(HomeViewObject(homeObject.data.banners,
          homeObject.data.services, homeObject.data.stores));

      // navigate to main screen
    });
  }

  @override
  void dispose() {
    _homeViewObjectsStreamController.close();

    super.dispose();
  }

  @override
  Sink get inputHomeData => _homeViewObjectsStreamController.sink;

  // -- outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _homeViewObjectsStreamController.stream
          .map((homeViewObject) => homeViewObject);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<List<HomeViewObject>> get outputHomeData;
}

class HomeViewObject {
  List<BannerAd> banners;
  List<Service> services;
  List<Store> stores;
  HomeViewObject(
    this.banners,
    this.services,
    this.stores,
  );
}
