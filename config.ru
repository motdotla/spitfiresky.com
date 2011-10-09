builder = Rack::Builder.new do
  use Rack::CommonLogger

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
end
Rack::Handler::Mongrel.run builder, :Port => 9292