require 'rails_helper'

RSpec.describe 'Rooms API', type: :request do
  let(:user) { create(:user) }
  let!(:rooms) { create_list(:room, 10, created_by: user.id) }
  let(:room_id) { rooms.first.id }
  let(:headers) { valid_headers }

  describe 'GET /rooms' do

    before { get '/rooms', params: {}, headers: headers }

    it 'returns rooms' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /rooms' do
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/rooms', params: valid_attributes, headers: headers }

      it 'creates a room' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/rooms', params: { title: 'Foobar' }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  describe 'PUT /rooms/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/rooms/#{room_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /rooms/:id' do
    before { delete "/rooms/#{room_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
