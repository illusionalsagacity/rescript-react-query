type props = {
  style?: ReactDOM.Style.t,
  onClose?: unit => unit,
  client?: QueryClient.t,
  errorTypes?: array<ReactQueryDevtools.ErrorType.t>,
  styleNonce?: string,
  shadowDOMTarget?: Dom.element,
}

@module("@tanstack/react-query-devtools")
external make: React.component<props> = "ReactQueryDevtoolsPanel"
