Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_headers] = {"Content-Disposition" => "attachment"}
Paperclip::Attachment.default_options[:s3_protocol] = 'http'
Paperclip::Attachment.default_options[:path] = ':class/:id/:filename'
Paperclip::Attachment.default_options[:s3_credentials] =
  { :bucket => Rails.application.secrets.s3_bucket_name,
      :access_key_id => Rails.application.secrets.aws_access_key_id,
      :secret_access_key => Rails.application.secrets.aws_secret_access_key
  }

require 'paperclip/media_type_spoof_detector'         
module Paperclip         
 class MediaTypeSpoofDetector        
    def spoofed?         
      false       
    end       
  end        
end 