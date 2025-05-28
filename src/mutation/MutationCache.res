type t
type options = {}

type notifyEvent = [
  | #added
  | #removed
  | #updated
]

type listener<'data, 'variables, 'context> = option<Mutation.t<'data, 'variables, 'context>> => unit

@module("@tanstack/react-query")
@new external make: (~options: options=?) => t = "MutationCache"
// FIXME: this isn't correct, each mutation should have its own type variables
// @send external getAll: t => array<Mutation.t<'data, 'variables, 'context>> = "getAll"
@send external clear: t => unit = "clear"
@send external subscribe: (t, notifyEvent => unit) => unit => unit = "subscribe"