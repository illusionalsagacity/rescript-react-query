// Bindings for TanStack Query Mutation class
// https://tanstack.com/query/latest/docs/reference/mutation

// The main Mutation type, parameterized by data types
type t<'data, 'variables, 'context>

// Mutation state - represents the current state of a mutation
type state<'data, 'variables, 'context> = {
  context: option<'context>,
  data: option<'data>,
  error: Null.t<Error.t>,
  failureCount: int,
  failureReason: Null.t<Error.t>,
  isPaused: bool,
  status: MutationStatus.t,
  variables: option<'variables>,
  submittedAt: int,
}

// Mutation configuration used in constructor
type config<'data, 'variables, 'context> = {
  mutationId: int,
  // mutationCache: MutationCache.t, // FIXME: dep cycle
  options: UseMutationOptions.t<unknown, 'variables, 'data, unknown, 'context>,
  state?: state<'data, 'variables, 'context>,
}

@tag("type")
type rec action =
  | @as("failed") Failed({failureCount: int, error: Null.t<Error.t>}): action
  | @as("pending") Pending({isPaused: bool, variables?: 'variables, context?: 'context}): action
  | @as("success") Success({data: 'data}): action
  | @as("error") Error({error: Error.t}): action
  | @as("pause") Pause: action
  | @as("continue") Continue: action

// Meta information for mutations
type meta

// Properties accessible on mutation instances
@get
external state: t<'data, 'variables, 'context> => state<'data, 'variables, 'context> = "state"

@get
external options: t<'data, 'variables, 'context> => UseMutationOptions.t<
  unknown,
  'variables,
  'data,
  unknown,
  'context,
> = "options"
@get external mutationId: t<'data, 'variables, 'context> => int = "mutationId"
@get external meta: t<'data, 'variables, 'context> => option<meta> = "meta"

// Methods for managing mutation options
@send
external setOptions: (
  t<'data, 'variables, 'context>,
  UseMutationOptions.t<unknown, 'variables, 'data, unknown, 'context>,
) => unit = "setOptions"

// Observer management methods
@send
external addObserver: (
  t<'data, 'variables, 'context>,
  MutationObserver.t<'data, 'variables, 'context>,
) => unit = "addObserver"

@send
external removeObserver: (
  t<'data, 'variables, 'context>,
  MutationObserver.t<'data, 'variables, 'context>,
) => unit = "removeObserver"

// Execution methods
@send external continue: t<'data, 'variables, 'context> => promise<unknown> = "continue"

@send
external execute: (t<'data, 'variables, 'context>, 'variables) => promise<'data> = "execute"

// Create default state for mutations
@module("@tanstack/react-query")
external getDefaultState: unit => state<'data, 'variables, 'context> = "getDefaultState"
