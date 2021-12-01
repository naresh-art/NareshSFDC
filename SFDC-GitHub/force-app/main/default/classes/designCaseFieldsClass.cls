global class designCaseFieldsClass extends visualEditor.DynamicPickList{

    global override visualEditor.DataRow getDefaultValue(){
     visualEditor.DataRow defaultValue = new visualEditor.DataRow('case', 'Case');
        return defaultValue;
    }
   /* global override visualEditor.DynamicPickListRows getValues(){
     visualEditor.DynamicPickListRows pickListRowList = new visualEditor.DynamicPickListRows();
        list<visualEditor.DataRow> dataRowsList = new list<visualEditor.DataRow>();
        for(Schema.SObjectType sObjectTypeName:schema.getGlobalDescribe().values()){
            visualEditor.DataRow rowField = new visualEditor.DataRow(sObjectTypeName.getDescribe().getLabel(),sObjectTypeName.getDescribe().getName());
             dataRowsList.add(rowField);
        }
        pickListRowList.addAllRows(dataRowsList);
        return pickListRowList; */
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DataRow value1 = new VisualEditor.DataRow('priority', 'Priority');
        VisualEditor.DataRow value2 = new VisualEditor.DataRow('status', 'Status');
        VisualEditor.DataRow value3 = new VisualEditor.DataRow('contact Name', 'ContactId');
        VisualEditor.DataRow value4 = new VisualEditor.DataRow('Email Address', 'SuppliedEmail');
        VisualEditor.DataRow value5 = new VisualEditor.DataRow('type', 'Type');
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();
        myValues.addRow(value1);
        myValues.addRow(value2);
        myValues.addRow(value3);
        myValues.addRow(value4);
        myValues.addRow(value5);
        return myValues;
    }
 }