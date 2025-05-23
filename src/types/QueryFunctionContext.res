type t<'key, 'meta> = {
  queryKey: 'key,
  // client: QueryClient.t, // FIXME: causes a circular dependency
  signal?: Fetch.AbortSignal.t,
  meta?: 'meta,
}