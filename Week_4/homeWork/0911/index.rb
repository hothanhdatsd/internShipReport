# frozen_string_literal: true

require 'faraday'
require 'nokogiri'
## scrap html
class FetchHTML
  def self.fetch_html(url)
    response = Faraday.get(url)
    Nokogiri::HTML(response.body) if response.success?
  end

  def self.extract_links(html_doc)
    links_data = []

    html_doc.css('article').each do |item|
      h2_a = item.at_css('h2 a')
      next unless h2_a

      link_data = {
        href: h2_a['href'],
        title: h2_a.text.strip,
        desc: item.at_css('p a')&.text&.strip
      }
      links_data << link_data
    end
    links_data
  end

  def self.export_data
    html_doc = fetch_html(url)
    if html_doc
      links_data = extract_links(html_doc)
      links_data.each do |link_data|
        puts "URL: #{link_data[:href]}"
        puts "Title: #{link_data[:title]}"
        puts "Description: #{link_data[:desc]}"
        puts ''
      end
    else
      puts 'Failed'
    end
  end

  def self.url
    'https://vnexpress.net/so-hoa/cong-nghe/ai'
  end
end

FetchHTML.export_data
