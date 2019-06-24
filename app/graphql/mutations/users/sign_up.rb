# frozen_string_literal: true

module Mutations
  module Users
    class SignUp < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::User

      def resolve(email: nil, password: nil)
        User.create!(
          email: email,
          password: password
        )
      end
    end
  end
end
