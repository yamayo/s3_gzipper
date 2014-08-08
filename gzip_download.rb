require 'httpclient'
require 'active_support/gzip'

client = HTTPClient.new
res = client.get_content(
  'http://s3-ap-northeast-1.amazonaws.com/bucket-name/sample.txt.gz'
)

puts "response: #{res}"
puts "size: #{res.length}"

client2 = HTTPClient.new
client2.transparent_gzip_decompression = true
res2 = client2.get_content(
  'https://s3-ap-northeast-1.amazonaws.com/bucket-name/sample.txt.gz',
)
puts "response: #{res2}"
puts "size: #{res2.size}"

#require 'open-uri'
#
#open('http://s3-ap-northeast-1.amazonaws.com/bucket-name/sample') {|f|
#  f.each_line {|line| p line}
#}
#require 'net/http'
#
#Net::HTTP.start('s3-ap-northeast-1.amazonaws.com', 80) { |http|
#  response = http.get('/bucket-name/sample') # ディレクトリを指定
#  p response.body
#}
