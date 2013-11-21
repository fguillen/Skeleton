module JSON
  def self.parse_sym(source)
    self.parse(source, :symbolize_names => true)
  end
end