# frozen_string_literal: true

require_relative 'user'
require 'gruff'

# export data
class Exporter
  def self.export_chart(gender_counts)
    g = Gruff::Pie.new
    g.title = 'Gender Distribution'
    data = gender_counts.map { |gender, count| [gender, count] }

    data.each do |gender, count|
      g.data(gender.capitalize, count)
    end

    g.write('./data/chart.png')

    p current_directory = Dir.pwd

    image_filename = '/data/chart.png'
    image_path = File.join(current_directory, image_filename)

    Caracal::Document.save "#{Dir.pwd}/data/TableChart.docx" do |docx|
      docx.img image_path do
        width   250
        height  200
        align   :left
      end
    end
  end
end
