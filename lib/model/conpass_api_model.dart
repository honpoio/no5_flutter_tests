class ConpassAPIModel{
  var results_start;
  var results_returned;
  var results_available;
  var events;

  ConpassAPIModel(
    this.results_start,
    this.results_returned,
    this.results_available,
    // this.events,
  );

  ConpassAPIModel.fromJson(Map<String, dynamic> json)
      : results_returned = json['results_returned'],
        results_available = json['results_available'],
        results_start = json['results_start'],
        events =  json['events'];
}