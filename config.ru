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

map '/blog' do
  run lambda {|env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      if ["/blog", "/blog/"].include?(env['REQUEST_URI'])
        File.open("public/blog/index.html", File::RDONLY)
      else
        File.open("public#{env['REQUEST_URI']}", File::RDONLY)
      end
    ]
  }
end