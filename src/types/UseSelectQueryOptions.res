type t<'slice, 'key, 'data, 'meta> = {
  ...UseQueryOptions.t<'key, 'data, 'meta>,
  select: 'data => 'slice,
}