type t<'key, 'data, 'meta, 'pageParam> = {
  ...UseQueryOptions.t<'key, 'data, 'meta>,
  initialPageParam: 'pageParam,
  getNextPageParam: unit => Nullable.t<'pageParam>, // TODO
  getPreviousPageParam: unit => Nullable.t<'pageParam>, // TODO
  maxPages: option<int>,
}