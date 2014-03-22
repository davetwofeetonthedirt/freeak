require 'httparty'

users = File.read(ARGV[0])

users.each_line do |line|
  begin
    uuid, json = line.split(/\t/)

    HTTParty.post("http://localhost:4000/users/info/#{uuid}", body: json).body

  rescue Exception => e
    p "EXCEPTION:::::: #{e} : #{line}"
  end
end


#    p "uuid: #{uuid}, json: #{json}"
