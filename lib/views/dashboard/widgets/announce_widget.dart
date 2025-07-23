import 'dart:convert';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnnounceWidget extends ConsumerWidget {
  const AnnounceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encodedText = ref.watch(
      currentProfileProvider.select((profile) => profile?.announceText),
    );

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
        print('Не удалось декодировать анонс из base64: $e');
        announceText = encodedText;
      }
    }

    if (announceText == null || announceText.isEmpty) {
      return const SizedBox.shrink();
    }

    return AbsorbPointer(
      child: CommonCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.campaign_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SelectableText(
                  announceText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}