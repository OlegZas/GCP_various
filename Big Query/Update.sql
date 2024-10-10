CREATE TABLE IF NOT EXISTS `project.ProjectAlpha.TableZ` (
  TID STRING(4),
  OwnerSeq BIGINT NOT NULL,
  ItemName STRING(127) NOT NULL,
  ItemDescription STRING(255),
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  Identifier STRING(255),
  EntityName STRING(255),
  LastFlag INT64 NOT NULL,
  CreatedAt TIMESTAMP NOT NULL,
  DeletedAt TIMESTAMP NOT NULL,
  Supervisor STRING(255),
  PlanIdentifier STRING(127),
  JobTitle STRING(255),
  GroupIdentifier STRING(255),
  CompensationAmount BIGDECIMAL(25, 10),
  UnitTypeForCompensation BIGINT,
  UnitIdentifier STRING(255),
  CustomAttr1 STRING(255),
  CustomAttr2 STRING(255),
  CustomAttr3 STRING(255),
  CustomAttr4 STRING(255),
  CustomAttr5 STRING(255),
  CustomAttr6 STRING(255),
  CustomAttr7 STRING(255),
  CustomAttr8 STRING(255),
  CustomAttr9 STRING(255),
  CustomAttr10 STRING(255),
  CustomAttr11 STRING(255),
  CustomAttr12 STRING(255),
  CustomAttr13 STRING(255),
  CustomAttr14 STRING(255),
  CustomAttr15 STRING(255),
  CustomAttr16 STRING(255),
  CustomNum1 BIGDECIMAL(25, 10),
  UnitTypeForCustomNum1 BIGINT,
  CustomNum2 BIGDECIMAL(25, 10),
  UnitTypeForCustomNum2 BIGINT,
  CustomNum3 BIGDECIMAL(25, 10),
  UnitTypeForCustomNum3 BIGINT,
  CustomNum4 BIGDECIMAL(25, 10),
  UnitTypeForCustomNum4 BIGINT,
  CustomNum5 BIGDECIMAL(25, 10),
  UnitTypeForCustomNum5 BIGINT,
  CustomNum6 BIGDECIMAL(25, 10),
  UnitTypeForCustomNum6 BIGINT,
  CustomDate1 DATE,
  CustomDate2 DATE,
  CustomDate3 DATE,
  CustomDate4 DATE,
  CustomDate5 DATE,
  CustomDate6 DATE,
  CustomBool1 INT64,
  CustomBool2 INT64,
  CustomBool3 INT64,
  CustomBool4 INT64,
  CustomBool5 INT64,
  CustomBool6 INT64,
  IsRunnable INT64 DEFAULT 0 NOT NULL,
  CreditStart DATE,
  CreditEnd DATE,
  ProcessingStart DATE,
  ProcessingEnd DATE,
  ProcessingSeq BIGINT DEFAULT 12345678901234567 NOT NULL
);

DROP TABLE `project.ProjectAlpha.TableZ`; 
TRUNCATE TABLE `project.ProjectAlpha.TableZ`; 

