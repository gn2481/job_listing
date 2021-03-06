class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader
  validates :cover_letter, presence: true
end
