module Log
  def log(string, level = 1, &block)
    puts "#{'=='*(level-1)}> #{string}"
    block_given? ? block.call : string
  end
  alias l log
end
include Log
