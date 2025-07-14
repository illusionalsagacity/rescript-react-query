open MSW

let postUrl = #URL("/api/posts")
let postByIdUrl = #URL("/api/posts/:id")

let handleGetPostById = Http.get(postByIdUrl, async ({params, _}) => {
  {
    id: params->Dict.get("id")->Option.getExn,
    title: "Hello World",
    description: "This is a sample post description.",
  }
  ->Post.encode
  ->HttpResponse.json({
    status: 200,
    statusText: "Ok",
  })
})

let handleCreatePostSuccess = Http.post(postUrl, async _options => {
  {
    id: "3",
    title: "Hello World",
    description: "This is a sample post description.",
  }
  ->Post.encode
  ->HttpResponse.json({
    status: 200,
    statusText: "Ok",
  })
})

let handleCreatePostError = Http.post(postUrl, async _options => {
  HttpResponse.error()
})

let handleGetPosts = Http.get(postUrl, async _options => {
  {
    posts: [
      {
        id: "1",
        title: "Hello World",
        description: "This is a sample post description.",
      },
      {
        id: "2",
        title: "Another Post",
        description: "This is another sample post description.",
      },
    ],
  }
  ->PostList.encode
  ->HttpResponse.json({
    status: 200,
    statusText: "Ok",
  })
})
