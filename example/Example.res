open Hooks

let showModal = ref => {
  ref.React.current->Nullable.forEach(el => Obj.magic(el)["showModal"]())
}

let closeDialog = ref => {
  ref.React.current->Nullable.forEach(el => Obj.magic(el)["close"]())
}

let postsQueryKey = ("posts", "all")

@react.component
let make = () => {
  let successDialogRef = React.useRef(Nullable.null)
  let errorDialogRef = React.useRef(Nullable.null)
  let queryClient = ReactQuery.useQueryClient()
  let {data: _, status: _mutationStatus, error: _, mutate, reset, _} = useCreatePost({
    onMutate: variables => {
      QueryClient.cancelQueries(queryClient, ~filters={queryKey: postsQueryKey})->ignore
      let previousData = QueryClient.getQueryData(queryClient, postsQueryKey)

      let _ = queryClient->QueryClient.setQueryData(
        postsQueryKey,
        #Fn(
          previousData =>
            switch previousData {
            | None
            | Some([]) =>
              [variables]->Some
            | Some(previousData) => [...previousData, variables]->Some
            },
        ),
      )

      {
        previousData: previousData,
      }
    },
    onSettled: (_data, _error, _variables, _context) =>
      queryClient->QueryClient.invalidateQueries(
        ~filters={
          queryKey: postsQueryKey,
        },
      ),
    onError: async (error, _variables, context) => {
      Console.error(error)
      showModal(errorDialogRef)
      switch context {
      | Some({previousData: Some(previousData)}) => {
          let _ = QueryClient.setQueryData(queryClient, postsQueryKey, #Data(previousData))
        }
      | _ => Console.log("No previous data to restore")
      }
    },
    onSuccess: async (_data, _variables, _context) => {
      Console.log("Post created successfully!")
      showModal(successDialogRef)
    },
  })

  let postQueryResult = useGetPost(None)

  switch postQueryResult {
  | Pending(_) => Console.log("pending")
  | Success({data}) => Console.log(data)
  | Error({error}) => Console.error(error)
  }

  let suspenseResult = useGetPostSuspense("1")

  let successDialog =
    <Dialog dialogRef=successDialogRef title="Success" subtitle="Post created successfully!">
      <button
        onClick={_event => {
          reset()
          closeDialog(successDialogRef)
        }}>
        {React.string("Close")}
      </button>
    </Dialog>

  let errorDialog =
    <Dialog dialogRef={errorDialogRef} title="Error" subtitle="Post creation failed!">
      <button
        onClick={_event => {
          reset()
          closeDialog(errorDialogRef)
        }}>
        {React.string("Close")}
      </button>
    </Dialog>

  switch suspenseResult {
  | Success({data, _}) =>
    <section>
      {successDialog}
      {errorDialog}
      <h2> {React.string(data.Post.title)} </h2>
      <p> {data.description->Option.mapOr(React.null, React.string)} </p>
      <button onClick={_event => {Post.id: "-1", title: "another one"}->Post.encode->mutate}>
        {React.string("Create Post")}
      </button>
    </section>
  | Error({error, _}) => {
      let errorMessage = error->Error.message->Option.getOr("An error occurred")->React.string

      <section>
        {successDialog}
        {errorDialog}
        <h2> {React.string("Error")} </h2>
        <p> {errorMessage} </p>
      </section>
    }
  }
}
