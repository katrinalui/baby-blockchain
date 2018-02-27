require "digest"

class Block

  attr_reader :index
  attr_reader :data
  attr_reader :prev_hash
  attr_reader :timestamp
  attr_reader :hash

  def initialize(index, data, prev_hash)
    @index = index
    @data = data
    @prev_hash = prev_hash
    @timestamp = Time.now
    @hash = generate_hash
  end

  private

  def generate_hash
    sha = Digest::SHA256.new
    sha.update(@index.to_s + @timestamp.to_s + @data + @prev_hash)
    sha.hexdigest
  end
end
