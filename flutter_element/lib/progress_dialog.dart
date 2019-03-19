import 'package:flutter/material.dart';

class ProgressDialog extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final String loadingText;

  ProgressDialog(
      {this.child, this.isLoading: false, this.loadingText: '加载中，请稍后...'})
      : assert(null != child);

  @override
  State<StatefulWidget> createState() {
    return _ProgressDialogState();
  }
}

class _ProgressDialogState extends State<ProgressDialog> {
  @override
  Widget build(BuildContext context) {
    List<Widget> childList = [];
    childList.add(widget.child);
    if (widget.isLoading) {
      childList.add(
        Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black87,
            )),
      );
      childList.add(Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                    child: Text(
                      widget.loadingText,
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ));
    }
    return Stack(children: childList);
  }
}
