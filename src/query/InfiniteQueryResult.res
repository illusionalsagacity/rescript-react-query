type data<'pageData, 'pageParam> = {
  pages: array<'pageData>,
  pageParams: array<'pageParam>,
}

type t<'key, 'data, 'pageParam> = {
  data: data<'data, 'pageParam>,
  isFetchingNextPage: bool,
  isFetchingPreviousPage: bool,
  // fetchNextPage: (~options: FetchNextPageOptions.t) => unit,
  // fetchPreviousPage: (~options: FetchPreviousPageOptions.t) => unit,
  
  hasNextPage: bool,
  hasPreviousPage: bool,
  isFetchNextPageError: bool,
  isFetchPreviousPageError: bool,
  isRefetching: bool,
  isRefetchError: bool,
  promise: promise<'data>,
}