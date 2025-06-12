type t_predicate<'key, 'data, 'meta> = {
  predicate?: Query.t<'key, 'data, 'meta> => bool,
}

type t_withoutKey = {
  @as("type") type_?: QueryTypeFilter.t,
  exact?: bool,
  stale?: bool,
  fetchStatus?: FetchStatus.t,
}

type t_optionalKey<'key, 'data, 'meta> = {
  ...t_withoutKey,
  ...t_predicate<'key, 'data, 'meta>,
  queryKey?: 'key,
}

type t_requiredKey<'key, 'data, 'meta> = {
  ...t_withoutKey,
  ...t_predicate<'key, 'data, 'meta>,
  queryKey: 'key,
}