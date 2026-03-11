import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail_page.dart';


class MovieListPage extends StatefulWidget {
  final String username;
  const MovieListPage({super.key, this.username = 'username'});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final List<MovieModel> movies = movieList;
  final Set<int> savedIndices = {};

  void _toggleSave(int index) {
    setState(() {
      if (savedIndices.contains(index)) savedIndices.remove(index);
      else savedIndices.add(index);
    });
  }

  void _openDetail(MovieModel movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailPage(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${widget.username}!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final m = movies[index];
                  final isSaved = savedIndices.contains(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () => _openDetail(m),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              // Thumbnail / poster
                              Container(
                                width: 80,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(6),
                                  image: m.imgUrl.isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(m.imgUrl),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: m.imgUrl.isEmpty
                                    ? const Icon(
                                        Icons.movie,
                                        size: 36,
                                        color: Colors.grey,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${m.title} (${m.year})',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => _toggleSave(index),
                                          icon: Icon(
                                            isSaved ? Icons.bookmark : Icons.bookmark_outline,
                                            color: isSaved ? Colors.blue : Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      m.genre,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, size: 16, color: Colors.orange),
                                        const SizedBox(width: 6),
                                        Text('${m.rating}/10', style: const TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}