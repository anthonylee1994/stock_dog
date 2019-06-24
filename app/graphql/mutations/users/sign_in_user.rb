# frozen_string_literal: true

module Mutations
  module Users
    class SignInUser < BaseMutation
      null true

      argument :email, String, required: true
      argument :password, String, required: true

      field :token, String, null: true
      field :user, Types::User, null: true

      def resolve(email:, password:)
        return unless email

        user = User.find_by(email: email)
        return unless user
        return unless user.authenticate(password)

        token = AuthService.crypter.encrypt_and_sign("user-id:#{user.id}")

        { user: user, token: token }
      end
    end
  end
end
