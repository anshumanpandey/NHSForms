using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using NHS.Common;
using NHS.Common.DTO;


namespace NHS.Data
{
    public class DBEngine
    {
        private static SqlConnection _connection = null;
        private static SqlCommand command = null;
        private string connectionString = string.Empty;
        public DBEngine(string connectionString) { this.connectionString = connectionString; }

        private SqlConnection GetConnection()
        {
            if (_connection == null)
                _connection = new SqlConnection(connectionString);
            else if (_connection.State == ConnectionState.Closed)
                _connection.ConnectionString = connectionString;

            if (_connection.State != ConnectionState.Open)
                _connection.Open();
            return _connection;
        }

        /// <summary>
        /// This method brings in all patient lists or brings in a specific patient information based on the
        /// nhs number.
        /// </summary>
        /// <param name="nhsNumber">string</param>
        /// <returns>List<clsPatientDetails>Patient Details List</returns>
        public List<clsPatientDetails> GetPatientDetails(int? patientID)
        {
            var connection = GetConnection();
            SqlDataReader dbReader = null;
            List <clsPatientDetails> lstPatientDetails = new List<clsPatientDetails>();
            try
            {   
                SqlCommand dbCmd = new SqlCommand("usp_GetPatientDashboardDetails", connection);
                dbCmd.CommandType = CommandType.StoredProcedure;
                if(patientID != null)
                    dbCmd.Parameters.AddWithValue("@PatientID", patientID);
                else
                    dbCmd.Parameters.AddWithValue("@PatientID", "");

                dbReader = dbCmd.ExecuteReader();

                while (dbReader.Read())
                {
                    clsPatientDetails patientDashboard = new clsPatientDetails();
                    patientDashboard.ID = Convert.ToInt32(dbReader["ID"]);
                    patientDashboard.PatientId = Convert.ToString(dbReader["PatientId"]);
                    patientDashboard.SpellNumber = Convert.ToInt32(dbReader["SpellNumber"]);
                    patientDashboard.NHSNumber = Convert.ToString(dbReader["NHSNumber"]);
                    patientDashboard.PatientName = Convert.ToString(dbReader["PatientName"]);
                    patientDashboard.DOB = Convert.ToDateTime(dbReader["DOB"]).ToString("dd/MM/yyyy");
                    patientDashboard.DateofAdmission = Convert.ToDateTime(dbReader["DateOfAdmission"]).ToString("dd/MM/yyyy");
                    patientDashboard.DateofDeath = Convert.ToDateTime(dbReader["DateOfDeath"]).ToString("dd/MM/yyyy");
                    patientDashboard.WardofDeath = Convert.ToString(dbReader["WardOfDeath"]);
                    patientDashboard.DischargeConsutantName = Convert.ToString(dbReader["DischargeConsultantName"]);
                    patientDashboard.AdmissionType = Convert.ToString(dbReader["AdmissionType"]);
                    patientDashboard.MedTriage = Convert.ToInt32(dbReader["MedTriage"]);
                    patientDashboard.SJR1 = Convert.ToInt32(dbReader["SJR1"]);
                    patientDashboard.SJR2 = Convert.ToInt32(dbReader["SJR2"]);
                    patientDashboard.SJROutcome = Convert.ToInt32(dbReader["SJROutcome"]);
                    patientDashboard.Age = Convert.ToInt32(dbReader["Age"]);
                    patientDashboard.Gender = Convert.ToString(dbReader["Gender"]);
                    patientDashboard.TimeofAdmission = Convert.ToDateTime(dbReader["TimeofAdmission"].ToString()).ToString("HH:mm");
                    patientDashboard.TimeofDeath = Convert.ToDateTime(dbReader["TimeOfDeath"].ToString()).ToString("HH:mm");
                    patientDashboard.DischargeWard = Convert.ToString(dbReader["DischargeWard"]);
                    patientDashboard.DischargeConsultantCode = Convert.ToString(dbReader["DischargeConsultantCode"]);
                    patientDashboard.DischargeSpecialtyCode = Convert.ToString(dbReader["DischargeSpecialityCode"]);
                    patientDashboard.DischargeSpeciality = Convert.ToString(dbReader["DischargeSpeciality"]);
                    patientDashboard.Caregroup = Convert.ToString(dbReader["Caregroup"]);
                    patientDashboard.ComorbiditiesCount = Convert.ToInt32(dbReader["ComorbiditiesCount"]);
                    patientDashboard.IsFullSJRRequired = Convert.ToBoolean(dbReader["IsFullSJRRequired"]);
                    patientDashboard.Stage2SJRRequired = Convert.ToBoolean(dbReader["Stage2SJRRequired"]);
                    lstPatientDetails.Add(patientDashboard);
                }                
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dbReader.IsClosed)
                    dbReader.Close();
            }
            return lstPatientDetails;
        }

        /// <summary>
        /// This method brings in all patient lists or brings in a specific patient information based on the
        /// nhs number.
        /// </summary>
        /// <param name="nhsNumber">string</param>
        /// <returns>List<clsPatientDetails>Patient Details List</returns>
        public List<clsPatientDetails> GetPatientDetailsByID(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dbReader = null;
            List<clsPatientDetails> lstPatientDetails = new List<clsPatientDetails>();
            try
            {
                SqlCommand dbCmd = new SqlCommand("usp_GetPatientDetailsByID", connection);
                dbCmd.CommandType = CommandType.StoredProcedure;
                if (id != null)
                    dbCmd.Parameters.AddWithValue("@PatientID", id);
                else
                    dbCmd.Parameters.AddWithValue("@PatientID", null);

                dbReader = dbCmd.ExecuteReader();

                while (dbReader.Read())
                {
                    clsPatientDetails patientDashboard = new clsPatientDetails();
                    patientDashboard.ID = Convert.ToInt32(dbReader["ID"]);
                    patientDashboard.PatientId = Convert.ToString(dbReader["PatientId"]);
                    patientDashboard.SpellNumber = Convert.ToInt32(dbReader["SpellNumber"]);
                    patientDashboard.NHSNumber = Convert.ToString(dbReader["NHSNumber"]);
                    patientDashboard.PatientName = Convert.ToString(dbReader["PatientName"]);
                    patientDashboard.DOB = Convert.ToDateTime(dbReader["DOB"]).ToString("dd/MM/yyyy");
                    patientDashboard.DateofAdmission = Convert.ToDateTime(dbReader["DateOfAdmission"]).ToString("dd/MM/yyyy");
                    patientDashboard.DateofDeath = Convert.ToDateTime(dbReader["DateOfDeath"]).ToString("dd/MM/yyyy");
                    patientDashboard.WardofDeath = Convert.ToString(dbReader["WardOfDeath"]);
                    patientDashboard.DischargeConsutantName = Convert.ToString(dbReader["DischargeConsultantName"]);
                    patientDashboard.AdmissionType = Convert.ToString(dbReader["AdmissionType"]);
                    patientDashboard.MedTriage = Convert.ToInt32(dbReader["MedTriage"]);
                    patientDashboard.SJR1 = Convert.ToInt32(dbReader["SJR1"]);
                    patientDashboard.SJR2 = Convert.ToInt32(dbReader["SJR2"]);
                    patientDashboard.SJROutcome = Convert.ToInt32(dbReader["SJROutcome"]);
                    patientDashboard.Age = Convert.ToInt32(dbReader["Age"]);
                    patientDashboard.Gender = Convert.ToString(dbReader["Gender"]);
                    patientDashboard.TimeofAdmission = Convert.ToDateTime(dbReader["TimeofAdmission"].ToString()).ToString("HH:mm");
                    patientDashboard.TimeofDeath = Convert.ToDateTime(dbReader["TimeOfDeath"].ToString()).ToString("HH:mm");
                    patientDashboard.DischargeWard = Convert.ToString(dbReader["DischargeWard"]);
                    patientDashboard.DischargeConsultantCode = Convert.ToString(dbReader["DischargeConsultantCode"]);
                    patientDashboard.DischargeSpecialtyCode = Convert.ToString(dbReader["DischargeSpecialityCode"]);
                    patientDashboard.DischargeSpeciality = Convert.ToString(dbReader["DischargeSpeciality"]);
                    patientDashboard.Caregroup = Convert.ToString(dbReader["Caregroup"]);
                    patientDashboard.ComorbiditiesCount = Convert.ToInt32(dbReader["ComorbiditiesCount"]);
                    patientDashboard.IsFullSJRRequired = Convert.ToBoolean(dbReader["IsFullSJRRequired"]);
                    patientDashboard.Stage2SJRRequired = Convert.ToBoolean(dbReader["Stage2SJRRequired"]);
                    patientDashboard.PrimaryDiagnosis = Convert.ToString(dbReader["PrimaryDiagnosis"]);
                    patientDashboard.PrimaryProcedure = Convert.ToString(dbReader["PrimaryProcedure"]);
                    patientDashboard.ProcedureCount = Convert.ToInt32(dbReader["ProcedureCount"]);
                    patientDashboard.DiagnosisCount = Convert.ToInt32(dbReader["DiagnosisCount"]);
                    patientDashboard.CodingIssueIdentified = Convert.ToBoolean(dbReader["CodingIssueIdentified"]);
                    patientDashboard.Comments = Convert.ToString(dbReader["Comments"]);
                    lstPatientDetails.Add(patientDashboard);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dbReader.IsClosed)
                    dbReader.Close();
            }
            return lstPatientDetails;
        }

