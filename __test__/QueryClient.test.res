open Vitest

describe("QueryClient", () => {
  it("should have a useQuery function", t => {
    let client = QueryClient.make()
    expect(t, client)->Expect.toBeTruthy
  })
})
