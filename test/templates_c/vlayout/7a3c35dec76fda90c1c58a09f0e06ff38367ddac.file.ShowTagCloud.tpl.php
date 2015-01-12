<?php /* Smarty version Smarty-3.1.7, created on 2015-01-05 14:19:40
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Vtiger/ShowTagCloud.tpl" */ ?>
<?php /*%%SmartyHeaderCode:23564917354aa9d7caa4917-46518735%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7a3c35dec76fda90c1c58a09f0e06ff38367ddac' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Vtiger/ShowTagCloud.tpl',
      1 => 1420390923,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '23564917354aa9d7caa4917-46518735',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MAX_TAG_LENGTH' => 0,
    'MODULE' => 0,
    'TAGS' => 0,
    'TAG_NAME' => 0,
    'TAG_ID' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54aa9d7cb45d5',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54aa9d7cb45d5')) {function content_54aa9d7cb45d5($_smarty_tpl) {?>
<div class="row-fluid tagCloudContainer"><input type="hidden" id="maxTagLength" value="<?php echo $_smarty_tpl->tpl_vars['MAX_TAG_LENGTH']->value;?>
" /><div class="row-fluid"><span class="span1">&nbsp;</span><input type="text" class="span10" id="tagRecordText" /></div><div class="row-fluid"><div class="row-fluid"><span class="span1">&nbsp;</span><input type="button" class="btn span" id="tagRecord" value="<?php echo vtranslate('LBL_TAG_THIS_RECORD',$_smarty_tpl->tpl_vars['MODULE']->value);?>
" /></div></div><div class="span11 row-fluid padding10" id="tagsList"><?php  $_smarty_tpl->tpl_vars['TAG_ID'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['TAG_ID']->_loop = false;
 $_smarty_tpl->tpl_vars['TAG_NAME'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['TAGS']->value[1]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['TAG_ID']->key => $_smarty_tpl->tpl_vars['TAG_ID']->value){
$_smarty_tpl->tpl_vars['TAG_ID']->_loop = true;
 $_smarty_tpl->tpl_vars['TAG_NAME']->value = $_smarty_tpl->tpl_vars['TAG_ID']->key;
?><div class="tag row-fluid span11 marginLeftZero" data-tagname="<?php echo $_smarty_tpl->tpl_vars['TAG_NAME']->value;?>
" data-tagid="<?php echo $_smarty_tpl->tpl_vars['TAG_ID']->value;?>
"><span class="tagName textOverflowEllipsis span11"><a class="cursorPointer"><?php echo $_smarty_tpl->tpl_vars['TAG_NAME']->value;?>
</a></span><span class="pull-right deleteTag cursorPointer">x</span></div><?php } ?></div></div>	<?php }} ?>