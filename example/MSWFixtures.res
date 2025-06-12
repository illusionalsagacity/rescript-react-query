open MSW

let handleGetPostById = Http.get(#URL("/api/posts/:id"), async ({params, _}) => {
  HttpResponse.json(
    Post.encode({
      id: params->Dict.get("id")->Option.getExn,
      title: "Hello World",
      description: "This is a sample post description.",
    }),
    {
      status: 200,
      statusText: "Ok",
    },
  )
})

let handleCreatePostSuccess = Http.post(#URL("/api/posts"), async _options => {
  HttpResponse.json(
    Post.encode({
      id: "3",
      title: "Hello World",
      description: "This is a sample post description.",
    }),
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
    {
      "posts": [
        Post.encode({
          id: "1",
          title: "Hello World",
          description: "This is a sample post description.",
        }),
        Post.encode({
          id: "2",
          title: "Another Post",
          description: "This is another sample post description.",
        }),
      ],
    },
    {
      status: 200,
      statusText: "Ok",
    },
  )
})
