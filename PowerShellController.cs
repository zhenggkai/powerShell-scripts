// PowerShellController.cs
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace YourNamespace.Controllers
{
    public class PowerShellController : Controller
    {
        public IActionResult Index()
        {
            var processInfo = new ProcessStartInfo
            {
                FileName = "pwsh",
                Arguments = "path/to/your/script.ps1",
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };

            using (var process = Process.Start(processInfo))
            {
                string output = process.StandardOutput.ReadToEnd();
                ViewBag.Output = output;
            }

            return View();
        }
    }
}
