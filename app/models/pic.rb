class Pic < ActiveRecord::Base
  attr_accessible :item, :attach
  belongs_to :item

  before_validation :initialize_position

  validates :attach, :attachment_presence => true
  validates :item_id, :presence => true
  validates :position, :presence => true

  scope :by_position, order("position asc")

  ATTACH_STYLES = {
    :front => "215x",
    :front_big => "710x",
    :admin => "303x203#"
  }

  # TODO: ugly! the point is that in test we don't use S3 so it needs another config
  if APP_CONFIG[:s3_credentials]
    has_attached_file(
      :attach,
      :styles => ATTACH_STYLES,
      :storage => :s3,
      :s3_credentials => APP_CONFIG[:s3_credentials],
      :path => "/assets/uploads/:item_id/:id_:style.:extension",
    )
  else
    has_attached_file(
      :attach,
      :styles => ATTACH_STYLES,
      :url => "/assets/uploads/:rails_env/:item_id/:id_:style.:extension",
      :path => ":rails_root/public:url"
    )
  end


  def initialize_position
    self.position ||= Pic.minimum(:position).to_i - 1
  end

  def title
    filename = File.basename(attach.original_filename, ".*")

    return nil if filename =~ /^_/
    return filename.gsub("_", " ")
  end

  def to_json
    {
      "id" => id,
      "file_url" => attach(:admin)
    }
  end
end
