Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createLink, function: Resolvers::CreateLink.new
  field :createUser, function: Resolvers::CreateUser.new
  field :createVote, function: Resolvers::CreateVote.new
  field :signinUser, function: Resolvers::SignInUser.new
  field :UpdateLinkDescription, function: Resolvers::UpdateLinkDescription.new
end