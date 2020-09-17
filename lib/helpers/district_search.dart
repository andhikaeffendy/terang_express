import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_area.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/district.dart';

class DistrictSearch extends SearchDelegate<District> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // We will put the api call here
      future: searchDistrict(),
      builder: (context, snapshot) =>
        query == '' ? searchResultView(districts) : snapshot.hasData ? searchResultView(snapshot.data) : searchingView(),
    );
  }

  String getName(District district){
    return district.name;
  }

  int getId(District district){
    return district.districtId;
  }

  Future<List<District>> searchDistrict() async {
    List<District> result = new List();
    districts.forEach((element) {
      if(element.name.toLowerCase().contains(query.toLowerCase()))
        result.add(element);
    });

    return result;
  }

  Widget searchResultView(data){
    return ListView.builder(
      itemBuilder: (context, index) =>
          Card(
            child: ListTile(
              title: Text(getName(data[index])),
              onTap: () async {
                showCircular(context);
                futureApiArea(currentUser.token, getId(data[index])).then((value){
                  closeCircular(context);
                  if(value.isSuccess()) {
                    District district = data[index];
                    district.areaId = value.areaId;
                    close(context, district);
                  } else alertDialogOK(context, "Area", value.message);
                });
              },
            ),
          ),
      itemCount: data.length,
    );
  }

  Widget emptyView(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text('Masukkan Kota/Kabupaten'),
    );
  }

  Widget searchingView(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text('Mencari ...'),
    );
  }

}