using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace MaxouPizza.Pages.Admin
{
    public class IndexModel : PageModel
    {
        public bool identifiantsAreNotOk = false;
        public IActionResult OnGet()
        {
            if (HttpContext.User.Identity.IsAuthenticated)
            {
                return Redirect("Admin/Pizzas");
            }
            return Page();
        }

        public async Task<IActionResult> OnPost(string username, string password, string ReturnUrl)
        {
            if (username == "admin" && password == "ok")
            {
                var claims = new List<Claim>
                 {
                 new Claim(ClaimTypes.Name, username)
                 };
                var claimsIdentity = new ClaimsIdentity(claims, "Login");
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new
               ClaimsPrincipal(claimsIdentity));
                return Redirect(ReturnUrl == null ? "/Admin/Pizzas" : ReturnUrl);
            }
            else
            {
                identifiantsAreNotOk = true;
            }
            return Page();
        }

        public async Task<IActionResult> OnGetLogOut()
        {
            await HttpContext.SignOutAsync();
            return Redirect("/Admin");
        }

    }
}
