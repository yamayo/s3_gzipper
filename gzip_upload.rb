require 'tempfile'
require 'active_support/gzip'
require 'aws-sdk-core'

temp = Tempfile.new('sample')
temp.print 'test ' * 100

temp.rewind
gzip_data = ActiveSupport::Gzip.compress(temp.gets)
temp.close

s3 = Aws::S3::Client.new(region: 'ap-northeast-1')
s3.put_object(
  acl: 'public-read',
  bucket: 'bucket-name',
  content_type: 'application/text; charset=UTF-8',
  content_encoding: 'gzip',
  key: 'sample.txt',
  body: gzip_data
)
