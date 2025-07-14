type renderProps = {
  reset: unit => unit,
}

@module("@tanstack/react-query")
@react.component
external make: (~children: React.element) => React.element = "QueryErrorResetBoundary"
