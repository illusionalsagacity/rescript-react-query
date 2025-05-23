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

let useGetPost = id =>
  ReactQuery.useQuery({
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
  let successDialogRef = React.useRef(Nullable.null)
  let errorDialogRef = React.useRef(Nullable.null)
  let {data: _, status: _mutationStatus, error: _, mutate, reset, _} = useCreatePost()

  let postQueryResult = useGetPost("hello")

  switch postQueryResult {
  | Pending(_) => Console.log("pending")
  | Success({data}) => Console.log(data)
  | Error({error}) => Console.error(error)
  }

  let {data: _suspenseData} = ReactQuery.useSuspenseQuery({
    queryKey: ("posts", "hello"),
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

  // switch queryResult {
  // | Pending(_) => Console.log("pending")
  // | Success({data}) => Console.log(data)
  // | Error({error}) => Console.error(error)
  // }

  let successDialog =
    <dialog ref={ReactDOM.Ref.domRef(successDialogRef)}>
      <h3> {React.string("Success")} </h3>
      <p> {React.string("Post created successfully!")} </p>
      <button
        onClick={_event => {
          reset()
          successDialogRef.current->Nullable.forEach(el => Obj.magic(el)["close"]())
        }}>
        {React.string("Close")}
      </button>
    </dialog>

  let errorDialog =
    <dialog ref={ReactDOM.Ref.domRef(errorDialogRef)}>
      <h3> {React.string("Error")} </h3>
      <p> {React.string("Post created failed!")} </p>
      <button
        onClick={_event => {
          reset()
          errorDialogRef.current->Nullable.forEach(el => Obj.magic(el)["close"]())
        }}>
        {React.string("Close")}
      </button>
    </dialog>

  <section>
    {successDialog}
    {errorDialog}
    <h2> {React.string("Hello")} </h2>
    <p> {React.string("World")} </p>
    <button
      onClick={_event =>
        mutate(
          Null,
          ~options={
            onSuccess: (_data, _variables, _context) => {
              successDialogRef.current->Nullable.forEach(el => Obj.magic(el)["showModal"]())
            },
            onError: (_err, _variables, _context) => {
              errorDialogRef.current->Nullable.forEach(el => Obj.magic(el)["showModal"]())
            },
          },
        )}>
      {React.string("Create Post")}
    </button>
  </section>
}
