require 'rails_helper'

RSpec.describe Channel, type: :model do
  it { is_expected.to belong_to(:site) }
  it { is_expected.to validate_presence_of(:site) }
end
