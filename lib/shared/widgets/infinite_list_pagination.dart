import 'package:flutter/material.dart';

class InfiniteListPagination extends StatefulWidget {
  final Function(BuildContext context, ScrollController scrollController) builder;
  final Function()? onMaxScrollExtent;
  final double maxScrollExtentThreshold;

  const InfiniteListPagination({
    super.key,
    required this.builder,
    this.onMaxScrollExtent,
    this.maxScrollExtentThreshold = 0.9,
  });

  @override
  State<InfiniteListPagination> createState() => _InfiniteListPaginationState();
}

class _InfiniteListPaginationState extends State<InfiniteListPagination> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if ((scrollController.position.maxScrollExtent * widget.maxScrollExtentThreshold) <
          scrollController.position.pixels) {
        widget.onMaxScrollExtent?.call();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      scrollController,
    );
  }
}
