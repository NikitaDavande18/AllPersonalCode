public class CustomerTriggerHelper
 {
    public static void createInvoiceRecords (List<apex_customer__c> customerList, Map<id, apex_customer__c> oldMapCustomer) {
        List<apex_invoice__c> InvoiceList = new List<apex_invoice__c>();
        for (APEX_Customer__c objCustomer: customerList) {
            if (objCustomer.APEX_Customer_Status__c == 'Active' && oldMapCustomer.get(objCustomer.id).APEX_Customer_Status__c == 'Inactive') {//condition to check the old value and new value
                APEX_Invoice__c objInvoice = new APEX_Invoice__c();
                objInvoice.APEX_Status__c = 'Pending';
                objInvoice.APEX_Customer__c = objCustomer.id;
                InvoiceList.add(objInvoice);
            }
        }
        insert InvoiceList;//DML to insert the Invoice List in SFDC
    }
}