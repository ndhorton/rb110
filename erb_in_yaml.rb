require 'erb'
require 'yaml'

name = 'John'
age = 25

file = File.read("#{__dir__}/erb_in_yaml.yml")
erb = ERB.new(file).result
content = YAML.safe_load(erb)
puts content["greeting"]
puts content["age"].class