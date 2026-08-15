import 'package:flutter/material.dart';
import '../models/anime.dart';
import '../utils/theme.dart';

class EpisodeTile extends StatelessWidget {
  final Episode episode;
  final VoidCallback onTap;

  const EpisodeTile({
    super.key,
    required this.episode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${episode.episodeNumber}',
                  style: const TextStyle(
                    color: AppTheme.primaryLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                episode.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.white,
                ),
              ),
            ),
            const Icon(Icons.play_circle_outline_rounded, color: AppTheme.primary, size: 28),
          ],
        ),
      ),
    );
  }
}
