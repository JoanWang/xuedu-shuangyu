#等级水平
class CreateGradingLevels < ActiveRecord::Migration
  def self.up
    create_table :grading_levels do |t|
      t.string     :name, :comment => "名称"
      t.references :batch, :comment => "关联学期"
      t.integer    :min_score, :comment => "最低分"
      t.integer    :order, :comment => "排序"
      t.boolean    :is_deleted, :default => false, :comment => "是否删除"
      t.timestamps
    end
      create_default
  end

  def self.down
    drop_table :grading_levels
  end

    def self.create_default
    GradingLevel.create(:name   => 'A',:min_score => '90')
    GradingLevel.create(:name   => 'B',:min_score => '80')
    GradingLevel.create(:name   => 'C',:min_score => '70')
    GradingLevel.create(:name   => 'D',:min_score => '60')
    GradingLevel.create(:name   => 'E',:min_score => '50')
    GradingLevel.create(:name   => 'F',:min_score => '0')
  end
end
