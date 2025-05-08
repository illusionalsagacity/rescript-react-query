@unboxed type withoutFn = Int(int) | @as(false) False
@unboxed
type t<'key, 'data, 'meta> =
  | ...withoutFn
  | Fn(Query.t<'key, 'data, 'meta> => option<withoutFn>)
