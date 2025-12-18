import 'dart:developer';

import 'package:flutter/material.dart';

class CustomButtonToShowOverlayDialog extends StatefulWidget {
  const CustomButtonToShowOverlayDialog({
    super.key,
    required this.mainWidget,
    this.widgetListInDialog,
    this.onTapOnChildrenItem,
    this.showDialog = false,
    required this.buttonKey,
  });
  final Widget mainWidget;
  final List<Widget>? widgetListInDialog;
  final List<VoidCallback>? onTapOnChildrenItem;
  final bool showDialog;
  final GlobalKey buttonKey;
  @override
  CustomButtonToShowOverlayDialogState createState() =>
      CustomButtonToShowOverlayDialogState();
}

class CustomButtonToShowOverlayDialogState
    extends State<CustomButtonToShowOverlayDialog>
    with WidgetsBindingObserver {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    log('initState showDialog: ${widget.showDialog}');
    if (widget.showDialog) {
      _showDialog();
    } else {
      _removeDialog();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _removeDialog();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // This is called on screen size/orientation change
    _removeDialog();
    super.didChangeMetrics();
  }

  void _removeDialog() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  void _showDialog() {
    if (_overlayEntry != null) {
      // Dialog is open → close it
      _removeDialog(); // remove old dialog if exists
      return;
    }
    final RenderBox renderBox =
        widget.buttonKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // ========== CLICK OUTSIDE TO CLOSE ==========
            Positioned.fill(
              child: Container(
                color: Colors.black12, // with opacity to indicate overlay
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _removeDialog,
                ),
              ),
            ),

            // ========== THE DIALOG ==========
            Positioned(
              top: position.dy + 90,
              right: position.dx,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(blurRadius: 6, color: Colors.black26),
                    ],
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: widget.widgetListInDialog!.asMap().entries.map((
                        entry,
                      ) {
                        // int index = entry.key;
                        Widget child = entry.value;
                        return child;
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDialog();
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _removeDialog();
      });
    }
    return widget.mainWidget;
  }
}
