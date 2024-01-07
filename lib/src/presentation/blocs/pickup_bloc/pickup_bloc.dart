import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/config/app_constants.dart';
import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_entity.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_list_with_count_entity.dart';
import 'package:gelivery_tracker/src/domain/usecases/get_pick_up_list.dart';
import 'package:gelivery_tracker/src/presentation/blocs/pickup_bloc/pickup_state.dart';
import 'package:injectable/injectable.dart';

@injectable
final class PickupCubit extends Cubit<PickupState> {
  final UseCase<Result<PickupListWithCountEntity>, GetPickupListParams>
      _getPickUpList;
  PickupCubit(this._getPickUpList) : super(const PickupLoadingState()) {
    _scrollController.addListener(listenOnScroll);
  }
  final ScrollController _scrollController = ScrollController();

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }

  ScrollController get scrollController => _scrollController;

  Future<void> loadPickupItems() async {
    final result = await _getPickUpList(
      const GetPickupListParams(0, pickupListPageSize),
    );

    switch (result) {
      case Success(data: final data):
        emit(
          PickupSuccessState(
            items: data.items,
            totalRecords: data.totalRecords,
            page: 0,
          ),
        );

      case Failed(failure: final failure):
        emit(PickupFailureState(failure));
    }
  }

  void loadNextPickupItems() async {
    if (state
        case PickupSuccessState(
          items: final oldItems,
          hasNextPage: final hasNextPage,
          totalRecords: final totalRecords,
          page: final page,
        )) {
      if (!hasNextPage) return;
      emit(PickupSuccessState(
        items: oldItems,
        totalRecords: totalRecords,
        shouldShowNextPageLoading: true,
        page: page,
      ));

      final result = await _getPickUpList(
        GetPickupListParams(
          page + 1,
          pickupListPageSize,
        ),
      );
      switch (result) {
        case Success(data: final data):
          final items = <PickupEntity>{...oldItems, ...data.items};
          emit(
            PickupSuccessState(
              page: page + 1,
              items: items.toList(),
              totalRecords: data.totalRecords,
              shouldShowNextPageLoading: false,
            ),
          );

        case Failed(failure: final failure):
          emit(PickupNextPageFailureState(failure));
      }
    }
  }

  void listenOnScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      EasyDebounce.debounce(
        'next-page',
        const Duration(milliseconds: 700),
        () => loadNextPickupItems(),
      );
    }
  }
}
