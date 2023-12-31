import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../notifiers/current_song_notifier.dart';
import '../../../../states/current_song_state.dart';

class PlayPauseAudioButton extends StatelessWidget {
  const PlayPauseAudioButton({super.key});

  void _onPressed(BuildContext context) async {
    final notifier = context.read<CurrentSongNotifier>();
    return switch (notifier.state.status) {
      CurrentSongStatus.stopped => null,
      CurrentSongStatus.paused => notifier.resume(),
      CurrentSongStatus.playing => notifier.pause()
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton.filled(
      padding: EdgeInsets.zero,
      style: IconButton.styleFrom(backgroundColor: colorScheme.onSurface),
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      onPressed: () => _onPressed(context),
      splashRadius: 10,
      hoverColor: colorScheme.background.withOpacity(0.2),
      highlightColor: colorScheme.background.withOpacity(0.25),
      icon: Selector<CurrentSongNotifier, CurrentSongStatus>(
        selector: (_, notifier) => notifier.state.status,
        builder: (_, status, __) => Icon(
          switch (status) {
            CurrentSongStatus.stopped || CurrentSongStatus.paused => Icons.play_arrow,
            CurrentSongStatus.playing => Icons.pause,
          },
          size: 25,
        ),
      ),
    );
  }
}
