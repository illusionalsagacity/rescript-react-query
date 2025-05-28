/**
 https://github.com/TanStack/query/blob/v5.70.0/packages/query-core/src/query.ts#L158
 */
type t<'key, 'data, 'meta> = {
  queryKey: 'key,
  queryHash: string,
}

@unboxed type staleTime<'key, 'data, 'meta> = Int(int) | Fn(t<'key, 'data, 'meta> => int)

/**
This type is present to allow a Partial-like behavior for custom hooks, and also for future defaulted options via `setQueryDefaults`.
 */
type baseOptions<'key, 'data, 'meta> = {
  queryHashFn?: 'key => string,
  networkMode?: NetworkMode.t,
  retry?: Retry.t,
  retryOnMount?: bool,
  staleTime?: staleTime<'key, 'data, 'meta>,
  gcTime?: GcTime.t,
  initialData?: unit => 'data,
  initialDataUpdatedAt?: InitialDataUpdatedAt.t,
  subscribed?: bool,
  meta?: 'meta,
}

type options<'key, 'data, 'meta> = {
  ...baseOptions<'key, 'data, 'meta>,
  queryKey: 'key,
  queryFn: QueryFunctionContext.t<'key, 'meta> => promise<'data>,
}

@get external options: t<'key, 'data, 'meta> => options<'key, 'data, 'meta> = "options"
@get external meta: t<_, _, 'meta> => 'meta = "meta"
@get external promise: t<_, 'data, _> => promise<'data> = "promise"
@get external queryKey: t<'key, _, _> => 'key = "queryKey"
