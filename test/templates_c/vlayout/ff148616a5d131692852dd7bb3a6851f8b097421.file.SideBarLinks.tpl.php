<?php /* Smarty version Smarty-3.1.7, created on 2015-01-05 15:41:27
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Rss/SideBarLinks.tpl" */ ?>
<?php /*%%SmartyHeaderCode:213559213454aab0a7685e53-28624653%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ff148616a5d131692852dd7bb3a6851f8b097421' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Rss/SideBarLinks.tpl',
      1 => 1420390922,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '213559213454aab0a7685e53-28624653',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'QUICK_LINKS' => 0,
    'SIDEBARLINK' => 0,
    'MODULE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54aab0a772620',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54aab0a772620')) {function content_54aab0a772620($_smarty_tpl) {?>
<div class="quickLinksDiv"><?php $_smarty_tpl->tpl_vars['SIDEBARLINK'] = new Smarty_variable($_smarty_tpl->tpl_vars['QUICK_LINKS']->value['SIDEBARLINK'][0], null, 0);?><div style="margin-bottom: 5px" class="btn-group row-fluid"><button id="rssAddButton" class="btn addButton span12 rssAddButton" data-href="<?php echo $_smarty_tpl->tpl_vars['SIDEBARLINK']->value->getUrl();?>
"><img src="layouts/vlayout/skins/images/rss_add.png" /><strong>&nbsp;&nbsp; <?php echo vtranslate($_smarty_tpl->tpl_vars['SIDEBARLINK']->value->getLabel(),$_smarty_tpl->tpl_vars['MODULE']->value);?>
</strong></button></div><div class="rssAddFormContainer hide"></div></div><?php }} ?>