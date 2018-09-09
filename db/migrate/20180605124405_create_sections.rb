class CreateSections < ActiveRecord::Migration[5.2]
  def up
    create_table :sections do |t|
        t.column "page_id", :integer
        t.column "subject_id", :integer, index: true
        t.column "name", :string
        t.column "position", :integer
        t.column "visible", :boolean
        t.column "content_type", :string
        t.column "content", :text
        
      t.timestamps
    end
    add_index "sections", "page_id"
  end

  def down
    drop_table :sections
  end
end
