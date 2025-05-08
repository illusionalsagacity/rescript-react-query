// Bindings for TanStack Query OnlineManager
// https://tanstack.com/query/latest/docs/reference/onlineManager

// Opaque type for the manager itself, though we only interact with the global instance
type t

@module("@tanstack/react-query") external onlineManager: t = "onlineManager"

// Type for the handler passed to setEventListener
type setOnline = bool => unit

// Type for the cleanup function returned by setEventListener's setup function
type cleanupFn = unit => unit

// Type for the setup function passed to setEventListener
type setupFn = setOnline => cleanupFn

@send external setEventListener: (t, setupFn) => unit = "setEventListener"

// Type for the callback passed to subscribe
type subscribeCallback = bool => unit

// Type for the unsubscribe function returned by subscribe
type unsubscribeFn = unit => unit

@send external subscribe: (t, subscribeCallback) => unsubscribeFn = "subscribe"

@send external setOnline: (t, bool) => unit = "setOnline"

@send external isOnline: t => bool = "isOnline"
