require_relative '../test_helper'

class UserCanUpdateSkillTest < FeatureTest

  def create_skill(num)
    num.times do |i|
      SkillInventory.create({ :name => "#{i+1} name",
                              :status => "#{i+1} status"})
    end
  end

  def test_user_can_delete_skill
    create_skill(1)

    # As a user
    # when I visit the skills page
    visit "/skills"
    # and I click on delete
    click_button("delete")
    # than that task is removed
    refute page.has_content?("new skill")
  end
end
