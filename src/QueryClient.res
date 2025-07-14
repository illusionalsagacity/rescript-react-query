type t

type refetchType =
  | @as("active") Active
  | @as("inactive") Inactive
  | @as("all") All
  | @as("none") None

// Placeholder types for complex options - these might need refinement or separate files
type invalidateOptions = {
  refetchType?: refetchType,
  throwOnError?: bool,
}

type refetchOptions = {
  throwOnError?: bool,
  cancelRefetch?: bool,
}

type cancelOptions = {
  revert?: bool,
  silent?: bool,
  throwOnError?: bool,
}

type resetOptions = {throwOnError?: bool}

type setQueryDataOptions = {updatedAt?: int} // Timestamp

type setQueriesDataOptions = {updatedAt?: int} // Timestamp

// Basic Mutation Options (subset of UseMutationOptions)
type mutationOptions<'variables, 'data, 'meta, 'context> = {
  mutationFn?: ('variables, option<'context>) => promise<'data>,
  retry?: Retry.t,
  retryDelay?: RetryDelay.t,
  gcTime?: GcTime.t,
  networkMode?: NetworkMode.t,
  meta?: 'meta,
}

// DefaultOptions might be complex, using a placeholder structure
type defaultOptions = {
  queries?: Query.baseOptions<unknown, unknown, unknown>, // Using unknown for generics
  // FIXME: create a new module for MutationOptions
  mutations?: mutationOptions<unknown, unknown, unknown, unknown>, // Using unknown for generics
}

type config = {
  queryCache?: QueryCache.t,
  mutationCache?: MutationCache.t,
  defaultOptions?: defaultOptions,
}

@module("@tanstack/react-query") @new
external make: (~config: config=?) => t = "QueryClient"

// --- Query Methods ---

