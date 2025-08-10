import 'dart:convert';
import 'package:flclashx/providers/providers.dart';
import 'package:flclashx/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnnounceWidget extends ConsumerWidget {
  const AnnounceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider);

    if (profile == null) {
      return const SizedBox.shrink();
    }

    final encodedText = profile.announceText;
    String? announceText;

    if (encodedText != null && encodedText.isNotEmpty) {
      var textToDecode = encodedText;
      if (encodedText.startsWith('base64:')) {
        textToDecode = encodedText.substring(7);
      }
      try {
        final normalized = base64.normalize(textToDecode);
        announceText = utf8.decode(base64.decode(normalized));
      } catch (e) {
        announceText = encodedText;
      }
    }

    if (announceText == null || announceText.isEmpty) {
      return const SizedBox.shrink();
    }

    return AbsorbPointer(
      child: CommonCard(
        onPressed: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: SelectableText(
              announceText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
