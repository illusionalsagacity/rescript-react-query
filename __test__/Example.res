let useCreatePost = () => {
  ReactQuery.useMutation({
    mutationKey: ("one", "two"),
    mutationFn: async (payload, _) => {
      let response = await Fetch.fetch(
        `/api/posts`,
        {method: #POST, body: payload->JSON.stringify->Fetch.Body.string},
      )
      if !Fetch.Response.ok(response) {
        panic("http error code")
      }

      switch await Fetch.Response.json(response) {
      | parsed => parsed
      | exception _e => panic("aaaaaa")
      }
    },
  })
}

let useGetPost = (id) => ReactQuery.useQuery({
    queryKey: ("posts", id),
    queryFn: async ({queryKey: (_, id), _}) => {
      let response = await Fetch.fetch(`/api/posts/${id}`, {method: #POST})
      if !Fetch.Response.ok(response) {
        panic("http error code")
      }

      switch await Fetch.Response.json(response) {
      | parsed => parsed
      | exception _e => panic("aaaaaa")
      }
    },
  })

@react.component
let make = () => {
  let {data, status, error, _} = useCreatePost()

  let queryResult = useGetPost()

  switch queryResult {
  | Pending(_) => Console.log("pending")
  | Success({data}) => Console.log(data)
  | Error({error}) => Console.error(error)
  }
}
