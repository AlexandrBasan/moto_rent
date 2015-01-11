class Airport < ActiveRecord::Base
  has_many :destinations, :dependent => :destroy
  has_many :bookings

  validates :code, presence: true
  validates :name, presence: true
  validates :fixed_fare, presence: true


  def self.import(file)
    @array_error = Array.new([])
    #allowed_attributes = [ "id","created_at","updated_at"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      #product = find_by_id(row["id"]) || new
      product = new
      row["id"] = nil
      row["code"] = (row["name"]).last(3)
      row["fixed_fare"] = 1
      row["created_at"] = nil
      row["updated_at"] = nil
      product.attributes = row.to_hash
      #product.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
      #product.save!
      if product.valid?
        product.save!
      else
        case File.extname(file.original_filename)
          when ".csv" then
            @array_error.push(product)
          when ".xls" then
            @array_error.push(spreadsheet.row(i))
          when ".xlsx" then
            @array_error.push(spreadsheet.row(i))
          else raise "Unknown file type: #{file.original_filename}"
        end
      end
    end
  end

  def self.check_import_errors
    if @array_error.blank?
      true
    else
      false
      @array_error
    end
  end

  # export to csv and xls
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |delivery_rate|
        csv << delivery_rate.attributes.values_at(*column_names)
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
