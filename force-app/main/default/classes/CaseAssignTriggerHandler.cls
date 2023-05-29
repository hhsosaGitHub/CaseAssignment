public with sharing class CaseAssignTriggerHandler {

    private static Id lowPriorityQueue, medPriorityQueue,highPriorityQueue;

    private static final List<Group> queuesList = [SELECT Id, Name FROM Group WHERE Name IN ('Low Priority Queue','Medium Priority Queue', 'High Priority Queue') AND Type = 'Queue' LIMIT 3];
        
    public static void AssignNewCases(List<Case> newCaseList){

        List<Case> caseList = New List<Case>();
        
        for(Group group00 : queuesList){
            switch on group00.Name {
                when 'Low Priority Queue' {		
                    lowPriorityQueue = group00.Id;
                }	
                when 'Medium Priority Queue' {		
                    medPriorityQueue =  group00.Id;
                }
                when 'High Priority Queue' {		
                    highPriorityQueue =  group00.Id;
                }
            }
        }
        
        for( Case case00 : newCaseList ){
            if(case00.Priority != null || case00.Priority != ''){
                switch on case00.Priority {
                    when 'Low' {		
                        case00.OwnerId = lowPriorityQueue;
                    }	
                    when 'Medium' {		
                        case00.OwnerId = medPriorityQueue;
                    }
                    when 'High' {		
                        case00.OwnerId = highPriorityQueue;
                    }
                    when else {		  
                        //case01.OwnerId = null;
                    }
                }
            }
        }
    }

    public static void AssignUpdatedCases(Map<Id,Case> newCaseMap, Map<Id,Case> oldCaseMap){

        List<Case> caseList = New List<Case>();
        
        for(Group group00 : queuesList){
            switch on group00.Name {
                when 'Low Priority Queue' {		
                    lowPriorityQueue = group00.Id;
                }	
                when 'Medium Priority Queue' {		
                    medPriorityQueue =  group00.Id;
                }
                when 'High Priority Queue' {		
                    highPriorityQueue =  group00.Id;
                }
            }
        }
        
        for( Case case00 : newCaseMap.values() ){
            if(newCaseMap.get(case00.id).Priority != oldCaseMap.get(case00.id).Priority){
                caseList.add( newCaseMap.get(case00.id) );
            }
        }

        for(Case case01 : caseList ){
            switch on case01.Priority {
                when 'Low' {		
                    case01.OwnerId = lowPriorityQueue;
                }	
                when 'Medium' {		
                    case01.OwnerId = medPriorityQueue;
                }
                when 'High' {		
                    case01.OwnerId = highPriorityQueue;
                }
                when else {		  
                    //case01.OwnerId = null;
                }
            }
        }
    }
}   