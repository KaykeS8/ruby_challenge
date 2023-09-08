require "csv"
require "erb"
require "google/apis/civicinfo_v2"


arquivo = 'event_attendees.csv'
puts "EventManager initialized"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislator_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

   begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')
  filename = "output/thanks_#{id}.html"
  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end


def clean_home_phone(phone_number)
  phone = phone_number.gsub(/\D/, '')
  case phone
  when phone.length < 10
    puts "Number incorrect"
  when phone.length == 11 && phone[0] == '1'
    phone = phone[1..-1]
  when phone.length == 11 && phone[0] != '1'
    puts "Number incorrect"
  when phone.length > 11
    puts "Number incorrect"
  else
    puts "Correct number"
  end
end

contents = CSV.open(
  arquivo,
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  name = row[:first_name]


  id = row[0]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_home_phone(row[:homephone])

  legislators = legislator_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
  
end


