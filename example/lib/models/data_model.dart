
class DataModel {
    int id;
    String dato1;
    String dato2;
    String date1;

    DataModel({
        this.id,
        this.dato1,
        this.dato2,
        this.date1,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => new DataModel(
        id: json["id"],
        dato1: json["dato1"],
        dato2: json["dato2"],
        date1: json["date1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dato1": dato1,
        "dato2": dato2,
        "date1": date1,
    };
}