using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebUI.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			return View();
		}

		public ActionResult About()
		{
			ViewBag.Message = "“N-nothing important. That is, I heard a good deal about a ring, and a dark lord, and something about the end of the world...” ";

			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "If you like what you see, then give me a call!";

			return View();
		}
	}
}