        /// <summary>
        /// Update details of medical examiner decision tab into the database for a particular patient ID
        /// </summary>
        /// <param name="isMCCDissue">bool</param>
        /// <param name="isCoronerReferral">bool</param>
        /// <param name="isHospitalPostMortem">bool</param>
        /// <param name="isDeathCertificate">bool</param>
        /// <param name="isCornerReferralComplete">bool</param>
        /// <param name="isCoronerDecisionInquest">bool</param>
        /// <param name="isCoronerDecisionPostMortem">bool</param>
        /// <param name="isCoronerDecision100A">bool</param>
        /// <param name="isCoronerDecisionGPissue">bool</param>
        /// <param name="ReasonID">int</param>
        /// <param name="CauseOfDeath1">string</param>
        /// <param name="CauseOfDeath2">string</param>
        /// <param name="CauseOfDeath3">string</param>
        /// <param name="CauseOfDeath4">string</param>
        /// <param name="id">int</param>
        /// <returns>int</returns>
        public int UpdateMedicalExaminerDecision(bool isMCCDissue, bool isCoronerReferral, bool isHospitalPostMortem, bool isDeathCertificate, bool isCornerReferralComplete, bool isCoronerDecisionInquest, bool isCoronerDecisionPostMortem,
            bool isCoronerDecision100A, bool isCoronerDecisionGPissue, int ReasonID, string CauseOfDeath1, string CauseOfDeath2, string CauseOfDeath3, string CauseOfDeath4, int id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpsertMedExaminerDecision", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@isMCCDissue", isMCCDissue);
                dbCommand.Parameters.AddWithValue("@isCoronerReferral", isCoronerReferral);
                dbCommand.Parameters.AddWithValue("@isHospitalPostMortem", isHospitalPostMortem);
                dbCommand.Parameters.AddWithValue("@isDeathCertificate", isDeathCertificate);
                dbCommand.Parameters.AddWithValue("@isCornerReferralComplete", isCornerReferralComplete);
                dbCommand.Parameters.AddWithValue("@isCoronerDecisionInquest", isCoronerDecisionInquest);
                dbCommand.Parameters.AddWithValue("@isCoronerDecisionPostMortem", isCoronerDecisionPostMortem);
                dbCommand.Parameters.AddWithValue("@isCoronerDecision100A", isCoronerDecision100A);
                dbCommand.Parameters.AddWithValue("@isCoronerDecisionGPissue", isCoronerDecisionGPissue);
                dbCommand.Parameters.AddWithValue("@ReasonID", ReasonID);
                dbCommand.Parameters.AddWithValue("@CauseOfDeath1", CauseOfDeath1);
                dbCommand.Parameters.AddWithValue("@CauseOfDeath2", CauseOfDeath2);
                dbCommand.Parameters.AddWithValue("@CauseOfDeath3", CauseOfDeath3);
                dbCommand.Parameters.AddWithValue("@CauseOfDeath4", CauseOfDeath4);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Get distinct discharge speciality names for the filter drop down.
        /// </summary>
        /// <returns>List<DischargeSpecialityNames></returns>
        public List<DischargeSpecialityNames> GetSpecialities()
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            List<DischargeSpecialityNames> dischargeSpecialityNames = new List<DischargeSpecialityNames>();

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSpecialityNames", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    DischargeSpecialityNames dischargeSpeciality = new DischargeSpecialityNames();
                    dischargeSpeciality.DischargeSpecialityCode = Convert.ToString(dataReader["DischargeSpecialityCode"]);
                    dischargeSpeciality.DischargeSpeciality = Convert.ToString(dataReader["DischargeSpeciality"]);
                    dischargeSpecialityNames.Add(dischargeSpeciality);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return dischargeSpecialityNames;
        }

        public List<clsDataManagement> GetDataSets()
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            List<clsDataManagement> datasets = new List<clsDataManagement>();

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_DataManagementDetails", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    clsDataManagement dataset = new clsDataManagement();
                    dataset.SourceSystem = Convert.ToString(dataReader["SourceSystem"]);
                    dataset.DataSet = Convert.ToString(dataReader["DataSet"]);
                    dataset.DQRag = Convert.ToInt32(dataReader["DQRag"]);
                    dataset.UpdateDate = Convert.ToDateTime(dataReader["UpdateDate"]).ToString("dd-MMM-yyyy");
                    dataset.UpdateTime = Convert.ToDateTime(dataReader["UpdateTime"].ToString()).ToString("HH:mm");
                    datasets.Add(dataset);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return datasets;
        }

        /// <summary>
        /// Get positive feedback form details for particular patient ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsFeedBackModel</returns>
        public clsFeedBackModel GetFeedback(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            clsFeedBackModel feedback = new clsFeedBackModel();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetFeedback", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {                    
                    feedback.Patient_ID = Convert.ToInt32(dataReader["Patient_ID"]);
                    feedback.FormCompleted = Convert.ToBoolean(dataReader["FormCompleted"]);
                    feedback.ComplementsFedBack = Convert.ToBoolean(dataReader["ComplementsFedBack"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return feedback;
        }


        public int GetRatingIDByName(string name)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            int ratingID = 0;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetRatingIDByName", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@Name", name);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    ratingID = Convert.ToInt32(dataReader["CareRatingID"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return ratingID;
        }

        /// <summary>
        /// Get SJR1 Form step 1 details based on patientID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsSJRFormInitial</returns>
        public clsSJRFormInitial GetSJRFormInitial(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            clsSJRFormInitial sjrFormInitial = new clsSJRFormInitial();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSJRFormInitial", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    sjrFormInitial.Patient_ID = Convert.ToInt32(dataReader["Patient_ID"]);
                    sjrFormInitial.PatientID = Convert.ToString(dataReader["PatientID"]);
                    string InitialManagement = "";
                    if (dataReader["InitialManagement"] != null) InitialManagement = Convert.ToString(dataReader["InitialManagement"]);
                    sjrFormInitial.InitialManagement = InitialManagement;
                    int InitialManagementCareRatingID = 0;
                    if(dataReader["InitialManagementCareRatingID"] != null) InitialManagementCareRatingID = Convert.ToInt32(dataReader["InitialManagementCareRatingID"]);
                    sjrFormInitial.InitialManagementCareRatingID = InitialManagementCareRatingID;
                    string OngoingCare = "";
                    if (dataReader["OngoingCare"] != null) OngoingCare = Convert.ToString(dataReader["OngoingCare"]);
                    sjrFormInitial.OngoingCare = OngoingCare;
                    int OngoingCareRatingID = 0;
                    if (dataReader["OngoingCareRatingID"] != null) OngoingCareRatingID = Convert.ToInt32(dataReader["OngoingCareRatingID"]);
                    sjrFormInitial.OngoingCareRatingID = OngoingCareRatingID;
                    string CareDuringProcedure = "";
                    if (dataReader["CareDuringProcedure"] != null) CareDuringProcedure = Convert.ToString(dataReader["CareDuringProcedure"]);
                    sjrFormInitial.CareDuringProcedure = CareDuringProcedure;
                    int CareDuringProcedureCareRatingID = 0;
                    if (dataReader["CareDuringProcedureCareRatingID"] != null) CareDuringProcedureCareRatingID = Convert.ToInt32(dataReader["CareDuringProcedureCareRatingID"]);
                    sjrFormInitial.CareDuringProcedureCareRatingID = CareDuringProcedureCareRatingID;
                    string EndLifeCare = "";
                    if (dataReader["EndLifeCare"] != null) EndLifeCare = Convert.ToString(dataReader["EndLifeCare"]);
                    sjrFormInitial.EndLifeCare = EndLifeCare;
                    int EndLifeCareRatingID = 0;
                    if (dataReader["EndLifeCareRatingID"] != null) EndLifeCareRatingID = Convert.ToInt32(dataReader["EndLifeCareRatingID"]);
                    sjrFormInitial.EndLifeCareRatingID = EndLifeCareRatingID;
                    string OverAllAssessment = "";
                    if (dataReader["OverAllAssessment"] != null) OverAllAssessment = Convert.ToString(dataReader["OverAllAssessment"]);
                    sjrFormInitial.OverAllAssessment = OverAllAssessment;
                    int OverAllAssessmentCareRatingID = 0;
                    if (dataReader["OverAllAssessmentCareRatingID"] != null) OverAllAssessmentCareRatingID = Convert.ToInt32(dataReader["OverAllAssessmentCareRatingID"]);
                    sjrFormInitial.OverAllAssessmentCareRatingID = OverAllAssessmentCareRatingID;
                    int QualityDocumentation = 0;
                    if (dataReader["QualityDocumentation"] != null) QualityDocumentation = Convert.ToInt32(dataReader["QualityDocumentation"]);
                    sjrFormInitial.QualityDocumentation = Convert.ToInt32(dataReader["QualityDocumentation"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return sjrFormInitial;
        }

        public clsSJRFormInitial GetSJR2FormInitial(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            clsSJRFormInitial sjrFormInitial = new clsSJRFormInitial();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSJR2FormInitial", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    sjrFormInitial.Patient_ID = Convert.ToInt32(dataReader["Patient_ID"]);
                    sjrFormInitial.PatientID = Convert.ToString(dataReader["PatientID"]);
                    string InitialManagement = "";
                    if (dataReader["InitialManagement"] != null) InitialManagement = Convert.ToString(dataReader["InitialManagement"]);
                    sjrFormInitial.InitialManagement = InitialManagement;
                    int InitialManagementCareRatingID = 0;
                    if (dataReader["InitialManagementCareRatingID"] != null) InitialManagementCareRatingID = Convert.ToInt32(dataReader["InitialManagementCareRatingID"]);
                    sjrFormInitial.InitialManagementCareRatingID = InitialManagementCareRatingID;
                    string OngoingCare = "";
                    if (dataReader["OngoingCare"] != null) OngoingCare = Convert.ToString(dataReader["OngoingCare"]);
                    sjrFormInitial.OngoingCare = OngoingCare;
                    int OngoingCareRatingID = 0;
                    if (dataReader["OngoingCareRatingID"] != null) OngoingCareRatingID = Convert.ToInt32(dataReader["OngoingCareRatingID"]);
                    sjrFormInitial.OngoingCareRatingID = OngoingCareRatingID;
                    string CareDuringProcedure = "";
                    if (dataReader["CareDuringProcedure"] != null) CareDuringProcedure = Convert.ToString(dataReader["CareDuringProcedure"]);
                    sjrFormInitial.CareDuringProcedure = CareDuringProcedure;
                    int CareDuringProcedureCareRatingID = 0;
                    if (dataReader["CareDuringProcedureCareRatingID"] != null) CareDuringProcedureCareRatingID = Convert.ToInt32(dataReader["CareDuringProcedureCareRatingID"]);
                    sjrFormInitial.CareDuringProcedureCareRatingID = CareDuringProcedureCareRatingID;
                    string EndLifeCare = "";
                    if (dataReader["EndLifeCare"] != null) EndLifeCare = Convert.ToString(dataReader["EndLifeCare"]);
                    sjrFormInitial.EndLifeCare = EndLifeCare;
                    int EndLifeCareRatingID = 0;
                    if (dataReader["EndLifeCareRatingID"] != null) EndLifeCareRatingID = Convert.ToInt32(dataReader["EndLifeCareRatingID"]);
                    sjrFormInitial.EndLifeCareRatingID = EndLifeCareRatingID;
                    string OverAllAssessment = "";
                    if (dataReader["OverAllAssessment"] != null) OverAllAssessment = Convert.ToString(dataReader["OverAllAssessment"]);
                    sjrFormInitial.OverAllAssessment = OverAllAssessment;
                    int OverAllAssessmentCareRatingID = 0;
                    if (dataReader["OverAllAssessmentCareRatingID"] != null) OverAllAssessmentCareRatingID = Convert.ToInt32(dataReader["OverAllAssessmentCareRatingID"]);
                    sjrFormInitial.OverAllAssessmentCareRatingID = OverAllAssessmentCareRatingID;
                    int QualityDocumentation = 0;
                    if (dataReader["QualityDocumentation"] != null) QualityDocumentation = Convert.ToInt32(dataReader["QualityDocumentation"]);
                    sjrFormInitial.QualityDocumentation = Convert.ToInt32(dataReader["QualityDocumentation"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return sjrFormInitial;
        }

        /// <summary>
        /// Get all sjr outcome form details for particular patient ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsSJROutcome</returns>
        public clsSJROutcome GetSJROutcome(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            clsSJROutcome sjrOutcome = new clsSJROutcome();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSJROutcome", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    sjrOutcome.Patient_ID = Convert.ToInt32(dataReader["Patient_ID"]);
                    sjrOutcome.PatientID = Convert.ToString(dataReader["PatientID"]);
                    sjrOutcome.Stage2SJRRequired = Convert.ToBoolean(dataReader["Stage2SJRRequired"]);
                    sjrOutcome.Stage2SJRDateSent = Convert.ToDateTime(dataReader["Stage2SJRDateSent"]).ToString("dd/MM/yyyy");
                    sjrOutcome.Stage2SJRSentTo = Convert.ToString(dataReader["Stage2SJRSentTo"]);
                    sjrOutcome.ReferenceNumber = Convert.ToString(dataReader["ReferenceNumber"]);
                    sjrOutcome.DateReceived = Convert.ToDateTime(dataReader["DateReceived"]).ToString("dd/MM/yyyy");
                    sjrOutcome.AvoidabilityScoreID = Convert.ToInt32(dataReader["AvoidabilityScoreID"]);
                    sjrOutcome.MSGRequired = Convert.ToBoolean(dataReader["MSGRequired"]);
                    sjrOutcome.MSGDiscussionDate = Convert.ToDateTime(dataReader["MSGDiscussionDate"]).ToString("dd/MM/yyyy");
                    sjrOutcome.Comments = Convert.ToString(dataReader["Comments"]);
                    sjrOutcome.SIRIComments = Convert.ToString(dataReader["SIRIComments"]);
                    sjrOutcome.FeedbackToNoK = Convert.ToString(dataReader["FeedbackToNoK"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return sjrOutcome;
        }

        /// <summary>
        /// Get all details for SJR1 step 2 for particular patient ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsSJRFormProblemType</returns>
        public clsSJRFormProblemType GetSJRProblemType(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            clsSJRFormProblemType sjrProblemType = new clsSJRFormProblemType();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSJRProblemType", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    sjrProblemType.Patient_ID = Convert.ToInt32(dataReader["Patient_ID"]);
                    sjrProblemType.PatientID = Convert.ToString(dataReader["PatientID"]);
                    sjrProblemType.ProblemOccured = Convert.ToBoolean(dataReader["ProblemOccured"]);
                    sjrProblemType.AssessmentResponseID = Convert.ToInt32(dataReader["AssessmentResponseID"]);
                    sjrProblemType.AssessmentCarePhaseID = Convert.ToInt32(dataReader["AssessmentCarePhaseID"]);
                    sjrProblemType.MedicationResponseID = Convert.ToInt32(dataReader["MedicationResponseID"]);
                    sjrProblemType.MedicationCarePhaseID = Convert.ToInt32(dataReader["MedicationCarePhaseID"]);
                    sjrProblemType.TreatmentResponseID = Convert.ToInt32(dataReader["TreatmentResponseID"]);
                    sjrProblemType.TreatmentCarePhaseID = Convert.ToInt32(dataReader["TreatmentCarePhaseID"]);
                    sjrProblemType.InfectionResponseID = Convert.ToInt32(dataReader["InfectionResponseID"]);
                    sjrProblemType.InfectionCarePhaseID = Convert.ToInt32(dataReader["InfectionCarePhaseID"]);
                    sjrProblemType.ProcedureResponseID = Convert.ToInt32(dataReader["ProcedureResponseID"]);
                    sjrProblemType.ProcedureCarePhaseID = Convert.ToInt32(dataReader["ProcedureCarePhaseID"]);
                    sjrProblemType.MonitoringResponseID = Convert.ToInt32(dataReader["MonitoringResponseID"]);
                    sjrProblemType.ResuscitationResponseID = Convert.ToInt32(dataReader["ResuscitationResponseID"]);
                    sjrProblemType.OthertypeResponseID = Convert.ToInt32(dataReader["OthertypeResponseID"]);
                    sjrProblemType.OthertypeCarePhaseID = Convert.ToInt32(dataReader["OthertypeCarePhaseID"]);
                    sjrProblemType.AvoidabilityScoreID = Convert.ToInt32(dataReader["AvoidabilityScoreID"]);
                    sjrProblemType.Comments = Convert.ToString(dataReader["Comments"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return sjrProblemType;
        }

        public clsSJRFormProblemType GetSJR2ProblemType(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            clsSJRFormProblemType sjrProblemType = new clsSJRFormProblemType();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSJR2ProblemType", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    sjrProblemType.Patient_ID = Convert.ToInt32(dataReader["Patient_ID"]);
                    sjrProblemType.PatientID = Convert.ToString(dataReader["PatientID"]);
                    sjrProblemType.ProblemOccured = Convert.ToBoolean(dataReader["ProblemOccured"]);
                    sjrProblemType.AssessmentResponseID = Convert.ToInt32(dataReader["AssessmentResponseID"]);
                    sjrProblemType.AssessmentCarePhaseID = Convert.ToInt32(dataReader["AssessmentCarePhaseID"]);
                    sjrProblemType.MedicationResponseID = Convert.ToInt32(dataReader["MedicationResponseID"]);
                    sjrProblemType.MedicationCarePhaseID = Convert.ToInt32(dataReader["MedicationCarePhaseID"]);
                    sjrProblemType.TreatmentResponseID = Convert.ToInt32(dataReader["TreatmentResponseID"]);
                    sjrProblemType.TreatmentCarePhaseID = Convert.ToInt32(dataReader["TreatmentCarePhaseID"]);
                    sjrProblemType.InfectionResponseID = Convert.ToInt32(dataReader["InfectionResponseID"]);
                    sjrProblemType.InfectionCarePhaseID = Convert.ToInt32(dataReader["InfectionCarePhaseID"]);
                    sjrProblemType.ProcedureResponseID = Convert.ToInt32(dataReader["ProcedureResponseID"]);
                    sjrProblemType.ProcedureCarePhaseID = Convert.ToInt32(dataReader["ProcedureCarePhaseID"]);
                    sjrProblemType.MonitoringResponseID = Convert.ToInt32(dataReader["MonitoringResponseID"]);
                    sjrProblemType.ResuscitationResponseID = Convert.ToInt32(dataReader["ResuscitationResponseID"]);
                    sjrProblemType.OthertypeResponseID = Convert.ToInt32(dataReader["OthertypeResponseID"]);
                    sjrProblemType.OthertypeCarePhaseID = Convert.ToInt32(dataReader["OthertypeCarePhaseID"]);
                    sjrProblemType.AvoidabilityScoreID = Convert.ToInt32(dataReader["AvoidabilityScoreID"]);
                    sjrProblemType.Comments = Convert.ToString(dataReader["Comments"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return sjrProblemType;
        }

        /// <summary>
        /// Get distinct discharge consultant names for the filter drop down.
        /// </summary>
        /// <returns>List<DischargeConsultants></returns>
        public List<DischargeConsultants> GetConsultants()
        {
            var connection = GetConnection();
            List<DischargeConsultants> dischargeConsultants = new List<DischargeConsultants>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetConsultants", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    DischargeConsultants dischargeConsultant = new DischargeConsultants();
                    dischargeConsultant.DischargeConsultantCode = Convert.ToString(dataReader["DischargeConsultantCode"]);
                    dischargeConsultant.DischargeConsultantName = Convert.ToString(dataReader["DischargeConsultantName"]);
                    dischargeConsultants.Add(dischargeConsultant);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return dischargeConsultants;
        }


        public List<Specialities> GetSpecialitiesForDropDown()
        {
            var connection = GetConnection();
            List<Specialities> specialities = new List<Specialities>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetSpecialities", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    Specialities speciality = new Specialities();
                    speciality.SpecialityName = Convert.ToString(dataReader["SpecialityName"]);
                    speciality.SpecialityID = Convert.ToInt32(dataReader["SpecialityID"]);
                    specialities.Add(speciality);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return specialities;
        }

        /// <summary>
        /// Get distinct ward of death names for the filter drop down.
        /// </summary>
        /// <returns>List<WardOfDeaths></returns>
        public List<WardOfDeaths> GetWardOfDeaths()
        {
            var connection = GetConnection();
            List<WardOfDeaths> wardOfDeaths = new List<WardOfDeaths>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetWardOfDeaths", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    WardOfDeaths wardOfDeath = new WardOfDeaths();
                    wardOfDeath.WardOfDeath = Convert.ToString(dataReader["WardOfDeath"]);
                    wardOfDeaths.Add(wardOfDeath);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return wardOfDeaths;
        }

        /// <summary>
        /// This method brings in all patient lists or brings in a specific patient information based on the
        /// nhs number.
        /// </summary>
        /// <param name="nhsNumber">string</param>
        /// <returns>List<clsPatientDetails>Patient Details List</returns>
        public List<clsPatientDetails> GetFilteredPatientDetails(DateTime startDate, DateTime endDate, string dischargeConsultantCode, string wardOfDeath, string dischargeSpecialityCode)
        {
            var connection = GetConnection();
            SqlDataReader dataReader = null;
            List<clsPatientDetails> lstPatientDetails = new List<clsPatientDetails>();
            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetFilteredPatientDetails", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                if (startDate != null)
                    dbCommand.Parameters.AddWithValue("@StartDate", startDate);
                else
                    dbCommand.Parameters.AddWithValue("@StartDate", "");
                if (endDate != null)
                    dbCommand.Parameters.AddWithValue("@EndDate", endDate);
                else
                    dbCommand.Parameters.AddWithValue("@EndDate", "");
                if (dischargeConsultantCode != null)
                    dbCommand.Parameters.AddWithValue("@DischargeConsultantCode", dischargeConsultantCode);
                else
                    dbCommand.Parameters.AddWithValue("@DischargeConsultantCode", "");
                if (wardOfDeath != null)
                    dbCommand.Parameters.AddWithValue("@WardOfDeath", wardOfDeath);
                else
                    dbCommand.Parameters.AddWithValue("@WardOfDeath", "");
                if (dischargeSpecialityCode != null)
                    dbCommand.Parameters.AddWithValue("@DischargeSpecialityCode", dischargeSpecialityCode);
                else
                    dbCommand.Parameters.AddWithValue("@DischargeSpecialityCode", "");

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    clsPatientDetails patientDashboard = new clsPatientDetails();
                    patientDashboard.ID = Convert.ToInt32(dataReader["ID"]);
                    patientDashboard.PatientId = Convert.ToString(dataReader["PatientId"]);
                    patientDashboard.SpellNumber = Convert.ToInt32(dataReader["SpellNumber"]);
                    patientDashboard.NHSNumber = Convert.ToString(dataReader["NHSNumber"]);
                    patientDashboard.PatientName = Convert.ToString(dataReader["PatientName"]);
                    patientDashboard.DOB = Convert.ToDateTime(dataReader["DOB"]).ToString("dd/MM/yyyy");
                    patientDashboard.DateofAdmission = Convert.ToDateTime(dataReader["DateOfAdmission"]).ToString("dd/MM/yyyy");
                    patientDashboard.DateofDeath = Convert.ToDateTime(dataReader["DateOfDeath"]).ToString("dd/MM/yyyy");
                    patientDashboard.WardofDeath = Convert.ToString(dataReader["WardOfDeath"]);
                    patientDashboard.DischargeConsutantName = Convert.ToString(dataReader["DischargeConsultantName"]);
                    patientDashboard.AdmissionType = Convert.ToString(dataReader["AdmissionType"]);
                    patientDashboard.MedTriage = Convert.ToInt32(dataReader["MedTriage"]);
                    patientDashboard.SJR1 = Convert.ToInt32(dataReader["SJR1"]);
                    patientDashboard.SJR2 = Convert.ToInt32(dataReader["SJR2"]);
                    patientDashboard.SJROutcome = Convert.ToInt32(dataReader["SJROutcome"]);
                    patientDashboard.Age = Convert.ToInt32(dataReader["Age"]);
                    patientDashboard.Gender = Convert.ToString(dataReader["Gender"]);
                    patientDashboard.TimeofAdmission = Convert.ToDateTime(dataReader["TimeofAdmission"].ToString()).ToString("HH:mm");
                    patientDashboard.TimeofDeath = Convert.ToDateTime(dataReader["TimeOfDeath"].ToString()).ToString("HH:mm");
                    patientDashboard.DischargeWard = Convert.ToString(dataReader["DischargeWard"]);
                    patientDashboard.DischargeConsultantCode = Convert.ToString(dataReader["DischargeConsultantCode"]);
                    patientDashboard.DischargeSpecialtyCode = Convert.ToString(dataReader["DischargeSpecialityCode"]);
                    patientDashboard.DischargeSpeciality = Convert.ToString(dataReader["DischargeSpeciality"]);
                    patientDashboard.Caregroup = Convert.ToString(dataReader["Caregroup"]);
                    patientDashboard.ComorbiditiesCount = Convert.ToInt32(dataReader["ComorbiditiesCount"]);
                    patientDashboard.IsFullSJRRequired = Convert.ToBoolean(dataReader["IsFullSJRRequired"]);
                    patientDashboard.Stage2SJRRequired = Convert.ToBoolean(dataReader["Stage2SJRRequired"]);
                    lstPatientDetails.Add(patientDashboard);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return lstPatientDetails;
        }

        /// <summary>
        /// Get diagnosis details based on nhs number
        /// </summary>
        /// <returns>List<DischargeConsultants></returns>
        public List<Diagnosis> GetDiagnosisDetails(int? id)
        {
            var connection = GetConnection();
            List<Diagnosis> diagnoses = new List<Diagnosis>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetDiagnosisByPatientID", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    Diagnosis diagnosis = new Diagnosis();
                    diagnosis.Position = Convert.ToInt32(dataReader["Position"]);
                    diagnosis.ComorbidityFlag = Convert.ToBoolean(dataReader["ComorbidityFlag"]);
                    diagnosis.DiagnosisDescription = Convert.ToString(dataReader["DiagnosisDescription"]);
                    diagnoses.Add(diagnosis);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return diagnoses;
        }

        /// <summary>
        /// Get procedure details based on nhs number
        /// </summary>
        /// <returns>List<DischargeConsultants></returns>
        public List<Procedures> GetProcedureDetails(int? id)
        {
            var connection = GetConnection();
            List<Procedures> procedures = new List<Procedures>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetProcedureByPatientID", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientID", id);

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    Procedures procedure = new Procedures();
                    procedure.ProcedureDescription = Convert.ToString(dataReader["ProcedureDescription"]);
                    procedures.Add(procedure);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return procedures;
        }

        /// <summary>
        /// Update patient details first tab details.
        /// </summary>
        /// <param name="isCodingIssueIdentified">bool</param>
        /// <param name="comments">string</param>
        /// <param name="id">int</param>
        /// <returns>int</returns>
        public int UpdatePatientDetails(bool isCodingIssueIdentified, string comments, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdatePatientDetails", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@IsCodingIssueIdentified", isCodingIssueIdentified);
                dbCommand.Parameters.AddWithValue("@Comments", comments);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Insert/Update medical examiner review details for a particular patient ID.
        /// </summary>
        /// <param name="isQAP_Discussion"></param>
        /// <param name="isNotes_Review"></param>
        /// <param name="isNok_Discussion"></param>
        /// <param name="med_id"></param>
        /// <param name="qapname"></param>
        /// <param name="comments"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public int UpdateMedicalExaminerReview(bool isQAP_Discussion, bool isNotes_Review, bool isNok_Discussion, int med_id, string qapname, string comments, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateMedicalExaminerReview", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@QAPDiscussion", isQAP_Discussion);
                dbCommand.Parameters.AddWithValue("@NotesReview", isNotes_Review);
                dbCommand.Parameters.AddWithValue("@NoKDiscussion", isNok_Discussion);
                dbCommand.Parameters.AddWithValue("@MedID", med_id);
                dbCommand.Parameters.AddWithValue("@QAPName", qapname);
                dbCommand.Parameters.AddWithValue("@Comments", comments);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Update SJR 1 step 1 details to database based on patientID
        /// </summary>
        /// <param name="initialManagement">string</param>
        /// <param name="initialManagementRating">int</param>
        /// <param name="ongoingCare">string</param>
        /// <param name="ongoingCareRating">int</param>
        /// <param name="careduringProcedure">string</param>
        /// <param name="careduringProcedureRating">int</param>
        /// <param name="endlifeCare">string</param>
        /// <param name="endlifecareRating">int</param>
        /// <param name="overallAssessment">string</param>
        /// <param name="overallAssessmentRating">int</param>
        /// <param name="qualitOfDocumentation">int</param>
        /// <param name="id">int</param>
        /// <returns>int</returns>
        public int UpdateSJRFormInitial(string initialManagement, string initialManagementRating, string ongoingCare, string ongoingCareRating,
            string careduringProcedure, string careduringProcedureRating, string endlifeCare, string endlifecareRating, string overallAssessment,
            string overallAssessmentRating, string qualitOfDocumentation, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateSJRFormInitial", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@InitialManagement", initialManagement);
                dbCommand.Parameters.AddWithValue("@InitialManagementRating", initialManagementRating);
                dbCommand.Parameters.AddWithValue("@OngoingCare", ongoingCare);
                dbCommand.Parameters.AddWithValue("@OngoingCareRating", ongoingCareRating);
                dbCommand.Parameters.AddWithValue("@CareduringProcedure", careduringProcedure);
                dbCommand.Parameters.AddWithValue("@CareduringProcedureRating", careduringProcedureRating);
                dbCommand.Parameters.AddWithValue("@EndlifeCare", endlifeCare);
                dbCommand.Parameters.AddWithValue("@EndlifecareRating", endlifecareRating);
                dbCommand.Parameters.AddWithValue("@OverallAssessment", overallAssessment);
                dbCommand.Parameters.AddWithValue("@OverallAssessmentRating", overallAssessmentRating);
                dbCommand.Parameters.AddWithValue("@QualitOfDocumentation", qualitOfDocumentation);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        public int UpdateSJR2FormInitial(string initialManagement, string initialManagementRating, string ongoingCare, string ongoingCareRating,
            string careduringProcedure, string careduringProcedureRating, string endlifeCare, string endlifecareRating, string overallAssessment,
            string overallAssessmentRating, string qualitOfDocumentation, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateSJR2FormInitial", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@InitialManagement", initialManagement);
                dbCommand.Parameters.AddWithValue("@InitialManagementRating", initialManagementRating);
                dbCommand.Parameters.AddWithValue("@OngoingCare", ongoingCare);
                dbCommand.Parameters.AddWithValue("@OngoingCareRating", ongoingCareRating);
                dbCommand.Parameters.AddWithValue("@CareduringProcedure", careduringProcedure);
                dbCommand.Parameters.AddWithValue("@CareduringProcedureRating", careduringProcedureRating);
                dbCommand.Parameters.AddWithValue("@EndlifeCare", endlifeCare);
                dbCommand.Parameters.AddWithValue("@EndlifecareRating", endlifecareRating);
                dbCommand.Parameters.AddWithValue("@OverallAssessment", overallAssessment);
                dbCommand.Parameters.AddWithValue("@OverallAssessmentRating", overallAssessmentRating);
                dbCommand.Parameters.AddWithValue("@QualitOfDocumentation", qualitOfDocumentation);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Update SJR Outcome details for a particular patient ID
        /// </summary>
        /// <param name="SJR2Required">bool</param>
        /// <param name="Stage2SJRDateSent">DateTime</param>
        /// <param name="Stage2SJRSentTo">string</param>
        /// <param name="ReferenceNumber">string</param>
        /// <param name="DateReceived">DateTime</param>
        /// <param name="SIRIComments">string</param>
        /// <param name="MSGRequired">bool</param>
        /// <param name="MSGDiscussionDate">DateTime</param>
        /// <param name="AvoidabilityScoreID">int</param>
        /// <param name="Comments">string</param>
        /// <param name="FeedbackToNoK">string</param>
        /// <param name="id">int</param>
        /// <returns>int</returns>
        public int UpdateSJROutcome(bool SJR2Required, DateTime Stage2SJRDateSent, string Stage2SJRSentTo, string ReferenceNumber,
            DateTime DateReceived, string SIRIComments, bool MSGRequired, DateTime MSGDiscussionDate, int AvoidabilityScoreID,
            string Comments, string FeedbackToNoK, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateSJROutcome", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@SJR2Required", SJR2Required);
                dbCommand.Parameters.AddWithValue("@Stage2SJRDateSent", Stage2SJRDateSent);
                dbCommand.Parameters.AddWithValue("@Stage2SJRSentTo", Stage2SJRSentTo);
                dbCommand.Parameters.AddWithValue("@ReferenceNumber", ReferenceNumber);
                dbCommand.Parameters.AddWithValue("@DateReceived", DateReceived);
                dbCommand.Parameters.AddWithValue("@SIRIComments", SIRIComments);
                dbCommand.Parameters.AddWithValue("@MSGRequired", MSGRequired);
                dbCommand.Parameters.AddWithValue("@MSGDiscussionDate", MSGDiscussionDate);
                dbCommand.Parameters.AddWithValue("@AvoidabilityScoreID", AvoidabilityScoreID);
                dbCommand.Parameters.AddWithValue("@Comments", Comments);
                dbCommand.Parameters.AddWithValue("@FeedbackToNoK", FeedbackToNoK);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        public int UpdateSJR1ProblemType(int AssessmentResponseID, int AssessmentCarePhaseID, int MedicationResponseID, int MedicationCarePhaseID,
            int TreatmentResponseID, int TreatmentCarePhaseID, int InfectionResponseID, int InfectionCarePhaseID, int ProcedureResponseID,
            int ProcedureCarePhaseID, int MonitoringResponseID, int ResuscitationResponseID, int OthertypeResponseID, int OthertypeCarePhaseID, int AvoidabilityScoreID, 
            string Comments, string SIRIComments, bool ProblemOccured, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateSJR1ProblemType", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@AssessmentResponseID", AssessmentResponseID);
                dbCommand.Parameters.AddWithValue("@AssessmentCarePhaseID", AssessmentCarePhaseID);
                dbCommand.Parameters.AddWithValue("@MedicationResponseID", MedicationResponseID);
                dbCommand.Parameters.AddWithValue("@MedicationCarePhaseID", MedicationCarePhaseID);
                dbCommand.Parameters.AddWithValue("@TreatmentResponseID", TreatmentResponseID);
                dbCommand.Parameters.AddWithValue("@TreatmentCarePhaseID", TreatmentCarePhaseID);
                dbCommand.Parameters.AddWithValue("@InfectionResponseID", InfectionResponseID);
                dbCommand.Parameters.AddWithValue("@InfectionCarePhaseID", InfectionCarePhaseID);
                dbCommand.Parameters.AddWithValue("@ProcedureResponseID", ProcedureResponseID);
                dbCommand.Parameters.AddWithValue("@ProcedureCarePhaseID", ProcedureCarePhaseID);
                dbCommand.Parameters.AddWithValue("@MonitoringResponseID", MonitoringResponseID);
                dbCommand.Parameters.AddWithValue("@ResuscitationResponseID", ResuscitationResponseID);
                dbCommand.Parameters.AddWithValue("@OthertypeResponseID", OthertypeResponseID);
                dbCommand.Parameters.AddWithValue("@OthertypeCarePhaseID", OthertypeCarePhaseID);
                dbCommand.Parameters.AddWithValue("@AvoidabilityScoreID", AvoidabilityScoreID);
                dbCommand.Parameters.AddWithValue("@Comments", Comments);
                dbCommand.Parameters.AddWithValue("@ProblemOccured", ProblemOccured);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        public int UpdateSJR2ProblemType(int AssessmentResponseID, int AssessmentCarePhaseID, int MedicationResponseID, int MedicationCarePhaseID,
            int TreatmentResponseID, int TreatmentCarePhaseID, int InfectionResponseID, int InfectionCarePhaseID, int ProcedureResponseID,
            int ProcedureCarePhaseID, int MonitoringResponseID, int ResuscitationResponseID, int OthertypeResponseID, int OthertypeCarePhaseID, int AvoidabilityScoreID,
            string Comments, string SIRIComments, bool ProblemOccured, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateSJR2ProblemType", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@AssessmentResponseID", AssessmentResponseID);
                dbCommand.Parameters.AddWithValue("@AssessmentCarePhaseID", AssessmentCarePhaseID);
                dbCommand.Parameters.AddWithValue("@MedicationResponseID", MedicationResponseID);
                dbCommand.Parameters.AddWithValue("@MedicationCarePhaseID", MedicationCarePhaseID);
                dbCommand.Parameters.AddWithValue("@TreatmentResponseID", TreatmentResponseID);
                dbCommand.Parameters.AddWithValue("@TreatmentCarePhaseID", TreatmentCarePhaseID);
                dbCommand.Parameters.AddWithValue("@InfectionResponseID", InfectionResponseID);
                dbCommand.Parameters.AddWithValue("@InfectionCarePhaseID", InfectionCarePhaseID);
                dbCommand.Parameters.AddWithValue("@ProcedureResponseID", ProcedureResponseID);
                dbCommand.Parameters.AddWithValue("@ProcedureCarePhaseID", ProcedureCarePhaseID);
                dbCommand.Parameters.AddWithValue("@MonitoringResponseID", MonitoringResponseID);
                dbCommand.Parameters.AddWithValue("@ResuscitationResponseID", ResuscitationResponseID);
                dbCommand.Parameters.AddWithValue("@OthertypeResponseID", OthertypeResponseID);
                dbCommand.Parameters.AddWithValue("@OthertypeCarePhaseID", OthertypeCarePhaseID);
                dbCommand.Parameters.AddWithValue("@AvoidabilityScoreID", AvoidabilityScoreID);
                dbCommand.Parameters.AddWithValue("@Comments", Comments);
                dbCommand.Parameters.AddWithValue("@ProblemOccured", ProblemOccured);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        public int UpdatePositiveFeedback(bool isFormCompleted, bool isComplementsFedBack, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdatePositiveFeedback", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@FormCompleted", isFormCompleted);
                dbCommand.Parameters.AddWithValue("@ComplementsFedBack", isComplementsFedBack);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Update SJR Assessment Triage Details for a particular patient ID
        /// </summary>
        /// <param name="isPaediatricPatient">bool</param>
        /// <param name="isLearningDisabilityPatient">bool</param>
        /// <param name="isMentalillnessPatient">bool</param>
        /// <param name="isElectiveAdmission">bool</param>
        /// <param name="isNoKConcernsDeath">bool</param>
        /// <param name="isOtherConcern">bool</param>
        /// <param name="isFullSJRRequired">bool</param>
        /// <param name="otherConcernDetails">string</param>
        /// <param name="specialityID">int</param>
        /// <param name="id">int</param>
        /// <returns>int</returns>
        public int UpdateSJRAssessmentTriage(bool isPaediatricPatient, bool isLearningDisabilityPatient, bool isMentalillnessPatient, bool isElectiveAdmission, bool isNoKConcernsDeath, bool isOtherConcern,
            bool isFullSJRRequired, string otherConcernDetails, int specialityID, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateSJRAssessmentTriage", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PaediatricPatient", isPaediatricPatient);
                dbCommand.Parameters.AddWithValue("@LearningDisabilityPatient", isLearningDisabilityPatient);
                dbCommand.Parameters.AddWithValue("@MentalillnessPatient", isMentalillnessPatient);
                dbCommand.Parameters.AddWithValue("@ElectiveAdmission", isElectiveAdmission);
                dbCommand.Parameters.AddWithValue("@NoKConcernsDeath", isNoKConcernsDeath);
                dbCommand.Parameters.AddWithValue("@OtherConcern", isOtherConcern);
                dbCommand.Parameters.AddWithValue("@FullSJRRequired", isFullSJRRequired);
                dbCommand.Parameters.AddWithValue("@otherConcernDetails", otherConcernDetails);
                dbCommand.Parameters.AddWithValue("@specialityID", specialityID);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Update other referrals based on particular patient ID
        /// </summary>
        /// <param name="isPatientSafetySIRI">bool</param>
        /// <param name="isChildDeathCoordinator">bool</param>
        /// <param name="isLearningDisabilityNurse">bool</param>
        /// <param name="isHeadOfCompliance">bool</param>
        /// <param name="isPALsComplaints">bool</param>
        /// <param name="isWardTeam">bool</param>
        /// <param name="isOther">bool</param>
        /// <param name="PatientSafetySIRIReason">string</param>
        /// <param name="HeadOfComplianceReason">string</param>
        /// <param name="PALsComplaintsReason">string</param>
        /// <param name="WardTeamReason">string</param>
        /// <param name="OtherReason">string</param>
        /// <param name="specialityID">int</param>
        /// <param name="id">int</param>
        /// <returns></returns>
        public int UpdateOtherReferrals(bool isPatientSafetySIRI, bool isChildDeathCoordinator, bool isLearningDisabilityNurse, bool isHeadOfCompliance, bool isPALsComplaints, bool isWardTeam,
            bool isOther, string PatientSafetySIRIReason, string HeadOfComplianceReason, string PALsComplaintsReason, string WardTeamReason, string OtherReason, int? id)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_UpdateOtherReferrals", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@PatientSafetySIRI", isPatientSafetySIRI);
                dbCommand.Parameters.AddWithValue("@ChildDeathCoordinator", isChildDeathCoordinator);
                dbCommand.Parameters.AddWithValue("@LearningDisabilityNurse", isLearningDisabilityNurse);
                dbCommand.Parameters.AddWithValue("@HeadOfCompliance", isHeadOfCompliance);
                dbCommand.Parameters.AddWithValue("@PALsComplaints", isPALsComplaints);
                dbCommand.Parameters.AddWithValue("@WardTeam", isWardTeam);
                dbCommand.Parameters.AddWithValue("@Other", isOther);
                dbCommand.Parameters.AddWithValue("@PatientSafetySIRIReason", PatientSafetySIRIReason);
                dbCommand.Parameters.AddWithValue("@HeadOfComplianceReason", HeadOfComplianceReason);
                dbCommand.Parameters.AddWithValue("@PALsComplaintsReason", PALsComplaintsReason);
                dbCommand.Parameters.AddWithValue("@WardTeamReason", WardTeamReason);
                dbCommand.Parameters.AddWithValue("@OtherReason", OtherReason);
                dbCommand.Parameters.AddWithValue("@ID", id);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            return retVal;
        }

        /// <summary>
        /// Get Other referral tab details for a particular patient ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsOtherReferralModel</returns>
        public clsOtherReferralModel GetOtherReferrals(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dbReader = null;
            clsOtherReferralModel otherReferralModel = new clsOtherReferralModel();
            try
            {
                SqlCommand dbCmd = new SqlCommand("usp_GetOtherReferrals", connection);
                dbCmd.CommandType = CommandType.StoredProcedure;
                if (id != null)
                    dbCmd.Parameters.AddWithValue("@PatientID", id);
                else
                    dbCmd.Parameters.AddWithValue("@PatientID", null);

                dbReader = dbCmd.ExecuteReader();

                while (dbReader.Read())
                {
                    otherReferralModel.Patient_ID = Convert.ToInt32(dbReader["Patient_ID"]);
                    otherReferralModel.PatientID = Convert.ToString(dbReader["PatientID"]);
                    otherReferralModel.PatientSafetySIRI = Convert.ToBoolean(dbReader["PatientSafetySIRI"]);
                    otherReferralModel.PatientSafetySIRIReason = Convert.ToString(dbReader["PatientSafetySIRIReason"]);
                    otherReferralModel.ChildDeathCoordinator = Convert.ToBoolean(dbReader["ChildDeathCoordinator"]);
                    otherReferralModel.LearningDisabilityNurse = Convert.ToBoolean(dbReader["LearningDisabilityNurse"]);
                    otherReferralModel.HeadOfCompliance = Convert.ToBoolean(dbReader["HeadOfCompliance"]);
                    otherReferralModel.HeadOfComplianceReason = Convert.ToString(dbReader["HeadOfComplianceReason"]);
                    otherReferralModel.PALsComplaints = Convert.ToBoolean(dbReader["PALsComplaints"]);
                    otherReferralModel.PALsComplaintsReason = Convert.ToString(dbReader["PALsComplaintsReason"]);
                    otherReferralModel.WardTeam = Convert.ToBoolean(dbReader["WardTeam"]);
                    otherReferralModel.WardTeamReason = Convert.ToString(dbReader["WardTeamReason"]);
                    otherReferralModel.Other = Convert.ToBoolean(dbReader["Other"]);
                    otherReferralModel.OtherReason = Convert.ToString(dbReader["OtherReason"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dbReader.IsClosed)
                    dbReader.Close();
            }
            return otherReferralModel;
        }

        /// <summary>
        /// Get medical examiner decision tab details for a particular ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsMedicalExaminerDecision</returns>
        public clsMedicalExaminerDecision GetMedicalExaminerDecision(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dbReader = null;
            clsMedicalExaminerDecision medicalExaminerDecision = new clsMedicalExaminerDecision();
            try
            {
                SqlCommand dbCmd = new SqlCommand("usp_GetMedicalExaminerDecision", connection);
                dbCmd.CommandType = CommandType.StoredProcedure;
                if (id != null)
                    dbCmd.Parameters.AddWithValue("@PatientID", id);
                else
                    dbCmd.Parameters.AddWithValue("@PatientID", null);

                dbReader = dbCmd.ExecuteReader();

                while (dbReader.Read())
                {                    
                    medicalExaminerDecision.ID = Convert.ToInt32(dbReader["Patient_ID"]);
                    medicalExaminerDecision.PatientID = Convert.ToString(dbReader["PatientID"]);
                    medicalExaminerDecision.MCCDissue = Convert.ToBoolean(dbReader["MCCDissue"]);
                    medicalExaminerDecision.CoronerReferral = Convert.ToBoolean(dbReader["CoronerReferral"]);
                    medicalExaminerDecision.HospitalPostMortem = Convert.ToBoolean(dbReader["HospitalPostMortem"]);
                    medicalExaminerDecision.CoronerReferralReasonID = Convert.ToInt32(dbReader["CoronerReferralReasonID"]);
                    medicalExaminerDecision.ReasonGroupID = Convert.ToInt32(dbReader["GroupID"]);
                    medicalExaminerDecision.CauseOfDeath1 = Convert.ToString(dbReader["CauseOfDeath1"]);
                    medicalExaminerDecision.CauseOfDeath2 = Convert.ToString(dbReader["CauseOfDeath2"]);
                    medicalExaminerDecision.CauseOfDeath3 = Convert.ToString(dbReader["CauseOfDeath3"]);
                    medicalExaminerDecision.CauseOfDeath4 = Convert.ToString(dbReader["CauseOfDeath4"]);
                    medicalExaminerDecision.DeathCertificate = Convert.ToBoolean(dbReader["DeathCertificate"]);
                    medicalExaminerDecision.CornerReferralComplete = Convert.ToBoolean(dbReader["CornerReferralComplete"]);
                    medicalExaminerDecision.CoronerDecisionInquest = Convert.ToBoolean(dbReader["CoronerDecisionInquest"]);
                    medicalExaminerDecision.CoronerDecision100A = Convert.ToBoolean(dbReader["CoronerDecision100A"]);
                    medicalExaminerDecision.CoronerDecisionPostMortem = Convert.ToBoolean(dbReader["CoronerDecisionPostMortem"]);                    
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dbReader.IsClosed)
                    dbReader.Close();
            }
            return medicalExaminerDecision;
        }

        /// <summary>
        /// Get SJR assesment triage details for a particular patient ID
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>clsSJRReview</returns>
        public clsSJRReview GetSJRAssesmentTraige(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dbReader = null;
            clsSJRReview sJRReview = new clsSJRReview();
            try
            {
                SqlCommand dbCmd = new SqlCommand("usp_GetSJRAssessmentTriage", connection);
                dbCmd.CommandType = CommandType.StoredProcedure;
                if (id != null)
                    dbCmd.Parameters.AddWithValue("@PatientID", id);
                else
                    dbCmd.Parameters.AddWithValue("@PatientID", null);

                dbReader = dbCmd.ExecuteReader();

                while (dbReader.Read())
                {
                    sJRReview.Patient_ID = Convert.ToInt32(dbReader["Patient_ID"]);
                    sJRReview.PatientID = Convert.ToString(dbReader["PatientID"]);
                    sJRReview.PaediatricPatient = Convert.ToBoolean(dbReader["PaediatricPatient"]);
                    sJRReview.LearningDisabilityPatient = Convert.ToBoolean(dbReader["LearningDisabilityPatient"]);
                    sJRReview.MentalillnessPatient = Convert.ToBoolean(dbReader["MentalillnessPatient"]);
                    sJRReview.ElectiveAdmission = Convert.ToBoolean(dbReader["ElectiveAdmission"]);
                    sJRReview.NoKConcernsDeath = Convert.ToBoolean(dbReader["NoKConcernsDeath"]);
                    sJRReview.OtherConcern = Convert.ToBoolean(dbReader["OtherConcern"]);
                    sJRReview.OtherConcernDetails = Convert.ToString(dbReader["OtherConcernDetails"]);
                    sJRReview.FullSJRRequired = Convert.ToBoolean(dbReader["FullSJRRequired"]);
                    sJRReview.SpecialityID = Convert.ToInt32(dbReader["SpecialityID"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dbReader.IsClosed)
                    dbReader.Close();
            }
            return sJRReview;
        }

        /// <summary>
        /// Get medical examiner review details for patient ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public clsMedicalExaminerReview GetMedicalExaminerReview(int? id)
        {
            var connection = GetConnection();
            SqlDataReader dbReader = null;
            clsMedicalExaminerReview medicalExaminerReview = new clsMedicalExaminerReview();

            try
            {
                SqlCommand dbCmd = new SqlCommand("usp_GetMedicalExamierReview", connection);
                dbCmd.CommandType = CommandType.StoredProcedure;
                if (id != null)
                    dbCmd.Parameters.AddWithValue("@PatientID", id);
                else
                    dbCmd.Parameters.AddWithValue("@PatientID", null);

                dbReader = dbCmd.ExecuteReader();

                while (dbReader.Read())
                {
                    medicalExaminerReview.Patient_ID = Convert.ToInt32(dbReader["Patient_ID"]);
                    medicalExaminerReview.PatientID = Convert.ToString(dbReader["PatientID"]);
                    medicalExaminerReview.ME_ID = Convert.ToInt32(dbReader["ME_ID"]);
                    medicalExaminerReview.QAP_Discussion = Convert.ToBoolean(dbReader["QAP_Discussion"]);
                    medicalExaminerReview.Notes_Review = Convert.ToBoolean(dbReader["Notes_Review"]);
                    medicalExaminerReview.Nok_Discussion = Convert.ToBoolean(dbReader["Nok_Discussion"]);
                    medicalExaminerReview.QAPName = Convert.ToString(dbReader["QAPName"]);
                    medicalExaminerReview.Comments = Convert.ToString(dbReader["Comments"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dbReader.IsClosed)
                    dbReader.Close();
            }
            return medicalExaminerReview;
        }

        /// <summary>
        /// Get list of users in the system who are in Medical Examiner role.
        /// </summary>
        /// <returns>List<clsMedicalExaminers></returns>
        public List<clsMedicalExaminers> GetMedicalExaminers()
        {
            var connection = GetConnection();
            List<clsMedicalExaminers> medicalExaminers = new List<clsMedicalExaminers>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetMedicalExaminers", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    clsMedicalExaminers medicalExaminer = new clsMedicalExaminers();
                    medicalExaminer.ID = Convert.ToInt32(dataReader["ID"]);
                    medicalExaminer.Email = Convert.ToString(dataReader["Email"]);
                    medicalExaminer.Code = Convert.ToString(dataReader["Code"]);
                    medicalExaminer.Name = Convert.ToString(dataReader["Name"]);
                    medicalExaminer.UserID = Convert.ToString(dataReader["UserID"]);
                    medicalExaminer.Speciality = Convert.ToString(dataReader["Speciality"]);
                    medicalExaminer.Role = Convert.ToString(dataReader["Role"]);
                    medicalExaminers.Add(medicalExaminer);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return medicalExaminers;
        }

        /// <summary>
        /// Get All coroner referral reasons from the database
        /// </summary>
        /// <returns>List<clsCoronerReferralReason></returns>
        public List<ReasonGroups> GetReasonGroups()
        {
            var connection = GetConnection();
            List<ReasonGroups> reasonGroups = new List<ReasonGroups>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_ReasonGroups", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;

                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    ReasonGroups reasonGroup = new ReasonGroups();
                    reasonGroup.GroupID = Convert.ToInt32(dataReader["GroupID"]);
                    reasonGroup.GroupName = Convert.ToString(dataReader["GroupName"]);
                    reasonGroups.Add(reasonGroup);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return reasonGroups;
        }

        /// <summary>
        /// Get all referral reasons based on reason group ID
        /// </summary>
        /// <param name="groupid">int</param>
        /// <returns>List<clsCoronerReferralReason></returns>
        public List<clsCoronerReferralReason> GetCoronerReferralReasons(int? groupid)
        {
            var connection = GetConnection();
            List<clsCoronerReferralReason> reasonNames = new List<clsCoronerReferralReason>();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_GetCoronerReferrals", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                if (groupid != null)
                    dbCommand.Parameters.AddWithValue("@GroupID", groupid);
                else
                    dbCommand.Parameters.AddWithValue("@GroupID", 0);
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    clsCoronerReferralReason reasonName = new clsCoronerReferralReason();
                    reasonName.Reason_ID = Convert.ToInt32(dataReader["Reason_ID"]);
                    reasonName.ReasonName = Convert.ToString(dataReader["ReasonName"]);
                    reasonNames.Add(reasonName);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return reasonNames;
        }
        
        /// <summary>
        /// Checks if the user exists
        /// </summary>
        /// <param name="UserName">user alias</param>
        /// <returns>0 if user does not exit , 1 if user exists</returns>
        public AppUsers ValidateUser(string userName)
        {
            var connection = GetConnection();
            AppUsers user = new AppUsers();
            SqlDataReader dataReader = null;

            try
            {
                SqlCommand dbCommand = new SqlCommand("usp_ValidateUser", connection);
                dbCommand.CommandType = CommandType.StoredProcedure;
                if (userName != null)
                    dbCommand.Parameters.AddWithValue("@UserID", userName);
                else
                    dbCommand.Parameters.AddWithValue("@UserID", "");
                dataReader = dbCommand.ExecuteReader();

                while (dataReader.Read())
                {
                    user.IsFound = Convert.ToBoolean(dataReader["IsFound"]);
                    user.FirstName = Convert.ToString(dataReader["FirstName"]);
                    user.LastName = Convert.ToString(dataReader["LastName"]);
                }
            }
            catch (Exception ex)
            {
                LogException(ex.Message, this.ToString(), "ValidateUser", System.DateTime.Now);
            }
            finally
            {
                if (!dataReader.IsClosed)
                    dataReader.Close();
            }
            return user;
        }

        /// <summary>
        /// Log exception to exceptionlog table
        /// </summary>
        /// <param name="message">string</param>
        /// <param name="className">string</param>
        /// <param name="methodName">string</param>
        /// <param name="createdDate">DateTime</param>
        private void LogException(string message, string className, string methodName, DateTime createdDate)
        {
            var connection = GetConnection();
            int retVal = 0;
            SqlCommand dbCommand = new SqlCommand("usp_InsertLogException", connection);
            try
            {
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("@Message", message);
                dbCommand.Parameters.AddWithValue("@ClassName", className);
                dbCommand.Parameters.AddWithValue("@MethodName", methodName);
                dbCommand.Parameters.AddWithValue("@CreatedDate", createdDate);
                retVal = dbCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
