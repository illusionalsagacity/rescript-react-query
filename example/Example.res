open Hooks

let showModal = ref => {
  ref.React.current->Nullable.forEach(el => Obj.magic(el)["showModal"]())
}

@react.component
let make = () => {
  let successDialogRef = React.useRef(Nullable.null)
  let errorDialogRef = React.useRef(Nullable.null)
  let {data: _, status: _mutationStatus, error: _, mutate, reset, _} = useCreatePost({
    onError: (error, _variables, _context) => {
      Console.error(error)
      showModal(errorDialogRef)
    },
    onSuccess: (_data, _variables, _context) => {
      Console.log("Post created successfully!")
      showModal(successDialogRef)
    },
  })

  let postQueryResult = useGetPost(Some("hello"))

  switch postQueryResult {
  | Pending(_) => Console.log("pending")
  | Success({data}) => Console.log(data)
  | Error({error}) => Console.error(error)
  }

  let suspenseResult = useGetPostSuspense("1")

  let closeDialog = ref => {
    ref.React.current->Nullable.forEach(el => Obj.magic(el)["close"]())
  }

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
      <h2> {React.string("Hello")} </h2>
      <p> {React.string("World")} </p>
      <pre> {JSON.stringify(data)->React.string} </pre>
      <button onClick={_event => mutate(Null)}> {React.string("Create Post")} </button>
    </section>
  | Error({error, _}) =>
    <section>
      {successDialog}
      {errorDialog}
      <h2> {React.string("Error")} </h2>
      <p>
        {switch error->Error.message {
        | None => React.string("An error occurred")
        | Some(message) => React.string(message)
        }}
      </p>
    </section>
  }
}
