import 'package:equatable/equatable.dart';
import 'package:gelivery_tracker/src/core/utils/failures/failure.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_entity.dart';

sealed class PickupState extends Equatable {
  const PickupState();

  @override
  List<Object?> get props => [];
}

final class PickupLoadingState extends PickupState {
  const PickupLoadingState();
}

final class PickupFailureState extends PickupState {
  final Failure failure;
  const PickupFailureState(this.failure);
}

final class PickupNextPageFailureState extends PickupState {
  final Failure failure;
  const PickupNextPageFailureState(this.failure);
}

final class PickupSuccessState extends PickupState {
  final List<PickupEntity> items;
  final int totalRecords;
  final int page;
  final bool shouldShowNextPageLoading;

  const PickupSuccessState({
    required this.items,
    required this.page,
    required this.totalRecords,
    this.shouldShowNextPageLoading = true,
  });

  bool get hasNextPage => items.length < totalRecords;

  PickupSuccessState copyWith({
    List<PickupEntity>? items,
    int? totalRecords,
    bool? shouldShowNextPageLoading,
    int? page,
  }) =>
      PickupSuccessState(
        page: page ?? this.page,
        items: items ?? this.items,
        totalRecords: totalRecords ?? this.totalRecords,
        shouldShowNextPageLoading:
            shouldShowNextPageLoading ?? this.shouldShowNextPageLoading,
      );

  @override
  List<Object?> get props => [
        items,
        totalRecords,
        shouldShowNextPageLoading,
      ];
}
