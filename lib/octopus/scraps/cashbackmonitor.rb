require 'nokogiri'
require 'open-uri'

module Octopus
  module Scrapers
    class Cashbackmonitor < Scraper
      namespace :cashbackmonitor

      def initialize(robot)
        super
      end

      def host
        'http://www.cashbackmonitor.com/travel-miles-points-comparison/'
      end

      def scrap
        page = Nokogiri::HTML(open(host))
        programs_count = page.css('table.cbm tr')[0].css('th').size - 3
        for_program = page.css('table.cbm tr')[0].css('th')
        programs = [for_program[2].text, for_program[3].text, for_program[4].text, for_program[5].text, for_program[6].text, for_program[7].text]
        programs.map!(&:lstrip)
        result = []
        pro = 1
        c = 0
        until c == programs_count
          pro += 1
          program = { name: programs[c] }
          c += 1
          pr = []
          page.css('table.cbm tr').each do |prog|
            if prog.css('td').size > 2
              merch_name = prog.css('td.l.tl').text
              pr << {
                name: merch_name,
                rate: prog.css('td')[pro].text.scan(/(\d+)/).flatten.compact.first,
                currency: prog.css('td')[pro].text.gsub(/(\d+ )/, '')
              }
            end
          end
          result << { program: program, stores: pr }
        end
        result
      end

      Octopus.register_adapter(:cashbackmonitor, self)
    end
  end
end
