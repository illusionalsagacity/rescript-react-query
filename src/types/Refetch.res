@unboxed type values = | @as(false) False | @as(true) True | @as("always") Always
@unboxed type t<'key, 'data, 'meta> = | ...values | Fn(Query.t<'key, 'data, 'meta> => values)
