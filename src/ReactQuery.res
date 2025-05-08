type infiniteQueryFunctionContext<'key, 'meta, 'pageParam> = {
  ...QueryFunctionContext.t<'key, 'meta>,
  pageParam: 'pageParam,
}

// type structuralSharing

@module("react-query")
external useQueryClient: unit => QueryClient.t = "useQueryClient"

@module("react-query")
external useQuery: UseQueryOptions.t<'key, 'data, 'meta> => QueryResult.t<'data> = "useQuery"

@module("react-query")
external useSelectQuery: UseSelectQueryOptions.t<'slice, 'key, 'data, 'meta> => QueryResult.t<
  'slice,
> = "useQuery"

@module("react-query")
external useInfiniteQuery: UseInfiniteQueryOptions.t<
  'key,
  'data,
  'meta,
  'pageParam,
> => QueryResult.t<'data> = "useInfiniteQuery"

@module("react-query")
external usePrefetchQuery: Query.options<'key, 'data, 'meta> => unit = "usePrefetchQuery"

@module("react-query")
external usePrefetchInfiniteQuery: UseInfiniteQueryOptions.t<
  'key,
  'data,
  'meta,
  'pageParam,
> => unit = "usePrefetchInfiniteQuery"

@module("react-query")
external useMutation: UseMutationOptions.t<
  'key,
  'variables,
  'data,
  'meta,
  'context,
> => MutationResult.t<'variables, 'data, 'context> = "useMutation"

@module("react-query")
external useIsFetching: (~filters: QueryFilters.t_requiredKey<'key, 'data, 'meta>=?) => int =
  "useIsFetching"

@module("react-query")
external useIsMutating: (~filters: MutationFilters.t_requiredKey<'key, 'data>=?) => int =
  "useIsMutating"

@module("react-query")
external matchQuery: (
  QueryFilters.t_optionalKey<'key, 'data, 'meta>,
  Query.t<'key, 'data, 'meta>,
) => bool = "matchQuery"

@module("react-query")
external matchMutation: (MutationFilters.t_optionalKey<'key, 'data>, Mutation.t) => bool =
  "matchMutation"

@module("react-query")
external useMutationState: UseMutationStateOptions.t<'key, 'data, 'select> => array<'select> =
  "useMutationState"

@module("react-query")
external useSuspenseQuery: UseSuspenseQueryOptions.t<'key, 'data, 'meta> => SuspenseQueryResult.t<
  'data,
> = "useSuspenseQuery"

@module("react-query")
external useSuspenseInfiniteQuery: UseSuspenseInfiniteQueryOptions.t<
  'key,
  'data,
  'meta,
  'pageParam,
> => SuspenseQueryResult.t<'data> = "useSuspenseInfiniteQuery"
