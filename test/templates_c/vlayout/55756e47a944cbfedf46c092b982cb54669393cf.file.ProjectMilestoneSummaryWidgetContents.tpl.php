<?php /* Smarty version Smarty-3.1.7, created on 2015-01-06 06:42:29
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Vtiger/ProjectMilestoneSummaryWidgetContents.tpl" */ ?>
<?php /*%%SmartyHeaderCode:52948595754ab83d57ca605-72367445%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '55756e47a944cbfedf46c092b982cb54669393cf' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Vtiger/ProjectMilestoneSummaryWidgetContents.tpl',
      1 => 1420390923,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '52948595754ab83d57ca605-72367445',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'RELATED_HEADERS' => 0,
    'HEADER' => 0,
    'MODULE_NAME' => 0,
    'PROJECTMILESTONE_NAME_HEADER' => 0,
    'PROJECTMILESTONE_DATE_HEADER' => 0,
    'RELATED_RECORDS' => 0,
    'RELATED_RECORD' => 0,
    'MODULE' => 0,
    'RELATED_MODULE' => 0,
    'NUMBER_OF_RECORDS' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54ab83d598250',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54ab83d598250')) {function content_54ab83d598250($_smarty_tpl) {?>
<?php  $_smarty_tpl->tpl_vars['HEADER'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['HEADER']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['RELATED_HEADERS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['HEADER']->key => $_smarty_tpl->tpl_vars['HEADER']->value){
$_smarty_tpl->tpl_vars['HEADER']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['HEADER']->value->get('label')=="Project Milestone Name"){?><?php ob_start();?><?php echo vtranslate($_smarty_tpl->tpl_vars['HEADER']->value->get('label'),$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
<?php $_tmp1=ob_get_clean();?><?php $_smarty_tpl->tpl_vars['PROJECTMILESTONE_NAME_HEADER'] = new Smarty_variable($_tmp1, null, 0);?><?php }elseif($_smarty_tpl->tpl_vars['HEADER']->value->get('label')=="Milestone Date"){?><?php ob_start();?><?php echo vtranslate($_smarty_tpl->tpl_vars['HEADER']->value->get('label'),$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
<?php $_tmp2=ob_get_clean();?><?php $_smarty_tpl->tpl_vars['PROJECTMILESTONE_DATE_HEADER'] = new Smarty_variable($_tmp2, null, 0);?><?php }?><?php } ?><div class="row-fluid"><span class="span7"><strong><?php echo $_smarty_tpl->tpl_vars['PROJECTMILESTONE_NAME_HEADER']->value;?>
</strong></span><span class="span4"><span class="pull-right"><strong><?php echo $_smarty_tpl->tpl_vars['PROJECTMILESTONE_DATE_HEADER']->value;?>
</strong></span></span></div><?php  $_smarty_tpl->tpl_vars['RELATED_RECORD'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['RELATED_RECORD']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['RELATED_RECORDS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['RELATED_RECORD']->key => $_smarty_tpl->tpl_vars['RELATED_RECORD']->value){
$_smarty_tpl->tpl_vars['RELATED_RECORD']->_loop = true;
?><div class="recentActivitiesContainer"><ul class="unstyled"><li><div class="row-fluid"><span class="span7 textOverflowEllipsis"><a href="<?php echo $_smarty_tpl->tpl_vars['RELATED_RECORD']->value->getDetailViewUrl();?>
" id="<?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
_<?php echo $_smarty_tpl->tpl_vars['RELATED_MODULE']->value;?>
_Related_Record_<?php echo $_smarty_tpl->tpl_vars['RELATED_RECORD']->value->get('id');?>
" title="<?php echo $_smarty_tpl->tpl_vars['RELATED_RECORD']->value->getDisplayValue('projectmilestonename');?>
"><?php echo $_smarty_tpl->tpl_vars['RELATED_RECORD']->value->getDisplayValue('projectmilestonename');?>
</a></span><span class="span4 horizontalLeftSpacingForSummaryWidgetContents"><span class="pull-right"><?php echo $_smarty_tpl->tpl_vars['RELATED_RECORD']->value->getDisplayValue('projectmilestonedate');?>
</span></span></div></li></ul></div><?php } ?><?php $_smarty_tpl->tpl_vars['NUMBER_OF_RECORDS'] = new Smarty_variable(count($_smarty_tpl->tpl_vars['RELATED_RECORDS']->value), null, 0);?><?php if ($_smarty_tpl->tpl_vars['NUMBER_OF_RECORDS']->value==5){?><div class="row-fluid"><div class="pull-right"><a class="moreRecentMilestones cursorPointer"><?php echo vtranslate('LBL_MORE',$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
</a></div></div><?php }?><?php }} ?>