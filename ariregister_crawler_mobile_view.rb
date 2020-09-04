require 'selenium-webdriver'
require 'csv'

# done = []
reg_nrs = [12295472,12295816,12295940,12296460,12297092,12297212,12298074,12299049,12299501,12300109,12301362]
CSV_HEADERS = ["Nimi",	"Kehtetud nimed:",	"Aadress",	"Registrikood",	"Käibemaksukohustuslase number",	"Õiguslik vorm",	"Staatus",	"Esmakande kuupäev",	"Kapital",	"Esindusõigus"]

p "START: #{Time.now}"

def self.info_ariregistrist(reg_nr)
  p "Registri nr #{reg_nr}"
  result = Array.new
  # set up Selenium
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  driver = Selenium::WebDriver.for :chrome, options: options

  # use <form name="liht" method="POST" action="/lihtparing"> to enter registration number
  driver.get('https://ariregister.rik.ee/mobile/mobile?lang=est%27')
  driver.save_screenshot('main.png')
  sleep(5)
  element = driver.find_element(:id, "search")
  element.send_keys(reg_nr)
  element.submit
  driver.save_screenshot('result.png')
  sleep(3)
  driver.find_element(:class, "first").click
  driver.save_screenshot('next.png')
  lihtandmed = driver.find_elements(:class, 'first')
  # Lihtandmed
  lihtandmed.each do |td|
    result << td.text.split("\n")
    # result << td.find_element(:tag_name, 'span').text&.gsub(/[\r\n]+/, ' ')
  end
  sleep(10)
  driver.find_element(:id, "ui-id-3").click
  driver.save_screenshot('registrikaart.png')

  juhatus = Array.new
  epostid = Array.new
  registrikaart = driver.find_element(:class, 'registrikaart')
  registrikaart.find_elements(:tag_name, 'span').each do |span|
    sisu = span.text&.gsub(/[\r\n]+/, ' ')
    if sisu.include?('Juhatuse liige on ')
      sisu.slice!('Juhatuse liige on ')
      juhatus << sisu
    end
    if sisu.include?('Elektronposti aadress on ')
      sisu.slice!('Elektronposti aadress on ')
      epostid << sisu
    end
  end
  p juhatus.join("\n")
  juhatus_str = juhatus.join("\n")
  result << ["Esindusõigus",juhatus_str]
  result << ["Epost", epostid.join(",")]
  p "Result"
  p result
  CSV.open("test.csv", "a", {col_sep: ";"}) do |csv|
    row = CSV::Row.new(CSV_HEADERS,[])
      result.each do |col|
        row[col[0]] = col[1]
      end
    csv << row
  end
  # # keep track of registration numbers that have been processed
  # CSV.open("done.csv", "a", {col_sep: ";"}) do |csv|
  #   csv << [reg_nr]
  # end
  #
  # driver.quit
  #
  # p result
  # done << reg_nr
  # # optimal time to avoid captcha
  # sleep(rand(100..300))
end

reg_nrs.each do |reg_nr|
  begin
    info_ariregistrist(reg_nr)
    sleep(rand(100..200))
  rescue Selenium::WebDriver::Error::NoSuchElementError
    # program ran into captcha
    p "Rescued NoSuchElementError"
    sleep(rand(250..400))
    info_ariregistrist(reg_nr)
    next
  end
end

p "END: #{Time.now}"
