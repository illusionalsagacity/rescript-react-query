type buttonPosition =
  | @as("top-left") TopLeft
  | @as("top-right") TopRight
  | @as("bottom-left") BottomLeft
  | @as("bottom-right") BottomRight
  | @as("relative") Relative

type position =
  | @as("top") Top
  | @as("bottom") Bottom
  | @as("left") Left
  | @as("right") Right

module ErrorType = {
  type t
  type config<'key, 'data, 'meta> = {
    name: string,
    initializer: Query.t<'key, 'data, 'meta> => Error.t,
  }

  external cast: config<'key, 'data, 'meta> => t = "%identity"
}

type props<'query> = {
  initialIsOpen?: bool,
  buttonPosition?: buttonPosition,
  position?: position,
  client?: QueryClient.t,
  errorTypes?: array<ErrorType.t>,
  styleNonce?: string,
  shadowDOMTarget?: Dom.element,
}

@module("@tanstack/react-query-devtools")
external make: React.component<props<'query>> = "ReactQueryDevtools"
