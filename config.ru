# map "/blog" do
#   use Rack::Static,
#     :urls => ["/blog", "/css", "/feed", "/images", "/javascripts", "/portfolio", "/about", "/contact"],
#     :root => "public"
#
#   run lambda { |env|
#     [
#       200,
#       {
#         'Content-Type'  => 'text/html',
#         'Cache-Control' => 'public, max-age=86400'
#       },
#       File.open('public/blog/index.html', File::RDONLY)
#     ]
#   }
# end
#
# map "/" do
#   use Rack::Static,
#     :urls => ["/blog", "/css", "/feed", "/images", "/javascripts", "/portfolio", "/about", "/contact"],
#     :root => "public"
#
#   run lambda { |env|
#     # Extract the requested path from the request
#     path = Rack::Utils.unescape(env['PATH_INFO'])
#
#     [
#       200,
#       {
#         'Content-Type'  => 'text/html',
#         'Cache-Control' => 'public, max-age=86400'
#       },
#       # StringIO.new(path)
#       File.open('public/index.html', File::RDONLY)
#     ]
#   }
# end

# v1
# run Proc.new {|env| [200, {"Content-Type" => "text/html"}, "Hello Rack!"]}

# v2
# infinity = Proc.new {|env| [200, {"Content-Type" => "text/html"}, env.inspect]}
# Rack::Handler::Mongrel.run infinity, :Port => 9292

# v3
# builder = Rack::Builder.new do
#   use Rack::CommonLogger
#
#   map '/' do
#     use Rack::Static,
#       :urls => ["/blog", "/css", "/feed", "/images", "/javascripts", "/portfolio", "/about", "/contact"],
#       :root => "public"
#
#     run lambda { |env|
#       [
#         200,
#         {
#           'Content-Type'  => 'text/html',
#           'Cache-Control' => 'public, max-age=86400'
#         },
#         File.open('public/index.html', File::RDONLY)
#       ]
#     }
#   end
# end
# # Rack::Handler::Mongrel.run builder, :Port => 9292




map '/' do
  use Rack::Static,
    :urls => ["/blog", "/css", "/feed", "/images", "/javascripts", "/portfolio", "/about", "/contact"],
    :root => "public"

  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('public/index.html', File::RDONLY)
    ]
  }
end