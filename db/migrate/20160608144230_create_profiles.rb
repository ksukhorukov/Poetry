class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :biography

      t.belongs_to :user
    end
  end
end
