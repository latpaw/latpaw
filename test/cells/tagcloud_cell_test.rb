require 'test_helper'

class TagcloudCellTest < Cell::TestCase
  test "tagcloud" do
    invoke :tagcloud
    assert_select "p"
  end
  

end
