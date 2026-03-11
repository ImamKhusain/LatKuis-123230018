import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        elevation: 0.8,
      ),
      body: Column(
        children: [
          movie.imgUrl.isNotEmpty
          ? Image.network(
              movie.imgUrl,
              width: double.infinity,
              height: 260,
              fit: BoxFit.contain,
            )
          : Container(
              height: 260,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.movie_outlined, size: 72, color: Colors.grey),
              ),
            ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${movie.title} (${movie.year})', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Directed by ${movie.director}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  const SizedBox(height: 12),
                  Text(movie.synopsis, style: const TextStyle(fontSize: 14, height: 1.4)),
                  const SizedBox(height: 12),
                  Text('Genre: ${movie.genre}', style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                  const SizedBox(height: 6),
                  Text('Casts: ${movie.casts.join(', ')}', style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                  const SizedBox(height: 12),
                  Row(children: [
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    const SizedBox(width: 8),
                    Text('Rated ${movie.rating}/10', style: const TextStyle(fontSize: 14)),
                  ]),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Would open: ${movie.movieUrl}')),
                      ),
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      child: const Text('Go to Wikipedia'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}