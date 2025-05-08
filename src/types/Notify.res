@unboxed type values = Array(array<string>) | @as("all") All
@unboxed type t<'key, 'data, 'meta> = | ...values | Fn(Query.t<'key, 'data, 'meta> => values)
