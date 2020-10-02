using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "TrangChu", action = "TrangChu", id = UrlParameter.Optional }
                 //defaults: new { controller = "QuanLy", action = "TrangQuanLy", id = UrlParameter.Optional }
                  //defaults: new { controller = "DangKy", action = "DangNhap", id = UrlParameter.Optional }
            );
        }
    }
}