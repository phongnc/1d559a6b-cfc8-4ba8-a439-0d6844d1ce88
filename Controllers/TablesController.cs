using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SSISApplication.Generator.Models;

namespace SSISApplication.Generator.Controllers
{
    public class TablesController : Controller
    {
        private Model1 db = new Model1();

        public ActionResult AllJSMenu()
        {
            ViewBag.Template_Content = TemplateConfig.Generateall_app_js_menu();
            ViewBag.Title = "Generateall_app_js_menu";
            return View("AllTable");
        }
        public ActionResult AllCSCtrl()
        {
            ViewBag.Template_Content = TemplateConfig.Generateall_controller_cs();
            ViewBag.Title = "Generateall_controller_cs";
            return View("AllTable");
        }
        public ActionResult AllJSState()
        {
            ViewBag.Template_Content = TemplateConfig.Generateall_app_js_state();
            ViewBag.Title = "Generateall_app_js_state";
            return View("AllTable");
        }
        public ActionResult AllJSSevice()
        {
            ViewBag.Template_Content = TemplateConfig.Generateall_services_js_DataServices();
            ViewBag.Title = "Generateall_services_js_DataServices";
            return View("AllTable");
        }
        public ActionResult AllJSCtrl()
        {
            ViewBag.Template_Content = TemplateConfig.Generateall_controllers_js(); ;
            ViewBag.Title = "Generateall_controllers_js_*";
            return View("AllTable");
        }
        public ActionResult AllHTMLTemp()
        {
            ViewBag.Template_Content = TemplateConfig.Generateall_templates_html();
            ViewBag.Title = "Generateall_templates_html_*";
            return View("AllTable");
        }
        // GET: /Tables/
        public ActionResult Index()
        {
            return View(db.Tables_tb.ToList());
        }

        // GET: /Tables/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tables_tb tables_tb = db.Tables_tb.Find(id);
            if (tables_tb == null)
            {
                return HttpNotFound();
            }
            return View(tables_tb);
        }

        // GET: /Tables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Tables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Table_Name,Display_Name,Use_As")] Tables_tb tables_tb)
        {
            if (ModelState.IsValid)
            {
                db.Tables_tb.Add(tables_tb);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tables_tb);
        }

        // GET: /Tables/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tables_tb tables_tb = db.Tables_tb.Find(id);
            if (tables_tb == null)
            {
                return HttpNotFound();
            }
            ViewBag.Template_Content = TemplateConfig.Generate(tables_tb.Table_Name); 
            return View(tables_tb);
        }

        // POST: /Tables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Table_Name,Display_Name,Use_As")] Tables_tb tables_tb)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tables_tb).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tables_tb);
        }

        // GET: /Tables/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tables_tb tables_tb = db.Tables_tb.Find(id);
            if (tables_tb == null)
            {
                return HttpNotFound();
            }
            return View(tables_tb);
        }

        // POST: /Tables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Tables_tb tables_tb = db.Tables_tb.Find(id);
            db.Tables_tb.Remove(tables_tb);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
