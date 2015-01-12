<?php /* Smarty version Smarty-3.1.7, created on 2015-01-06 06:42:14
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Project/ModuleSummaryView.tpl" */ ?>
<?php /*%%SmartyHeaderCode:98001142854ab83c64d0a63-91347716%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ec6e9303195298c943300cb9cc7068b9d29c7005' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Project/ModuleSummaryView.tpl',
      1 => 1420420895,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '98001142854ab83c64d0a63-91347716',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE_NAME' => 0,
    'SUMMARY_INFORMATION' => 0,
    'SUMMARY_CATEGORY' => 0,
    'FIELD_NAME' => 0,
    'FIELD_VALUE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54ab83c65577c',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54ab83c65577c')) {function content_54ab83c65577c($_smarty_tpl) {?>
<div class="recordDetails"><div><h4> <?php echo vtranslate('LBL_RECORD_SUMMARY',$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
	</h4><hr></div><?php  $_smarty_tpl->tpl_vars['SUMMARY_CATEGORY'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['SUMMARY_CATEGORY']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['SUMMARY_INFORMATION']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['SUMMARY_CATEGORY']->key => $_smarty_tpl->tpl_vars['SUMMARY_CATEGORY']->value){
$_smarty_tpl->tpl_vars['SUMMARY_CATEGORY']->_loop = true;
?><div class="row-fluid textAlignCenter roundedCorners"><?php  $_smarty_tpl->tpl_vars['FIELD_VALUE'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['FIELD_VALUE']->_loop = false;
 $_smarty_tpl->tpl_vars['FIELD_NAME'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['SUMMARY_CATEGORY']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['FIELD_VALUE']->key => $_smarty_tpl->tpl_vars['FIELD_VALUE']->value){
$_smarty_tpl->tpl_vars['FIELD_VALUE']->_loop = true;
 $_smarty_tpl->tpl_vars['FIELD_NAME']->value = $_smarty_tpl->tpl_vars['FIELD_VALUE']->key;
?><span class="well squeezedWell span3"><div><label class="font-x-small"><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_NAME']->value,$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
</label></div><div><label class="font-x-x-large"><?php if (!empty($_smarty_tpl->tpl_vars['FIELD_VALUE']->value)){?><?php echo $_smarty_tpl->tpl_vars['FIELD_VALUE']->value;?>
<?php }else{ ?>0<?php }?></label></div></span><?php } ?></div><?php } ?><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('SummaryViewContents.tpl'), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</div><?php }} ?>