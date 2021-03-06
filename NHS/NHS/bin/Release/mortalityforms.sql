USE [master]
GO
/****** Object:  Database [NHSForms]    Script Date: 03/02/2019 18:06:45 ******/
CREATE DATABASE [NHSForms]
GO
USE [NHSForms]
GO
/****** Object:  Table [dbo].[AvoidabilityScore]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvoidabilityScore](
	[AvoidabilityScoreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AvoidabilityScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarePhase]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarePhase](
	[CarePhaseID] [int] IDENTITY(1,1) NOT NULL,
	[PhaseName] [varchar](50) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarePhaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareRating]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareRating](
	[CareRatingID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CareRatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClinicalCoding]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalCoding](
	[ClinicalCodingID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[SpellNumber] [int] NULL,
	[FCENumber] [int] NULL,
	[Position] [int] NULL,
	[Diagnosiscode] [varchar](max) NULL,
	[DiagnosisDescription] [varchar](max) NULL,
	[ComorbidityFlag] [bit] NOT NULL,
	[ProcedureCode] [varchar](max) NULL,
	[ProcedureDescription] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__Clinical__24FDAA6E91C50102] PRIMARY KEY CLUSTERED 
(
	[ClinicalCodingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataManagement]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataManagement](
	[DataId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystem] [varchar](50) NULL,
	[DataSet] [varchar](50) NULL,
	[DQRag] [int] NULL,
	[UpdateDate] [date] NULL,
	[UpdateTime] [time](7) NULL,
 CONSTRAINT [PK_DataManagement] PRIMARY KEY CLUSTERED 
(
	[DataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DischargeConsultant]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DischargeConsultant](
	[DischargeConsultantCode] [varchar](100) NOT NULL,
	[DischargeConsultantName] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__Discharg__25D0DB919B774E82] PRIMARY KEY CLUSTERED 
(
	[DischargeConsultantCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExceptionLog]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLog](
	[ErrorNo] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ClassName] [varchar](300) NULL,
	[MethodName] [varchar](300) NULL,
	[CreatedDate] [datetime] NULL,
	[ErrorType] [char](1) NULL,
 CONSTRAINT [PK_ExceptionLog] PRIMARY KEY CLUSTERED 
(
	[ErrorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedBack_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[FormCompleted] [bit] NULL,
	[ComplementsFedBack] [bit] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__FeedBack__5BDEA74DDABEB693] PRIMARY KEY CLUSTERED 
(
	[FeedBack_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalExaminer]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalExaminer](
	[ME_ID] [int] IDENTITY(1,1) NOT NULL,
	[ME_FirstName] [varchar](20) NULL,
	[ME_MiddleName] [varchar](20) NULL,
	[ME_LastName] [varchar](20) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ME_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalExaminerDecision]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalExaminerDecision](
	[MED_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[MCCDissue] [bit] NULL,
	[CoronerReferral] [bit] NULL,
	[HospitalPostMortem] [bit] NULL,
	[CoronerReferralReasonID] [int] NULL,
	[CauseOfDeath1] [varchar](max) NULL,
	[CauseOfDeath2] [varchar](max) NULL,
	[CauseOfDeath3] [varchar](max) NULL,
	[CauseOfDeath4] [varchar](max) NULL,
	[DeathCertificate] [bit] NULL,
	[CornerReferralComplete] [bit] NULL,
	[CoronerDecisionInquest] [bit] NULL,
	[CoronerDecision100A] [bit] NULL,
	[CoronerDecisionPostMortem] [bit] NULL,
	[CoronerDecisionGPissue] [bit] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__MedicalE__CB7019A7C4A6C73C] PRIMARY KEY CLUSTERED 
(
	[MED_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalExaminerReview]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalExaminerReview](
	[MEReviewId] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[ME_ID] [int] NULL,
	[QAP_Discussion] [bit] NULL,
	[Notes_Review] [bit] NULL,
	[Nok_Discussion] [bit] NULL,
	[Comments] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[QAPName] [varchar](50) NULL,
 CONSTRAINT [PK__MedicalE__16419BB4381CD343] PRIMARY KEY CLUSTERED 
(
	[MEReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MortalitySurveillance]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MortalitySurveillance](
	[MortalitySurveillance_ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[PresentationToMSG] [bit] NULL,
	[DiscussedWithMSG] [varchar](200) NULL,
	[AvoidabilityScoreID] [int] NULL,
	[Comments] [varchar](max) NULL,
	[FeedbackToNoK] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MortalitySurveillance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherReferral]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherReferral](
	[OtherReferral_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[PatientSafetySIRI] [bit] NULL,
	[PatientSafetySIRIReason] [varchar](max) NULL,
	[ChildDeathCoordinator] [bit] NULL,
	[LearningDisabilityNurse] [bit] NULL,
	[HeadOfCompliance] [bit] NULL,
	[HeadOfComplianceReason] [varchar](max) NULL,
	[PALsComplaints] [bit] NULL,
	[PALsComplaintsReason] [varchar](max) NULL,
	[WardTeam] [bit] NULL,
	[WardTeamReason] [varchar](max) NULL,
	[Other] [bit] NULL,
	[OtherReason] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__OtherRef__4A9A480466FA8869] PRIMARY KEY CLUSTERED 
(
	[OtherReferral_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDetails]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [varchar](10) NULL,
	[SpellNumber] [int] NULL,
	[PatientName] [varchar](max) NULL,
	[NHSNumber] [varchar](20) NULL,
	[Gender] [varchar](10) NULL,
	[Age] [int] NULL,
	[DOB] [date] NULL,
	[DateofAdmission] [date] NULL,
	[TimeofAdmission] [time](7) NULL,
	[DischargeWard] [varchar](max) NULL,
	[DateofDeath] [date] NULL,
	[TimeofDeath] [time](7) NULL,
	[WardofDeath] [varchar](50) NULL,
	[DischargeConsultantCode] [varchar](100) NULL,
	[DischargeConsultantName] [varchar](255) NULL,
	[DischargeSpecialityCode] [varchar](100) NULL,
	[DischargeSpeciality] [varchar](100) NULL,
	[Caregroup] [varchar](50) NULL,
	[AdmissionType] [varchar](50) NULL,
	[PrimaryDiagnosis] [varchar](255) NULL,
	[PrimaryProcedure] [varchar](50) NULL,
	[ComorbiditiesCount] [int] NULL,
	[SHMIGroup] [varchar](255) NULL,
	[SHMICode] [varchar](50) NULL,
	[CodingIssueIdentified] [bit] NULL,
	[Comments] [varchar](max) NULL,
	[MedTriage] [int] NULL,
	[SJR1] [int] NULL,
	[SJR2] [int] NULL,
	[SJROutcome] [int] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__PatientD__970EC366AE56E33F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMap]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMap](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[MRN] [varchar](100) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferralReason]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferralReason](
	[Reason_ID] [int] IDENTITY(1,1) NOT NULL,
	[ReasonGroupID] [int] NULL,
	[ReasonName] [varchar](200) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__CoronerR__3435D2D7472E5F0F] PRIMARY KEY CLUSTERED 
(
	[Reason_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferralReasonGroup]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferralReasonGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ReferralReasonGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsePT]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsePT](
	[ResponseID] [int] NOT NULL,
	[Response] [varchar](50) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__Response__1AAA640C28317974] PRIMARY KEY CLUSTERED 
(
	[ResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewStatus]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewStatus](
	[ReviewStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[Spellnumber] [varchar](10) NULL,
	[METriage] [int] NULL,
	[SJR1] [int] NULL,
	[SJR2] [int] NULL,
	[SJRoutcome] [int] NULL,
	[MortalityReview] [varchar](max) NULL,
	[CodingReview] [varchar](100) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ReviewStatus] PRIMARY KEY CLUSTERED 
(
	[ReviewStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJR2FormInitial]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJR2FormInitial](
	[SJRFormInitial_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[InitialManagement] [varchar](max) NULL,
	[InitialManagementCareRatingID] [int] NULL,
	[OngoingCare] [varchar](max) NULL,
	[OngoingCareRatingID] [int] NULL,
	[CareDuringProcedure] [varchar](max) NULL,
	[CareDuringProcedureCareRatingID] [int] NULL,
	[EndLifeCare] [varchar](max) NULL,
	[EndLifeCareRatingID] [int] NULL,
	[OverAllAssessment] [varchar](max) NULL,
	[OverAllAssessmentCareRatingID] [int] NULL,
	[Stage] [int] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[QualityDocumentationCode] [int] NULL,
 CONSTRAINT [PK__SJR2FormI__B76E13372FCA9743] PRIMARY KEY CLUSTERED 
(
	[SJRFormInitial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJR2FormProblemType]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJR2FormProblemType](
	[SJRFormProblemType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[ProblemOccured] [bit] NULL,
	[AssessmentResponseID] [int] NULL,
	[AssessmentCarePhaseID] [int] NULL,
	[MedicationResponseID] [int] NULL,
	[MedicationCarePhaseID] [int] NULL,
	[TreatmentResponseID] [int] NULL,
	[TreatmentCarePhaseID] [int] NULL,
	[InfectionResponseID] [int] NULL,
	[InfectionCarePhaseID] [int] NULL,
	[ProcedureResponseID] [int] NULL,
	[ProcedureCarePhaseID] [int] NULL,
	[MonitoringResponseID] [int] NULL,
	[ResuscitationResponseID] [int] NULL,
	[OthertypeResponseID] [int] NULL,
	[OthertypeCarePhaseID] [int] NULL,
	[AvoidabilityScoreID] [int] NULL,
	[Comments] [varchar](max) NULL,
	[Stage] [int] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__SJR2FormP__E10C732D820BCBAF] PRIMARY KEY CLUSTERED 
(
	[SJRFormProblemType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJRFormInitial]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJRFormInitial](
	[SJRFormInitial_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[InitialManagement] [varchar](max) NULL,
	[InitialManagementCareRatingID] [int] NULL,
	[OngoingCare] [varchar](max) NULL,
	[OngoingCareRatingID] [int] NULL,
	[CareDuringProcedure] [varchar](max) NULL,
	[CareDuringProcedureCareRatingID] [int] NULL,
	[EndLifeCare] [varchar](max) NULL,
	[EndLifeCareRatingID] [int] NULL,
	[OverAllAssessment] [varchar](max) NULL,
	[OverAllAssessmentCareRatingID] [int] NULL,
	[Stage] [int] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[QualityDocumentationCode] [int] NULL,
 CONSTRAINT [PK__SJRFormI__B76E13372FCA9743] PRIMARY KEY CLUSTERED 
(
	[SJRFormInitial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJRFormProblemType]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJRFormProblemType](
	[SJRFormProblemType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[ProblemOccured] [bit] NULL,
	[AssessmentResponseID] [int] NULL,
	[AssessmentCarePhaseID] [int] NULL,
	[MedicationResponseID] [int] NULL,
	[MedicationCarePhaseID] [int] NULL,
	[TreatmentResponseID] [int] NULL,
	[TreatmentCarePhaseID] [int] NULL,
	[InfectionResponseID] [int] NULL,
	[InfectionCarePhaseID] [int] NULL,
	[ProcedureResponseID] [int] NULL,
	[ProcedureCarePhaseID] [int] NULL,
	[MonitoringResponseID] [int] NULL,
	[ResuscitationResponseID] [int] NULL,
	[OthertypeResponseID] [int] NULL,
	[OthertypeCarePhaseID] [int] NULL,
	[AvoidabilityScoreID] [int] NULL,
	[Comments] [varchar](max) NULL,
	[Stage] [int] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__SJRFormP__E10C732D820BCBAF] PRIMARY KEY CLUSTERED 
(
	[SJRFormProblemType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJROutcomes]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJROutcomes](
	[SJROutcome_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[Stage2SJRRequired] [bit] NULL,
	[Stage2SJRDateSent] [datetime] NULL,
	[Stage2SJRSentTo] [varchar](200) NULL,
	[ReferenceNumber] [varchar](200) NULL,
	[DateReceived] [datetime] NULL,
	[MSGRequired] [bit] NULL,
	[MSGDiscussed] [datetime] NULL,
	[AvoidabilityScoreID] [int] NULL,
	[FeedbackToNoK] [varchar](max) NULL,
	[SIRIComments] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__SJROutco__852CBD272C9E04E1] PRIMARY KEY CLUSTERED 
(
	[SJROutcome_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJRReview]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJRReview](
	[SJRReview_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[PatientID] [varchar](10) NULL,
	[PaediatricPatient] [bit] NULL,
	[LearningDisabilityPatient] [bit] NULL,
	[MentalillnessPatient] [bit] NULL,
	[ElectiveAdmission] [bit] NULL,
	[NoKConcernsDeath] [bit] NULL,
	[OtherConcern] [bit] NULL,
	[FullSJRRequired] [bit] NULL,
	[SJRReviewSpecialityID] [int] NULL,
	[OtherConcernDetails] [varchar](255) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__SJRRevie__061EA64C621C0568] PRIMARY KEY CLUSTERED 
(
	[SJRReview_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SJRReviewSpeciality]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SJRReviewSpeciality](
	[SJRReviewSpecialityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SJRReviewSpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[SpecialityID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityName] [varchar](50) NULL,
 CONSTRAINT [PK_Specialities] PRIMARY KEY CLUSTERED 
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/02/2019 18:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[Role] [varchar](20) NULL,
	[Code] [varchar](20) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](10) NULL,
	[UserID] [varchar](20) NULL,
	[Speciality] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AvoidabilityScore] ON 

INSERT [dbo].[AvoidabilityScore] ([AvoidabilityScoreID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Grade 0', N'John Deo', CAST(N'2019-01-24T13:26:03.783' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:03.783' AS DateTime))
INSERT [dbo].[AvoidabilityScore] ([AvoidabilityScoreID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'Grade 0', N'John Deo', CAST(N'2019-01-24T13:26:56.230' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:56.230' AS DateTime))
INSERT [dbo].[AvoidabilityScore] ([AvoidabilityScoreID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Grade 0', N'John Deo', CAST(N'2019-01-24T19:37:40.357' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:40.357' AS DateTime))
INSERT [dbo].[AvoidabilityScore] ([AvoidabilityScoreID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'Grade 0', N'John Deo', CAST(N'2019-01-24T19:41:17.683' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:17.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[AvoidabilityScore] OFF
SET IDENTITY_INSERT [dbo].[CarePhase] ON 

INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (31, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:01.520' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:01.520' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (32, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:01.907' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:01.907' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (33, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:02.283' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:02.283' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (34, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:02.643' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:02.643' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (35, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:03.043' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:03.043' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (36, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:03.407' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:03.407' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (37, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:53.993' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:53.993' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (38, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:54.363' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:54.363' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (39, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:54.767' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:54.767' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (40, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:55.130' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:55.130' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (41, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:55.490' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:55.490' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (42, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T13:26:55.860' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:55.860' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (43, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:37:38.093' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:38.093' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (44, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:37:38.473' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:38.473' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (45, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:37:38.863' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:38.863' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (46, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:37:39.247' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:39.247' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (47, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:37:39.610' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:39.610' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (48, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:37:39.987' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:39.987' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (49, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:41:15.430' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:15.430' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (50, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:41:15.807' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:15.807' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (51, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:41:16.197' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:16.197' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (52, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:41:16.560' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:16.560' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (53, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:41:16.933' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:16.933' AS DateTime))
INSERT [dbo].[CarePhase] ([CarePhaseID], [PhaseName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (54, N'Admission and initial assessment', N'John Deo', CAST(N'2019-01-24T19:41:17.310' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:17.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarePhase] OFF
SET IDENTITY_INSERT [dbo].[CareRating] ON 

INSERT [dbo].[CareRating] ([CareRatingID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (61, N'Very Poor', NULL, NULL, NULL, NULL)
INSERT [dbo].[CareRating] ([CareRatingID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (62, N'Poor', NULL, NULL, NULL, NULL)
INSERT [dbo].[CareRating] ([CareRatingID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (63, N'Adequate', NULL, NULL, NULL, NULL)
INSERT [dbo].[CareRating] ([CareRatingID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (64, N'Good', NULL, NULL, NULL, NULL)
INSERT [dbo].[CareRating] ([CareRatingID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (65, N'Excellent', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CareRating] OFF
SET IDENTITY_INSERT [dbo].[ClinicalCoding] ON 

INSERT [dbo].[ClinicalCoding] ([ClinicalCodingID], [Patient_ID], [PatientID], [SpellNumber], [FCENumber], [Position], [Diagnosiscode], [DiagnosisDescription], [ComorbidityFlag], [ProcedureCode], [ProcedureDescription], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2, N'M34345', 123, 123, 1, N'D12.1', N'Lower respiratory tract infection', 1, N'H123.3', N'Repair of  tract', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ClinicalCoding] OFF
SET IDENTITY_INSERT [dbo].[DataManagement] ON 

INSERT [dbo].[DataManagement] ([DataId], [SourceSystem], [DataSet], [DQRag], [UpdateDate], [UpdateTime]) VALUES (1, N'Mortality', N'Mortality_Review', 0, CAST(N'2019-01-14' AS Date), CAST(N'16:31:00' AS Time))
SET IDENTITY_INSERT [dbo].[DataManagement] OFF
SET IDENTITY_INSERT [dbo].[ExceptionLog] ON 

INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (15, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T11:39:27.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (16, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T11:46:46.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (17, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T11:48:02.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (18, N'LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com BUT User - fghfgmanojs not found in AD', NULL, NULL, CAST(N'2019-02-01T11:48:33.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (19, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T11:54:19.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (20, N'User - manojs found in AD but not found in DB', NULL, NULL, CAST(N'2019-02-01T11:55:26.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (21, N'User - manojs found in AD but not found in DB', NULL, NULL, CAST(N'2019-02-01T12:24:14.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (22, N'User - manojs found in AD but not found in DB', NULL, NULL, CAST(N'2019-02-01T12:26:21.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (23, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T12:27:14.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (24, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T12:30:46.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (25, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T12:31:04.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (26, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T12:45:29.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (27, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T12:48:24.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (28, N'Login Successful. LDAP URL was provided LDAP://AD-GVTECH.corp.gvtech.com And User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T12:57:40.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (29, N'Login Successful. User - manojs was found in AD', NULL, NULL, CAST(N'2019-02-01T13:14:20.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (30, N'User - AnshumanPandey  not found in DB', NULL, NULL, CAST(N'2019-01-02T13:19:00.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (31, N'User - RD0003FF61B89C$  not found in DB', NULL, NULL, CAST(N'2019-02-01T14:15:45.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (32, N'User - RD0003FF61B89C$  not found in DB', NULL, NULL, CAST(N'2019-02-01T15:26:04.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (33, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-01T15:26:37.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (34, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-01T15:28:52.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (35, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-01T15:50:39.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (36, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-01T15:53:09.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (37, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-01T15:53:37.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (38, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-01T15:56:54.000' AS DateTime), NULL)
INSERT [dbo].[ExceptionLog] ([ErrorNo], [ErrorMessage], [ClassName], [MethodName], [CreatedDate], [ErrorType]) VALUES (39, N'Login Successful. User - RD0003FF61B89C$ was found in AD', NULL, NULL, CAST(N'2019-02-03T17:00:11.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ExceptionLog] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FeedBack_ID], [Patient_ID], [PatientID], [FormCompleted], [ComplementsFedBack], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 2, NULL, 1, 1, N'John Deo', CAST(N'2019-01-24T13:18:53.413' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:18:53.413' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBack_ID], [Patient_ID], [PatientID], [FormCompleted], [ComplementsFedBack], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 2, NULL, 1, 1, N'John Deo', CAST(N'2019-01-24T13:24:42.440' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:24:42.440' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBack_ID], [Patient_ID], [PatientID], [FormCompleted], [ComplementsFedBack], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 2, NULL, 1, 1, N'John Deo', CAST(N'2019-01-24T19:36:10.093' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:36:10.093' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBack_ID], [Patient_ID], [PatientID], [FormCompleted], [ComplementsFedBack], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 2, NULL, 1, 1, N'John Deo', CAST(N'2019-01-25T09:21:34.903' AS DateTime), N'John Deo', CAST(N'2019-01-25T09:21:34.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[MedicalExaminer] ON 

INSERT [dbo].[MedicalExaminer] ([ME_ID], [ME_FirstName], [ME_MiddleName], [ME_LastName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'P', N'K', N'P', N'John Deo', CAST(N'2019-01-24T13:09:40.220' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:09:40.220' AS DateTime))
INSERT [dbo].[MedicalExaminer] ([ME_ID], [ME_FirstName], [ME_MiddleName], [ME_LastName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'M', N'K', N'S', N'John Deo', CAST(N'2019-01-24T13:13:24.033' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:13:24.033' AS DateTime))
INSERT [dbo].[MedicalExaminer] ([ME_ID], [ME_FirstName], [ME_MiddleName], [ME_LastName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'M', N'K', N'S', N'John Deo', CAST(N'2019-01-24T13:19:22.250' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:19:22.250' AS DateTime))
INSERT [dbo].[MedicalExaminer] ([ME_ID], [ME_FirstName], [ME_MiddleName], [ME_LastName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'P', N'K', N'P', N'John Deo', CAST(N'2019-01-24T13:23:56.333' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:23:56.333' AS DateTime))
INSERT [dbo].[MedicalExaminer] ([ME_ID], [ME_FirstName], [ME_MiddleName], [ME_LastName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'P', N'K', N'P', N'John Deo', CAST(N'2019-01-25T09:11:41.090' AS DateTime), N'John Deo', CAST(N'2019-01-25T09:11:41.287' AS DateTime))
SET IDENTITY_INSERT [dbo].[MedicalExaminer] OFF
SET IDENTITY_INSERT [dbo].[MedicalExaminerDecision] ON 

INSERT [dbo].[MedicalExaminerDecision] ([MED_ID], [Patient_ID], [PatientID], [MCCDissue], [CoronerReferral], [HospitalPostMortem], [CoronerReferralReasonID], [CauseOfDeath1], [CauseOfDeath2], [CauseOfDeath3], [CauseOfDeath4], [DeathCertificate], [CornerReferralComplete], [CoronerDecisionInquest], [CoronerDecision100A], [CoronerDecisionPostMortem], [CoronerDecisionGPissue], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 2, N'M34345', 0, 1, 0, 10, N'cause1', N'cause2', N'cause3', N'cause4', 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MedicalExaminerDecision] OFF
SET IDENTITY_INSERT [dbo].[MedicalExaminerReview] ON 

INSERT [dbo].[MedicalExaminerReview] ([MEReviewId], [Patient_ID], [PatientID], [ME_ID], [QAP_Discussion], [Notes_Review], [Nok_Discussion], [Comments], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate], [QAPName]) VALUES (11, 2, N'M34345', 2, 1, 1, 1, N'hello comment12', NULL, NULL, NULL, NULL, N'testQAP')
SET IDENTITY_INSERT [dbo].[MedicalExaminerReview] OFF
SET IDENTITY_INSERT [dbo].[MortalitySurveillance] ON 

INSERT [dbo].[MortalitySurveillance] ([MortalitySurveillance_ID], [PatientID], [PresentationToMSG], [DiscussedWithMSG], [AvoidabilityScoreID], [Comments], [FeedbackToNoK], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 2, 1, N'dfddfs', 1, N'ssd ssd ssdd', N'dddd', N'John Deo', CAST(N'2019-01-24T19:08:51.690' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:08:52.013' AS DateTime))
INSERT [dbo].[MortalitySurveillance] ([MortalitySurveillance_ID], [PatientID], [PresentationToMSG], [DiscussedWithMSG], [AvoidabilityScoreID], [Comments], [FeedbackToNoK], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 2, 1, N'dsfsdf', 1, N'sss', N'sss', N'John Deo', CAST(N'2019-01-24T19:21:35.060' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:21:35.437' AS DateTime))
INSERT [dbo].[MortalitySurveillance] ([MortalitySurveillance_ID], [PatientID], [PresentationToMSG], [DiscussedWithMSG], [AvoidabilityScoreID], [Comments], [FeedbackToNoK], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 2, 1, N'xdv', 1, N'vxv', N'xcvxvx', N'John Deo', CAST(N'2019-01-24T14:12:51.073' AS DateTime), N'John Deo', CAST(N'2019-01-24T14:12:51.073' AS DateTime))
INSERT [dbo].[MortalitySurveillance] ([MortalitySurveillance_ID], [PatientID], [PresentationToMSG], [DiscussedWithMSG], [AvoidabilityScoreID], [Comments], [FeedbackToNoK], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 2, 1, N'dsfsdf', 1, N'cvxv', N'cxvxvx', N'John Deo', CAST(N'2019-01-24T14:13:22.420' AS DateTime), N'John Deo', CAST(N'2019-01-24T14:13:22.420' AS DateTime))
INSERT [dbo].[MortalitySurveillance] ([MortalitySurveillance_ID], [PatientID], [PresentationToMSG], [DiscussedWithMSG], [AvoidabilityScoreID], [Comments], [FeedbackToNoK], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 2, 0, NULL, -1, NULL, NULL, N'John Deo', CAST(N'2019-01-24T19:41:34.763' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:34.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[MortalitySurveillance] OFF
SET IDENTITY_INSERT [dbo].[OtherReferral] ON 

INSERT [dbo].[OtherReferral] ([OtherReferral_ID], [Patient_ID], [PatientID], [PatientSafetySIRI], [PatientSafetySIRIReason], [ChildDeathCoordinator], [LearningDisabilityNurse], [HeadOfCompliance], [HeadOfComplianceReason], [PALsComplaints], [PALsComplaintsReason], [WardTeam], [WardTeamReason], [Other], [OtherReason], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 2, NULL, 1, N'test123', 1, 1, 1, N'test345', 1, N'2232', 1, N'test456', 1, N'test567', N'John Deo', CAST(N'2019-01-24T13:19:42.903' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:19:42.903' AS DateTime))
INSERT [dbo].[OtherReferral] ([OtherReferral_ID], [Patient_ID], [PatientID], [PatientSafetySIRI], [PatientSafetySIRIReason], [ChildDeathCoordinator], [LearningDisabilityNurse], [HeadOfCompliance], [HeadOfComplianceReason], [PALsComplaints], [PALsComplaintsReason], [WardTeam], [WardTeamReason], [Other], [OtherReason], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 2, NULL, 1, N'test123', 1, 1, 1, N'test345', 1, N'2232', 1, N'test456', 1, N'test567', N'John Deo', CAST(N'2019-01-24T13:24:36.463' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:24:36.463' AS DateTime))
INSERT [dbo].[OtherReferral] ([OtherReferral_ID], [Patient_ID], [PatientID], [PatientSafetySIRI], [PatientSafetySIRIReason], [ChildDeathCoordinator], [LearningDisabilityNurse], [HeadOfCompliance], [HeadOfComplianceReason], [PALsComplaints], [PALsComplaintsReason], [WardTeam], [WardTeamReason], [Other], [OtherReason], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 2, NULL, 1, N'test123', 1, 1, 1, N'test345', 1, N'2232', 1, N'test456', 1, N'test567', N'John Deo', CAST(N'2019-01-25T09:19:20.143' AS DateTime), N'John Deo', CAST(N'2019-01-25T09:19:20.143' AS DateTime))
SET IDENTITY_INSERT [dbo].[OtherReferral] OFF
SET IDENTITY_INSERT [dbo].[PatientDetails] ON 

INSERT [dbo].[PatientDetails] ([ID], [PatientID], [SpellNumber], [PatientName], [NHSNumber], [Gender], [Age], [DOB], [DateofAdmission], [TimeofAdmission], [DischargeWard], [DateofDeath], [TimeofDeath], [WardofDeath], [DischargeConsultantCode], [DischargeConsultantName], [DischargeSpecialityCode], [DischargeSpeciality], [Caregroup], [AdmissionType], [PrimaryDiagnosis], [PrimaryProcedure], [ComorbiditiesCount], [SHMIGroup], [SHMICode], [CodingIssueIdentified], [Comments], [MedTriage], [SJR1], [SJR2], [SJROutcome], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'M34345', 1, N'Anshuman Pandey', N'12345', N'Male', 35, CAST(N'1983-12-28' AS Date), CAST(N'2018-12-24' AS Date), CAST(N'08:00:00' AS Time), N'12', CAST(N'2018-12-29' AS Date), CAST(N'19:08:00' AS Time), N'A234', N'DFG234', N'A P', N'CR', N'Cancer', N'ERT', N'Emergency', N'Vomitting', N'None', 7, N'UIOP', NULL, 1, N'test123', 3, 3, 3, 3, N'John Deo', CAST(N'2019-01-25T11:23:13.067' AS DateTime), N'John Deo', CAST(N'2019-01-25T11:23:13.067' AS DateTime))
SET IDENTITY_INSERT [dbo].[PatientDetails] OFF
SET IDENTITY_INSERT [dbo].[ReferralReason] ON 

INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (5, NULL, N'M K S', N'John Deo', CAST(N'2019-01-24T13:13:47.817' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:13:47.817' AS DateTime))
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (6, NULL, N'P K P', N'John Deo', CAST(N'2019-01-24T13:19:27.280' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:19:27.280' AS DateTime))
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (7, NULL, N'T M T', N'John Deo', CAST(N'2019-01-24T13:24:08.907' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:24:08.907' AS DateTime))
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (8, NULL, N'M K S', N'John Deo', CAST(N'2019-01-25T09:14:33.670' AS DateTime), N'John Deo', CAST(N'2019-01-25T09:14:33.670' AS DateTime))
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 1, N'the medical cause of death is unknown A', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 1, N'the medical cause of death is unknown E', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 1, N'the medical cause of death is unknown I', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 1, N'the medical cause of death is unknown N', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 2, N'the medical cause of death is unknown B', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 2, N'the medical cause of death is unknown F', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 2, N'the medical cause of death is unknown J', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 2, N'the medical cause of death is unknown C', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (17, 2, N'the medical cause of death is unknown G', NULL, NULL, NULL, NULL)
INSERT [dbo].[ReferralReason] ([Reason_ID], [ReasonGroupID], [ReasonName], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (18, 2, N'the medical cause of death is unknown K', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ReferralReason] OFF
SET IDENTITY_INSERT [dbo].[ReferralReasonGroup] ON 

INSERT [dbo].[ReferralReasonGroup] ([GroupID], [GroupName]) VALUES (1, N'Mental Health')
INSERT [dbo].[ReferralReasonGroup] ([GroupID], [GroupName]) VALUES (2, N'External factors')
INSERT [dbo].[ReferralReasonGroup] ([GroupID], [GroupName]) VALUES (3, N'Unknown')
INSERT [dbo].[ReferralReasonGroup] ([GroupID], [GroupName]) VALUES (4, N'Other')
SET IDENTITY_INSERT [dbo].[ReferralReasonGroup] OFF
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (41, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:04.160' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:04.160' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (42, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:04.543' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:04.543' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (43, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:04.917' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:04.917' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (44, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:05.283' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:05.283' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (45, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:05.650' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:05.650' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (46, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:06.027' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:06.027' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (47, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:06.397' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:06.397' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (48, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:06.763' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:06.763' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (49, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:56.597' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:56.597' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (50, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:56.980' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:56.980' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (51, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:57.333' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:57.333' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (52, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:57.713' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:57.713' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (53, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:58.080' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:58.080' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (54, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:58.450' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:58.450' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (55, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:58.813' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:58.813' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (56, N'Yes', N'John Deo', CAST(N'2019-01-24T13:26:59.173' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:26:59.173' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (57, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:40.743' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:40.743' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (58, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:41.137' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:41.137' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (59, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:41.497' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:41.497' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (60, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:41.873' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:41.873' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (61, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:42.250' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:42.250' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (62, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:42.633' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:42.633' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (63, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:43.013' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:43.013' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (64, N'Yes', N'John Deo', CAST(N'2019-01-24T19:37:43.377' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:37:43.377' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (65, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:18.053' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:18.053' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (66, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:18.413' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:18.413' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (67, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:18.797' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:18.797' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (68, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:19.167' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:19.167' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (69, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:19.527' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:19.527' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (70, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:19.907' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:19.907' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (71, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:20.290' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:20.290' AS DateTime))
INSERT [dbo].[ResponsePT] ([ResponseID], [Response], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (72, N'Yes', N'John Deo', CAST(N'2019-01-24T19:41:20.670' AS DateTime), N'John Deo', CAST(N'2019-01-24T19:41:20.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReviewStatus] ON 

INSERT [dbo].[ReviewStatus] ([ReviewStatusId], [Patient_ID], [PatientID], [Spellnumber], [METriage], [SJR1], [SJR2], [SJRoutcome], [MortalityReview], [CodingReview], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 2, NULL, N'1', 3, 3, 3, 3, NULL, NULL, N'John Deo', CAST(N'2019-01-25T11:23:13.627' AS DateTime), N'John Deo', CAST(N'2019-01-25T11:23:13.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReviewStatus] OFF
SET IDENTITY_INSERT [dbo].[SJR2FormInitial] ON 

INSERT [dbo].[SJR2FormInitial] ([SJRFormInitial_ID], [Patient_ID], [PatientID], [InitialManagement], [InitialManagementCareRatingID], [OngoingCare], [OngoingCareRatingID], [CareDuringProcedure], [CareDuringProcedureCareRatingID], [EndLifeCare], [EndLifeCareRatingID], [OverAllAssessment], [OverAllAssessmentCareRatingID], [Stage], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate], [QualityDocumentationCode]) VALUES (1, 2, N'M34345', N'test1', 61, N'test2', 62, N'test3', 63, N'test4', 64, N'test5', 65, NULL, NULL, NULL, NULL, NULL, 65)
SET IDENTITY_INSERT [dbo].[SJR2FormInitial] OFF
SET IDENTITY_INSERT [dbo].[SJR2FormProblemType] ON 

INSERT [dbo].[SJR2FormProblemType] ([SJRFormProblemType_ID], [Patient_ID], [PatientID], [ProblemOccured], [AssessmentResponseID], [AssessmentCarePhaseID], [MedicationResponseID], [MedicationCarePhaseID], [TreatmentResponseID], [TreatmentCarePhaseID], [InfectionResponseID], [InfectionCarePhaseID], [ProcedureResponseID], [ProcedureCarePhaseID], [MonitoringResponseID], [ResuscitationResponseID], [OthertypeResponseID], [OthertypeCarePhaseID], [AvoidabilityScoreID], [Comments], [Stage], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2, N'M34345', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, N'teststage3', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SJR2FormProblemType] OFF
SET IDENTITY_INSERT [dbo].[SJRFormInitial] ON 

INSERT [dbo].[SJRFormInitial] ([SJRFormInitial_ID], [Patient_ID], [PatientID], [InitialManagement], [InitialManagementCareRatingID], [OngoingCare], [OngoingCareRatingID], [CareDuringProcedure], [CareDuringProcedureCareRatingID], [EndLifeCare], [EndLifeCareRatingID], [OverAllAssessment], [OverAllAssessmentCareRatingID], [Stage], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate], [QualityDocumentationCode]) VALUES (13, 2, N'M34345', N'test123', 61, N'test234', 62, N'test678', 63, N'test458', 64, N'test890', 65, NULL, NULL, NULL, NULL, NULL, 65)
SET IDENTITY_INSERT [dbo].[SJRFormInitial] OFF
SET IDENTITY_INSERT [dbo].[SJRFormProblemType] ON 

INSERT [dbo].[SJRFormProblemType] ([SJRFormProblemType_ID], [Patient_ID], [PatientID], [ProblemOccured], [AssessmentResponseID], [AssessmentCarePhaseID], [MedicationResponseID], [MedicationCarePhaseID], [TreatmentResponseID], [TreatmentCarePhaseID], [InfectionResponseID], [InfectionCarePhaseID], [ProcedureResponseID], [ProcedureCarePhaseID], [MonitoringResponseID], [ResuscitationResponseID], [OthertypeResponseID], [OthertypeCarePhaseID], [AvoidabilityScoreID], [Comments], [Stage], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2, N'M34345', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, N'test comments', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SJRFormProblemType] OFF
SET IDENTITY_INSERT [dbo].[SJROutcomes] ON 

INSERT [dbo].[SJROutcomes] ([SJROutcome_ID], [Patient_ID], [PatientID], [Stage2SJRRequired], [Stage2SJRDateSent], [Stage2SJRSentTo], [ReferenceNumber], [DateReceived], [MSGRequired], [MSGDiscussed], [AvoidabilityScoreID], [FeedbackToNoK], [SIRIComments], [Comments], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (24, 2, N'M34345', 1, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'testsjr', N'34567', CAST(N'2019-02-12T00:00:00.000' AS DateTime), 1, CAST(N'2019-02-25T00:00:00.000' AS DateTime), 1, N'testnok', N'testsiri', N'testcom', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SJROutcomes] OFF
SET IDENTITY_INSERT [dbo].[SJRReview] ON 

INSERT [dbo].[SJRReview] ([SJRReview_ID], [Patient_ID], [PatientID], [PaediatricPatient], [LearningDisabilityPatient], [MentalillnessPatient], [ElectiveAdmission], [NoKConcernsDeath], [OtherConcern], [FullSJRRequired], [SJRReviewSpecialityID], [OtherConcernDetails], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2, N'M34345', 1, 1, 1, 1, 1, 1, 1, 15, N'test1234', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SJRReview] OFF
SET IDENTITY_INSERT [dbo].[SJRReviewSpeciality] ON 

INSERT [dbo].[SJRReviewSpeciality] ([SJRReviewSpecialityID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'P K P', N'John Deo', CAST(N'2019-01-24T13:19:36.257' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:19:36.257' AS DateTime))
INSERT [dbo].[SJRReviewSpeciality] ([SJRReviewSpecialityID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'M K S', N'John Deo', CAST(N'2019-01-24T13:24:16.933' AS DateTime), N'John Deo', CAST(N'2019-01-24T13:24:16.933' AS DateTime))
INSERT [dbo].[SJRReviewSpeciality] ([SJRReviewSpecialityID], [Name], [CreatedBy], [CreateDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'M K S', N'John Deo', CAST(N'2019-01-25T09:17:10.097' AS DateTime), N'John Deo', CAST(N'2019-01-25T09:17:10.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[SJRReviewSpeciality] OFF
SET IDENTITY_INSERT [dbo].[Specialities] ON 

INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (1, N'Acute medicine')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (2, N'Cardiology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (3, N'Critical care medicine')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (4, N'Diabetes & endocrinology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (5, N'Elderly care')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (6, N'ENT')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (7, N'Gastroenterology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (8, N'General surgery')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (9, N'Haematology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (10, N'Neurology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (11, N'Oncology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (12, N'Renal')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (13, N'Respiratory')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (14, N'Rheumatology')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (15, N'Sexual health')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (16, N'Stroke medicine')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (17, N'Trauma & orthopaedics')
INSERT [dbo].[Specialities] ([SpecialityID], [SpecialityName]) VALUES (18, N'Urology')
SET IDENTITY_INSERT [dbo].[Specialities] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'jo.B@rhbh.com', N'ME', N'C123454', N'Jo', N'Brown', N'Brownjo', N'T&O', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'jo.A@rhbh.com', N'QAP', N'C123455', N'Jon', N'Adam', N'Adamjo', N'T&O', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'alex.B@rhbh.com', N'Admin', N'N100001', N'Alex', N'Burn', N'BurnAlex', N'Governance', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'tom.H@rhbh.com', N'Consultant', N'C123457', N'Tom', N'Hanks', N'HanksTom', N'T&O', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'rob.H@rhbh.com', N'Other clinician', N'C123458', N'Rob', N'Henry', N'HenryRob', N'T&O', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'manoj@gvtechsolution.com', N'Other clinician', N'C123459', N'Manoj', N'Singh', N'manojs', N'T&O', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'', N'Admin', N'N100001', N'Katie', N'Elcock', N'Elcockk', N'Governance', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'', N'Admin', N'N100001', N'Darren', N'Lee', N'leeD', N'Governance', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'', N'Admin', N'N100001', N'Eghosa', N'Bazuaye', N'Bazuaye', N'Informatics', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'', N'Admin', N'N100001', N'Sam', N'Harmer', N'HarmerS', N'Informatics', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, N'', N'ME', N'C100002', N'Natalie', N'Shaw', N'ShawN', N'Bereavement', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'', N'ME', N'C100003', N'Juliet', N'Murphy', N'MurphyJ', N'Governance', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, N'', N'Consultant', N'C100004', N'Jon', N'Swinburn', N'SwinburnJ', N'Cardiology', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, N'', N'ME', N'C100005', N'bhavesh', N'Sachdev', N'bhaveshs', N'ED', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, N'', N'Admin', N'C100005', N'Xu', N'Shen', N'xus', N'Governance', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, N'', N'Admin', N'C100005', N'Anshuman', N'Pandey', N'AnshumanPandey', N'Governance', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, N'', N'Admin', N'C100005', N'Anshuman', N'Pandey', N'RD0003FF61B89C$', N'Governance', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PatientD__970EC347368278F7]    Script Date: 03/02/2019 18:06:50 ******/
ALTER TABLE [dbo].[PatientDetails] ADD UNIQUE NONCLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClinicalCoding]  WITH CHECK ADD  CONSTRAINT [FK__ClinicalC__Patie__498EEC8D] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[ClinicalCoding] CHECK CONSTRAINT [FK__ClinicalC__Patie__498EEC8D]
GO
ALTER TABLE [dbo].[ClinicalCoding]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalCoding_ClinicalCoding] FOREIGN KEY([ClinicalCodingID])
REFERENCES [dbo].[ClinicalCoding] ([ClinicalCodingID])
GO
ALTER TABLE [dbo].[ClinicalCoding] CHECK CONSTRAINT [FK_ClinicalCoding_ClinicalCoding]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK__FeedBack__Patien__797309D9] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK__FeedBack__Patien__797309D9]
GO
ALTER TABLE [dbo].[MedicalExaminerDecision]  WITH CHECK ADD  CONSTRAINT [FK__MedicalEx__Coron__7A672E12] FOREIGN KEY([CoronerReferralReasonID])
REFERENCES [dbo].[ReferralReason] ([Reason_ID])
GO
ALTER TABLE [dbo].[MedicalExaminerDecision] CHECK CONSTRAINT [FK__MedicalEx__Coron__7A672E12]
GO
ALTER TABLE [dbo].[MedicalExaminerDecision]  WITH CHECK ADD  CONSTRAINT [FK__MedicalEx__Patie__7B5B524B] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[MedicalExaminerDecision] CHECK CONSTRAINT [FK__MedicalEx__Patie__7B5B524B]
GO
ALTER TABLE [dbo].[MedicalExaminerReview]  WITH CHECK ADD  CONSTRAINT [FK__MedicalEx__ME_ID__7C4F7684] FOREIGN KEY([ME_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[MedicalExaminerReview] CHECK CONSTRAINT [FK__MedicalEx__ME_ID__7C4F7684]
GO
ALTER TABLE [dbo].[MedicalExaminerReview]  WITH CHECK ADD  CONSTRAINT [FK__MedicalEx__Patie__7D439ABD] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[MedicalExaminerReview] CHECK CONSTRAINT [FK__MedicalEx__Patie__7D439ABD]
GO
ALTER TABLE [dbo].[MortalitySurveillance]  WITH CHECK ADD  CONSTRAINT [FK__Mortality__Patie__7E37BEF6] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[MortalitySurveillance] CHECK CONSTRAINT [FK__Mortality__Patie__7E37BEF6]
GO
ALTER TABLE [dbo].[OtherReferral]  WITH CHECK ADD  CONSTRAINT [FK__OtherRefe__Patie__7F2BE32F] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[OtherReferral] CHECK CONSTRAINT [FK__OtherRefe__Patie__7F2BE32F]
GO
ALTER TABLE [dbo].[ReferralReason]  WITH CHECK ADD  CONSTRAINT [FK_ReferralReason_ReferralReasonGroup] FOREIGN KEY([ReasonGroupID])
REFERENCES [dbo].[ReferralReasonGroup] ([GroupID])
GO
ALTER TABLE [dbo].[ReferralReason] CHECK CONSTRAINT [FK_ReferralReason_ReferralReasonGroup]
GO
ALTER TABLE [dbo].[ReviewStatus]  WITH CHECK ADD  CONSTRAINT [FK__ReviewSta__Patie__634EBE90] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[ReviewStatus] CHECK CONSTRAINT [FK__ReviewSta__Patie__634EBE90]
GO
ALTER TABLE [dbo].[ReviewStatus]  WITH CHECK ADD  CONSTRAINT [FK_ReviewStatus_ReviewStatus] FOREIGN KEY([ReviewStatusId])
REFERENCES [dbo].[ReviewStatus] ([ReviewStatusId])
GO
ALTER TABLE [dbo].[ReviewStatus] CHECK CONSTRAINT [FK_ReviewStatus_ReviewStatus]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__CareD__02084FDA] FOREIGN KEY([CareDuringProcedureCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__CareD__02084FDA]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__EndLi__02FC7413] FOREIGN KEY([EndLifeCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__EndLi__02FC7413]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__Initi__03F0984C] FOREIGN KEY([InitialManagementCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__Initi__03F0984C]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__Ongoi__04E4BC85] FOREIGN KEY([OngoingCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__Ongoi__04E4BC85]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__OverA__05D8E0BE] FOREIGN KEY([OverAllAssessmentCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__OverA__05D8E0BE]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__Patie__06CD04F7] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__Patie__06CD04F7]
GO
ALTER TABLE [dbo].[SJR2FormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJR2FormIn__Quali__07C12930] FOREIGN KEY([QualityDocumentationCode])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJR2FormInitial] CHECK CONSTRAINT [FK__SJR2FormIn__Quali__07C12930]
GO
ALTER TABLE [dbo].[SJR2FormProblemType]  WITH CHECK ADD  CONSTRAINT [FK_SJR2FormProblemType_PatientDetails] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[SJR2FormProblemType] CHECK CONSTRAINT [FK_SJR2FormProblemType_PatientDetails]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__CareD__02084FDA] FOREIGN KEY([CareDuringProcedureCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__CareD__02084FDA]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__EndLi__02FC7413] FOREIGN KEY([EndLifeCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__EndLi__02FC7413]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__Initi__03F0984C] FOREIGN KEY([InitialManagementCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__Initi__03F0984C]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__Ongoi__04E4BC85] FOREIGN KEY([OngoingCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__Ongoi__04E4BC85]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__OverA__05D8E0BE] FOREIGN KEY([OverAllAssessmentCareRatingID])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__OverA__05D8E0BE]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__Patie__06CD04F7] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__Patie__06CD04F7]
GO
ALTER TABLE [dbo].[SJRFormInitial]  WITH CHECK ADD  CONSTRAINT [FK__SJRFormIn__Quali__07C12930] FOREIGN KEY([QualityDocumentationCode])
REFERENCES [dbo].[CareRating] ([CareRatingID])
GO
ALTER TABLE [dbo].[SJRFormInitial] CHECK CONSTRAINT [FK__SJRFormIn__Quali__07C12930]
GO
ALTER TABLE [dbo].[SJRFormProblemType]  WITH CHECK ADD  CONSTRAINT [FK_SJRFormProblemType_PatientDetails] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[SJRFormProblemType] CHECK CONSTRAINT [FK_SJRFormProblemType_PatientDetails]
GO
ALTER TABLE [dbo].[SJROutcomes]  WITH CHECK ADD  CONSTRAINT [FK__SJROutcom__Patie__17F790F9] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[SJROutcomes] CHECK CONSTRAINT [FK__SJROutcom__Patie__17F790F9]
GO
ALTER TABLE [dbo].[SJRReview]  WITH CHECK ADD  CONSTRAINT [FK__SJRReview__Patie__18EBB532] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[PatientDetails] ([ID])
GO
ALTER TABLE [dbo].[SJRReview] CHECK CONSTRAINT [FK__SJRReview__Patie__18EBB532]
GO
ALTER TABLE [dbo].[SJRReview]  WITH CHECK ADD  CONSTRAINT [FK__SJRReview__SJRRe__19DFD96B] FOREIGN KEY([SJRReviewSpecialityID])
REFERENCES [dbo].[Specialities] ([SpecialityID])
GO
ALTER TABLE [dbo].[SJRReview] CHECK CONSTRAINT [FK__SJRReview__SJRRe__19DFD96B]
GO
/****** Object:  StoredProcedure [dbo].[GetRatingIDByName]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[GetRatingIDByName]
(
    @Name varchar(200)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    select CareRatingID from CareRating where [Name] = @Name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataManagementDetails]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_DataManagementDetails]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select SourceSystem, DataSet, DQRag, UpdateDate, UpdateTime from DataManagement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetConsultants]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetConsultants]

AS
BEGIN
    SET NOCOUNT ON

    Select distinct DischargeConsultantCode, DischargeConsultantName from PatientDetails 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCoronerReferrals]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCoronerReferrals]
(
   @GroupID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select Reason_ID, ReasonName from ReferralReason where ReasonGroupID = @GroupID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetDiagnosisByPatientID]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetDiagnosisByPatientID]
(
	@PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	Select Position, ComorbidityFlag, Diagnosiscode + ' - ' + DiagnosisDescription as DiagnosisDescription from ClinicalCoding where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetFeedback]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetFeedback]
(
	@PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	select Patient_ID, FormCompleted, [ComplementsFedBack] from FeedBack where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetFilteredPatientDetails]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetFilteredPatientDetails]
(
    @StartDate datetime,
	@EndDate datetime,
	@DischargeConsultantCode varchar(100),
	@WardOfDeath varchar(50),
	@DischargeSpecialityCode varchar(100) 
)
AS
BEGIN
declare @sql varchar(max)
declare @whereclause varchar(max)

Set @sql = ''
Set @whereclause = ''

If @StartDate is not null
Begin
	Set @whereclause += ' DateOfDeath > ''' + Convert (varchar(30), @StartDate) + ''''
End

If @EndDate is not null and @StartDate is not null
Begin
	Set @whereclause += ' And DateOfDeath < ''' + Convert(varchar(30), @EndDate) + ''''
End
Else
Begin
	Set @whereclause += ' DateOfDeath < ''' + Convert(varchar(30), @EndDate) + ''''
End

If ltrim(rtrim(@DischargeConsultantCode)) <> '' And (@StartDate is not null Or @EndDate is not null)
Begin
	Set @whereclause += ' And DischargeConsultantCode = ''' + @DischargeConsultantCode + ''''
End
Else
If ltrim(rtrim(@DischargeConsultantCode)) <> ''
Begin
	Set @whereclause += ' DischargeConsultantCode = ''' + @DischargeConsultantCode + ''''
End

If ltrim(rtrim(@WardOfDeath)) <> '' And (@StartDate is not null Or @EndDate is not null Or ltrim(rtrim(@DischargeConsultantCode)) <> '')
Begin
	Set @whereclause += ' And WardOfDeath = ''' + @WardOfDeath + ''''
End
Else
If ltrim(rtrim(@WardOfDeath)) <> ''
Begin
	Set @whereclause += ' WardOfDeath = ''' + @WardOfDeath + ''''
End
print @whereclause
If ltrim(rtrim(@DischargeSpecialityCode)) <> '' And (@StartDate is not null Or @EndDate is not null Or ltrim(rtrim(@DischargeConsultantCode)) <> '' Or ltrim(rtrim(@WardOfDeath)) <> '')
Begin
	Set @whereclause += ' And DischargeSpecialityCode = ''' + @DischargeSpecialityCode + ''''
End
Else
If ltrim(rtrim(@DischargeSpecialityCode)) <> ''
Begin
	Set @whereclause += ' DischargeSpecialityCode = ''' + @DischargeSpecialityCode + ''''
End

Set @sql = 'SELECT distinct a.ID, a.[PatientId]
      ,[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,[DischargeConsultantName]
      ,[DischargeSpecialityCode]
      ,[DischargeSpeciality]
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments]
      ,case when [MedTriage] is null then 2 else [MedTriage] end as MedTriage
      ,case when [SJR1] is null then 0 else [SJR1] end as SJR1
      ,case when [SJR2] is null then 0 else [SJR2] end as SJR2
      ,case when [SJROutcome] is null then 0 else [SJROutcome] end as SJROutcome
      ,case when b.[FullSJRRequired] is null then 0 else b.[FullSJRRequired] end as IsFullSJRRequired
	  ,case when c.Stage2SJRRequired is null then 0 else c.Stage2SJRRequired end as Stage2SJRRequired
  FROM [dbo].[PatientDetails] a
  Left Join [dbo].SJRReview b  
  On a.PatientID = b.PatientID
  Left Join [dbo].SJROutcomes c
  On a.PatientID = c.PatientID
  Where '

  Set @sql = @sql + @whereclause
  exec(@sql)
End
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMedicalExamierReview]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetMedicalExamierReview]
(
   @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select Patient_ID, PatientID, case when ME_ID is null then 0 else ME_ID end as ME_ID, QAP_Discussion, Notes_Review, Nok_Discussion, QAPName, Comments from MedicalExaminerReview where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMedicalExaminerDecision]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetMedicalExaminerDecision]
(
    @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	declare @Patient_ID varchar(10)
	select @Patient_ID = PatientID from PatientDetails where ID = @PatientID

    Select Patient_ID, @Patient_ID as PatientID, MCCDissue, CoronerReferral, HospitalPostMortem, CoronerReferralReasonID, g.GroupID as GroupID, CauseOfDeath1, 
	CauseOfDeath2, CauseOfDeath3, CauseOfDeath4, DeathCertificate, CornerReferralComplete, CoronerDecisionInquest,
	CoronerDecision100A, CoronerDecisionPostMortem from MedicalExaminerDecision m
	Left Join ReferralReason r on r.Reason_ID = m.CoronerReferralReasonID
	Left Join ReferralReasonGroup g on g.GroupID = r.ReasonGroupID
	where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMedicalExaminers]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetMedicalExaminers]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select ID, Email, Code, FirstName + ' ' + LastName as [Name], [Role],UserID, Speciality from Users where [Role] = 'ME'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetOtherReferrals]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetOtherReferrals]
(
    @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select Patient_ID, PatientID, [PatientSafetySIRI], [PatientSafetySIRIReason], [ChildDeathCoordinator], [LearningDisabilityNurse], [HeadOfCompliance],
	[HeadOfComplianceReason], [PALsComplaints], [PALsComplaintsReason], [WardTeam], [WardTeamReason], [Other], [OtherReason] from OtherReferral
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPatientDashboardDetails]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetPatientDashboardDetails]
(
    @PatientID int
)
AS
BEGIN

If @PatientID <> ''
Begin

declare @ID int

SELECT distinct a.ID, a.[PatientId]
      ,a.[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,DischargeConsultantName
      ,DischargeSpecialityCode
      ,DischargeSpeciality
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments]
      ,case when [MedTriage] is null then 2 else [MedTriage] end as MedTriage
      ,case when [SJR1] is null then 0 else [SJR1] end as SJR1
      ,case when [SJR2] is null then 0 else [SJR2] end as SJR2
      ,case when [SJROutcome] is null then 0 else [SJROutcome] end as SJROutcome
      ,case when b.[FullSJRRequired] is null then 0 else b.[FullSJRRequired] end as IsFullSJRRequired
	  ,case when c.Stage2SJRRequired is null then 0 else c.Stage2SJRRequired end as Stage2SJRRequired
	  ,Count(d.ProcedureCode) as 'ProcedureCount'
	  ,Count(d.DiagnosisCode) as 'DiagnosisCount'
  FROM [dbo].[PatientDetails] a
  Left Join [dbo].SJRReview b  
  On a.ID = b.Patient_ID
  Left Join [dbo].SJROutcomes c
  On a.ID = c.Patient_ID
  Left Join [dbo].ClinicalCoding d
  On a.ID = d.Patient_ID
  Where a.ID = @PatientID
  Group By a.ID, a.[PatientId]
      ,a.[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,DischargeConsultantName
      ,DischargeSpecialityCode
      ,DischargeSpeciality
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments], MedTriage, SJR1, SJR2, SJROutcome, b.FullSJRRequired, c.Stage2SJRRequired, d.ProcedureCode, d.ProcedureDescription, d.Diagnosiscode, d.DiagnosisDescription
End
Else
Begin
	SELECT a.ID, a.[PatientId]
      ,a.[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,DischargeConsultantName
      ,DischargeSpecialityCode
      ,DischargeSpeciality
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments]
      ,case when [MedTriage] is null then 2 else [MedTriage] end as MedTriage
      ,case when [SJR1] is null then 0 else [SJR1] end as SJR1
      ,case when [SJR2] is null then 0 else [SJR2] end as SJR2
      ,case when [SJROutcome] is null then 0 else [SJROutcome] end as SJROutcome
      ,case when b.[FullSJRRequired] is null then 0 else b.[FullSJRRequired] end as IsFullSJRRequired
	  ,case when c.Stage2SJRRequired is null then 0 else c.Stage2SJRRequired end as Stage2SJRRequired
	  ,Count(d.ProcedureCode) as 'ProcedureCount'
	  ,Count(d.DiagnosisCode) as 'DiagnosisCount'
  FROM [dbo].[PatientDetails] a
  Left Join [dbo].SJRReview b 
  On a.ID = b.Patient_ID
  Left Join [dbo].SJROutcomes c
  On a.ID = c.Patient_ID
  Left Join [dbo].ClinicalCoding d
  On a.ID = d.Patient_ID
    Group By a.ID, a.[PatientId]
      ,a.[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,DischargeConsultantName
      ,DischargeSpecialityCode
      ,DischargeSpeciality
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments], MedTriage, SJR1, SJR2, SJROutcome, b.FullSJRRequired, c.Stage2SJRRequired, d.ProcedureCode, d.ProcedureDescription, d.Diagnosiscode, d.DiagnosisDescription
END
End
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPatientDetailsByID]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetPatientDetailsByID]
(
    @PatientID int
)
AS
BEGIN

SELECT distinct a.ID, a.[PatientId]
      ,a.[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,DischargeConsultantName
      ,DischargeSpecialityCode
      ,DischargeSpeciality
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments]
      ,case when [MedTriage] is null then 2 else [MedTriage] end as MedTriage
      ,case when [SJR1] is null then 0 else [SJR1] end as SJR1
      ,case when [SJR2] is null then 0 else [SJR2] end as SJR2
      ,case when [SJROutcome] is null then 0 else [SJROutcome] end as SJROutcome
      ,case when b.[FullSJRRequired] is null then 0 else b.[FullSJRRequired] end as IsFullSJRRequired
	  ,case when c.Stage2SJRRequired is null then 0 else c.Stage2SJRRequired end as Stage2SJRRequired
	  ,Count(d.ProcedureCode) as 'ProcedureCount'
	  ,Count(d.DiagnosisCode) as 'DiagnosisCount'
  FROM [dbo].[PatientDetails] a
  Left Join [dbo].SJRReview b  
  On a.ID = b.Patient_ID
  Left Join [dbo].SJROutcomes c
  On a.ID = c.Patient_ID
  Left Join [dbo].ClinicalCoding d
  On a.ID = d.Patient_ID
  Where a.ID = @PatientID
  Group By a.ID, a.[PatientId]
      ,a.[SpellNumber]
      ,[PatientName]
      ,[NHSNumber]
      ,[Gender]
      ,[Age]
      ,[DOB]
      ,[DateofAdmission]
      ,[TimeofAdmission]
      ,[DischargeWard]
      ,[DateofDeath]
      ,[TimeofDeath]
      ,[WardofDeath]
      ,[DischargeConsultantCode]
      ,DischargeConsultantName
      ,DischargeSpecialityCode
      ,DischargeSpeciality
      ,[Caregroup]
      ,[AdmissionType]
      ,[PrimaryDiagnosis]
      ,[PrimaryProcedure]
      ,[ComorbiditiesCount]
      ,[SHMIGroup]
      ,[SHMICode]
      ,[CodingIssueIdentified]
      ,a.[Comments], MedTriage, SJR1, SJR2, SJROutcome, b.FullSJRRequired, c.Stage2SJRRequired, d.ProcedureCode, d.ProcedureDescription, d.Diagnosiscode, d.DiagnosisDescription
End
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProcedureByPatientID]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetProcedureByPatientID]
(
	@PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	Select ProcedureCode + ' - ' + ProcedureDescription as ProcedureDescription from ClinicalCoding where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRatingIDByName]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetRatingIDByName]
(
    @Name varchar(200)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    select CareRatingID from CareRating where [Name] = @Name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSJR2FormInitial]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
Create PROCEDURE [dbo].[usp_GetSJR2FormInitial]
(
   @PatientID int	
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select Patient_ID, PatientID, InitialManagement, case when InitialManagementCareRatingID is null then 0 else InitialManagementCareRatingID end as InitialManagementCareRatingID, OngoingCare, 
	case when OngoingCareRatingID is null then 0 else OngoingCareRatingID end as OngoingCareRatingID, CareDuringProcedure, 
	case when CareDuringProcedureCareRatingID is null then 0 else CareDuringProcedureCareRatingID end as CareDuringProcedureCareRatingID, EndLifeCare,
	case when EndLifeCareRatingID is null then 0 else EndLifeCareRatingID end as EndLifeCareRatingID, OverAllAssessment, 
	case when OverAllAssessmentCareRatingID is null then 0 else OverAllAssessmentCareRatingID end as OverAllAssessmentCareRatingID,
	case when QualityDocumentationCode is null then 0 else QualityDocumentationCode end as QualityDocumentation from SJR2FormInitial where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSJR2ProblemType]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
Create PROCEDURE [dbo].[usp_GetSJR2ProblemType]
(
    @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    SELECT [Patient_ID]
      ,[PatientID]
	  ,ProblemOccured
      ,[AssessmentResponseID]
      ,[AssessmentCarePhaseID]
      ,[MedicationResponseID]
      ,[MedicationCarePhaseID]
      ,[TreatmentResponseID]
      ,[TreatmentCarePhaseID]
      ,[InfectionResponseID]
      ,[InfectionCarePhaseID]
      ,[ProcedureResponseID]
      ,[ProcedureCarePhaseID]
      ,[MonitoringResponseID]
      ,[ResuscitationResponseID]
      ,[OthertypeResponseID]
      ,[OthertypeCarePhaseID]
      ,[AvoidabilityScoreID]
      ,[Comments]
  FROM [dbo].[SJR2FormProblemType] Where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSJRAssessmentTriage]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetSJRAssessmentTriage]
(
   @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	select Patient_ID, PatientID, PaediatricPatient, LearningDisabilityPatient, MentalillnessPatient, ElectiveAdmission, NoKConcernsDeath, OtherConcern, OtherConcernDetails, 
	FullSJRRequired, [SJRReviewSpecialityID] as SpecialityID from SJRReview
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSJRFormInitial]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetSJRFormInitial]
(
   @PatientID int	
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select Patient_ID, PatientID, InitialManagement, case when InitialManagementCareRatingID is null then 0 else InitialManagementCareRatingID end as InitialManagementCareRatingID, OngoingCare, 
	case when OngoingCareRatingID is null then 0 else OngoingCareRatingID end as OngoingCareRatingID, CareDuringProcedure, 
	case when CareDuringProcedureCareRatingID is null then 0 else CareDuringProcedureCareRatingID end as CareDuringProcedureCareRatingID, EndLifeCare,
	case when EndLifeCareRatingID is null then 0 else EndLifeCareRatingID end as EndLifeCareRatingID, OverAllAssessment, 
	case when OverAllAssessmentCareRatingID is null then 0 else OverAllAssessmentCareRatingID end as OverAllAssessmentCareRatingID,
	case when QualityDocumentationCode is null then 0 else QualityDocumentationCode end as QualityDocumentation from SJRFormInitial where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSJROutcome]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetSJROutcome]
(
    @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

   SELECT [Patient_ID]
      ,[PatientID]
      ,[Stage2SJRRequired]
      ,[Stage2SJRDateSent]
      ,[Stage2SJRSentTo]
      ,[ReferenceNumber]
      ,[DateReceived]
      ,[MSGRequired]
      ,[MSGDiscussed] as MSGDiscussionDate
      ,[AvoidabilityScoreID]
      ,[FeedbackToNoK]
      ,[SIRIComments]
      ,[Comments]
  FROM [dbo].[SJROutcomes] where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSJRProblemType]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetSJRProblemType]
(
    @PatientID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    SELECT [Patient_ID]
      ,[PatientID]
	  ,ProblemOccured
      ,[AssessmentResponseID]
      ,[AssessmentCarePhaseID]
      ,[MedicationResponseID]
      ,[MedicationCarePhaseID]
      ,[TreatmentResponseID]
      ,[TreatmentCarePhaseID]
      ,[InfectionResponseID]
      ,[InfectionCarePhaseID]
      ,[ProcedureResponseID]
      ,[ProcedureCarePhaseID]
      ,[MonitoringResponseID]
      ,[ResuscitationResponseID]
      ,[OthertypeResponseID]
      ,[OthertypeCarePhaseID]
      ,[AvoidabilityScoreID]
      ,[Comments]
  FROM [dbo].[SJRFormProblemType] Where Patient_ID = @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSpecialities]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetSpecialities]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

   Select SpecialityID, SpecialityName from Specialities
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSpecialityNames]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetSpecialityNames]

AS
BEGIN
    SET NOCOUNT ON

    Select distinct DischargeSpecialityCode, DischargeSpeciality from PatientDetails 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetWardOfDeaths]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetWardOfDeaths]

AS
BEGIN
    SET NOCOUNT ON

    Select distinct WardofDeath from PatientDetails 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertLogException]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertLogException]
(
    @Message varchar(max),
	@ClassName varchar(255),
	@MethodName varchar(255),
	@CreatedDate datetime
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Insert into ExceptionLog values(@Message, @ClassName, @MethodName, @CreatedDate, 'E')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ReasonGroups]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReasonGroups]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

   select GroupID, GroupName from ReferralReasonGroup
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateMedicalExaminerReview]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateMedicalExaminerReview]
(
    @QAPDiscussion bit,
	@NotesReview bit,
	@NoKDiscussion bit,
	@MedID int,
	@QAPName varchar(50),
	@Comments varchar(max),
	@ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	if @MedID = 0
	Begin
		Set @MedID = NULL
	End
   declare @count int
   select @count = Count(*) from MedicalExaminerReview where Patient_ID = @ID
   declare @PatientID varchar(20)
   select @PatientID = PatientID from PatientDetails where ID = @ID
   If @count = 0
   Begin
		Insert into MedicalExaminerReview(Patient_ID, PatientID, ME_ID, QAP_Discussion, Notes_Review, Nok_Discussion, QAPName, Comments)
		values (@ID, @PatientID, @MedID, @QAPDiscussion, @NotesReview, @NoKDiscussion, @QAPName, @Comments)
   End
   Else
   Begin
		Update MedicalExaminerReview
		Set ME_ID = @MedID,
		QAP_Discussion = @QAPDiscussion,
		Notes_Review = @NotesReview,
		Nok_Discussion = @NoKDiscussion,
		QAPName = @QAPName,
		Comments = @Comments
		Where Patient_ID = @ID
   End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateOtherReferrals]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateOtherReferrals]
(
    @PatientSafetySIRI bit,
	@ChildDeathCoordinator bit,
	@LearningDisabilityNurse bit,
	@HeadOfCompliance bit,
	@PALsComplaints bit,
	@WardTeam bit,
	@Other bit,
	@PatientSafetySIRIReason varchar(max),
	@HeadOfComplianceReason varchar(max),
	@PALsComplaintsReason varchar(max),
	@WardTeamReason varchar(max),
	@OtherReason varchar(max),
	@ID int
)
AS
BEGIN
    SET NOCOUNT ON

    declare @count int
	select @count = Count(*) from OtherReferral
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into OtherReferral([Patient_ID], [PatientID], [PatientSafetySIRI], [PatientSafetySIRIReason], [ChildDeathCoordinator], [LearningDisabilityNurse],
		[HeadOfCompliance], [HeadOfComplianceReason], [PALsComplaints], [PALsComplaintsReason], [WardTeam], [WardTeamReason], [Other], [OtherReason])
		values(@ID, @PatientID, @PatientSafetySIRI, @PatientSafetySIRIReason, @ChildDeathCoordinator, @LearningDisabilityNurse, @HeadOfCompliance, @HeadOfComplianceReason, @PALsComplaints,
		@PALsComplaintsReason, @WardTeam, @WardTeamReason, @Other, @OtherReason)
	End
	Else
	Begin
		Update OtherReferral
		Set [PatientSafetySIRI] = @PatientSafetySIRI,
		[PatientSafetySIRIReason] = @PatientSafetySIRIReason,
		[ChildDeathCoordinator] = @ChildDeathCoordinator,
		[LearningDisabilityNurse] = @LearningDisabilityNurse,
		[HeadOfCompliance] = @HeadOfCompliance,
		[HeadOfComplianceReason] = @HeadOfComplianceReason,
		[PALsComplaints] = @PALsComplaints,
		[PALsComplaintsReason] = @PALsComplaintsReason,
		[WardTeam] = @WardTeam,
		[WardTeamReason] = @WardTeamReason,
		[Other] = @Other,
		[OtherReason] = @OtherReason
		Where Patient_ID = @ID
	End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePatientDetails]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdatePatientDetails]
(
   @IsCodingIssueIdentified bit,
   @Comments varchar(max),
   @ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	declare @reviewcount int

	Update PatientDetails
	Set CodingIssueIdentified = @IsCodingIssueIdentified,
	Comments = @Comments,
	MedTriage = 1
	Where ID = @ID

	select @reviewcount = Count(*) from ReviewStatus where Patient_ID = @id

	If @reviewcount = 0
	Begin
		Insert into ReviewStatus(Patient_ID, PatientID, SpellNumber, METriage, SJR1, SJR2, SJRoutcome, MortalityReview, CodingReview,CreateDate, CreatedBy, UpdatedDate, UpdatedBy)
		Select ID, PatientID, SpellNumber, MedTriage, SJR1, SJR2, SJROutcome, null,null,null,null,null, null from PatientDetails where ID = @ID
	End
	Else
	Begin
		Update ReviewStatus
		Set METriage = 1
		Where Patient_ID = @ID
		And METriage <> 3
	End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePositiveFeedback]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdatePositiveFeedback]
(
   @FormCompleted bit,
   @ComplementsFedBack bit,
   @ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    declare @count int
	select @count = Count(*) from FeedBack where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID
	
	If @count = 0
	Begin
		Insert into Feedback ([Patient_ID], [PatientID], [FormCompleted], [ComplementsFedBack])
		values (@ID, @PatientID, @FormCompleted, @ComplementsFedBack)
	End 
	Else
	Begin
		Update FeedBack
		Set FormCompleted = @FormCompleted,
		ComplementsFedBack = @ComplementsFedBack
		Where Patient_ID = @ID
	End

	update PatientDetails
	Set [MedTriage] = 3
	Where ID = @ID and MedTriage = 1

	update ReviewStatus
	Set [METriage] = 3
	Where Patient_ID = @ID and METriage = 1

	declare @FullSJRRequired bit
	select @FullSJRRequired = [FullSJRRequired] from SJRReview where Patient_ID = @ID

	If @FullSJRRequired = 1
	Begin 
		Update PatientDetails 
		Set SJR1 = 1,
		SJROutcome = 1
		where ID = @ID

		Update ReviewStatus
		Set SJR1 = 1,
		SJROutcome = 1
		where Patient_ID = @ID
	End
	Else
	Begin
		Update PatientDetails 
		Set SJROutcome = 1
		where ID = @ID

		Update ReviewStatus
		Set SJR1 = 1
		where Patient_ID = @ID
	End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSJR1ProblemType]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateSJR1ProblemType]
(
	@AssessmentResponseID int,
	@AssessmentCarePhaseID int,
	@MedicationResponseID int,
	@MedicationCarePhaseID int,
	@TreatmentResponseID int,
	@TreatmentCarePhaseID int,
	@InfectionResponseID int,
	@InfectionCarePhaseID int,
	@ProcedureResponseID int,
	@ProcedureCarePhaseID int,
	@MonitoringResponseID int,
	@ResuscitationResponseID int,
	@OthertypeResponseID int,
	@OthertypeCarePhaseID int,
	@AvoidabilityScoreID int,
	@Comments varchar(max),
	@ProblemOccured bit,
	@ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    declare @count int
	select @count = Count(*) from SJRFormProblemType where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into SJRFormProblemType ([Patient_ID], [PatientID], [AssessmentResponseID], [AssessmentCarePhaseID], [MedicationResponseID], [MedicationCarePhaseID], [TreatmentResponseID],
		[TreatmentCarePhaseID], [InfectionResponseID], [InfectionCarePhaseID],[ProcedureResponseID],[ProcedureCarePhaseID], [MonitoringResponseID], [ResuscitationResponseID], [OthertypeResponseID],
		[OthertypeCarePhaseID], [AvoidabilityScoreID], [Comments], ProblemOccured)
		values(@ID, @PatientID, @AssessmentResponseID, @AssessmentCarePhaseID, @MedicationResponseID, @MedicationCarePhaseID, @TreatmentResponseID, @TreatmentCarePhaseID, @InfectionResponseID,
		@InfectionCarePhaseID, @ProcedureResponseID, @ProcedureCarePhaseID, @MonitoringResponseID, @ResuscitationResponseID, @OthertypeResponseID, 
		@OthertypeCarePhaseID, @AvoidabilityScoreID, @Comments, @ProblemOccured)
	End
	Else
	Begin
		Update SJRFormProblemType
		Set [AssessmentResponseID] = @AssessmentResponseID,
		[AssessmentCarePhaseID] = @AssessmentCarePhaseID,
		[MedicationResponseID] = @MedicationResponseID,
		[MedicationCarePhaseID] = @MedicationCarePhaseID,
		[TreatmentResponseID] = @TreatmentResponseID,
		[TreatmentCarePhaseID] = @TreatmentCarePhaseID,
		[InfectionResponseID] = @InfectionResponseID,
		[InfectionCarePhaseID] = @InfectionCarePhaseID,
		[ProcedureResponseID] = @ProcedureResponseID,
		[ProcedureCarePhaseID] = @ProcedureCarePhaseID,
		[MonitoringResponseID] = @MonitoringResponseID,
		[ResuscitationResponseID] = @ResuscitationResponseID,
		[OthertypeResponseID] = @OthertypeResponseID,
		[OthertypeCarePhaseID] = @OthertypeCarePhaseID,
		[AvoidabilityScoreID] = @AvoidabilityScoreID,
		[Comments] = @Comments,
		[ProblemOccured] = @ProblemOccured
		Where Patient_ID = @ID
	End

	Update PatientDetails 
		Set SJR1 = 3
		where ID = @ID

		Update ReviewStatus
		Set SJR1 = 3
		where Patient_ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSJR2FormInitial]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
Create PROCEDURE [dbo].[usp_UpdateSJR2FormInitial]
(
   @InitialManagement varchar(max),
   @InitialManagementRating varchar(200),
   @OngoingCare varchar(max),
   @OngoingCareRating varchar(200),
   @CareduringProcedure varchar(max),
   @CareduringProcedureRating varchar(200),
   @EndlifeCare varchar(max),
   @EndlifecareRating varchar(max),
   @OverallAssessment varchar(max),
   @OverallAssessmentRating varchar(200),
   @QualitOfDocumentation varchar(200),
   @ID int
)
AS
BEGIN
    SET NOCOUNT ON

	declare @InitialManagementRatingID int
	declare @OngoingCareRatingID int
	declare @CareduringProcedureRatingID int
	declare @EndlifecareRatingID int
	declare @OverallAssessmentRatingID int
	declare @QualitOfDocumentationID int

	if(@InitialManagementRating = '')
		Select @InitialManagementRatingID = InitialManagementCareRatingID from SJRFormInitial where Patient_ID = @ID
	else
		select @InitialManagementRatingID = CareRatingID from CareRating where [Name] = @InitialManagementRating
    if(@OngoingCareRating = '')
		Select @OngoingCareRatingID = OngoingCareRatingID from SJRFormInitial where Patient_ID = @ID
	else
		select @OngoingCareRatingID = CareRatingID from CareRating where [Name] = @OngoingCareRating
	if(@CareduringProcedureRating = '')
		Select @CareduringProcedureRatingID = [CareDuringProcedureCareRatingID] from SJRFormInitial where Patient_ID = @ID
	else
		select @CareduringProcedureRatingID = CareRatingID from CareRating where [Name] = @CareduringProcedureRating
	if(@EndlifecareRating = '')
		Select @EndlifecareRatingID = [EndLifeCareRatingID] from SJRFormInitial where Patient_ID = @ID
	else
		select @EndlifecareRatingID = CareRatingID from CareRating where [Name] = @EndlifecareRating
	if(@OverallAssessmentRating = '')
		Select @OverallAssessmentRatingID = [OverAllAssessmentCareRatingID] from SJRFormInitial where Patient_ID = @ID
	else
		select @OverallAssessmentRatingID = CareRatingID from CareRating where [Name] = @OverallAssessmentRating
	if(@QualitOfDocumentation = '')
		Select @QualitOfDocumentationID = [QualityDocumentationCode] from SJRFormInitial where Patient_ID = @ID
	else
		select @QualitOfDocumentationID = CareRatingID from CareRating where [Name] = @QualitOfDocumentation

    declare @count int
	select @count = Count(*) from SJR2FormInitial where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into SJR2FormInitial([Patient_ID], [PatientID], [InitialManagement], [InitialManagementCareRatingID], [OngoingCare], [OngoingCareRatingID], [CareDuringProcedure], [CareDuringProcedureCareRatingID],
		[EndLifeCare], [EndLifeCareRatingID], [OverAllAssessment], [OverAllAssessmentCareRatingID], [QualityDocumentationCode])
		values(@ID, @PatientID, @InitialManagement, case when @InitialManagementRatingID = 0 then null else @InitialManagementRatingID end, @OngoingCare, case when @OngoingCareRatingID = 0 then null else @OngoingCareRatingID end,
		@CareduringProcedure, case when @CareduringProcedureRatingID = 0 then null else @CareduringProcedureRatingID end, @EndlifeCare,case when @EndlifecareRatingID = 0 then null else @EndlifecareRatingID end,
		@OverallAssessment, case when @OverallAssessmentRatingID = 0 then null else @OverallAssessmentRatingID end, case when @QualitOfDocumentationID = 0 then null else @QualitOfDocumentationID end)
	End
	Else
	Begin
		Update SJR2FormInitial
		Set InitialManagement = @InitialManagement,
		InitialManagementCareRatingID = case when  @InitialManagementRatingID = 0 then null else @InitialManagementRatingID end,
		OngoingCare = @OngoingCare,
		OngoingCareRatingID = case when @OngoingCareRatingID = 0 then null else @OngoingCareRatingID end,
		CareDuringProcedure = @CareduringProcedure,
		[CareDuringProcedureCareRatingID] = case when @CareduringProcedureRatingID = 0 then null else @CareduringProcedureRatingID end,
		[EndLifeCare] = @EndlifeCare,
		[EndLifeCareRatingID] = case when @EndlifecareRatingID = 0 then null else @EndlifecareRatingID end,
		[OverAllAssessment] = @OverallAssessment,
		[OverAllAssessmentCareRatingID] = case when @OverallAssessmentRatingID = 0 then null else @OverallAssessmentRatingID end,
		[QualityDocumentationCode] = case when @QualitOfDocumentationID = 0 then null else @QualitOfDocumentationID end
		where Patient_ID = @ID 
	End

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSJR2ProblemType]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateSJR2ProblemType]
(
	@AssessmentResponseID int,
	@AssessmentCarePhaseID int,
	@MedicationResponseID int,
	@MedicationCarePhaseID int,
	@TreatmentResponseID int,
	@TreatmentCarePhaseID int,
	@InfectionResponseID int,
	@InfectionCarePhaseID int,
	@ProcedureResponseID int,
	@ProcedureCarePhaseID int,
	@MonitoringResponseID int,
	@ResuscitationResponseID int,
	@OthertypeResponseID int,
	@OthertypeCarePhaseID int,
	@AvoidabilityScoreID int,
	@Comments varchar(max),
	@ProblemOccured bit,
	@ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    declare @count int
	select @count = Count(*) from SJR2FormProblemType where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into SJR2FormProblemType ([Patient_ID], [PatientID], [AssessmentResponseID], [AssessmentCarePhaseID], [MedicationResponseID], [MedicationCarePhaseID], [TreatmentResponseID],
		[TreatmentCarePhaseID], [InfectionResponseID], [InfectionCarePhaseID],[ProcedureResponseID],[ProcedureCarePhaseID], [MonitoringResponseID], [ResuscitationResponseID], [OthertypeResponseID],
		[OthertypeCarePhaseID], [AvoidabilityScoreID], [Comments], ProblemOccured)
		values(@ID, @PatientID, @AssessmentResponseID, @AssessmentCarePhaseID, @MedicationResponseID, @MedicationCarePhaseID, @TreatmentResponseID, @TreatmentCarePhaseID, @InfectionResponseID,
		@InfectionCarePhaseID, @ProcedureResponseID, @ProcedureCarePhaseID, @MonitoringResponseID, @ResuscitationResponseID, @OthertypeResponseID, 
		@OthertypeCarePhaseID, @AvoidabilityScoreID, @Comments, @ProblemOccured)
	End
	Else
	Begin
		Update SJR2FormProblemType
		Set [AssessmentResponseID] = @AssessmentResponseID,
		[AssessmentCarePhaseID] = @AssessmentCarePhaseID,
		[MedicationResponseID] = @MedicationResponseID,
		[MedicationCarePhaseID] = @MedicationCarePhaseID,
		[TreatmentResponseID] = @TreatmentResponseID,
		[TreatmentCarePhaseID] = @TreatmentCarePhaseID,
		[InfectionResponseID] = @InfectionResponseID,
		[InfectionCarePhaseID] = @InfectionCarePhaseID,
		[ProcedureResponseID] = @ProcedureResponseID,
		[ProcedureCarePhaseID] = @ProcedureCarePhaseID,
		[MonitoringResponseID] = @MonitoringResponseID,
		[ResuscitationResponseID] = @ResuscitationResponseID,
		[OthertypeResponseID] = @OthertypeResponseID,
		[OthertypeCarePhaseID] = @OthertypeCarePhaseID,
		[AvoidabilityScoreID] = @AvoidabilityScoreID,
		[Comments] = @Comments,
		[ProblemOccured] = @ProblemOccured
		Where Patient_ID = @ID
	End

	Update PatientDetails 
		Set SJR2 = 3
		where ID = @ID

		Update ReviewStatus
		Set SJR2 = 3
		where Patient_ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSJRAssessmentTriage]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateSJRAssessmentTriage]
(
    @PaediatricPatient bit,
	@LearningDisabilityPatient bit, 
	@MentalillnessPatient bit,
	@ElectiveAdmission bit, 
	@NoKConcernsDeath bit,
	@OtherConcern bit,
	@FullSJRRequired bit,
	@otherConcernDetails varchar(255),
	@specialityID int,
	@ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    declare @count int
	Select @count = Count(*) from SJRReview where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into SJRReview (Patient_ID, PatientID, [PaediatricPatient], [LearningDisabilityPatient], [MentalillnessPatient], [ElectiveAdmission],
		[NoKConcernsDeath], [OtherConcern], [FullSJRRequired], [SJRReviewSpecialityID], [OtherConcernDetails])
		values (@ID, @PatientID, @PaediatricPatient, @LearningDisabilityPatient, @MentalillnessPatient, @ElectiveAdmission, @NoKConcernsDeath, @OtherConcern,
		@FullSJRRequired, @specialityID, @otherConcernDetails)
	End
	Else
	Begin
		Update SJRReview
		Set [PaediatricPatient] = @PaediatricPatient,
		[LearningDisabilityPatient] = @LearningDisabilityPatient,
		[MentalillnessPatient] = @MentalillnessPatient,
		[ElectiveAdmission] = @ElectiveAdmission,
		[NoKConcernsDeath] = @NoKConcernsDeath,
		[OtherConcern] = @OtherConcern,
		[FullSJRRequired] = @FullSJRRequired,
		[SJRReviewSpecialityID] = @specialityID,
		[OtherConcernDetails] = @otherConcernDetails
		Where Patient_ID = @ID
	End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSJRFormInitial]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateSJRFormInitial]
(
   @InitialManagement varchar(max),
   @InitialManagementRating varchar(200),
   @OngoingCare varchar(max),
   @OngoingCareRating varchar(200),
   @CareduringProcedure varchar(max),
   @CareduringProcedureRating varchar(200),
   @EndlifeCare varchar(max),
   @EndlifecareRating varchar(max),
   @OverallAssessment varchar(max),
   @OverallAssessmentRating varchar(200),
   @QualitOfDocumentation varchar(200),
   @ID int
)
AS
BEGIN
    SET NOCOUNT ON

	declare @InitialManagementRatingID int
	declare @OngoingCareRatingID int
	declare @CareduringProcedureRatingID int
	declare @EndlifecareRatingID int
	declare @OverallAssessmentRatingID int
	declare @QualitOfDocumentationID int

	if(@InitialManagementRating = '')
		Select @InitialManagementRatingID = InitialManagementCareRatingID from SJRFormInitial where Patient_ID = @ID
	else
		select @InitialManagementRatingID = CareRatingID from CareRating where [Name] = @InitialManagementRating
    if(@OngoingCareRating = '')
		Select @OngoingCareRatingID = OngoingCareRatingID from SJRFormInitial where Patient_ID = @ID
	else
		select @OngoingCareRatingID = CareRatingID from CareRating where [Name] = @OngoingCareRating
	if(@CareduringProcedureRating = '')
		Select @CareduringProcedureRatingID = [CareDuringProcedureCareRatingID] from SJRFormInitial where Patient_ID = @ID
	else
		select @CareduringProcedureRatingID = CareRatingID from CareRating where [Name] = @CareduringProcedureRating
	if(@EndlifecareRating = '')
		Select @EndlifecareRatingID = [EndLifeCareRatingID] from SJRFormInitial where Patient_ID = @ID
	else
		select @EndlifecareRatingID = CareRatingID from CareRating where [Name] = @EndlifecareRating
	if(@OverallAssessmentRating = '')
		Select @OverallAssessmentRatingID = [OverAllAssessmentCareRatingID] from SJRFormInitial where Patient_ID = @ID
	else
		select @OverallAssessmentRatingID = CareRatingID from CareRating where [Name] = @OverallAssessmentRating
	if(@QualitOfDocumentation = '')
		Select @QualitOfDocumentationID = [QualityDocumentationCode] from SJRFormInitial where Patient_ID = @ID
	else
		select @QualitOfDocumentationID = CareRatingID from CareRating where [Name] = @QualitOfDocumentation

    declare @count int
	select @count = Count(*) from SJRFormInitial where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into SJRFormInitial([Patient_ID], [PatientID], [InitialManagement], [InitialManagementCareRatingID], [OngoingCare], [OngoingCareRatingID], [CareDuringProcedure], [CareDuringProcedureCareRatingID],
		[EndLifeCare], [EndLifeCareRatingID], [OverAllAssessment], [OverAllAssessmentCareRatingID], [QualityDocumentationCode])
		values(@ID, @PatientID, @InitialManagement, case when @InitialManagementRatingID = 0 then null else @InitialManagementRatingID end, @OngoingCare, case when @OngoingCareRatingID = 0 then null else @OngoingCareRatingID end,
		@CareduringProcedure, case when @CareduringProcedureRatingID = 0 then null else @CareduringProcedureRatingID end, @EndlifeCare,case when @EndlifecareRatingID = 0 then null else @EndlifecareRatingID end,
		@OverallAssessment, case when @OverallAssessmentRatingID = 0 then null else @OverallAssessmentRatingID end, case when @QualitOfDocumentationID = 0 then null else @QualitOfDocumentationID end)
	End
	Else
	Begin
		Update SJRFormInitial
		Set InitialManagement = @InitialManagement,
		InitialManagementCareRatingID = case when  @InitialManagementRatingID = 0 then null else @InitialManagementRatingID end,
		OngoingCare = @OngoingCare,
		OngoingCareRatingID = case when @OngoingCareRatingID = 0 then null else @OngoingCareRatingID end,
		CareDuringProcedure = @CareduringProcedure,
		[CareDuringProcedureCareRatingID] = case when @CareduringProcedureRatingID = 0 then null else @CareduringProcedureRatingID end,
		[EndLifeCare] = @EndlifeCare,
		[EndLifeCareRatingID] = case when @EndlifecareRatingID = 0 then null else @EndlifecareRatingID end,
		[OverAllAssessment] = @OverallAssessment,
		[OverAllAssessmentCareRatingID] = case when @OverallAssessmentRatingID = 0 then null else @OverallAssessmentRatingID end,
		[QualityDocumentationCode] = case when @QualitOfDocumentationID = 0 then null else @QualitOfDocumentationID end
		where Patient_ID = @ID 
	End

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSJROutcome]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateSJROutcome]
(
    @SJR2Required bit,
	@Stage2SJRDateSent datetime,
	@Stage2SJRSentTo varchar(200),
	@ReferenceNumber varchar(200),
	@DateReceived datetime,
	@SIRIComments varchar(max),
	@MSGRequired bit,
	@MSGDiscussionDate datetime,
	@AvoidabilityScoreID int,
	@Comments varchar(max),
	@FeedbackToNoK varchar(max),
	@ID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    declare @count int
	select @count = Count(*) from SJROutcomes where Patient_ID = @ID
	declare @PatientID varchar(10)
	select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into SJROutcomes([Patient_ID], [PatientID], [Stage2SJRRequired], [Stage2SJRDateSent], [Stage2SJRSentTo], [ReferenceNumber], [DateReceived], [SIRIComments], [MSGRequired],
		[MSGDiscussed], [AvoidabilityScoreID], [Comments], [FeedbackToNoK])
		values(@ID, @PatientID,@SJR2Required, @Stage2SJRDateSent, @Stage2SJRSentTo, @ReferenceNumber, @DateReceived, @SIRIComments, @MSGRequired, @MSGDiscussionDate, @AvoidabilityScoreID,
		@Comments, @FeedbackToNoK)
	End
	Else
	Begin
		Update SJROutcomes
		Set [Stage2SJRRequired] = @SJR2Required,
		[Stage2SJRDateSent] = @Stage2SJRDateSent,
		[Stage2SJRSentTo] = @Stage2SJRSentTo,
		[ReferenceNumber] = @ReferenceNumber,
		[DateReceived] = @DateReceived,
		[SIRIComments] = @SIRIComments,
		[MSGRequired] = @MSGRequired,
		[MSGDiscussed] = @MSGDiscussionDate,
		[AvoidabilityScoreID] = @AvoidabilityScoreID,
		[Comments] = @Comments,
		[FeedbackToNoK] = @FeedbackToNoK
		where Patient_ID = @ID
	End

	If @SJR2Required = 1
	Begin
		Update PatientDetails 
		Set SJR2 = 1,
		SJROutcome = 3
		where ID = @ID

		Update ReviewStatus
		Set SJR2 = 1,
		SJROutcome = 3
		where Patient_ID = @ID
	End
	Else
	Begin
		Update PatientDetails 
		Set SJROutcome = 3
		where ID = @ID

		Update ReviewStatus
		Set SJROutcome = 3
		where Patient_ID = @ID
	End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpsertMedExaminerDecision]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpsertMedExaminerDecision]
(
    @isMCCDissue bit,
	@isCoronerReferral bit,
	@isHospitalPostMortem bit,
	@isDeathCertificate bit,
	@isCornerReferralComplete bit,
	@isCoronerDecisionInquest bit,
	@isCoronerDecisionPostMortem bit,
	@isCoronerDecision100A bit,
	@isCoronerDecisionGPissue bit,
	@ReasonID int,
	@CauseOfDeath1 varchar(max),
	@CauseOfDeath2 varchar(max),
	@CauseOfDeath3 varchar(max),
	@CauseOfDeath4 varchar(max),
	@ID int
)
AS
BEGIN
    SET NOCOUNT ON
	
	declare @count int
	select @count = Count(*) from MedicalExaminerDecision where Patient_ID = @ID

	declare @PatientID varchar(20)
	Select @PatientID = PatientID from PatientDetails where ID = @ID

	If @count = 0
	Begin
		Insert into MedicalExaminerDecision (Patient_ID, PatientID, MCCDIssue, CoronerReferral, HospitalPostMortem, CoronerReferralReasonID, CauseOfDeath1,
		CauseOfDeath2, CauseOfDeath3, CauseOfDeath4, DeathCertificate, CornerReferralComplete, CoronerDecisionInquest, CoronerDecision100A,
		CoronerDecisionPostMortem, CoronerDecisionGPIssue) values (@ID, @PatientID, @isMCCDissue, @isCoronerReferral, @isHospitalPostMortem,@ReasonID, @CauseOfDeath1, @CauseOfDeath2, @CauseOfDeath3, @CauseOfDeath4, @isDeathCertificate,
		@isCornerReferralComplete, @isCoronerDecisionInquest, @isCoronerDecisionPostMortem, @isCoronerDecision100A, @isCoronerDecisionGPissue
		)
	End
	Else
	Begin
		Update MedicalExaminerDecision
		Set MCCDIssue = @isMCCDissue,
		CoronerReferral = @isCoronerReferral,
		HospitalPostMortem = @isHospitalPostMortem,
		CoronerReferralReasonID = @ReasonID,
		CauseOfDeath1 = @CauseOfDeath1,
		CauseOfDeath2 = @CauseOfDeath2,
		CauseOfDeath3 = @CauseOfDeath3,
		CauseOfDeath4 = @CauseOfDeath4,
		DeathCertificate = @isDeathCertificate,
		CornerReferralComplete = @isCornerReferralComplete,
		CoronerDecisionInquest = @isCoronerDecisionInquest,
		CoronerDecision100A = @isCoronerDecision100A,
		CoronerDecisionPostMortem = @isCoronerDecisionPostMortem,
		CoronerDecisionGPIssue = @isCoronerDecisionGPissue
		where Patient_ID = @ID
	End
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateUser]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[usp_ValidateUser]
(
    @UserID varchar(20) 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

   declare @count int
   select @count = Count(*) from Users where rtrim(ltrim(lower(@UserID))) = rtrim(ltrim(lower(UserID)))

   If @count > 0
   Begin
		select 1 as 'IsFound', FirstName, LastName from Users where rtrim(ltrim(lower(@UserID))) = rtrim(ltrim(lower(UserID)))
   End
   Else
   Begin
		select 0 as 'IsFound', '',''
   End
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetAddress]    Script Date: 03/02/2019 18:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[uspGetAddress]
@TaskName varchar(50),
    @ID int = NULL
AS
begin
insert into SJROutcomes(PatientID,ReferenceNumber)
values(@ID,@TaskName)

end
GO
USE [master]
GO
ALTER DATABASE [NHSForms] SET  READ_WRITE 
GO
