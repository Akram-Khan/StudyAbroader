# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end



  # Provide a default URL as a default if there hasn't been a file uploaded:
  #def default_url
    #asset_path "/images/" + [version_name, "female_user.png"].compact.join('_')
  #asset_path "/images/female_user.png"
  #asset_path "fallback/" + [version_name, "default.png"].compact.join('_')
  #end

  # Process files as they are uploaded:
  #process :scale => [200, 300]
  #process :resize_to_fit => [150, 200]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  version :thumb_small do
    process :resize_to_fill => [50,50]
    process :strip
  end
  version :thumb_medium do
    process :resize_to_limit => [200,200]
    #process :strip
  end
  version :thumb_large do
    process :resize_to_limit => [400,400]
    process :strip
  end
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def strip
    manipulate! do |img|
      img.strip
      img = yield(img) if block_given?
      img
    end
  end

end
