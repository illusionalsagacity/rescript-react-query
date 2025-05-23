type props = {
  queryClient: QueryClient.t,
  children: React.element,
}

@module("@tanstack/react-query") external make: React.component<props> = "QueryClientProvider"