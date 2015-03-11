class SiteGenerator

  def make_index!
    File.open('./_site/index.html', 'w') { |file| file.write("
      <!DOCTYPE html>
      <html>
        <head>
          <title>Movies</title>
        </head>
        <body>
          <ul>
           #{movies_link}
          </ul>
        </body>
      </html>
      ") }
  end

  def movies_link
      movies = Movie.all
      movies.each_with_object(""){|movie, string|string << "<li><a href=\"movies/#{movie.url_name}\">#{movie.title}</a></li>"}
  end

  def generate_pages!
    link = movies_link.gsub(/movies\//,"")
    template = ERB.new(File.read('./lib/templates/movie.html.erb'))
    Movie.all.each do |movie|
    File.open("./_site/movies/#{movie.url}", "w"){|f| f.write(template.result(binding))}
  end
end


end
