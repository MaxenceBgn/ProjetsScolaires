using MvcMovie.Domain.DTO;

namespace MvcMovie.Domain.Services
{
    public class MovieService
    {
        private MvcMovie.Data.MvcMovieContext _context;

        public MovieService(Data.MvcMovieContext context)
        {
            _context = context;
        }

        public IEnumerable<MovieItemDTO> GetMovieItemDTOs() 
        {
            var result = new List<MovieItemDTO>();
            var movies = _context.Movie.ToList();
            movies.ForEach(movie => 
                {
                    var dto = new MovieItemDTO(movie);
                    result.Add(dto);
                });

            var re = movies.Select(movie => new MovieItemDTO(movie)).ToList();
            return re;
        }
    }
}
