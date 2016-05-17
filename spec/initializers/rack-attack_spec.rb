require 'rails_helper'

describe Rack::Attack do
  include Rack::Test::Methods

  def app
    Rails.application
  end

  describe 'throttle excessive requests by IP address' do
    let(:limit) { 20 }

    context 'number of requests is lower than the limit' do
      it 'does not change the request status' do
        limit.times do
          get '/', {}, 'REMOTE_ADDR' => '1.2.3.4'

          expect(last_response.status).to_not eq(429)
        end
      end
    end

    context 'number of requests is higher than the limit' do
      it 'changes the request status to 429' do
        (limit * 2).times do |i|
          get '/', {}, 'REMOTE_ADDR' => '1.2.3.5'

          expect(last_response.status).to eq(429) if i > limit
        end
      end
    end

    describe 'throttle excessive POST requests to admin sign in by IP address' do
      let(:limit) { 5 }

      context 'number of requests is lower than the limit' do
        it 'does not change the request status' do
          limit.times do |i|
            post '/v1/auth/sign_in', { email: "example1#{i}@gmail.com" }, 'REMOTE_ADDR' => '1.2.3.6'

            expect(last_response.status).to_not eq(429)
          end
        end
      end

      context 'number of admin requests is higher than the limit' do
        it 'changes the request status to 429' do
          (limit * 2).times do |i|
            post '/v1/auth/sign_in', { email: "example2#{i}@gmail.com" }, 'REMOTE_ADDR' => '1.2.3.8'
            expect(last_response.status).to eq(429) if i > limit
          end
        end
      end
    end

    describe 'throttle excessive POST requests to admin sign in by email address' do
      let(:limit) { 5 }
      context 'number of requests is lower than the limit' do
        it 'does not change the request status' do
          limit.times do |i|
            post '/v1/auth/sign_in', { email: 'example5@gmail.com' }, 'REMOTE_ADDR' => "#{i}.2.4.9"
            expect(last_response.status).to_not eq(429)
          end
        end
      end

      context 'number of requests is higher than the limit' do
        it 'changes the request status to 429' do
          (limit * 2).times do |i|
            post '/v1/auth/sign_in', { email: 'example6@gmail.com' }, 'REMOTE_ADDR' => "#{i}.2.5.9"
            expect(last_response.status).to eq(429) if i > limit
          end
        end
      end
    end

    describe 'throttle excessive POST requests to user sign in by email address' do
      let(:limit) { 5 }

      context 'number of requests is lower than the limit' do
        it 'does not change the request status' do
          limit.times do |i|
            post '/v1/auth/sign_in', { email: 'example7@gmail.com' }, 'REMOTE_ADDR' => "#{i}.2.6.9"
            expect(last_response.status).to_not eq(429)
          end
        end
      end

      context 'number of requests is higher than the limit' do
        it 'changes the request status to 429' do
          (limit * 2).times do |i|
            post '/v1/auth/sign_in', { email: 'example8@gmail.com' }, 'REMOTE_ADDR' => "#{i}.2.7.9"
            expect(last_response.status).to eq(429) if i > limit
          end
        end
      end
    end
  end
end
