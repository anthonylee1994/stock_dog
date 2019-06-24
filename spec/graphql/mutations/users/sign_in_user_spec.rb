# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Users
    RSpec.describe SignInUser, type: :request do
      before do
        User.destroy_all
      end

      let(:user) { User.create(email: 'hososlch@gmail.com', password: '12345678') }

      describe '.resolve' do
        it 'should login' do
          post '/graphql', params: { query: query(email: user.email, password: '12345678') }
          json_body = JSON.parse(response.body)
          expect(json_body['data']['signIn']['token']).not_to eq nil
          expect(json_body['data']['signIn']['user']['email']).not_to eq nil
        end
      end

      def query(email:, password:)
        <<~GQL
          mutation {
            signIn(
              email: "#{email}"
              password: "#{password}"
            ) {
              token
              user {
                id
                email
              }
            }
          }
        GQL
      end
    end
  end
end
