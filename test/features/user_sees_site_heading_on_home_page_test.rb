require_relative '../test_helper'

class UserSeesSiteHeadingOnHomePageTest < FeatureTest
  def test_user_sees_site_heading
    # As a guest
    # When I visit the homepage
    visit '/'
    # Then I see Skill Inventory
    #save_and_open_page
    within("body") do
      assert page.has_content?("I have a")
    end
  end
end
