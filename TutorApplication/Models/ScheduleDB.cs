﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TutorApplication.Models.ViewModel;

namespace TutorApplication.Models
{
    public class ScheduleDB
    {
        OnlineTutorEntities _db = new OnlineTutorEntities();
        public int InsertSchedule(ScheduleViewModel svm)
        {
            Schedule sc = new Schedule();
            sc.FromTime = svm.FromTime;
            sc.ToTime = svm.ToTime;
            sc.Status = svm.Status;
            sc.TutorId = svm.TutorId;
            _db.Schedules.Add(sc);
            return _db.SaveChanges();
        }
        public int UpdateScheduleStatus(ScheduleViewModel svm)
        {

            Schedule sc = _db.Schedules.Where(t => t.ScheduleId == svm.ScheduleId).FirstOrDefault();
            sc.Status = svm.Status;
            
           
            return _db.SaveChanges();
        }
        public List<ScheduleViewModel> GetAllSchedule()
        {
            List<ScheduleViewModel> lstsch = new List<ScheduleViewModel>();
            var sch = _db.Schedules.ToList();
            foreach (var item in sch)
            {
                lstsch.Add(new ScheduleViewModel() { ScheduleId = item.ScheduleId, FromTime = item.FromTime, ToTime = item.ToTime, Status = item.Status, TutorId = item.TutorId });
            }
            return lstsch;
        }
        public List<ScheduleViewModel> GetAllScheduleByTeacherid(int teacherid)
        {
            List<ScheduleViewModel> lstsch = new List<ScheduleViewModel>();
            var sch = _db.Schedules.Where(t=>t.TutorId==teacherid && t.Status=="Open").ToList();
            foreach (var item in sch)
            {
                lstsch.Add(new ScheduleViewModel() { ScheduleId = item.ScheduleId, FromTime = item.FromTime, ToTime = item.ToTime, Status = item.Status, TutorId = item.TutorId });
            }
            return lstsch;
        }
    }
}