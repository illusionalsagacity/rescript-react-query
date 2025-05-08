

type t_withoutKey<'data> = {
  @as("type") type_?: QueryTypeFilter.t,
  exact?: bool,
  stale?: bool,
  fetchStatus?: FetchStatus.t,
}

type t_optionalKey<'key, 'data, 'meta> = {
  ...t_withoutKey<'data>,
  predicate: Query.t<'key, 'data, 'meta> => bool,
  queryKey?: 'key,
}

type t_requiredKey<'key, 'data, 'meta> = {
  ...t_withoutKey<'data>,
  predicate: Query.t<'key, 'data, 'meta> => bool,
  queryKey: 'key,
}