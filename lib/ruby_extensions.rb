class String
  # === How it works
  # It takes self and the subfile (a / is between them) and convert
  # them to a File path
  # === Why has it been made
  # I wanted to make my paths look beautiful.
  # === Example
  # ==== From:
  #   File.expand_path(File.dirname(DIR) + "/helpers.rb")
  # ==== To
  #   DIR/:'helpers.rb'
  def /(subfile)
    File.join(self, subfile.to_s)
  end
end
