using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TutorApplication.Models;
using TutorApplication.Models.ViewModel;

namespace TutorApplication.Controllers
{
    public class TutorController : Controller
    {
        //
        // GET: /Tutor/
        HireDB hrdb = new HireDB();
        UserDB udb = new UserDB();
        TutorDB tudb = new TutorDB();
        ScheduleDB scdb = new ScheduleDB();
        SubjectDB subdb = new SubjectDB();
        [Authorize(Roles="Teacher")]
        public ActionResult Index()
        {
            TutorViewModel tvm = tudb.GetTutorbyEmailId(Session["emailid"].ToString());
            Session.Add("tutorid", tvm.TutorId.ToString());
            ViewBag.Subjects = subdb.GetAllSubject();
            if (tvm.TutorId > 0)
            {
               
                ViewBag.SaveText = "Update";
                Session.Add("action", "Update");

            }
            else
            {
              
                ViewBag.SaveText = "Save";
                Session.Add("action", "Save");
            }
            return View(tvm);

        }
       
        [HttpPost]
        public ActionResult Index(TutorViewModel tvm)
        {
            if (ModelState.IsValid)
            {
                if (Session["action"].ToString() == "Save")
                {
                    HttpPostedFileBase fup = Request.Files["Photo"];
                    if (fup != null)
                    {

                        tvm.Photo = fup.FileName;
                        string filename = Path.GetFileName(fup.FileName);
                        fup.SaveAs(Server.MapPath("~/TutorImages/" + filename));
                    }
                    tvm.EmailId = Session["emailid"].ToString();
                    int i = tudb.CreateTutor(tvm);
                    if (i > 0)
                    {
                        ViewBag.SaveText = "Update";
                        ViewBag.Message = "Saved Successfully";
                        //return Content("tutor Created Successfully", "text/html");
                    }
                }
                else
                {
                    tvm.EmailId = Session["emailid"].ToString();
                    HttpPostedFileBase fup = Request.Files["Photo"];
                    if (fup != null)
                    {

                        tvm.Photo = fup.FileName;
                        string filename = Path.GetFileName(fup.FileName);
                        fup.SaveAs(Server.MapPath("~/TutorImages/" + filename));
                    }
                    int i = tudb.UpdateTutor(tvm);
                    if (i > 0)
                    {
                        ViewBag.SaveText = "Update";
                        ViewBag.Message = "Updated Successfully";
                        //return Content("Tutor updated Successfully", "text/html");
                    }
                }
            }
            //else
            //{
            //    ViewBag.SaveText = "Save";
            //}
            ViewBag.Subjects = subdb.GetAllSubject();
            return View();
        }

          [Authorize(Roles = "Teacher")]
        public ActionResult ListSchedule()
        {
            var sc = scdb.GetAllScheduleByTeacherid(Convert.ToInt32(Session["tutorid"].ToString()));
            return PartialView("_ListSchedule",sc);
        }
          [Authorize(Roles = "Teacher")]
        public ActionResult Schedule()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Teacher")]
        public ActionResult Schedule(ScheduleViewModel svm)
        {
            svm.TutorId = Convert.ToInt32(Session["tutorid"].ToString());
            svm.Status = "Open";
           

            scdb.InsertSchedule(svm);

            var sc = scdb.GetAllScheduleByTeacherid(Convert.ToInt32(Session["tutorid"].ToString()));
            return PartialView("_ListSchedule", sc);
        }

        [HttpGet]
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordViewModel ch)
        {
            ch.EmailId = Session["emailid"].ToString();

            if (udb.checkUser(ch))
            {
                int i = udb.UpdatePassword(ch);
                if (i > 0)
                {
                    ViewBag.Message = "Password Changed";
                }
            }
            return View();
        }
        public ActionResult GetTutorHiredByStudent()
        {
            List<Hire> lsthire = hrdb.GetTutorHiredByStudent(Convert.ToInt32(Session["tutorid"].ToString()));
            return View(lsthire);
        }
       

    }
}
