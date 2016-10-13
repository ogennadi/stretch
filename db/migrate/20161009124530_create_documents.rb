class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.belongs_to :shipment, index: true
      t.integer :checklist_id
      t.string  :title
      t.string  :path

      t.timestamps
    end
  end
end
