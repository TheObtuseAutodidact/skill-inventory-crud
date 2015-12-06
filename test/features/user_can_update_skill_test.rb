require_relative '../test_helper'

class UserCanUpdateSkillTest < FeatureTest

  def create_skill(num)
    num.times do |i|
      SkillInventory.create({ :name => "#{i+1} name",
                  :status => "#{i+1} status"})
    end
  end

  def test_user_can_edit_skill
    create_skill(1)

    skill = SkillInventory.all.last

    visit '/skills'
    click_link('edit')
    fill_in("skill-name", with: "edited skill")
    fill_in("skill-status", with: "edited status")
    click_button("update skill")

    assert_equal "/skills/#{skill.id}", current_path

    within(".container") do
      assert page.has_content?("edited skill")
    end
  end

end
