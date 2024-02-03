require "rails_helper"

RSpec.describe Player, type: :model do 
  describe '#method_name' do
    it {should belong_to (:team)}
  end
end