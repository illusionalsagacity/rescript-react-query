@send external unsafe_querySelector: (Dom.document, string) => Dom.element = "querySelector"

let queryCache = QueryCache.make()
let mutationCache = MutationCache.make()

let client = QueryClient.make(~config={
  mutationCache,
  queryCache,
  defaultOptions: {
    queries: {
      retry: Fn((attempt, _error) => attempt < 3),
    },
    mutations: {
      retry: False,
    },
  },
})

{
  open MSW
  let sw = setupWorker()
  // FIXME: this is a promise
  // FIXME: ServiceWorker.options is missing 'scope'
  ServiceWorker.startWithOptions(sw, {waitUntilReady: true})
  sw->ServiceWorker.useMany([
    MSWFixtures.handleGetPostById,
    // MSWFixtures.handleCreatePostSuccess,
    MSWFixtures.handleCreatePostError,
    MSWFixtures.handleGetPosts,
  ])
}

let root = document->unsafe_querySelector("#react-root")->ReactDOM.Client.createRoot

root->ReactDOM.Client.Root.render(
  <React.StrictMode>
    <QueryClientProvider client>
      <React.Suspense fallback={<div> {React.string("Loading...")} </div>}>
        <Example />
        <ReactQueryDevtools />
      </React.Suspense>
    </QueryClientProvider>
  </React.StrictMode>,
)
