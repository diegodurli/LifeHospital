class ReportPdf < Prawn::Document
  def initialize(records)
    super()
    @records = records
    header
    table_content
  end
 
  def header
    y_position = cursor - 25
    bounding_box([0, y_position], :width => 530) do
      image "#{Rails.root}/app/assets/images/report_header.png", position: :center
    end
    move_down 50
    bounding_box([0, cursor], :width => 530, :height => 50) do
      text "Report for #{@records.table.name.titleize}", size: 15, style: :bold, align: :center
    end
  end

  def get_columns_of(resource)
    if resource && resource.singularize.gsub(' ','').safe_constantize
      resource.singularize.gsub(' ','').safe_constantize.attribute_names - %w{id created_at updated_at}
    else
      []
    end
  end

  def table_content
    table record_rows, position: :center do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
    end
  end
 
  def record_rows
    @values = []
    columns = get_columns_of(@records.table.name.humanize.titleize)
    @values.push(columns.map { |column| column.humanize })

    @records.each do |record|
      values = []
      columns.each { |column| values.push(record[column.to_sym]) }
      @values.push(values)
    end

    @values
  end
end