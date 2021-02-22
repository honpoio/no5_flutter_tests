class ConpassAPIModelEvents{
var title;
var description;
var event_url;
var Catch;

ConpassAPIModelEvents(
    this.title,
    this.description,
    this.event_url,
    this.Catch,
    );


ConpassAPIModelEvents.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        event_url = json['event_url'],
        Catch =  json['catch'];
}