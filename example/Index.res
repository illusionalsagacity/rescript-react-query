@send external unsafe_querySelector: (Dom.document, string) => Dom.element = "querySelector"

let queryCache = QueryCache.make()
let mutationCache = MutationCache.make()

let client = QueryClient.make(
  ~config={
    mutationCache,
    queryCache,
    defaultOptions: {
      queries: {
        retry: Fn(
          (attempt, error) => {
            Console.error(`Error: ${error->Error.message->Option.getOr("Unknown error")}`)
            Console.log(`Retrying query, attempt: ${attempt->Int.toString}`)
            attempt < 3
          },
        ),
      },
      mutations: {
        retry: False,
      },
    },
  },
)

let ready = {
  open MSW
  let sw = setupWorker()
  sw->ServiceWorker.useMany([
    MSWFixtures.handleGetPostById,
    MSWFixtures.handleCreatePostSuccess,
    MSWFixtures.handleCreatePostError,
    MSWFixtures.handleGetPosts,
  ])

  await ServiceWorker.startWithOptions(sw, {onUnhandledRequest: #warn})
}

let root = document->unsafe_querySelector("#react-root")->ReactDOM.Client.createRoot

root->ReactDOM.Client.Root.render(
  <React.StrictMode>
    <QueryClientProvider client>
      <React.Suspense fallback={<div> {React.string("Loading...")} </div>}>
        <QueryResetErrorBoundary>
            <RescriptReactErrorBoundary
              fallback={_ => <div>
                {React.string("Error occurred!")}
                <button> {React.string("Reset")} </button>
              </div>}>
              <Example />
            </RescriptReactErrorBoundary>
        </QueryResetErrorBoundary>
      </React.Suspense>
      <ReactQueryDevtools />
    </QueryClientProvider>
  </React.StrictMode>,
)
