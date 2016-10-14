module ImageValidations extend ActiveSupport::Concern
  included do
    has_attached_file :cover

    validates :name, presence: true, length: {minimum: 6}
    validates :cover, presence: true
    validates :description, presence: true
    validates_attachment_file_name :cover, matches: [/png\z/, /jpe?g\z/]
    validates_attachment_content_type :cover, content_type: /\Aimage/ 
  end
end
