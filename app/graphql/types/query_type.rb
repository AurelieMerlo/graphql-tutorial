Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :allLinks, !types[Types::LinkType] do
    resolve -> (obj, args, ctx) { Link.all }
  end
end