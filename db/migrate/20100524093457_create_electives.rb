#选修
class CreateElectives < ActiveRecord::Migration
  def self.up
    create_table :electives do |t|
      t.references :elective_group, :comment => "关联选修组"
      t.timestamps
    end
  end

  def self.down
    drop_table :electives
  end
end
