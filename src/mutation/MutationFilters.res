
type t_withoutKey<'data> = {
  exact?: bool,
  status?: MutationStatus.t,
}

type t_optionalKey<'key, 'data> = {
  ...t_withoutKey<'data>,
  mutationKey?: 'key,
  predicate?: Mutation.t => bool,
}

type t_requiredKey<'key, 'data> = {
  ...t_withoutKey<'data>,
  mutationKey: 'key,
  predicate?: Mutation.t => bool,
}