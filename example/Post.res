type t = {
  id: string,
  title: string,
  description?: string,
}

let decode = json => {
  open JSON
  let data = json->Decode.object->Option.getExn
  let id = data->Dict.get("id")->Option.flatMap(Decode.string)->Option.getExn
  let title = data->Dict.get("title")->Option.flatMap(Decode.string)->Option.getExn
  let description = data->Dict.get("description")->Option.flatMap(Decode.string)

  {id, title, ?description}
}

let encode = post => {
  open JSON

  [
    ("id", post.id->Encode.string),
    ("title", post.title->Encode.string),
    ("description", post.description->Option.mapOr(Encode.null, Encode.string)),
  ]
  ->Dict.fromArray
  ->Encode.object
}
