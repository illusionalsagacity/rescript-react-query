
type queryObserver<'data, 'error, 'queryKey, 'queryData>
type action<'data>

@tag("type")
type rec t =
  | @as("added") Added({query: Query.t<'data, 'error, 'queryKey>}): t
  | @as("removed") Removed({query: Query.t<'data, 'error, 'queryKey>}): t
  | @as("updated")
    Updated({
      query: Query.t<'data, 'error, 'queryKey>,
      action: action<'data>,
    }): t
  | @as("observerAdded")
    ObserverAdded({
      query: Query.t<'data, 'error, 'queryKey>,
      observer: queryObserver<'data, 'error, 'queryKey, 'queryData>,
    }): t
  | @as("observerRemoved")
    ObserverRemoved({
      query: Query.t<'data, 'error, 'queryKey>,
      observer: queryObserver<'data, 'error, 'queryKey, 'queryData>,
    }): t
  | @as("observerResultsUpdated")
    ObserverResultsUpdated({query: Query.t<'data, 'error, 'queryKey>}): t
  | @as("observerOptionsUpdated")
    ObserverOptionsUpdated({
      query: Query.t<'data, 'error, 'queryKey>,
      observer: queryObserver<'data, 'error, 'queryKey, 'queryData>,
    }): t