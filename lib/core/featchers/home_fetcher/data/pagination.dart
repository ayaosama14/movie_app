// class PaginationData {
//   int? page;
//   int? totalPages;
//
//   int? totalResults;
//
//   PaginationData({ this.page, this.totalPages, this.totalResults});
//
//   factory PaginationData.fromJson(Map<String, dynamic> paginationData) {
//     return PaginationData(
//         page: paginationData["page"],
//         totalPages: paginationData["total_pages"],
//         totalResults: paginationData["total_results"]);
//   }
//
//   bool get isLastPage => page! >= totalPages!;
// }
///*****************************call it in model
/// isPaginated
//         ? PaginationData(
//         page: json['page'],
//         totalPages: json['total_pages'],
//         totalResults: json['total_results'])
//         : null;
