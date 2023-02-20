class BaseResponse<T> {
  final int count;
  final String next;
  final String? previous;
  final List<T> results;

  const BaseResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results']
    );
  }
}