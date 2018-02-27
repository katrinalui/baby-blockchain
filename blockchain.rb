require "digest"

class Block
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
    sha.update(@index.to_s + @timestamp.to_s + @data + @previous_hash)
    sha.hexdigest
  end
end
