open MSW

let handleGetPostById = Http.get(#URL("/api/posts/:id"), async ({params, _}) => {
  HttpResponse.jsonObj(
    {"id": params->Dict.getUnsafe("id")},
    {
      status: 200,
      statusText: "Ok",
    },
  )
})

let handleCreatePostSuccess = Http.post(#URL("/api/posts"), async _options => {
  HttpResponse.jsonObj(
    {"id": "-1"},
    {
      status: 200,
      statusText: "Ok",
    },
  )
})
let handleCreatePostError = Http.post(#URL("/api/posts"), async _options => {
  HttpResponse.error()
})

let handleGetPosts = Http.get(#URL("/api/posts"), async _options => {
  HttpResponse.jsonObj(
    {"posts": []},
    {
      status: 200,
      statusText: "Ok",
    },
  )
})
