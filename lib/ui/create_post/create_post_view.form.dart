// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CaptionValueKey = 'caption';

mixin $CreatePostView on StatelessWidget {
  final TextEditingController captionController = TextEditingController();
  final FocusNode captionFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    captionController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            CaptionValueKey: captionController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    captionController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get captionValue => this.formValueMap[CaptionValueKey];

  bool get hasCaption => this.formValueMap.containsKey(CaptionValueKey);
}

extension Methods on FormViewModel {}
