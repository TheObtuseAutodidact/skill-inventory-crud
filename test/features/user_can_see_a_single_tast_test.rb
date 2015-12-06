require_relative '../test_helper'

class UserCanSeeASingleTest < FeatureTest

  def create_skill(num)
    num.times do |i|
      SkillInventory.create({ :name => "#{i+1} name",
                              :status => "#{i+1} status"})
      end
    end

    def test_user_can_see_single_skill
      create_skill(1)
      # As a user
      # When I visit index page
      visit '/skills'
      # And I click on the individual skill
      click_link("1 name")
      # Then I see that skill's show page
      assert page.has_content?("status")
    end
  end
