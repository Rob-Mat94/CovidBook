class Country {
  late dynamic name;
  late dynamic cases;
  late dynamic todayCases;
  late dynamic deaths;
  late dynamic todayDeaths;
  late dynamic recovered;
  late dynamic active;
  late dynamic critical;
  late dynamic deathsPerOneMillion;

  Country.fromJson(Map<String, dynamic> json)
      : name = json['country'],
        cases = json['cases'],
        todayCases = json['todayCases'],
        deaths = json['deaths'],
        todayDeaths = json['todayDeaths'],
        recovered = json['recovered'],
        active = json['active'],
        critical = json['critical'],
        deathsPerOneMillion = json['deathsPerOneMillion'];
}
