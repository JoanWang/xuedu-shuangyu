#关联学生与学期
class CreateBatchStudentsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :batch_students, :id => false do |t|
      t.references :student, :comment => "关联学生"
      t.references :batch, :comment => "关联学期"
    end
  end

  def self.down
    drop_table :batch_students
  end

end
