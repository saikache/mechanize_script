begin
  puts 'Loading Mechanize gem .......'
  puts ''
  require 'mechanize'

  def add_http input_taken
    input_taken = "http://#{input_taken}" unless input_taken =~ /\Ahttp|https:\/\//
    input_taken #Return if URL having http or https
  end
  def full_url host, short_url
    "#{host}/#{short_url}"
  end
  puts 'Please Enter A URL:'
  given_url = add_http gets.chomp
  # p '3333333333333333333'
  p given_url

  begin
    web_page = Mechanize.new.get(given_url)
  rescue
    puts "URL does't exist"
  end

  begin
    b = given_url.split('/')
    p main_url = b[0] + '//' + b[2]
    all = []
    web_page.links.each do |single_link|
      if single_link.href

        if single_link.href.include?('//')
          all << single_link.href.split('//').join
          p  single_link.href
        else
          all << show_url = full_url(main_url ,single_link.href)
          p show_url
        end
      end
    end
    puts '======================================================='
    puts "TOTAL URL'S FROM WEB"
    puts '======================================================='

    all = all.uniq
    not_working_urls = ['https://github.com/TESTING_URLLLLpdf3222222423']
    puts '-------------------------------------------------------'
    puts 'Checking Only 25 URLs From The above URLs'

    unless all.empty?
      all.each do |url|
        begin
          p url
          p 'eeeeeeeeeeeeeeeeeeeeeee'
          check_url = Mechanize.new.get(url)
        rescue
          not_working_urls << url
        end
      end
    end
    puts '======================================================='
    puts "NOT WORKING URL'S"
    puts '======================================================='
    puts not_working_urls.uniq

  rescue
  end
rescue LoadError
  p 'Please install mechanize gem'
end