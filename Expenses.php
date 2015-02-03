<?php
include './vtlib/Vtiger/Module.php';

$Vtiger_Utils_Log = true;

$MODULENAME='Expenses';

$moduleInstance=  Vtiger_Module::getInstance($MODULENAME);

if($moduleInstance || file_exists('modules/'.$MODULENAME)){
    echo "Module already present - choose a different name.";
}else{
    $moduleInstance = new Vtiger_Module();
    $moduleInstance->name = $MODULENAME;
    $moduleInstance->parent = 'Tools';
    $moduleInstance->save();
    
    $moduleInstance->initTables();
    
    $block = new Vtiger_Block();
    $block->label = 'LBL_'.strtoupper($moduleInstance->name).'_INFORMATION';
    $moduleInstance->addBlock($block);
    
    $blockcf = new Vtiger_Block();
    $blockcf->label = 'LBL_CUSTOM_INFORMATION';
    $moduleInstance->addBlock($blockcf);
    
    $field1 = new Vtiger_Field();
    $field1->name = 'summary';
    $field1->label = 'Summary';
    $field1->uitype = 2;
    $field1->column = $field1->name;
    $field1->columntype = 'VARCHAR(255)';
    $field1->typeofdata = 'V~M';
    $block->addField($field1);
    
    $field2 = new Vtiger_Field();
    $field2->name = 'expenseon';
    $field2->label = 'Expense On';
    $field2->uitype = 5;
    $field2->column = $field2->name;
    $field2->columntype = 'Date';
    $field2->typeofdata = 'D~O';
    $block->addField($field2);
    
    $field3 = new Vtiger_Field();
    $field3->name = 'expenseamount';
    $field3->label = 'Amount';
    $field3->uitype = 71;
    $field3->column = $field3->name;
    $field3->columntype = 'Varchar(255)';
    $field3->typeofdata = 'V~M';
    $block->addField($field3);
    
    $field4 = new Vtiger_Field();
    $field4->name = 'description';
    $field4->label = 'Description';
    $field4->uitype = 19;
    $field4->column = $field4->name;
    $field4->table = 'vtiger_crmentity';
    $block->addField($field4);
    
    $mfield1 = new Vtiger_Field();
    $mfield1->name = 'assigned_user_id';
    $mfield1->label = 'Assigned To';
    $mfield1->table = 'vtiger_crmentity';
    $mfield1->column = 'smownerid';
    $mfield1->uitype = 53;
    $mfield1->typeofdata = 'V~M';
    $block->addField($mfield1);
    
    
    $mfield2 = new Vtiger_Field();
    $mfield2->name = 'CreatedTime';
    $mfield2->label = 'Created Time';
    $mfield2->table = 'vtiger_crmentity';
    $mfield2->column = 'createdtime';
    $mfield2->uitype = 70;
    $mfield2->typeofdata = 'T~O';
    $block->addField($mfield2);
    
    $mfield3 = new Vtiger_Field();
    $mfield3->name = 'ModifiedTime';
    $mfield3->label = 'Modified Time';
    $mfield3->table = 'vtiger_crmentity';
    $mfield3->column = 'modifiedtime';
    $mfield3->uitype = 70;
    $mfield3->typeofdata = 'T~O';
    $mfield3->displaytype = 2;
    $block->addField($mfield3);
    
    $filter1 = new Vtiger_Filter();
    $filter1->name = 'All';
    $filter1->isdefault = true;
    $moduleInstance->addFilter($filter1);
    $filter1->addField($field1)->addField($field2,1)->addField($field3,2)->addField($mfield1,3);
    
    $moduleInstance->setDefaultSharing();
    $moduleInstance->initWebservice();
    
    mkdir('modules/'.$MODULENAME);
    
    echo 'OK\n';
}