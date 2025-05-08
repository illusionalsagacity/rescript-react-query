// Bindings for TanStack Query NotifyManager
// https://tanstack.com/query/latest/docs/reference/notifyManager

// Opaque type for the manager itself, though we only interact with the global instance
type t

@module("@tanstack/react-query") external notifyManager: t = "notifyManager"

// Type for a generic callback
type callback<'a> = unit => 'a

// Type for a function that takes a callback
type fnTakingCallback = callback<unit> => unit

// Type for a function that takes arguments and returns unit
// Using a simple single argument function type for batchCalls for now.
// For multi-arg functions, Js.Fn.arityN might be needed.
type batchCallsCallback<'a> = 'a => unit

@send external batch: (t, callback<'a>) => 'a = "batch"

// Simplified binding for batchCalls, assuming a single-argument function.
// Adjust if multi-argument functions are common.
@send
external batchCalls: (t, batchCallsCallback<'a>) => batchCallsCallback<'a> = "batchCalls"

@send external schedule: (t, callback<unit>) => unit = "schedule"

@send external setNotifyFunction: (t, fnTakingCallback) => unit = "setNotifyFunction"

@send external setBatchNotifyFunction: (t, fnTakingCallback) => unit = "setBatchNotifyFunction"

@send external setScheduler: (t, fnTakingCallback => unit) => unit = "setScheduler"
