class Resolvers::CreateLink < GraphQL::Function
  argument :description, !types.String
  argument :url, !types.String

  type Types::LinkType

  def call(_obj, args, _ctx)
    Link.create!(
      description: args[:description],
      url: args[:url],
    )
  end
end