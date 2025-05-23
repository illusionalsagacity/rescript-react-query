type t<'key, 'page, 'meta, 'pageParam> = {
  ...UseQueryOptions.t<'key, 'page, 'meta>,
  initialPageParam: 'pageParam,
  getNextPageParam: ('page, array<'page>, 'pageParam, array<'pageParam>) => option<'pageParam>,
  getPreviousPageParam?: ('page, array<'page>, 'pageParam, array<'pageParam>) => option<'pageParam>, // TODO
  maxPages?: int,
}
