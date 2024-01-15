import 'package:flutter/material.dart';

extension loadingButton on ElevatedButton {
  Widget withLoading(bool loading) {
    return loading
        ? const ElevatedButton(
            onPressed: null,
            child: SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator.adaptive(),
            ))
        : this;
  }
}
