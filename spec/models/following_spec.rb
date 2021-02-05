# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Assosations' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end
end
