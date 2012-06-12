require 'test_helper'

class RecentCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