// fetchQuery(options)
@send
external fetchQuery: (t, Query.options<'key, 'data, 'meta>) => promise<'data> = "fetchQuery"

// fetchInfiniteQuery(options)
// Note: Using a combined type for InfiniteQueryOptions for now
type infiniteQueryOptions<'key, 'data, 'meta, 'pageParam> = {
  ...Query.options<'key, 'data, 'meta>,
  initialPageParam: 'pageParam,
  getNextPageParam: ('data, array<'data>, 'pageParam) => option<'pageParam>, // Adjusted based on docs
  getPreviousPageParam?: ('data, array<'data>, 'pageParam) => option<'pageParam>, // Adjusted based on docs
  maxPages?: int,
}

@send
external fetchInfiniteQuery: (
  t,
  infiniteQueryOptions<'key, 'data, 'meta, 'pageParam>,
) => promise<PaginatedData.t<'data, 'pageParam>> = "fetchInfiniteQuery"

// prefetchQuery(options)
@send
external prefetchQuery: (t, Query.options<'key, 'data, 'meta>) => promise<unit> = "prefetchQuery"

// prefetchInfiniteQuery(options)
@send
external prefetchInfiniteQuery: (
  t,
  infiniteQueryOptions<'key, 'data, 'meta, 'pageParam>,
) => promise<unit> = "prefetchInfiniteQuery"

// getQueryData(queryKey, filters?)
@send
external getQueryData: (t, 'key, ~filters: QueryFilters.t_withoutKey=?) => option<'data> =
  "getQueryData"

// ensureQueryData(options)
@send
external ensureQueryData: (t, Query.options<'key, 'data, 'meta>) => promise<'data> =
  "ensureQueryData"

// ensureInfiniteQueryData(options)
@send
external ensureInfiniteQueryData: (
  t,
  infiniteQueryOptions<'key, 'data, 'meta, 'pageParam>,
) => promise<PaginatedData.t<'data, 'pageParam>> = "ensureInfiniteQueryData"

// getQueriesData(filters)
@send
external getQueriesData: (
  t,
  QueryFilters.t_optionalKey<'key, 'data, 'meta>,
) => array<('key, 'data)> = "getQueriesData"

@send
external setQueryData: (
  t,
  'key,
  @unwrap [#Data('data) | #Fn(option<'data> => option<'data>)],
  ~options: setQueryDataOptions=?,
) => option<'data> = "setQueryData"

// getQueryState(queryKey, filters?)
@send
external getQueryState: (
  t,
  'key,
  ~filters: QueryFilters.t_withoutKey=?,
) => option<QueryState.t<'data>> = "getQueryState"

// setQueriesData(filters, updater, options?)
@send
external setQueriesData: (
  t,
  QueryFilters.t_optionalKey<'key, 'data, 'meta>,
  @unwrap [#Data('data) | #Fn(option<'data> => option<'data>)],
  ~options: setQueriesDataOptions=?,
) => array<('key, 'data)> = "setQueriesData" // Returns array of [queryKey, data] tuples

// invalidateQueries(filters?, options?)
@send
external invalidateQueries: (
  t,
  ~filters: QueryFilters.t_optionalKey<'key, 'data, 'meta>=?,
  ~options: invalidateOptions=?,
) => promise<unit> = "invalidateQueries"

// refetchQueries(filters?, options?)
@send
external refetchQueries: (
  t,
  ~filters: QueryFilters.t_optionalKey<'key, 'data, 'meta>=?,
  ~options: refetchOptions=?,
) => promise<unit> = "refetchQueries"

// cancelQueries(filters?, options?)
@send
external cancelQueries: (
  t,
  ~filters: QueryFilters.t_optionalKey<'key, 'data, 'meta>=?,
  ~options: cancelOptions=?,
) => promise<unit> = "cancelQueries"

// removeQueries(filters?)
@send
external removeQueries: (t, ~filters: QueryFilters.t_optionalKey<'key, 'data, 'meta>=?) => unit =
  "removeQueries"

// resetQueries(filters?, options?)
@send
external resetQueries: (
  t,
  ~filters: QueryFilters.t_optionalKey<'key, 'data, 'meta>=?,
  ~options: resetOptions=?,
) => promise<unit> = "resetQueries"

// isFetching(filters?)
@send
external isFetching: (t, ~filters: QueryFilters.t_optionalKey<'key, 'data, 'meta>=?) => int =
  "isFetching"

// isMutating(filters?)
@send
external isMutating: (
  t,
  ~filters: MutationFilters.t_optionalKey<'key, 'data, 'variables, 'context>=?,
) => int = "isMutating"

// --- Defaults ---

// getDefaultOptions()
@send external getDefaultOptions: t => defaultOptions = "getDefaultOptions"

// setDefaultOptions(options)
@send external setDefaultOptions: (t, defaultOptions) => unit = "setDefaultOptions"

// getQueryDefaults(queryKey)
@send
external getQueryDefaults: (t, 'key) => option<Query.options<'key, unknown, unknown>> =
  "getQueryDefaults" // Data/Meta type might not be known

// setQueryDefaults(queryKey, options)
@send
external setQueryDefaults: (t, 'key, Query.options<'key, 'data, 'meta>) => unit = "setQueryDefaults"

// getMutationDefaults(mutationKey)
@send
external getMutationDefaults: (
  t,
  'key,
) => option<mutationOptions<unknown, unknown, unknown, unknown>> = "getMutationDefaults" // Variable/Data/Context/Meta types might not be known

// setMutationDefaults(mutationKey, options)
@send
external setMutationDefaults: (
  t,
  'key,
  mutationOptions<'variables, 'data, 'meta, 'context>,
) => unit = "setMutationDefaults"

// --- Cache Access ---

// getQueryCache()
@send external getQueryCache: t => QueryCache.t = "getQueryCache"

// getMutationCache()
@send external getMutationCache: t => MutationCache.t = "getMutationCache"

// --- Other Methods ---

// clear()
@send external clear: t => unit = "clear"

// resumePausedMutations()
@send external resumePausedMutations: t => promise<unit> = "resumePausedMutations"
