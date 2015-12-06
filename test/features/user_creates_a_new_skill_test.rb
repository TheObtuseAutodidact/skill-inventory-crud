require_relative '../test_helper'

class UserCreatesANewSkillTest < FeatureTest
  def test_it_creates_a_new_skill_with_valid_attributes
    # As a user
    # When on the index page
    visit '/'
    # And I click on create new skill
    click_link("Add a Skill")
    # And I populate name and status fields
    fill_in("skill[name]", :with => 'SQL')
    fill_in("skill[status]", :with => 'never heard of it')
    # And I click submit
    click_button("submit")
    # Then I see the new skill added to index page
    assert page.has_content?("SQL")
  end
end
