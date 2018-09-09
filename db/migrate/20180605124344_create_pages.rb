class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t| 
        t.integer "subject_id", index: true
        t.column "name", :string
        t.column "permalink", :string
        t.column "position", :integer
        t.column "visible", :boolean, :default => false

      t.timestamps
    end
    add_index :pages, :permalink
  end
end
