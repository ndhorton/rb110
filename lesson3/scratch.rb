require 'yaml'

obj = YAML.load_file("/home/nicholas/launch_school/rb110/lesson3/scratch.yml")
HSH = obj['english']
puts format(HSH['str1'], "world")
puts HSH['str2'] % ["my", "friend"]