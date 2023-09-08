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
  if phone.length == 10
    phone
  elsif phone.length == 11 && phone[0] == '1'
    phone[1..10]
  else
    "Wrong Number"
  end
end


def count_frequency(array)
  array.max_by {|a| array.count(a)}
end

contents = CSV.open(
  arquivo,
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
contents_size = CSV.read(arquivo).length
contents_size-=1
date_hours = Array.new(contents_size)
date_of_week = Array.new(contents_size)
j = 0
cal = {0=>"sunday",1=>"monday",2=>"tuesday",3=>"wednesday",4=>"thursday",5=>"friday",6=>"saturday"}

contents.each do |row|
  name = row[:first_name]
  id = row[0]
  reg_date = row[:regdate].gsub('/', '-')
  reg_date_to_print =  DateTime.strptime(reg_date, '%m-%d-%y %H:%M')
  date_hours[j] =  reg_date_to_print.hour
  date_of_week[j] = reg_date_to_print.wday
  j+= 1
  
  phone_number = clean_home_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
  
end

puts "A hours is more repeat is: #{count_frequency(date_hours)}"
puts "A week day is more repeat is: #{cal[count_frequency(date_of_week)]}"