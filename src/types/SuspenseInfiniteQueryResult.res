type rec t<'key, 'page, 'pageParam> = {
  data: PaginatedData.t<'page, 'pageParam>,
  isFetchingNextPage: bool,
  isFetchingPreviousPage: bool,
  fetchNextPage: (~options: FetchNextPageOptions.t) => promise<t<'key, 'page, 'pageParam>>,
  fetchPreviousPage: (~options: FetchPreviousPageOptions.t) => promise<t<'key, 'page, 'pageParam>>,
  hasNextPage: bool,
  hasPreviousPage: bool,
  isFetchNextPageError: bool,
  isFetchPreviousPageError: bool,
  isRefetching: bool,
  isRefetchError: bool,
  promise: promise<'page>,
}