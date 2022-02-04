import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class MapWidget extends StatelessWidget {

  final LatLng mapCenter = LatLng(54.583091, 38.017251);

  @override
  Widget build(BuildContext context) {
    double width = (ResponsiveWidget.isLargeScreen(context) ? 0.3 : ResponsiveWidget.isMediumScreen(context) ? 0.5 : 1) * context.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: width,
      height: 450,
      child: FlutterMap(
        children: [
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
          ),
          MarkerLayerWidget(options: MarkerLayerOptions(
            markers: [Marker(
              width: 30,
              height: 30,
              anchorPos: AnchorPos.align(AnchorAlign.center),
              point: mapCenter,
              builder: (context) => Image.asset('assets/logo/logo_molokovo_1024.png'),
            )],
          )),
        ],
        options: MapOptions(
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          maxZoom: 18,
          center: mapCenter,
          zoom: 13,
          //controller: _mapController,
        ),
      ),
    );
  }
}