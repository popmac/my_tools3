class PhotosController < ApplicationController
  mount_uploader :image, ImageUploader
end
