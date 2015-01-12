<?php /* Smarty version Smarty-3.1.7, created on 2015-01-05 14:19:01
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Documents/AddFolder.tpl" */ ?>
<?php /*%%SmartyHeaderCode:167785205354aa9d55b57f56-88418942%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fd2f3201d30ed41d2a9b60c0588996bde678967e' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Documents/AddFolder.tpl',
      1 => 1420390922,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '167785205354aa9d55b57f56-88418942',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54aa9d55c12b1',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54aa9d55c12b1')) {function content_54aa9d55c12b1($_smarty_tpl) {?>
<div class="modelContainer" style='min-width:350px;'><div class="modal-header contentsBackground"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h3><?php echo vtranslate('LBL_ADD_NEW_FOLDER',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</h3></div><form class="form-horizontal" id="addDocumentsFolder" method="post" action="index.php"><input type="hidden" name="module" value="<?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
" /><input type="hidden" name="action" value="Folder" /><input type="hidden" name="mode" value="save" /><div class="modal-body"><div class="row-fluid"><div class="control-group"><label class="control-label"><span class="redColor">*</span><?php echo vtranslate('LBL_FOLDER_NAME',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</label><div class="controls"><input class="span3" data-validator='<?php echo Zend_Json::encode(array(array('name'=>'FolderName')));?>
' data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" id="documentsFolderName" name="foldername" class="span12" type="text" value=""/></div></div><div class="control-group"><label class="control-label"><?php echo vtranslate('LBL_FOLDER_DESCRIPTION',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</label><div class="controls"><textarea rows="1" class="input-xxlarge fieldValue span3" name="folderdesc" id="description"></textarea></div></div></div></div><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('ModalFooter.tpl',$_smarty_tpl->tpl_vars['MODULE']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</form></div><?php }} ?>