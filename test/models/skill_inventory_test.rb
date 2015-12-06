require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ :name  => "#{i+1} name",
                              :status  => "#{i+1} status"})
    end
  end

  def test_it_creates_a_skill
    create_skills(1)

    skill = SkillInventory.all.last

    assert_equal '1 name', skill.name
    assert_equal '1 status', skill.status
    assert_equal SkillInventory.all.first.id, skill.id
  end

  def test_all_returns_an_array_of_one_task
    create_skills(1)
      skill = SkillInventory.all.last

      assert_equal '1 name', skill.name
      assert_equal '1 status', skill.status
    end

    def test_all_returns_an_array_for_multiple_tasks
      create_skills(2)

      skills = SkillInventory.all
      assert_equal 2, skills.count
      assert_equal '2 status', skills.last.status
    end

    def test_find_returns_skill_based_on_id
      create_skills(2)
      skill1 = SkillInventory.all.first
      skill2 = SkillInventory.all.last

      assert_equal '1 name', skill1.name
      assert_equal '2 status', skill2.status
    end

    def test_update_can_alter_existing_data
      create_skills(2)

      id = SkillInventory.all.first.id

      SkillInventory.update(id, {:name => 'updated name',
                                :status => 'updated status'})

      skill = SkillInventory.all.first

      assert_equal 'updated name', skill.name
      assert_equal 'updated status', skill.status
    end

    def test_it_can_delete_a_skill
      create_skills(3)
      total = SkillInventory.all.count

      SkillInventory.delete(SkillInventory.all.first.id)

      assert_equal (total - 1), SkillInventory.all.count
    end




end
