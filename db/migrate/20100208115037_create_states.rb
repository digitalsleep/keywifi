class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.column :name, :string
      t.column :abbreviation, :string
      t.column :country, :string
      t.timestamps
    end
   States.reset_column_information
    states = {'AL' => 'Alabama', 'AK' => 'Alaska', 'AS' => 'America Samoa', 'AZ' => 'Arizona','AR' => 'Arkansas', 'CA' => 'California','CO' => 'Colorado', 'CT' => 'Connecticut','DE' => 'Delaware', 'DC' => 'District of Columbia','FM' => 'Micronesia1', 'FL' => 'Florida','GA' => 'Georgia', 'GU' => 'Guam','HI' => 'Hawaii', 'ID' => 'Idaho','IL' => 'Illinois', 'IN' => 'Indiana','IA' => 'Iowa', 'KS' => 'Kansas','KY' => 'Kentucky', 'LA' => 'Louisiana','ME' => 'Maine', 'MH' => 'Islands1','MD' => 'Maryland', 'MA' => 'Massachusetts','MI' => 'Michigan', 'MN' => 'Minnesota','MS' => 'Mississippi', 'MO' => 'Missouri','MT' => 'Montana', 'NE' => 'Nebraska','NV' => 'Nevada', 'NH' => 'New Hampshire','NJ' => 'New Jersey', 'NM' => 'New Mexico','NY' => 'New York', 'NC' => 'North Carolina','ND' => 'North Dakota', 'OH' => 'Ohio','OK' => 'Oklahoma', 'OR' => 'Oregon','PW' => 'Palau', 'PA' => 'Pennsylvania','PR' => 'Puerto Rico', 'RI' => 'Rhode Island','SC' => 'South Carolina', 'SD' => 'South Dakota','TN' => 'Tennessee', 'TX' => 'Texas','UT' => 'Utah', 'VT' => 'Vermont','VI' => 'Virgin Island', 'VA' => 'Virginia','WA' => 'Washington', 'WV' => 'West Virginia','WI' => 'Wisconsin', 'WY' => 'Wyoming' }
   states.sort.each do |element|
      States.create(:abbreviation => element[0], :name => element[1], :country => 'USA')
    end
  end

  def self.down
    drop_table :states
  end
end
