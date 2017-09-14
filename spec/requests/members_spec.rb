require 'rails_helper'

RSpec.describe 'Members API' do
  let(:user) { create(:user) }
  let!(:room) { create(:room, created_by: user.id) }
  let!(:members) { create_list(:member, 20, room_id: room.id) }
  let(:room_id) { room.id }
  let(:id) { members.first.id }
  let(:headers) { valid_headers }

  describe 'GET /rooms/:room_id/members' do
    before { get "/rooms/#{room_id}/members", params: {}, headers: headers }

    context 'when room exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all room members' do
        expect(json.size).to eq(20)
      end
    end

    context 'when room does not exist' do
      let(:room_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

  describe 'GET /rooms/:room_id/members/:id' do
    before { get "/rooms/#{room_id}/members/#{id}", params: {}, headers: headers }

    context 'when room member exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the member' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when room member does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Member/)
      end
    end
  end

  describe 'POST /rooms/:room_id/members' do
    let(:valid_attributes) { { name: 'Visit Narnia', order: 1 } }

    context 'when request attributes are valid' do
      before { post "/rooms/#{room_id}/members", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/rooms/#{room_id}/members", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /rooms/:room_id/members/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/rooms/#{room_id}/members/#{id}", params: valid_attributes, headers: headers }

    context 'when member exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the member' do
        updated_member = Member.find(id)
        expect(updated_member.name).to match(/Mozart/)
      end
    end

    context 'when the member does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Member/)
      end
    end
  end

  describe 'DELETE /rooms/:id' do
    before { delete "/rooms/#{room_id}/members/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
