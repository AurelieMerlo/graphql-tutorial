class Resolvers::DestroyLink < GraphQL::Function
  argument :linkId, types.ID

  type Types::LinkType

  def call(_obj, args, ctx)
    link = Link.find_by(id: args[:linkId])

    link.destroy

    link
  end
end