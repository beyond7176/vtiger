<?php /* Smarty version Smarty-3.1.7, created on 2015-01-05 07:10:16
         compiled from "/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Reports/ChartReportContents.tpl" */ ?>
<?php /*%%SmartyHeaderCode:149281532154aa38d89c9192-66679797%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '46c85225ddcf5c9afc08d4a48f51da0b1d8f977a' => 
    array (
      0 => '/Applications/MAMP/htdocs/vtiger/includes/runtime/../../layouts/vlayout/modules/Reports/ChartReportContents.tpl',
      1 => 1420390922,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '149281532154aa38d89c9192-66679797',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CHART_TYPE' => 0,
    'DATA' => 0,
    'CLICK_THROUGH' => 0,
    'MODULE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_54aa38d8a03ff',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54aa38d8a03ff')) {function content_54aa38d8a03ff($_smarty_tpl) {?>

<input type='hidden' name='charttype' value="<?php echo $_smarty_tpl->tpl_vars['CHART_TYPE']->value;?>
" />
<input type='hidden' name='data' value='<?php echo $_smarty_tpl->tpl_vars['DATA']->value;?>
' />
<input type='hidden' name='clickthrough' value="<?php echo $_smarty_tpl->tpl_vars['CLICK_THROUGH']->value;?>
" />

<br>
<div style="margin:0px 20px;">
	<div class='border1px' style="padding:30px 100px;">
		<div id='chartcontent' style="min-height:400px;" ></div>
		<br>
		<?php if ($_smarty_tpl->tpl_vars['CLICK_THROUGH']->value!='true'){?>
			<div class='row-fluid alert-info' style="padding:20px">
				<span class='span3 offset4'> &nbsp;</span>
				<span class='span alert-info'>
					<i class="icon-info-sign"></i>
					<?php echo vtranslate('LBL_CLICK_THROUGH_NOT_AVAILABLE',$_smarty_tpl->tpl_vars['MODULE']->value);?>

				</span>
			</div>
			<br>
		<?php }?>
	</div>
</div>
<br>
<?php }} ?>