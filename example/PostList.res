type t = {posts: array<Post.t>}

let decode = json => {
  open JSON
  switch json {
  | Object(data) =>
    let posts = data->Dict.get("posts")->Option.getExn

    switch posts {
    | Array(array) => {
        posts: array->Array.map(Post.decode),
      }
    | _ => panic("Invalid JSON format for PostList.posts")
    }
  | _ => panic("Invalid JSON format for PostList")
  }
}

let encode = postList => {
  open JSON
  [("posts", postList.posts->Array.map(Post.encode)->Encode.array)]
  ->Dict.fromArray
  ->Encode.object
}
