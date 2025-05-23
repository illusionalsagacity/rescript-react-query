type t<'data> = {
  data: 'data,
  dataUpdatedAt: int,
  error: unit, // FIXME: this is incorrect
  errorUpdateCount: int,
  failureReason: unit,
  fetchStatus: FetchStatus.t,
  isFetched: bool,
  isFetchedAfterMount: bool,
  isRefetchError: bool,
  isStale: bool,
}
