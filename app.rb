require 'pry'
class App

  def call(env)
    req = Rack::Request.new(env)
    path = req.path

    if path.match("/books")
      books = ['"Annihilation" by Jeff VanderMeer', '"Borne" by Jeff VanderMeer']
      html = books.map{|book| "<li>#{book}</li>"}.join
      ['200', {'Content-Type' => 'text/html'}, ["<ul>#{html}</ul>"]]
    elsif path.match("/")
      ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app that refreshes automatically.']]
    end
  end

end
