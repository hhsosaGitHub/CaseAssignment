trigger CaseAssignmentTrigger on Case (before insert, before update) {
    if(Trigger.isBefore ){
        if( Trigger.isInsert ){
            CaseAssignTriggerHandler.AssignNewCases(Trigger.New);
        }
        if(Trigger.isUpdate){
            CaseAssignTriggerHandler.AssignUpdatedCases(Trigger.NewMap,Trigger.OldMap);
        }

    } 
}