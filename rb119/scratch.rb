require 'erb'
require 'yaml'

name = 'John'
age = 25

file = File.read("#{__dir__}/scratch.yml")

erb = ERB.new(file).result

content = YAML.safe_load(erb)

p content["greeting"]

# File.close(content)