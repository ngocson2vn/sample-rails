class CreateSampleAuthorizedServices < ActiveRecord::Migration[5.0]
  def change
    create_table :sample_authorized_services do |t|
      t.string :application_name
      t.string :old_application_token
      t.datetime :valid_until
      t.string :application_token

      t.timestamps
    end
    add_index :sample_authorized_services, :application_name, unique: true
    add_index :sample_authorized_services, :application_token, unique: true
  end
end
