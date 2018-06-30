class Resolvers::UpdateLinkDescription < GraphQL::Function
  argument :description, !types.String
  argument :linkId, types.ID

  type Types::LinkType

  def call(_obj, args, ctx)
    link = Link.find_by(id: args[:linkId])
    link.description = args[:description]

    link.save!

    link
  end
end