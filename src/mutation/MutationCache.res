type t
type options

type notifyEvent = [
  | #added
  | #removed
  | #updated
]

type listener = option<Mutation.t> => unit


@new external make: options => t = "MutationCache"
@send external getAll: t => array<Mutation.t> = "getAll"
@send external clear: t => unit = "clear"
@send external subscribe: (t, notifyEvent => unit) => unit => unit = "subscribe"