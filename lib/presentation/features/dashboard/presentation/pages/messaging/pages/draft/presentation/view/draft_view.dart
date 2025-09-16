import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_all_drafts_response.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/components/add_draft_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/components/draft_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/components/search_bar_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/notifier/get_all_drafts_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class DraftView extends ConsumerStatefulWidget {
  const DraftView({super.key});
  static const String routeName = '/draft';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DraftViewState();
}

class _DraftViewState extends ConsumerState<DraftView> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllDraftsNotifier.notifier).getAllDrafts();
      _filterDrafts();
      _searchController.addListener(_filterDrafts);
    });
    super.initState();
  }

  List<AllDraftsData>? filteredDrafts = [];

  void _filterDrafts() {
    final draftList = ref.watch(
      getAllDraftsNotifier.select(
        (v) => v.getAllDraftsResponse?.data ?? [],
      ),
    );

    final searchTerm = _searchController.text.toLowerCase();

    setState(() {
      filteredDrafts = draftList
          .where((item) =>
              item.draftTitle?.toLowerCase().contains(searchTerm) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
        getAllDraftsNotifier.select((v) => v.getAllDraftsState.isLoading));
    return PageLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Draft',
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SearchBarSection(
                  searchController: _searchController,
                ),
                const VerticalSpacing(19),
                DraftsSection(
                  filteredDrafts: filteredDrafts,
                ),
              ],
            ),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          elevation: 0,
          onPressed: () {
            context.pushNamed(AddDraftSection.routeName);
          },
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
