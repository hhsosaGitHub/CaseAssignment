@isTest
public with sharing class CaseAssignTriggerHandlerTest {
    
    static testMethod void CreateCase() {
        List<Case> caseList = New List<Case>();
        Case case01 = new Case(Subject='Test Case 01', Priority='Low');
        Case case02 = new Case(Subject='Test Case 02', Priority='Medium');
        Case case03 = new Case(Subject='Test Case 03', Priority='High');
        caseList.add(case01);
        caseList.add(case02);
        caseList.add(case03);
         
        Test.startTest();
        insert caseList;
        Test.stopTest();
         
        String subject = [SELECT Subject FROM Case WHERE Priority = 'Low' LIMIT 1].Subject;
         
        System.assertEquals('Test Case 01', subject);
    }

    static testMethod void UpdateCase() {
        Case case01 = new Case(Subject='Test Case Low to Medium', Priority='Low');
        Insert case01;
         
        Test.startTest();
            case01.Priority = 'Medium';
            update case01;
        Test.stopTest();
         
        String subject = [SELECT Subject FROM Case WHERE Priority = 'Medium' LIMIT 1].Subject;
         
        System.assertEquals('Test Case Low to Medium', subject);
    }
}