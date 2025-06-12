type context = { previousData: option<JSON.t> }

let useCreatePost = (
  options: UseMutationOptions.baseOptions<(string, string), JSON.t, Post.t, unit, context>,
) => {
  ReactQuery.useMutation({
    onError: ?options.onError,
    onSettled: ?options.onSettled,
    onSuccess: ?options.onSuccess,
    onMutate: ?options.onMutate,
    retry: ?options.retry,
    retryDelay: ?options.retryDelay,
    throwOnError: ?options.throwOnError,
    gcTime: ?options.gcTime,
    networkMode: ?options.networkMode,
    meta: ?options.meta,
    scope: ?options.scope,
    mutationKey: ("posts", "all"),
    mutationFn: async (payload, _) => {
      let response = await Fetch.fetch(
        `/api/posts`,
        {method: #POST, body: payload->JSON.stringify->Fetch.Body.string},
      )
      if !Fetch.Response.ok(response) {
        panic("http error code")
      }

      switch await Fetch.Response.json(response) {
      | parsed =>
        try Post.decode(parsed) catch {
        | _e => panic("aaaaaa")
        }
      | exception _e => panic("aaaaaa")
      }
    },
  })
}

let useGetPost = id =>
  ReactQuery.useQuery({
    queryKey: ("posts", id),
    queryFn: async ({queryKey: (_, id), _}) => {
      switch id {
      | Some(id) => {
          let response = await Fetch.fetch(`/api/posts/${id}`, {method: #GET})
          if !Fetch.Response.ok(response) {
            panic("http error code")
          }

          switch await Fetch.Response.json(response) {
          | parsed =>
            try Post.decode(parsed) catch {
            | _e => panic("aaaaaa")
            }
          | exception _e => panic("aaaaaa")
          }
        }

      | None => SkipToken.skipToken
      }
    },
    enabled: id->Option.isSome->Enabled.fromBool,
  })

let useGetPostSuspense = id => {
  ReactQuery.useSuspenseQuery({
    queryKey: ("posts", id),
    queryFn: async ({queryKey: (_, id), _}) => {
      let response = await Fetch.fetch(`/api/posts/${id}`, {method: #GET})
      if !Fetch.Response.ok(response) {
        panic("http error code")
      }

      switch await Fetch.Response.json(response) {
      | parsed =>
        try Post.decode(parsed) catch {
        | _e => panic("aaaaaa")
        }
      | exception _e => panic("aaaaaa")
      }
    },
  })
}
