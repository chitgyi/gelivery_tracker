import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/core/utils/failures/network_failure.dart';
import 'package:gelivery_tracker/src/di/di.dart';
import 'package:gelivery_tracker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/pickup_bloc/pickup_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/pickup_bloc/pickup_state.dart';
import 'package:gelivery_tracker/src/presentation/navigation/route_extension.dart';
import 'package:gelivery_tracker/src/presentation/widgets/dialogs/confirmation_dialog.dart';
import 'package:gelivery_tracker/src/presentation/widgets/items/pickup_list_view_item.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = get<PickupCubit>();
    return BlocProvider<PickupCubit>(
      create: (context) => cubit..loadPickupItems(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gelivery Tracker"),
          actions: [
            IconButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => ConfirmationDialog(
                    title: 'Warning',
                    content: 'Are you sure want to logout?',
                    onTapCancelBtn: () => context.pop(),
                    onTapOkBtn: () {
                      context.read<AuthCubit>().logout();
                      context.goToLoginPage();
                    },
                  ),
                ),
              },
              tooltip: 'Logout',
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: BlocListener<PickupCubit, PickupState>(
          listener: (BuildContext context, PickupState state) {
            if (state case PickupFailureState(failure: final failure)
                when failure is SessionFailure) {
              context.read<AuthCubit>().logout();
              context.goToLoginPage();
            }

            if (state case PickupNextPageFailureState(failure: final failure)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  showCloseIcon: true,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  duration: const Duration(seconds: 2),
                  content: Text(failure.reason),
                ),
              );
            }
          },
          child: BlocBuilder<PickupCubit, PickupState>(
            builder: (context, state) {
              return switch (state) {
                PickupSuccessState(items: final items) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RefreshIndicator(
                      onRefresh: () async => await cubit.loadPickupItems(),
                      child: CustomScrollView(
                        controller: cubit.scrollController,
                        slivers: [
                          SliverList.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: PickupListViewItem(
                                pickupEntity: items[index],
                                position: "${index + 1}/${items.length}",
                              ),
                            ),
                          ),
                          if (state.hasNextPage &&
                              state.shouldShowNextPageLoading)
                            const SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            ),
                          if (!state.hasNextPage)
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "You've caught all the items!",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                PickupFailureState(failure: final failure) => Center(
                    child: Text(failure.reason),
                  ),
                _ => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
