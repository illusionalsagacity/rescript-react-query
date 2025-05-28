type infiniteQueryFunctionContext<'key, 'meta, 'pageParam> = {
  ...QueryFunctionContext.t<'key, 'meta>,
  pageParam: 'pageParam,
}

// type structuralSharing

@module("@tanstack/react-query")
external useQueryClient: unit => QueryClient.t = "useQueryClient"

@module("@tanstack/react-query")
external useQuery: UseQueryOptions.t<'key, 'data, 'meta> => QueryResult.t<'data> = "useQuery"

@module("@tanstack/react-query")
external useSelectQuery: UseSelectQueryOptions.t<'slice, 'key, 'data, 'meta> => QueryResult.t<
  'slice,
> = "useQuery"

@module("@tanstack/react-query")
external useInfiniteQuery: UseInfiniteQueryOptions.t<
  'key,
  'page,
  'meta,
  'pageParam,
> => InfiniteQueryResult.t<'key, 'page, 'pageParam> = "useInfiniteQuery"

@module("@tanstack/react-query")
external usePrefetchQuery: Query.options<'key, 'data, 'meta> => unit = "usePrefetchQuery"

@module("@tanstack/react-query")
external usePrefetchInfiniteQuery: UseInfiniteQueryOptions.t<
  'key,
  'data,
  'meta,
  'pageParam,
> => unit = "usePrefetchInfiniteQuery"

@module("@tanstack/react-query")
external useMutation: UseMutationOptions.t<
  'key,
  'variables,
  'data,
  'meta,
  'context,
> => MutationResult.t<'variables, 'data, 'context> = "useMutation"

@module("@tanstack/react-query")
external useIsFetching: (~filters: QueryFilters.t_requiredKey<'key, 'data, 'meta>=?) => int =
  "useIsFetching"

@module("@tanstack/react-query")
external useIsMutating: (
  ~filters: MutationFilters.t_requiredKey<'key, 'data, 'variables, 'context>=?,
) => int = "useIsMutating"

@module("@tanstack/react-query")
external matchQuery: (
  QueryFilters.t_optionalKey<'key, 'data, 'meta>,
  Query.t<'key, 'data, 'meta>,
) => bool = "matchQuery"

@module("@tanstack/react-query")
external matchMutation: (
  MutationFilters.t_optionalKey<'key, 'data1, 'variables1, 'context1>,
  Mutation.t<'data2, 'variables2, 'context2>,
) => bool = "matchMutation"

@module("@tanstack/react-query")
external useMutationState: UseMutationStateOptions.t<
  'key,
  'data,
  'select,
  'variables,
  'context,
> => array<'select> = "useMutationState"

@module("@tanstack/react-query")
external useSuspenseQuery: UseSuspenseQueryOptions.t<'key, 'data, 'meta> => SuspenseQueryResult.t<
  'data,
> = "useSuspenseQuery"

@module("@tanstack/react-query")
external useSuspenseInfiniteQuery: UseSuspenseInfiniteQueryOptions.t<
  'key,
  'data,
  'meta,
  'pageParam,
> => SuspenseQueryResult.t<'data> = "useSuspenseInfiniteQuery"
