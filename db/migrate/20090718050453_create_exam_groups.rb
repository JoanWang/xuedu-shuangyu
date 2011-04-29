#考试组
class CreateExamGroups < ActiveRecord::Migration
  def self.up
    create_table :exam_groups do |t|
      t.string     :name, :comment => "名称"
      t.references :batch, :comment => "关联期次"
      t.string     :exam_type, :comment => "考试类型"
      t.boolean    :is_published, :default=>false, :comment => "是否已经公布"
      t.boolean    :result_published, :default=>false, :comment => "是否公布结果"
      t.date       :exam_date, :comment => "考试时间"
    end
  end

  def self.down
    drop_table :exam_groups
  end
end
