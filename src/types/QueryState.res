type t<'data, 'error> = {
  data: option<'data>,
  dataUpdateCount: int,
  dataUpdatedAt: float,
  error: option<'error>,
  errorUpdateCount: int,
  errorUpdatedAt: float,
  fetchFailureCount: int,
  fetchFailureReason: option<'error>,
  fetchMeta: option<FetchMeta.t>,
  isInvalidated: bool,
  status: QueryStatus.t,
  fetchStatus: FetchStatus.t,
}

// // Note: You'll need to define these types separately
// and fetchMeta = {
//   // Define FetchMeta structure here
// }
