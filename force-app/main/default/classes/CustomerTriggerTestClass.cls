@isTest
private class CustomerTriggerTestClass 
{
    static testMethod void myUnitTest() 
    {
        //Create Data for Customer Objet
        
        APEX_Customer__c objCust = new APEX_Customer__c();
        objCust.Name = 'Test Customer';
        objCust.APEX_Customer_Status__c = 'Inactive';
        insert objCust;
        
        //Now, our trigger will fire on After update event so update the Records
       Test.startTest();//Starts the scope of test
        objCust.APEX_Customer_Status__c  = 'Active';
        update objCust;
        Test.stopTest();//Ends the scope of test
        
        //Now check if it is giving desired results using system.assert Statement.New invoice should be created
        List<apex_invoice__c> invList = [SELECT Id, APEX_Customer__c FROM APEX_Invoice__c WHERE APEX_Customer__c = :objCust.id];
        system.assertEquals(1,invList.size());//Check if one record is created in Invoivce sObject
    }
      static testMethod void myUnitTest2() 
    {
        //Create Data for Customer Objet
        
        APEX_Customer__c objCust = new APEX_Customer__c();
        objCust.Name = 'Test Customer';
        objCust.APEX_Customer_Status__c = 'Inactive';
        insert objCust;
        
        //Now, our trigger will fire on After update event so update the Records
       Test.startTest();//Starts the scope of test
        objCust.APEX_Customer_Status__c  = 'pending';
        update objCust;
        Test.stopTest();//Ends the scope of test
        
        //Now check if it is giving desired results using system.assert Statement.New invoice should be created
        List<apex_invoice__c> invList = [SELECT Id, APEX_Customer__c FROM APEX_Invoice__c WHERE APEX_Customer__c = :objCust.id];
        system.assertEquals(0,invList.size());//Check if one record is created in Invoivce sObject
    }
}