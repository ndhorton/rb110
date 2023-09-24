# Extract the domain name from a URL

=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For
example:
domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"
=end

=begin

Notes:
scan for /\/\/.+?\.|www\..+?\./
scan each string for /[^./]+/
reject strings == 'www'
return remaining string in array
questions:

Problem:
input:
output:

  Write a function that isolates and returns the main domain name
  substring from a URL string

rules:
  not 'www' or 'http' or 'https'

Examples:

DS:

Algorithm:
Define constant PREFIXES := { "http", "https", "www" }
Given a string, url
Scan url with regex to match upper- and lowercase letters, digits and hypen
Find first match-string that is not a member of PREFIXES
Return first such match-string
=end

PREFIXES = ['http', 'https', 'www'].freeze

def domain_name(url)
  first_pass = url.scan(/[A-Za-z0-9\-]+/)
  first_pass.find { |string| !PREFIXES.include?(string) }
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

# 19:24