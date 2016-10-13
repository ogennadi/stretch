class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :marketer
      t.string :product
      t.date :arrived_at
      t.string :mother_vessel
      t.date :mother_vessel_bl
      t.string :jetty
      t.string :daughter_vessel
      t.date :daughter_vessel_bl
      t.string :receiving_depot
      t.date :shore_receipt_date

      t.timestamps
    end
  end
end
