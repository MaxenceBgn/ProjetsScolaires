using MvcMovie.Models;

namespace MvcMovie.Domain.DTO
{
    public class MovieItemDTO
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Gender { get; set; }

        public MovieItemDTO()
        {
        }

        public MovieItemDTO(Movie movie)
        {
            ID = movie.Id;
            Title = movie.Title;
            Gender = movie.Genre;
        }

        
    }
}
