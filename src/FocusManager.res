// Bindings for TanStack Query FocusManager
// https://tanstack.com/query/latest/docs/reference/focusManager

// Opaque type for the manager itself, though we only interact with the global instance
type t

@module("@tanstack/react-query") external focusManager: t = "focusManager"

// Type for the handler passed to setEventListener
type handleFocus = unit => unit

// Type for the cleanup function returned by setEventListener's setup function
type cleanupFn = unit => unit

// Type for the setup function passed to setEventListener
type setupFn = handleFocus => cleanupFn

@send external setEventListener: (t, setupFn) => unit = "setEventListener"

// Type for the callback passed to subscribe
type subscribeCallback = bool => unit

// Type for the unsubscribe function returned by subscribe
type unsubscribeFn = unit => unit

@send external subscribe: (t, subscribeCallback) => unsubscribeFn = "subscribe"

@send external setFocused: (t, option<bool>) => unit = "setFocused"

@send external isFocused: t => bool = "isFocused"
