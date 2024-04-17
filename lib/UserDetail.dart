import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebatecnicaflutter/Api.dart';
import 'package:pruebatecnicaflutter/widget/DetailWidget.dart';
import 'package:pruebatecnicaflutter/widget/RowExpandableWidget.dart';
import 'package:pruebatecnicaflutter/widget/RowWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/User.dart';

class UserDetailPage extends StatefulWidget {
  final int userId;

  const UserDetailPage({
    Key? key,
    required this.userId,
  }) : super(key: key);


  @override
  State<UserDetailPage> createState() {
    return _UserDetailPageState();
  }

}

class _UserDetailPageState extends State<UserDetailPage> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = API().getuserId(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de usuario'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DetailWidget(user: snapshot.data!,),

                    RowWidget(
                      image: "assets/images/icn_name.png",
                      text: snapshot.data!.name,
                    ),

                    RowExpandableWidget(
                        text: "Dirección",
                        image: "assets/images/icn_location.png",
                        content: Padding(
                            padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            child: Column(
                              children: [
                                Text('Street: ${snapshot.data!.address.street}'),
                                Text(snapshot.data!.address.suite),
                                Text('City: ${snapshot.data!.address.city}'),
                                Text('Zip Code: ${snapshot.data!.address.zipcode}'),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  width: double.infinity,
                                  height: 200.0,
                                  child: GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          double.parse(snapshot.data!.address.geo.lat),
                                          double.parse(snapshot.data!.address.geo.lng)
                                      ),
                                      zoom: 11.0,
                                    ),
                                    markers: {
                                      Marker(
                                        markerId: MarkerId(snapshot.data!.name),
                                        position: LatLng(
                                            double.parse(snapshot.data!.address.geo.lat),
                                            double.parse(snapshot.data!.address.geo.lng)
                                        ),
                                      )
                                    },
                                  ),
                                )
                              ],
                            )
                        )
                    ),

                    RowWidget(
                      image: "assets/images/icn_phone.png",
                      text: snapshot.data!.phone,
                    ),
                    RowWidget(
                      image: "assets/images/icn_web.png",
                      text: snapshot.data!.website,
                    ),

                    RowExpandableWidget(
                        text: snapshot.data!.company.name,
                        image: "assets/images/icn_company.png",
                        content: Padding(
                            padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            child: Column(
                              children: [
                                Text('Phrase: ${snapshot.data!.company.catchPhrase}'),
                                Text(snapshot.data!.company.bs),
                              ],
                            )
                        )
                    )
                  ],
                ),
              );

            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      );

  }
}