using Microsoft.AspNetCore.Mvc;
using System.Text.Encodings.Web;

namespace MvcMovie.Controllers;

public class HelloWorldController : Controller
{

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Welcome(string name = "Maxence", int age = 22, int numTimes = 10)
    {
        ViewData["Message"] = $"Coucou {name} ! Tu as {age} ans aujourd'hui.";
        ViewData["NumTimes"] = numTimes;
        ViewData["UserName"] = name;
        return View();
    }
}