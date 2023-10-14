import 'package:flutter/material.dart';

class CustomBottomSheet {
  const CustomBottomSheet({
    required this.context,
    this.title,
    required this.body,
    this.barrierColor,
    Key? key,
  });

  final BuildContext context;
  final Widget? title;
  final Widget body;
  final Color? barrierColor;

  Future<dynamic> show() async {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      isScrollControlled: true,
      barrierColor: barrierColor,
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: UnconstrainedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Color(0xFF6A6E87), width: 3),
                        )),
                        child: SizedBox(width: 48),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title ?? const SizedBox.shrink(),
                    body,
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showDraggable() async {
    showModalBottomSheet(
      // useSafeArea: true,
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      isScrollControlled: true,
      barrierColor: barrierColor,
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: UnconstrainedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Color(0xFF6A6E87), width: 3),
                      )),
                      child: SizedBox(width: 48),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  title ?? const SizedBox.shrink(),
                  body,
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
