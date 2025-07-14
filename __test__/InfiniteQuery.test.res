open Vitest
open ReactQuery

// Dummy fetch function for testing
let fetchPage = (~pageParam: int, ()) => {
  Js.Promise.resolve({
    pages: [pageParam],
    pageParams: [pageParam],
  }: PaginatedData.t<int, int>)
}

describe("useInfiniteQuery", () => {
  it("should return helpers and correct types", t => {
    let options: UseInfiniteQueryOptions.t<array<string>, PaginatedData.t<int, int>, unit, int> = {
      queryKey: ["test"],
      queryFn: _ctx => fetchPage(~pageParam=0, ()),
      getNextPageParam: (lastPage, _allPages, _lastPageParam, _allPageParams) =>
        switch Belt.Array.get(lastPage.pages, 0) {
        | Some(p) => Some(p + 1)
        | None => Some(1)
        },
      initialPageParam: 0,
    }
    let result = useInfiniteQuery(options)
    expect(t, result.fetchNextPage)->Expect.toBeTruthy
    expect(t, result.fetchPreviousPage)->Expect.toBeTruthy
    expect(t, result.hasNextPage)->Expect.toBeTruthy
    expect(t, result.data)->Expect.toBeTruthy
  })
})
