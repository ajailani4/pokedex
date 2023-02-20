class BaseResponse<T> {
  final int count;
  final String next;
  final String? previous;
  final T results;

  const BaseResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT
  ) {
    return BaseResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: fromJsonT(json['results'])
    );
  }
}