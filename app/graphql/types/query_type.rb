module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :current_user, Types::User, null: true

    def current_user
      context[:current_user]
    end
  end
end
