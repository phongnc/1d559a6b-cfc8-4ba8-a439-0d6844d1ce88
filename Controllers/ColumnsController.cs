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
    public class ColumnsController : Controller
    {
        private Model1 db = new Model1();

        // GET: /Columns/
        public ActionResult Index()
        {
            return View(db.Columns_tb.OrderBy(o => o.Table_Name).ToList());
        }

        // GET: /Columns/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Columns_tb columns_tb = db.Columns_tb.Find(id);
            if (columns_tb == null)
            {
                return HttpNotFound();
            }
            return View(columns_tb);
        }

        // GET: /Columns/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Columns/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Table_Name,Column_Name,Display_Name,Use_As")] Columns_tb columns_tb)
        {
            if (ModelState.IsValid)
            {
                db.Columns_tb.Add(columns_tb);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(columns_tb);
        }

        // GET: /Columns/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Columns_tb columns_tb = db.Columns_tb.Find(id);
            if (columns_tb == null)
            {
                return HttpNotFound();
            }
            return View(columns_tb);
        }

        // POST: /Columns/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Table_Name,Column_Name,Display_Name,Use_As")] Columns_tb columns_tb)
        {
            if (ModelState.IsValid)
            {
                db.Entry(columns_tb).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(columns_tb);
        }

        // GET: /Columns/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Columns_tb columns_tb = db.Columns_tb.Find(id);
            if (columns_tb == null)
            {
                return HttpNotFound();
            }
            return View(columns_tb);
        }

        // POST: /Columns/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Columns_tb columns_tb = db.Columns_tb.Find(id);
            db.Columns_tb.Remove(columns_tb);
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
