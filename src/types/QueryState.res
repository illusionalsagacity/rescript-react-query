type t<'data> = {
  data: option<'data>,
  dataUpdateCount: int,
  dataUpdatedAt: float,
  error: option<Error.t>,
  errorUpdateCount: int,
  errorUpdatedAt: float,
  fetchFailureCount: int,
  fetchFailureReason: option<Error.t>,
  fetchMeta: option<FetchMeta.t>,
  isInvalidated: bool,
  status: QueryStatus.t,
  fetchStatus: FetchStatus.t,
}
