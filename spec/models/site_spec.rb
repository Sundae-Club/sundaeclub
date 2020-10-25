require 'rails_helper'

RSpec.describe Site, type: :model do
  it { is_expected.to belong_to(:organisation) }
end
