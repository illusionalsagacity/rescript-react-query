type callbacks<'variables, 'data, 'context> = {
  // onMutate: unit => unit,
  onSuccess?: ('data, 'variables, 'context) => unit,
  onError?: (Error.t, 'variables, option<'context>) => unit,
  onSettled?: (option<'data>, option<Error.t>, option<'context>) => unit,
}

type t<'variables, 'data, 'context> = {
  status: MutationStatus.t,
  isPaused: bool,
  isIdle: bool,
  isPending: bool,
  isError: bool,
  data: option<'data>,
  error: Null.t<Error.t>,
  reset: unit => unit,
  failureCount: int,
  failureReason: Null.t<Error.t>,
  submittedAt: int,
  variables: option<'variables>,
  mutate: ('variables, callbacks<'variables, 'data, 'context>) => unit,
  mutateAsync: ('variables, callbacks<'variables, 'data, 'context>) => Js.Promise.t<'data>,
}
