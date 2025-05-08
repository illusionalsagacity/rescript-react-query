type t<'data> = {
  data: 'data,
  dataUpdatedAt: int,
  error: unit,
  errorUpdateCount: int,
  failureReason: unit,
  fetchStatus: FetchStatus.t,
  isFetched: bool,
  isFetchedAfterMount: bool,
  isRefetchError: bool,
  isStale: bool,
}
