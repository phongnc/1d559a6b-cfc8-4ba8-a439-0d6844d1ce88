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
    public class TemplatesController : Controller
    {
        private Model1 db = new Model1();

        // GET: /Templates/
        public ActionResult Index(string searchParam)
        {
            if (string.IsNullOrEmpty(searchParam))
                return View(db.Templates_tb.ToList());
            return View(db.Templates_tb.Where(s => s.Template_Name.StartsWith(searchParam)).ToList());
        }

        // GET: /Templates/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Templates_tb templates_tb = db.Templates_tb.Find(id);
            if (templates_tb == null)
            {
                return HttpNotFound();
            }
            return View(templates_tb);
        }

        // GET: /Templates/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Templates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Template_Name,Template_Content")] Templates_tb templates_tb)
        {
            if (ModelState.IsValid)
            {
                db.Templates_tb.Add(templates_tb);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(templates_tb);
        }

        // GET: /Templates/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Templates_tb templates_tb = db.Templates_tb.Find(id);
            if (templates_tb == null)
            {
                return HttpNotFound();
            }
            return View(templates_tb);
        }

        // POST: /Templates/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Template_Name,Template_Content")] Templates_tb templates_tb)
        {
            if (ModelState.IsValid)
            {
                db.Entry(templates_tb).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(templates_tb);
        }

        // GET: /Templates/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Templates_tb templates_tb = db.Templates_tb.Find(id);
            if (templates_tb == null)
            {
                return HttpNotFound();
            }
            return View(templates_tb);
        }

        // POST: /Templates/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Templates_tb templates_tb = db.Templates_tb.Find(id);
            db.Templates_tb.Remove(templates_tb);
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
