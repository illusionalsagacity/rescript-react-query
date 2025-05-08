type t<'key, 'data, 'select> = {
  filters?: MutationFilters.t_optionalKey<'key, 'data>,
  select?: Mutation.t => 'select,
}