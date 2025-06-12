type scope = {
  id: string,
}

type baseOptions<'key, 'variables, 'data, 'meta, 'context> = {
  gcTime?: GcTime.t,
  networkMode?: NetworkMode.t,
  onMutate?: 'variables => 'context,
  onSuccess?: ('data, 'variables, 'context) => promise<unit>,
  onError?: (Error.t, 'variables, option<'context>) => promise<unit>,
  onSettled?: (option<'data>, option<Error.t>, 'variables, option<'context>) => promise<unit>,
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