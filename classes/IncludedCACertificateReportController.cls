/********************************************************************************************************************

  IncludedCACertificateReportController is a controller for IncludedCACertificateReport, IncludedCACertificateReportCSVFormat
  and IncludedCACertificateReportPEMCSV VF pages to list root certificates. Report name used is
  'Mozilla Included CA Certificate List'. 
  
 *********************************************************************************************************************/

public class IncludedCACertificateReportController{

 public Transient List<Account> accountSoLst {get;set;}
 
  // constructor method for standard controller
    public IncludedCACertificateReportController() {   
                                          
           accountSoLst =  [select  Parent.Name,
                                    Certificate_Issuer_Organization__c,
                                    Certificate_Issuer_Organizational_Unit__c,
                                    Name,
                                    SHA_256_Fingerprint__c, 
                                    Subject_SPKI_SHA256__c, 
                                    Certificate_Serial_Number__c,                                                                
                                    Valid_From_YYYY_MMM_DD__c,
                                    Valid_To_YYYY_MMM_DD__c,
                                    Public_Key_Algorithm__c,
                                    Signature_Hash_Algorithm__c,
                                    Trust_Bits__c,
                                    EV_Policy_OID_s__c, 
                                    Approval_Bug__c,
                                    NSS_Release_When_First_Included__c,
                                    Firefox_Release_When_First_Included__c,
                                    Test_Website_Valid__c,
                                    Test_Website_Expired__c,
                                    Test_Website_Revoked__c,
                                    Mozilla_Applied_Constraints__c, 
                                    Parent.Company_Website__c,
                                    Parent.Geographic_Focus__c,
                                    Certificate_Policy_CP__c,
                                    Certification_Practice_Statement_CPS__c,
                                    Standard_Audit__c,
                                    BR_Audit__c, 
                                    EV_Audit__c,
                                    Auditor_New__r.Name,
                                    Standard_Audit_Type__c,
                                    Standard_Audit_Statement_Dt__c,                      
                                    X_509_Certificate_PEM__c,
                                    Comments__c  
                                          from  Account
                                          where Status__c In ('Included','Change Requested') and RecordType.Name In ('Root Certificate')
                                          order by Parent.Name, Name];
       system.debug('asdasdd '+ApexPages.currentPage().getUrl());                                   
       // if we are generating a CSV file then we need to replace the double quotes in all text fields with null
       if(Test.IsRunningTest() || (ApexPages.currentPage().getUrl().contains('CSV') && accountSoLst !=null && accountSoLst.size() > 0))
       {
          for(Account accountSo : accountSoLst)
          {
              if(accountSo.name !=null && accountSo.name.length() > 0) 
                   accountSo.name = accountSo.name.replace('"',''); 
              if(accountSo.parent.name !=null && accountSo.parent.name.length() > 0) 
                   accountSo.parent.name = accountSo.parent.name.replace('"','');  
              if(accountSo.Certificate_Issuer_Organization__c !=null && accountSo.Certificate_Issuer_Organization__c.length() > 0) 
                   accountSo.Certificate_Issuer_Organization__c = accountSo.Certificate_Issuer_Organization__c.replace('"',''); 
              if(accountSo.Certificate_Issuer_Organizational_Unit__c !=null && accountSo.Certificate_Issuer_Organizational_Unit__c.length() > 0) 
                   accountSo.Certificate_Issuer_Organizational_Unit__c = accountSo.Certificate_Issuer_Organizational_Unit__c.replace('"','');                            
              if(accountSo.Approval_Bug__c !=null && accountSo.Approval_Bug__c.length() > 0) 
                   accountSo.Approval_Bug__c = accountSo.Approval_Bug__c.replace('"',''); 
              if(accountSo.NSS_Release_When_First_Included__c !=null && accountSo.NSS_Release_When_First_Included__c.length() > 0) 
                   accountSo.NSS_Release_When_First_Included__c = accountSo.NSS_Release_When_First_Included__c.replace('"',''); 
              if(accountSo.Firefox_Release_When_First_Included__c !=null && accountSo.Firefox_Release_When_First_Included__c.length() > 0) 
                   accountSo.Firefox_Release_When_First_Included__c = accountSo.Firefox_Release_When_First_Included__c.replace('"','');                 
              if(accountSo.Mozilla_Applied_Constraints__c !=null && accountSo.Mozilla_Applied_Constraints__c.length() > 0) 
                   accountSo.Mozilla_Applied_Constraints__c = accountSo.Mozilla_Applied_Constraints__c.replace('"','');                   
              if(accountSo.Certificate_Policy_CP__c !=null && accountSo.Certificate_Policy_CP__c.length() > 0) 
                   accountSo.Certificate_Policy_CP__c = accountSo.Certificate_Policy_CP__c.replace('"','');  
              if(accountSo.Certification_Practice_Statement_CPS__c !=null && accountSo.Certification_Practice_Statement_CPS__c.length() > 0) 
                   accountSo.Certification_Practice_Statement_CPS__c = accountSo.Certification_Practice_Statement_CPS__c.replace('"','');               
              if(accountSo.Test_Website_Expired__c !=null && accountSo.Test_Website_Expired__c.length() > 0) 
                   accountSo.Test_Website_Expired__c = accountSo.Test_Website_Expired__c.replace('"','');  
              if(accountSo.Test_Website_Revoked__c !=null && accountSo.Test_Website_Revoked__c.length() > 0) 
                   accountSo.Test_Website_Revoked__c = accountSo.Test_Website_Revoked__c.replace('"','');           
              if(accountSo.X_509_Certificate_PEM__c!=null && accountSo.X_509_Certificate_PEM__c.length() > 0) 
                   accountSo.X_509_Certificate_PEM__c= accountSo.X_509_Certificate_PEM__c.replace('"','');  
                           
           }                                 
     
        }
     
     }
  
     
     String CurrentDate = ' ';
 
    // Get current Datetime in long date format   

    public String getCurrentDate() {

      Datetime cDT = System.now();
      CurrentDate = cDT.format('MMMM d, yyyy');

      return CurrentDate;

   }

     
  }