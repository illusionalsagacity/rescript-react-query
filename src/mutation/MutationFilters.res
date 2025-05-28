
type t_withoutKey<'data> = {
  exact?: bool,
  status?: MutationStatus.t,
}

type t_optionalKey<'key, 'data, 'variables, 'context> = {
  ...t_withoutKey<'data>,
  mutationKey?: 'key,
  predicate?: Mutation.t<'data, 'variables, 'context> => bool,
}

type t_requiredKey<'key, 'data, 'variables, 'context> = {
  ...t_withoutKey<'data>,
  mutationKey: 'key,
  predicate?: Mutation.t<'data, 'variables, 'context> => bool,
}