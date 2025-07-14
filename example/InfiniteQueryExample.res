open ReactQuery

// Example usage of useInfiniteQuery
let fetchPage = (~pageParam: int, ()) => {
  Js.Promise.resolve(
    (
      {
        pages: [pageParam],
        pageParams: [pageParam],
      }: PaginatedData.t<int, int>
    ),
  )
}

@react.component
let make = () => {
  let options: UseInfiniteQueryOptions.t<array<string>, PaginatedData.t<int, int>, unit, int> = {
    queryKey: ["example-infinite"],
    queryFn: _ctx => fetchPage(~pageParam=0, ()),
    getNextPageParam: (lastPage, _allPages, _lastPageParam, _allPageParams) =>
      switch lastPage.pages[0] {
      | Some(p) => Some(p + 1)
      | None => Some(1)
      },
    initialPageParam: 0,
  }
  let result = useInfiniteQuery(options)

  let pages =
    result.data.pages
    ->Array.flatMap(page => page.pages)
    ->Array.map(page => Int.toString(page))
    ->Array.join(", ")

  <div>
    <div> {React.string("Pages: " ++ pages)} </div>
    <button onClick={_ => result.fetchNextPage(~options={})->ignore} disabled={!result.hasNextPage}>
      {React.string("Fetch Next Page")}
    </button>
    <button
      onClick={_ => result.fetchPreviousPage(~options={})->ignore}
      disabled={!result.hasPreviousPage}>
      {React.string("Fetch Previous Page")}
    </button>
  </div>
}
