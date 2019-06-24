module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :sign_in, mutation: Mutations::Users::SignInUser
  end
end
