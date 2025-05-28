type t<'key, 'data, 'select, 'variables, 'context> = {
  filters?: MutationFilters.t_optionalKey<'key, 'data, 'variables, 'context>,
  select?: Mutation.t<'data, 'variables, 'context> => 'select,
}