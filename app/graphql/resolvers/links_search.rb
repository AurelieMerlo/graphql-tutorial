require 'search_object/plugin/graphql'

class Resolvers::LinksSearch
  
  include SearchObject.module(:graphql)

  scope { Link.all }

  type !types[Types::LinkType]

  LinkFilter = GraphQL::InputObjectType.define do
    name 'LinkFilter'

    argument :OR, -> { types[LinkFilter] }
    argument :description_contains, types.String
    argument :url_contains, types.String
  end

  option :filter, type: LinkFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Link.all
    scope = scope.where('description LIKE ?', "%#{value['description_contains']}%") if value['description_contains']
    scope = scope.where('url LIKE ?', "%#{value['url_contains']}%") if value['url_contains']

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end