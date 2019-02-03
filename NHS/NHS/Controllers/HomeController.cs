using NHS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Globalization;
using NHS.Common;
using NHS.Data;
using System.Configuration;
using System.DirectoryServices;
using System.Web.SessionState;


namespace NHS.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class HomeController : Controller
    {
        NHSEntities ent = new NHSEntities();
        public ActionResult Index()
        {
            if (GetUserDetailsFromAD())
            {
                return View();
            }
            else
            {
                return View("NotAuthorized");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult SJROutcome(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsSJROutcome sjrOutcome = new clsSJROutcome();
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            if (Request.HttpMethod != "POST")
            {
                sjrOutcome = dBEngine.GetSJROutcome(id);
            }
            return View(sjrOutcome);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="btnSave"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SJROutcome(FormCollection formCollection, string btnSave, int? id)
        {
            string actionName = "";
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                if (formCollection["Stage2SJRRequired"] == "Yes") formCollection["Stage2SJRRequired"] = "true"; else formCollection["Stage2SJRRequired"] = "false";
                if (formCollection["MSGRequired"] == "Yes") formCollection["MSGRequired"] = "true"; else formCollection["MSGRequired"] = "false";
                int retVal = dBEngine.UpdateSJROutcome(Convert.ToBoolean(formCollection["Stage2SJRRequired"]), Convert.ToDateTime(formCollection["Stage2SJRDateSent"]),
                    formCollection["Stage2SJRSentTo"], formCollection["ReferenceNumber"], Convert.ToDateTime(formCollection["DateReceived"]), formCollection["SIRIComments"],
                    Convert.ToBoolean(formCollection["MSGRequired"]), Convert.ToDateTime(formCollection["MSGDiscussionDate"]), Convert.ToInt32(formCollection["AvoidabilityScoreID"]),
                    formCollection["Comments"], formCollection["FeedbackToNoK"], id);
                actionName = "MortalityReview";
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Stage2SJRformFirstStep(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsSJRFormInitial medicalExaminerReview = new clsSJRFormInitial();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                if (Request.HttpMethod != "POST")
                {
                    medicalExaminerReview = dBEngine.GetSJRFormInitial(id);
                }
                ViewBag.ExcellentRatingID = dBEngine.GetRatingIDByName("Excellent");
                ViewBag.GoodRatingID = dBEngine.GetRatingIDByName("Good");
                ViewBag.AdequateRatingID = dBEngine.GetRatingIDByName("Adequate");
                ViewBag.PoorRatingID = dBEngine.GetRatingIDByName("Poor");
                ViewBag.VeryPoorRatingID = dBEngine.GetRatingIDByName("Very Poor");
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(medicalExaminerReview);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Stage2SJRFormSecondStep(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsSJRFormProblemType sjrProblemType = new clsSJRFormProblemType();
            try
            {                 
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                if (Request.HttpMethod != "POST")
                {
                    sjrProblemType = dBEngine.GetSJRProblemType(id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(sjrProblemType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Stage3SJRFormSecondStep(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsSJRFormProblemType sjrProblemType = new clsSJRFormProblemType();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                if (Request.HttpMethod != "POST")
                {
                    sjrProblemType = dBEngine.GetSJR2ProblemType(id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(sjrProblemType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnNext"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Stage2SJRformFirstStep(FormCollection formCollection, string BtnNext, int? id)
        {
            string actionName = "";
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                int retVal = dBEngine.UpdateSJRFormInitial(formCollection["InitialManagement"], formCollection["hdfInitialManagementCareRating"],
                    formCollection["OngoingCare"], formCollection["hdfOnGoingCareRating"], formCollection["CareDuringProcedure"], formCollection["hdfCareDuringProcedureCareRating"],
                    formCollection["EndLifeCare"], formCollection["hdfEndLifeCareRating"], formCollection["OverAllAssessment"], formCollection["hdfOverAllAssessmentCareRating"],
                    formCollection["hdfQualityDocumentationCareRating"], id);
                actionName = "Stage2SJRFormSecondStep";
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnFinish"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Stage2SJRformSecondStep(FormCollection formCollection, string BtnPrevious, string BtnFinish, int? id)
        {
            string actionName = "";
            try
            {
                int PID = Convert.ToInt32(Session["PId"]);
                if (BtnPrevious != null)
                    actionName = "Stage2SJRformFirstStep";

                if (BtnFinish != null)
                {
                    if (formCollection["hdfProblemOccured"] == "Yes") formCollection["hdfProblemOccured"] = "true"; else formCollection["hdfProblemOccured"] = "false";
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    int retVal = dBEngine.UpdateSJR1ProblemType(Convert.ToInt32(formCollection["AssessmentResponseID"]), Convert.ToInt32(formCollection["AssessmentCarePhaseID"]),
                        Convert.ToInt32(formCollection["MedicationResponseID"]), Convert.ToInt32(formCollection["MedicationCarePhaseID"]), Convert.ToInt32(formCollection["TreatmentResponseID"]),
                        Convert.ToInt32(formCollection["TreatmentCarePhaseID"]), Convert.ToInt32(formCollection["InfectionResponseID"]), Convert.ToInt32(formCollection["InfectionCarePhaseID"]),
                        Convert.ToInt32(formCollection["ProcedureResponseID"]), Convert.ToInt32(formCollection["ProcedureCarePhaseID"]),
                        Convert.ToInt32(formCollection["MonitoringResponseID"]), Convert.ToInt32(formCollection["ResuscitationResponseID"]),
                        Convert.ToInt32(formCollection["OthertypeResponseID"]), Convert.ToInt32(formCollection["OthertypeCarePhaseID"]), Convert.ToInt32(formCollection["AvoidabilityScoreID"]),
                        formCollection["Comments"], formCollection["SIRIComments"], Convert.ToBoolean(formCollection["hdfProblemOccured"]), id);
                    actionName = "MortalityReview";
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Stage3SJRformFirstStep(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsSJRFormInitial medicalExaminerReview = new clsSJRFormInitial();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                if (Request.HttpMethod != "POST")
                {
                    medicalExaminerReview = dBEngine.GetSJR2FormInitial(id);
                }
                ViewBag.ExcellentRatingID = dBEngine.GetRatingIDByName("Excellent");
                ViewBag.GoodRatingID = dBEngine.GetRatingIDByName("Good");
                ViewBag.AdequateRatingID = dBEngine.GetRatingIDByName("Adequate");
                ViewBag.PoorRatingID = dBEngine.GetRatingIDByName("Poor");
                ViewBag.VeryPoorRatingID = dBEngine.GetRatingIDByName("Very Poor");
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(medicalExaminerReview);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnNext"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Stage3SJRformFirstStep(FormCollection formCollection, string BtnNext, int? id)
        {
            string actionName = "";
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                int retVal = dBEngine.UpdateSJR2FormInitial(formCollection["InitialManagement"], formCollection["hdfInitialManagementCareRating"],
                    formCollection["OngoingCare"], formCollection["hdfOnGoingCareRating"], formCollection["CareDuringProcedure"], formCollection["hdfCareDuringProcedureCareRating"],
                    formCollection["EndLifeCare"], formCollection["hdfEndLifeCareRating"], formCollection["OverAllAssessment"], formCollection["hdfOverAllAssessmentCareRating"],
                    formCollection["hdfQualityDocumentationCareRating"], id);
                actionName = "Stage3SJRFormSecondStep";
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnFinish"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Stage3SJRformSecondStep(FormCollection formCollection, string BtnPrevious, string BtnFinish, int? id)
        {
            string actionName = "";
            try
            {
                int PID = Convert.ToInt32(Session["PId"]);
                if (BtnPrevious != null)
                    actionName = "Stage3SJRformFirstStep";

                if (BtnFinish != null)
                {
                    if (formCollection["hdfProblemOccured"] == "Yes") formCollection["hdfProblemOccured"] = "true"; else formCollection["hdfProblemOccured"] = "false";
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    int retVal = dBEngine.UpdateSJR2ProblemType(Convert.ToInt32(formCollection["AssessmentResponseID"]), Convert.ToInt32(formCollection["AssessmentCarePhaseID"]),
                        Convert.ToInt32(formCollection["MedicationResponseID"]), Convert.ToInt32(formCollection["MedicationCarePhaseID"]), Convert.ToInt32(formCollection["TreatmentResponseID"]),
                        Convert.ToInt32(formCollection["TreatmentCarePhaseID"]), Convert.ToInt32(formCollection["InfectionResponseID"]), Convert.ToInt32(formCollection["InfectionCarePhaseID"]),
                        Convert.ToInt32(formCollection["ProcedureResponseID"]), Convert.ToInt32(formCollection["ProcedureCarePhaseID"]),
                        Convert.ToInt32(formCollection["MonitoringResponseID"]), Convert.ToInt32(formCollection["ResuscitationResponseID"]),
                        Convert.ToInt32(formCollection["OthertypeResponseID"]), Convert.ToInt32(formCollection["OthertypeCarePhaseID"]), Convert.ToInt32(formCollection["AvoidabilityScoreID"]),
                        formCollection["Comments"], formCollection["SIRIComments"], Convert.ToBoolean(formCollection["hdfProblemOccured"]), id);
                    actionName = "MortalityReview";
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult PatientDetails(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            List<clsPatientDetails> patientDetails = new List<clsPatientDetails>();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                ViewBag.Diagnoses = dBEngine.GetDiagnosisDetails(id);
                ViewBag.Procedures = dBEngine.GetProcedureDetails(id);
                if (Request.HttpMethod != "POST")
                {
                    patientDetails = dBEngine.GetPatientDetailsByID(id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(patientDetails[0]);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="btnCloseYes"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PatientDetails(FormCollection formCollection, string btnCloseYes, int id)
        {
            List<clsPatientDetails> patientDetails = new List<clsPatientDetails>();
            bool isCodingIssueIdentified = false;

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dbEngine = new DBEngine(connectionString);

                if (Convert.ToString(formCollection["CodingIssueIdentified"]) == "on") isCodingIssueIdentified = true;
                int retVal = dbEngine.UpdatePatientDetails(isCodingIssueIdentified, formCollection["Comments"], id);
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction("MedicalExaminerReview", new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult MedicalExaminerReview(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsMedicalExaminerReview medicalExaminerReview = new clsMedicalExaminerReview();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                ViewBag.MedicalExaminers = dBEngine.GetMedicalExaminers();
                if (Request.HttpMethod != "POST")
                {
                    medicalExaminerReview = dBEngine.GetMedicalExaminerReview(id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(medicalExaminerReview);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="groupid"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetReferralReasons(int? groupid)
        {
            List<clsCoronerReferralReason> referralReasons = new List<clsCoronerReferralReason>();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                referralReasons = dBEngine.GetCoronerReferralReasons(groupid);
                ViewBag.CoronerReferralReasons = referralReasons;
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return Json(referralReasons, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnNext"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult MedicalExaminerReview(FormCollection formCollection, string BtnPrevious, string BtnNext, int? id)
        {
            string actionName = "";
            try
            {
                bool isQAP_Discussion = false;
                bool isNotes_Review = false;
                bool isNok_Discussion = false;

                if (BtnPrevious != null)
                    actionName = "PatientDetails";

                if (BtnNext != null)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    ViewBag.MedicalExaminers = dBEngine.GetMedicalExaminers();
                    if (Convert.ToString(formCollection["QAP_Discussion"]) == "on") isQAP_Discussion = true;
                    if (Convert.ToString(formCollection["Notes_Review"]) == "on") isNotes_Review = true;
                    if (Convert.ToString(formCollection["Nok_Discussion"]) == "on") isNok_Discussion = true;
                    if (formCollection["ddlDischargeSpeciality"] == "") formCollection["ddlDischargeSpeciality"] = "0";
                    int retVal = dBEngine.UpdateMedicalExaminerReview(isQAP_Discussion, isNotes_Review, isNok_Discussion, Convert.ToInt32(formCollection["ddlDischargeSpeciality"]), formCollection["QAPName"], formCollection["Comments"], id);
                    actionName = "MedicalExaminerDecision";
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult MedicalExaminerDecision(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsMedicalExaminerDecision medicalExaminerDecision = new clsMedicalExaminerDecision();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                medicalExaminerDecision = dBEngine.GetMedicalExaminerDecision(id);
                ViewBag.ReasonGroups = dBEngine.GetReasonGroups();
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(medicalExaminerDecision);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnNext"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult MedicalExaminerDecision(FormCollection formCollection, string BtnPrevious, string BtnNext, int id)
        {
            bool isMCCDissue = false;
            bool isCoronerReferral = false;
            bool isHospitalPostMortem = false;
            bool isDeathCertificate = false;
            bool isCornerReferralComplete = false;
            bool isCoronerDecisionInquest = false;
            bool isCoronerDecisionPostMortem = false;
            bool isCoronerDecision100A = false;
            bool isCoronerDecisionGPissue = false;
            string actionName = "";
            try
            {
                if (BtnPrevious != null)
                    actionName = "MedicalExaminerReview";
                if (BtnNext != null)
                {
                    actionName = "SJRAssessmentTriage";
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    if (Convert.ToString(formCollection["MCCDissue"]) == "on") isMCCDissue = true;
                    if (Convert.ToString(formCollection["CoronerReferral"]) == "on") isCoronerReferral = true;
                    if (Convert.ToString(formCollection["HospitalPostMortem"]) == "on") isHospitalPostMortem = true;
                    if (Convert.ToString(formCollection["DeathCertificate"]) == "on") isDeathCertificate = true;
                    if (Convert.ToString(formCollection["CornerReferralComplete"]) == "on") isCornerReferralComplete = true;
                    if (Convert.ToString(formCollection["CoronerDecisionInquest"]) == "on") isCoronerDecisionInquest = true;
                    if (Convert.ToString(formCollection["CoronerDecisionPostMortem"]) == "on") isCoronerDecisionPostMortem = true;
                    if (Convert.ToString(formCollection["CoronerDecision100A"]) == "on") isCoronerDecision100A = true;
                    if (Convert.ToString(formCollection["CoronerDecisionGPissue"]) == "on") isCoronerDecisionGPissue = true;
                    int retVal = dBEngine.UpdateMedicalExaminerDecision(isMCCDissue, isCoronerReferral, isHospitalPostMortem, isDeathCertificate, isCornerReferralComplete, isCoronerDecisionInquest, isCoronerDecisionPostMortem,
                       isCoronerDecision100A, isCoronerDecisionGPissue, Convert.ToInt32(formCollection["ddlCoronerReferral"]), formCollection["CauseOfDeath1"], formCollection["CauseOfDeath2"], formCollection["CauseOfDeath3"],
                       formCollection["CauseOfDeath4"], id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult SJRAssessmentTriage(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsSJRReview sJRAssement = new clsSJRReview();
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            sJRAssement = dBEngine.GetSJRAssesmentTraige(id);
            ViewBag.Specialities = dBEngine.GetSpecialitiesForDropDown();
            return View(sJRAssement);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnNext"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SJRAssessmentTriage(FormCollection formCollection, string BtnPrevious, string BtnNext, int? id)
        {
            string actionName = "";
            bool isPaediatricPatient = false;
            bool isLearningDisabilityPatient = false;
            bool isMentalillnessPatient = false;
            bool isElectiveAdmission = false;
            bool isNoKConcernsDeath = false;
            bool isOtherConcern = false;
            bool isFullSJRRequired = false;

            try
            {
                if (BtnPrevious != null)
                {
                    actionName = "MedicalExaminerDecision";
                }
                if (BtnNext != null)
                {
                    actionName = "OtherReferrals";
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    if (Convert.ToString(formCollection["PaediatricPatient"]) == "on") isPaediatricPatient = true;
                    if (Convert.ToString(formCollection["LearningDisabilityPatient"]) == "on") isLearningDisabilityPatient = true;
                    if (Convert.ToString(formCollection["MentalillnessPatient"]) == "on") isMentalillnessPatient = true;
                    if (Convert.ToString(formCollection["ElectiveAdmission"]) == "on") isElectiveAdmission = true;
                    if (Convert.ToString(formCollection["NoKConcernsDeath"]) == "on") isNoKConcernsDeath = true;
                    if (Convert.ToString(formCollection["OtherConcern"]) == "on") isOtherConcern = true;
                    if (Convert.ToString(formCollection["FullSJRRequired"]) == "on") isFullSJRRequired = true;
                    int retVal = dBEngine.UpdateSJRAssessmentTriage(isPaediatricPatient, isLearningDisabilityPatient, isMentalillnessPatient, isElectiveAdmission, isNoKConcernsDeath, isOtherConcern, isFullSJRRequired,
                       formCollection["OtherConcernDetails"], Convert.ToInt32(formCollection["ddlCoronerReferral"]), id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// Get Other referral details for a particular patient ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>ActionResult</returns>
        public ActionResult OtherReferrals(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsOtherReferralModel sJRAssement = new clsOtherReferralModel();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                sJRAssement = dBEngine.GetOtherReferrals(id);
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(sJRAssement);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnNext"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult OtherReferrals(FormCollection formCollection, string BtnPrevious, string BtnNext, int? id)
        {
            string actionName = "";
            bool isPatientSafetySIRI = false;
            bool isChildDeathCoordinator = false;
            bool isLearningDisabilityNurse = false;
            bool isHeadOfCompliance = false;
            bool isPALsComplaints = false;
            bool isWardTeam = false;
            bool isOther = false;
            try
            {
                if (BtnPrevious != null)
                {
                    actionName = "SJRAssessmentTriage";
                }
                if (BtnNext != null)
                {
                    actionName = "PositiveFeedback";
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    if (Convert.ToString(formCollection["PatientSafetySIRI"]) == "on") isPatientSafetySIRI = true;
                    if (Convert.ToString(formCollection["ChildDeathCoordinator"]) == "on") isChildDeathCoordinator = true;
                    if (Convert.ToString(formCollection["LearningDisabilityNurse"]) == "on") isLearningDisabilityNurse = true;
                    if (Convert.ToString(formCollection["HeadOfCompliance"]) == "on") isHeadOfCompliance = true;
                    if (Convert.ToString(formCollection["PALsComplaints"]) == "on") isPALsComplaints = true;
                    if (Convert.ToString(formCollection["WardTeam"]) == "on") isWardTeam = true;
                    if (Convert.ToString(formCollection["Other"]) == "on") isOther = true;
                    int retVal = dBEngine.UpdateOtherReferrals(isPatientSafetySIRI, isChildDeathCoordinator, isLearningDisabilityNurse, isHeadOfCompliance, isPALsComplaints, isWardTeam, isOther,
                       formCollection["PatientSafetySIRIReason"], formCollection["HeadOfComplianceReason"], formCollection["PALsComplaintsReason"], formCollection["WardTeamReason"], formCollection["OtherReason"], id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult PositiveFeedback(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            clsFeedBackModel feedback = new clsFeedBackModel();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                feedback = dBEngine.GetFeedback(id);
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(feedback);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="clsFeedBackModel"></param>
        /// <param name="BtnPrevious"></param>
        /// <param name="BtnFinish"></param>
        /// <param name="BtnNext"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PositiveFeedback(FormCollection formCollection, string BtnPrevious, string BtnFinish, string BtnNext, int id)
        {
            string actionName = "";
            bool isFormCompleted = false;
            bool isComplementsFedBack = false;
            try
            {
                if (BtnPrevious != null)
                    actionName = "OtherReferrals";
                if (BtnFinish != null)
                {
                    actionName = "MortalityReview";
                    string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                    DBEngine dBEngine = new DBEngine(connectionString);
                    if (Convert.ToString(formCollection["FormCompleted"]) == "on") isFormCompleted = true;
                    if (Convert.ToString(formCollection["ComplementsFedBack"]) == "on") isComplementsFedBack = true;
                    int retVal = dBEngine.UpdatePositiveFeedback(isFormCompleted, isComplementsFedBack, id);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return RedirectToAction(actionName, new { id = id });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="formCollection"></param>
        /// <param name="btnSearch"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult MedicalExaminerDashboard(FormCollection formCollection, string btnSearch, int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            List<clsPatientDetails> patientDetails = new List<clsPatientDetails>();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                ViewBag.LoadDischargeSpecialityDropdown = dBEngine.GetSpecialities();
                ViewBag.wardDeathDropdown = dBEngine.GetWardOfDeaths();
                ViewBag.dischargeConsultantDropdown = dBEngine.GetConsultants();
                if (Request.HttpMethod != "POST")
                {
                    patientDetails = dBEngine.GetPatientDetails(id);
                }
                else
                {
                    if (formCollection["txtStartDate"] == "")
                        formCollection["txtStartDate"] = "1/1/1990";
                    if (formCollection["txtEndDate"] == "")
                        formCollection["txtEndDate"] = DateTime.Now.ToString("dd/MM/yyyy");
                    ViewBag.StartDate = formCollection["txtStartDate"];
                    ViewBag.EndDate = formCollection["txtEndDate"];
                    ViewBag.DischargeConsultant = formCollection["ddlDischargeConsultant"];
                    ViewBag.WardDeath = formCollection["ddlWardDeath"];
                    ViewBag.Speciality = formCollection["ddlDischargeSpeciality"];
                    patientDetails = dBEngine.GetFilteredPatientDetails(Convert.ToDateTime(formCollection["txtStartDate"]), Convert.ToDateTime(formCollection["txtEndDate"]), formCollection["ddlDischargeConsultant"],
                        formCollection["ddlWardDeath"], formCollection["ddlDischargeSpeciality"]);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(patientDetails);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult MortalityReview(int? id)
        {
            bool isUser = GetUserDetailsFromAD();
            List<clsPatientDetails> patientDetails = new List<clsPatientDetails>();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
                DBEngine dBEngine = new DBEngine(connectionString);
                patientDetails = dBEngine.GetPatientDetails(id);
                ViewBag.PatientHistoryLink = "'" + "http://rbhbedred001/#/views/R550_RBH_Mortality_Reviews/PatientHistory?:iid=" + id.ToString() + "'";
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return View(patientDetails[0]);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private bool GetUserDetailsFromAD()
        {
            bool isValid = false;
            string FullName = string.Empty;
            DBEngine dBEngine = new DBEngine(ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString);

            try
            {
                //string LDAPUrl = ConfigurationManager.AppSettings["LDAPURL"].ToString();
                string userName = Environment.GetEnvironmentVariable("USERNAME");
                //if (string.IsNullOrWhiteSpace(LDAPUrl))
                //{
                //    if (string.IsNullOrWhiteSpace(UserName))
                //    {
                //        dBEngine.WriteLog("LDAPUrl is blank or not provided & UserName could not be retieved from environment");
                //        TempData["FullName"] = "";
                //    }
                //    else
                //    {
                //        dBEngine.WriteLog($"LDAPUrl is blank or not provided but UserName {UserName} was retieved from environment");
                //        TempData["FullName"] = UserName;
                //    }
                //}
                //else
                //{
                if (string.IsNullOrWhiteSpace(userName))
                {
                    Session["FullName"] = "";
                    //dBEngine.WriteLog($"UserName could not be retieved from environment");
                }
                //else
                //{
                //    DirectoryEntry rootEntry = new DirectoryEntry(LDAPUrl);
                //    rootEntry.AuthenticationType = AuthenticationTypes.None;
                //    DirectorySearcher searcher = new DirectorySearcher(rootEntry);
                //    var queryFormat = "(&(objectClass=user)(objectCategory=person)(|(SAMAccountName=*{0}*)(cn=*{0}*)(gn=*{0}*)(sn=*{0}*)(email=*{0}*)))";
                //    searcher.Filter = string.Format(queryFormat, UserName);
                //    foreach (SearchResult result in searcher.FindAll())
                //    {
                //        FullName = result.Properties["cn"].Count > 0 ? result.Properties["cn"][0].ToString() : string.Empty;
                //    }
                //    if (string.IsNullOrWhiteSpace(FullName))
                //    {
                //        dBEngine.WriteLog($"LDAP URL was provided {LDAPUrl} BUT User - {UserName} not found in AD");
                //        FullName = UserName;
                //        isValid = false;
                //    }
                //else
                //{
                AppUsers user = dBEngine.ValidateUser(userName);
                if ( user.IsFound == true)
                    isValid = true;
                else
                    isValid = false;
                Session["FullName"] = user.FirstName + " " + user.LastName;
            }
            catch (Exception ex)
            {
                Console.Write(ex.StackTrace);
            }
            return isValid;
        }
    }
}
