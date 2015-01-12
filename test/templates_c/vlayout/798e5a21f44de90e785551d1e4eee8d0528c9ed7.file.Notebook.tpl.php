<?php /* Smarty version Smarty-3.1.7, created on 2015-01-06 06:58:09
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Vtiger/dashboards/Notebook.tpl" */ ?>
<?php /*%%SmartyHeaderCode:22684158654ab8781119a24-53923960%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '798e5a21f44de90e785551d1e4eee8d0528c9ed7' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Vtiger/dashboards/Notebook.tpl',
      1 => 1420390923,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '22684158654ab8781119a24-53923960',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE_NAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54ab8781202c1',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54ab8781202c1')) {function content_54ab8781202c1($_smarty_tpl) {?>
<div class="dashboardWidgetHeader">
	<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/WidgetHeader.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>

<div class="dashboardWidgetContent" style='padding:5px'>
	<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/NotebookContents.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>
<?php }} ?>