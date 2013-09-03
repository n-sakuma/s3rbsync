class Region

  def self.printable_list
      describes = ["Location Name:", "Virginia", "California", "Oregon", "Ireland", "Tokyo", "Singapore", "Sydney", "Sao Paulo"]
      regions = self.names.unshift("Region Name:")
      [regions, describes]
  end

  def self.names
    ["us-east-1", "us-west-1", "us-west-2", "eu-west-1", "ap-northeast-1", "ap-southeast-1", "ap-southeast-2", "sa-east-1"]
  end
end
