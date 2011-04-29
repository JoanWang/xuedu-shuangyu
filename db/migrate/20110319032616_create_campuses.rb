class CreateCampuses < ActiveRecord::Migration
  def self.up
    create_table :campuses do |t|
      t.string     :name
      t.string     :code
      t.references :classrooms
      t.timestamps
    end
  end

  def self.down
    drop_table :campuses
  end
end
