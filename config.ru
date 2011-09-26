use Rack::Static, 
  :urls => ["/blog", "/css", "/feed", "/images", "/javascripts", "/portfolio", "/about", "/contact"],
  :root => "public"

map "/blog" do
  run lambda { |env|
    # Extract the requested path from the request
    path = Rack::Utils.unescape(env['PATH_INFO'])

    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=86400' 
      },
      StringIO.new("Hi there!")
    ]
  }
end

# run lambda { |env|
#   # Extract the requested path from the request
#   path = Rack::Utils.unescape(env['PATH_INFO'])
#     
#   [
#     200, 
#     {
#       'Content-Type'  => 'text/html', 
#       'Cache-Control' => 'public, max-age=86400' 
#     },
#     StringIO.new(path)
#     
#     # File.open('public/index.html', File::RDONLY)
#   ]
# }