type t<'key, 'meta, 'pageParam> = {
  ...QueryFunctionContext.t<'key, 'meta>,
  pageParam: 'pageParam,
}