CREATE OR REPLACE PROCEDURE `project.ProjectAlpha.ProcedureY` ()
BEGIN
  -- Insert records from the staging table into the base table
  INSERT INTO `project.ProjectAlpha.TableZ`
  SELECT  
    S.TID,
    S.OwnerSeq,
    S.ItemName,
    S.ItemDescription,
    S.StartDate,
    S.EndDate,
    S.Identifier,
    S.EntityName,
    S.LastFlag,
    S.CreatedAt,
    S.DeletedAt,
    S.Supervisor,
    S.PlanIdentifier,
    S.JobTitle,
    S.GroupIdentifier,
    S.CompensationAmount,
    S.UnitTypeForCompensation,
    S.UnitIdentifier,
    S.CustomAttr1,
    S.CustomAttr2,
    S.CustomAttr3,
    S.CustomAttr4,
    S.CustomAttr5,
    S.CustomAttr6,
    S.CustomAttr7,
    S.CustomAttr8,
    S.CustomAttr9,
    S.CustomAttr10,
    S.CustomAttr11,
    S.CustomAttr12,
    S.CustomAttr13,
    S.CustomAttr14,
    S.CustomAttr15,
    S.CustomAttr16,
    S.CustomNum1,
    S.UnitTypeForCustomNum1,
    S.CustomNum2,
    S.UnitTypeForCustomNum2,
    S.CustomNum3,
    S.UnitTypeForCustomNum3,
    S.CustomNum4,
    S.UnitTypeForCustomNum4,
    S.CustomNum5,
    S.UnitTypeForCustomNum5,
    S.CustomNum6,
    S.UnitTypeForCustomNum6,
    S.CustomDate1,
    S.CustomDate2,
    S.CustomDate3,
    S.CustomDate4,
    S.CustomDate5,
    S.CustomDate6,
    S.CustomBool1,
    S.CustomBool2,
    S.CustomBool3,
    S.CustomBool4,
    S.CustomBool5,
    S.CustomBool6,
    S.IsRunnable,
    S.CreditStart,
    S.CreditEnd,
    S.ProcessingStart,
    S.ProcessingEnd,
    S.ProcessingSeq
  FROM `project.ProjectAlpha.StagingTableX` S
  LEFT JOIN `project.ProjectAlpha.TableZ` B ON B.OwnerSeq = S.OwnerSeq
  WHERE B.OwnerSeq IS NULL;

  -- Update existing records if fields changed
  UPDATE `project.ProjectAlpha.TableZ` B
  SET 
    B.TID = S.TID,
    B.ItemName = S.ItemName,
    B.ItemDescription = S.ItemDescription,
    B.StartDate = S.StartDate,
    B.EndDate = S.EndDate,
    B.Identifier = S.Identifier,
    B.EntityName = S.EntityName,
    B.LastFlag = S.LastFlag,
    B.CreatedAt = S.CreatedAt,
    B.DeletedAt = S.DeletedAt,
    B.Supervisor = S.Supervisor,
    B.PlanIdentifier = S.PlanIdentifier,
    B.JobTitle = S.JobTitle,
    B.GroupIdentifier = S.GroupIdentifier,
    B.CompensationAmount = S.CompensationAmount,
    B.UnitTypeForCompensation = S.UnitTypeForCompensation,
    B.UnitIdentifier = S.UnitIdentifier,
    B.CustomAttr1 = S.CustomAttr1,
    B.CustomAttr2 = S.CustomAttr2,
    B.CustomAttr3 = S.CustomAttr3,
    B.CustomAttr4 = S.CustomAttr4,
    B.CustomAttr5 = S.CustomAttr5,
    B.CustomAttr6 = S.CustomAttr6,
    B.CustomAttr7 = S.CustomAttr7,
    B.CustomAttr8 = S.CustomAttr8,
    B.CustomAttr9 = S.CustomAttr9,
    B.CustomAttr10 = S.CustomAttr10,
    B.CustomAttr11 = S.CustomAttr11,
    B.CustomAttr12 = S.CustomAttr12,
    B.CustomAttr13 = S.CustomAttr13,
    B.CustomAttr14 = S.CustomAttr14,
    B.CustomAttr15 = S.CustomAttr15,
    B.CustomAttr16 = S.CustomAttr16,
    B.CustomNum1 = S.CustomNum1,
    B.UnitTypeForCustomNum1 = S.UnitTypeForCustomNum1,
    B.CustomNum2 = S.CustomNum2,
    B.UnitTypeForCustomNum2 = S.UnitTypeForCustomNum2,
    B.CustomNum3 = S.CustomNum3,
    B.UnitTypeForCustomNum3 = S.UnitTypeForCustomNum3,
    B.CustomNum4 = S.CustomNum4,
    B.UnitTypeForCustomNum4 = S.UnitTypeForCustomNum4,
    B.CustomNum5 = S.CustomNum5,
    B.UnitTypeForCustomNum5 = S.UnitTypeForCustomNum5,
    B.CustomNum6 = S.CustomNum6,
    B.UnitTypeForCustomNum6 = S.UnitTypeForCustomNum6,
    B.CustomDate1 = S.CustomDate1,
    B.CustomDate2 = S.CustomDate2,
    B.CustomDate3 = S.CustomDate3,
    B.CustomDate4 = S.CustomDate4,
    B.CustomDate5 = S.CustomDate5,
    B.CustomDate6 = S.CustomDate6,
    B.CustomBool1 = S.CustomBool1,
    B.CustomBool2 = S.CustomBool2,
    B.CustomBool3 = S.CustomBool3,
    B.CustomBool4 = S.CustomBool4,
    B.CustomBool5 = S.CustomBool5,
    B.CustomBool6 = S.CustomBool6,
    B.IsRunnable = S.IsRunnable,
    B.CreditStart = S.CreditStart,
    B.CreditEnd = S.CreditEnd,
    B.ProcessingStart = S.ProcessingStart,
    B.ProcessingEnd = S.ProcessingEnd,
    B.ProcessingSeq = S.ProcessingSeq
  FROM `project.ProjectAlpha.StagingTableX` S
  WHERE B.OwnerSeq = S.OwnerSeq AND (
    B.TID != S.TID
    OR B.ItemName != S.ItemName
    OR B.ItemDescription != S.ItemDescription 
    OR B.StartDate != S.StartDate
    OR B.EndDate != S.EndDate
    OR B.Identifier != S.Identifier
    OR B.EntityName != S.EntityName
    OR B.LastFlag != S.LastFlag
    OR B.CreatedAt != S.CreatedAt
    OR B.DeletedAt != S.DeletedAt
    OR B.Supervisor != S.Supervisor
    OR B.PlanIdentifier != S.PlanIdentifier
    OR B.JobTitle != S.JobTitle
    OR B.GroupIdentifier != S.GroupIdentifier
    OR B.CompensationAmount != S.CompensationAmount
    OR B.UnitTypeForCompensation != S.UnitTypeForCompensation
    OR B.UnitIdentifier != S.UnitIdentifier
    OR B.CustomAttr1 != S.CustomAttr1
    OR B.CustomAttr2 != S.CustomAttr2
    OR B.CustomAttr3 != S.CustomAttr3
    OR B.CustomAttr4 != S.CustomAttr4
    OR B.CustomAttr5 != S.CustomAttr5
    OR B.CustomAttr6 != S.CustomAttr6
    OR B.CustomAttr7 != S.CustomAttr7
    OR B.CustomAttr8 != S.CustomAttr8
    OR B.CustomAttr9 != S.CustomAttr9
    OR B.CustomAttr10 != S.CustomAttr10
    OR B.CustomAttr11 != S.CustomAttr11
    OR B.CustomAttr12 != S.CustomAttr12
    OR B.CustomAttr13 != S.CustomAttr13
    OR B.CustomAttr14 != S.CustomAttr14
    OR B.CustomAttr15 != S.CustomAttr15
    OR B.CustomAttr16 != S.CustomAttr16
    OR B.CustomNum1 != S.CustomNum1
    OR B.UnitTypeForCustomNum1 != S.UnitTypeForCustomNum1
    OR B.CustomNum2 != S.CustomNum2
    OR B.UnitTypeForCustomNum2 != S.UnitTypeForCustomNum2
    OR B.CustomNum3 != S.CustomNum3
    OR B.UnitTypeForCustomNum3 != S.UnitTypeForCustomNum3
    OR B.CustomNum4 != S.CustomNum4
    OR B.UnitTypeForCustomNum4 != S.UnitTypeForCustomNum4
    OR B.CustomNum5 != S.CustomNum5
    OR B.UnitTypeForCustomNum5 != S.UnitTypeForCustomNum5
    OR B.CustomNum6 != S.CustomNum6
    OR B.UnitTypeForCustomNum6 != S.UnitTypeForCustomNum6
    OR B.CustomDate1 != S.CustomDate1
    OR B.CustomDate2 != S.CustomDate2
    OR B.CustomDate3 != S.CustomDate3
    OR B.CustomDate4 != S.CustomDate4
    OR B.CustomDate5 != S.CustomDate5
    OR B.CustomDate6 != S.CustomDate6
    OR B.CustomBool1 != S.CustomBool1
    OR B.CustomBool2 != S.CustomBool2
    OR B.CustomBool3 != S.CustomBool3
    OR B.CustomBool4 != S.CustomBool4
    OR B.CustomBool5 != S.CustomBool5
    OR B.CustomBool6 != S.CustomBool6
    OR B.IsRunnable != S.IsRunnable
    OR B.CreditStart != S.CreditStart
    OR B.CreditEnd != S.CreditEnd
    OR B.ProcessingStart != S.ProcessingStart
    OR B.ProcessingEnd != S.ProcessingEnd
    OR B.ProcessingSeq != S.ProcessingSeq
);

END;
