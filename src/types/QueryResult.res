// open UtilityTypes

@tag("status")
type t<'data> =
  | @as("pending")
  Pending({
      data: unit,
      dataUpdatedAt: int,
      errorUpdateCount: int,
      failureCount: int,
      failureReason: Null.t<Error.t>,
      fetchStatus: FetchStatus.t,
      isFetched: bool,
      isFetchedAfterMount: bool,
      isPlaceholderData: bool,
      isRefetchError: bool,
      isStale: bool,
    })
  | @as("success")
  Success({
      data: 'data,
      dataUpdatedAt: int,
      error: unit,
      errorUpdateCount: int,
      failureReason: unit,
      fetchStatus: FetchStatus.t,
      isFetched: bool,
      isFetchedAfterMount: bool,
      isPlaceholderData: bool,
      isRefetchError: bool,
      isStale: bool,
    })
  | @as("error")
  Error({
      data: Nullable.t<'data>,
      dataUpdatedAt: int,
      error: Error.t,
      errorUpdateCount: int,
      failureCount: int,
      failureReason: Null.t<Error.t>,
      fetchStatus: FetchStatus.t,
      isFetched: bool,
      isFetchedAfterMount: bool,
      isPlaceholderData: bool,
      isRefetchError: bool,
      isStale: bool,
    })

