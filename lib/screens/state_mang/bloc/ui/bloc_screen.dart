import 'package:flutter/material.dart';

import 'package:welcomeflutter/screens/state_mang/bloc/blocs/bloc.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/Data.dart';
import 'package:welcomeflutter/screens/state_mang/bloc/models/getList.dart';

class Bloc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BlocState();
  }
}

class BlocState extends State<Bloc> {
  @override
  void initState() {
    super.initState();

    ///fetching data from api
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    ///release bloc
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Screen'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<GetList> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);

            /// if all right then show list
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());

            /// show error massage
          }
          return Text(snapshot.error.toString());//Center(child: CircularProgressIndicator());

          /// else show loading..
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<GetList> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.data.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Text('${snapshot.data.data[index].id}'),/*Image.network(
                '${snapshot.data.data[index].id}',
                fit: BoxFit.cover,
              ),*/
              onTap: () {},

              ///=> openDetailPage(snapshot.data, index)
            ),
          );
        });
  }

/*openDetailPage(Data data, int index) {
    final page = MovieDetailBlocProvider(
      child: MovieDetail(
        title: data.results[index].title,
        posterUrl: data.results[index].backdrop_path,
        description: data.results[index].overview,
        releaseDate: data.results[index].release_date,
        voteAverage: data.results[index].vote_average.toString(),
        movieId: data.results[index].id,
      ),
    );
    /// navigate next
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }),
    );
  }*/
}
