import 'package:flutter/material.dart';

class ViewPetDetailPage extends StatefulWidget {
  const ViewPetDetailPage({Key? key}) : super(key: key);

  @override
  State<ViewPetDetailPage> createState() => _ViewPetDetailPageState();
}

class _ViewPetDetailPageState extends State<ViewPetDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Pet Details"
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dog Details",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Name: Tom"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breed: Labrador"),
                    Text("Species: Labrador"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("sex: male"),
                    Text("weight: 20 kg"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("birthmark: None"),
                    Text("last pregnancy: -"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("sterialization: -"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Medical Contact",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Doctor name: Dr. XYZ"),
                SizedBox(
                  height: 10,
                ),
                Text("Clinic Address: abc, abc, abc, abc, abc"),
                SizedBox(
                  height: 10,
                ),
                Text("Clinic hours: 10:00 AM to 8:00 PM"),
                SizedBox(
                  height: 10,
                ),
                Text("Clinic contact: +91 8201820101"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Owner Details",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Owner name: Reddy"),
                SizedBox(
                  height: 10,
                ),
                Text("Owner address: bed, bed, bed, bed, bed"),
                SizedBox(
                  height: 10,
                ),
                Text("Owner contact: +91 8200082011"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Treatment Details",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Treatment: XYZ",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Infection: ABC",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Last visiting date: 08/12/22",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Is recurring : true",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Recurring days: 20",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Doctor details: -",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
