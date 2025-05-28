type scope = {
  id: string,
}

type baseOptions<'key, 'variables, 'data, 'meta, 'context> = {
  gcTime?: GcTime.t,
  networkMode?: NetworkMode.t,
  onMutate?: 'variables => 'context,
  onSuccess?: ('data, 'variables, 'context) => unit,
  onError?: (Error.t, 'variables, option<'context>) => unit,
  onSettled?: (option<'data>, option<Error.t>, option<'context>) => unit,
  retry?: Retry.t,
  retryDelay?: RetryDelay.t,
  scope?: scope,
  throwOnError?: bool,
  meta?: 'meta,
}
  

type t<'key, 'variables, 'data, 'meta, 'context> = {
  ...baseOptions<'key, 'variables, 'data, 'meta, 'context>,
  mutationFn: ('variables, option<'context>) => promise<'data>,
  mutationKey: 'key,
}