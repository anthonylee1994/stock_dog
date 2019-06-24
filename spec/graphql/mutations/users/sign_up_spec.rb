require 'rails_helper'

module Mutations
  module Users
    RSpec.describe SignUp, type: :request do

      describe '.resolve' do
        it 'creates a user' do
          post '/graphql', params: { query: query(email: 'hososlch@gmail.com', password: '12345678') }
          json_body = JSON.parse(response.body)
          expect(json_body['data']['signUp']['email']).not_to eq nil
        end
      end

      def query(email:, password:)
        <<~GQL
          mutation {
            signUp(
              email: "#{email}"
              password: "#{password}"
            ) {
              id
              email
            }
          }
        GQL
      end
    end

  end
end
