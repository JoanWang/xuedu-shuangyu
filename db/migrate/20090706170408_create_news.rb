#通知、新闻
class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string     :title, :comment => "标题"
      t.text       :content, :comment => "内容"
      t.references :author, :comment => "关联作者"
      t.timestamps
    end

    create_table :news_comments do |t|
      t.text       :content, :comment => "内容"
      t.references :news, :comment => "关联新闻"
      t.references :author, :comment => "关联作者"
      t.timestamps
    end
  end

  def self.down
    drop_table :news_comments
    drop_table :news
  end
end
