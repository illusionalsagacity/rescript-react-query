type t<'key, 'meta> = {
  queryKey: 'key,
  client: QueryClient.t,
  signal?: Fetch.AbortSignal.t,
  meta?: 'meta,
}