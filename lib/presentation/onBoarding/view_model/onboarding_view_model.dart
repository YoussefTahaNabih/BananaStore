import 'dart:async';
import 'package:app/domain/models/models.dart';
import 'package:app/presentation/base/base_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../resources/assets_manger.dart';
import '../../resources/strings_manger.dart';

class OnBoardinViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(_list[_currentIndex], _list.length, _currentIndex),
    );
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1.tr(),
            AppStrings.onBoardingTitle1.tr(), ImageAssets.asset1Ic),
        SliderObject(AppStrings.onBoardingTitle2.tr(),
            AppStrings.onBoardingTitle2.tr(), ImageAssets.asset2Ic),
        SliderObject(AppStrings.onBoardingTitle3.tr(),
            AppStrings.onBoardingTitle3.tr(), ImageAssets.asset3Ic),
      ];
}

abstract class OnBoardingViewModelInput {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}
