require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:organisation) }
  it { is_expected.to validate_presence_of(:organisation) }
end
