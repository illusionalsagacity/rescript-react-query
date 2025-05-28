type t

// FIXME: this won't work
type options = {
  onError?: 'key 'data 'meta. (Error.t, Query.t<'key, 'data, 'meta>) => unit,
  onSuccess?: 'key 'data 'meta. ('data, Query.t<'key, 'data, 'meta>) => unit,
  onSettled?: 'key 'data 'error 'meta. (option<'data>, option<'error>, Query.t<'key, 'data, 'meta>) => unit,
}

@module("@tanstack/react-query")
@new external make: (~options: options=?) => t = "QueryCache"

@send external clear: t => unit = "clear"
@send external find: (t, ~filters: QueryFilters.t_requiredKey<'key, 'data, 'meta>=?) => option<Query.t<'key, 'data, 'meta>> = "find"
// findAll is not bound because the array is polymorphic