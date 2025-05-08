type t<'key, 'data, 'meta> = {
  ...Query.options<'key, 'data, 'meta>,
  refetchInterval?: RefetchInterval.t<'key, 'data, 'meta>,
  refetchIntervalInBackground?: bool,
  refetchOnMount?: Refetch.t<'key, 'data, 'meta>,
  refetchOnWindowFocus?: Refetch.t<'key, 'data, 'meta>,
  refetchOnReconnect?: Refetch.t<'key, 'data, 'meta>,
  notifyOnPropsChange?: Notify.t<'key, 'data, 'meta>,  
  // placeholderData?: (option<'data>, option<Query.t<'key, 'data, 'meta>>) => 'data,
  // structuralSharing?: unknown, // TODO
  // select
} 