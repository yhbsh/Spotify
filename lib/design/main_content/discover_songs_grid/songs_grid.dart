import 'package:flutter/material.dart';

import '../../../entities/song.dart';
import '../../../notifiers/songs_notifier.dart';
import 'song_grid_card.dart';

class SongsGrid extends StatefulWidget {
  const SongsGrid({super.key});

  @override
  State<SongsGrid> createState() => _SongsGridState();
}

class _SongsGridState extends State<SongsGrid> {
  late final SongsNotifier _notifier;
  late final List<Song> _songs;

  @override
  void initState() {
    _notifier = SongsNotifier();
    _songs = _notifier.songs;
    super.initState();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1 / 1.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: _songs.length,
        itemBuilder: (_, i) => SongGridCard(song: _songs[i]),
      ),
    );
  }
}