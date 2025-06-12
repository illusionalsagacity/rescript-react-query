@unboxed
type t<'key, 'data, 'meta> =
  | @as(true) True | @as(false) False | Func(Query.t<'key, 'data, 'meta> => bool)

external fromBool: bool => t<'key, 'data, 'meta> = "%identity"