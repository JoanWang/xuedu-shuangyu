#用户信息
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :username, :comment => "用户名"
      t.string   :first_name, :comment => "名字"
      t.string   :last_name, :comment => "姓氏"
      t.string   :email, :comment => "email"

      t.boolean  :admin, :comment => "是否是管理员"
      t.boolean  :student, :comment => "是否为学生"
      t.boolean  :employee, :comment => "是否为职员"
      
      t.string   :hashed_password, :comment => "密码hash"
      t.string   :salt, :comment => "salt"
      t.string   :reset_password_code, :comment => "重置密码"
      t.datetime :reset_password_code_until
      
      t.timestamps
    end
    create_default
  end

  def self.down
    drop_table :users
  end

  def self.create_default
    User.create :username   => 'admin',:password   => 'admin123',:first_name => 'Fedena',
    :last_name  => 'Administrator',:email=> 'admin@fedena.com',:role=> 'Admin'
  end


end
