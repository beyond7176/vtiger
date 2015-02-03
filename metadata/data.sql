-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2015-02-03 12:37:36
-- 服务器版本： 5.5.38
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vtiger`
--
CREATE DATABASE IF NOT EXISTS `vtiger` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vtiger`;

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflow_activatedonce`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_activatedonce` (
  `workflow_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflow_tasktypes`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_tasktypes` (
  `id` int(11) NOT NULL,
  `tasktypename` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `classpath` varchar(255) DEFAULT NULL,
  `templatepath` varchar(255) DEFAULT NULL,
  `modules` varchar(500) DEFAULT NULL,
  `sourcemodule` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflow_tasktypes`
--

INSERT INTO `com_vtiger_workflow_tasktypes` (`id`, `tasktypename`, `label`, `classname`, `classpath`, `templatepath`, `modules`, `sourcemodule`) VALUES
(1, 'VTEmailTask', 'Send Mail', 'VTEmailTask', 'modules/com_vtiger_workflow/tasks/VTEmailTask.inc', 'com_vtiger_workflow/taskforms/VTEmailTask.tpl', '{"include":[],"exclude":[]}', ''),
(2, 'VTEntityMethodTask', 'Invoke Custom Function', 'VTEntityMethodTask', 'modules/com_vtiger_workflow/tasks/VTEntityMethodTask.inc', 'com_vtiger_workflow/taskforms/VTEntityMethodTask.tpl', '{"include":[],"exclude":[]}', ''),
(3, 'VTCreateTodoTask', 'Create Todo', 'VTCreateTodoTask', 'modules/com_vtiger_workflow/tasks/VTCreateTodoTask.inc', 'com_vtiger_workflow/taskforms/VTCreateTodoTask.tpl', '{"include":["Leads","Accounts","Potentials","Contacts","HelpDesk","Campaigns","Quotes","PurchaseOrder","SalesOrder","Invoice"],"exclude":["Calendar","FAQ","Events"]}', ''),
(4, 'VTCreateEventTask', 'Create Event', 'VTCreateEventTask', 'modules/com_vtiger_workflow/tasks/VTCreateEventTask.inc', 'com_vtiger_workflow/taskforms/VTCreateEventTask.tpl', '{"include":["Leads","Accounts","Potentials","Contacts","HelpDesk","Campaigns"],"exclude":["Calendar","FAQ","Events"]}', ''),
(5, 'VTUpdateFieldsTask', 'Update Fields', 'VTUpdateFieldsTask', 'modules/com_vtiger_workflow/tasks/VTUpdateFieldsTask.inc', 'com_vtiger_workflow/taskforms/VTUpdateFieldsTask.tpl', '{"include":[],"exclude":[]}', ''),
(6, 'VTCreateEntityTask', 'Create Entity', 'VTCreateEntityTask', 'modules/com_vtiger_workflow/tasks/VTCreateEntityTask.inc', 'com_vtiger_workflow/taskforms/VTCreateEntityTask.tpl', '{"include":[],"exclude":[]}', ''),
(7, 'VTSMSTask', 'SMS Task', 'VTSMSTask', 'modules/com_vtiger_workflow/tasks/VTSMSTask.inc', 'com_vtiger_workflow/taskforms/VTSMSTask.tpl', '{"include":[],"exclude":[]}', 'SMSNotifier');

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflow_tasktypes_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_tasktypes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflow_tasktypes_seq`
--

INSERT INTO `com_vtiger_workflow_tasktypes_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflows`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflows` (
`workflow_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `summary` varchar(400) NOT NULL,
  `test` text,
  `execution_condition` int(11) NOT NULL,
  `defaultworkflow` int(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `filtersavedinnew` int(1) DEFAULT NULL,
  `schtypeid` int(10) DEFAULT NULL,
  `schdayofmonth` varchar(100) DEFAULT NULL,
  `schdayofweek` varchar(100) DEFAULT NULL,
  `schannualdates` varchar(100) DEFAULT NULL,
  `schtime` varchar(50) DEFAULT NULL,
  `nexttrigger_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflows`
--

INSERT INTO `com_vtiger_workflows` (`workflow_id`, `module_name`, `summary`, `test`, `execution_condition`, `defaultworkflow`, `type`, `filtersavedinnew`, `schtypeid`, `schdayofmonth`, `schdayofweek`, `schannualdates`, `schtime`, `nexttrigger_time`) VALUES
(1, 'Invoice', 'UpdateInventoryProducts On Every Save', '[{"fieldname":"subject","operation":"does not contain","value":"`!`"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Accounts', 'Send Email to user when Notifyowner is True', '[{"fieldname":"notify_owner","operation":"is","value":"true:boolean"}]', 2, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Contacts', 'Send Email to user when Notifyowner is True', '[{"fieldname":"lastname","operation":"has changed","value":null,"valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 2, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Contacts', 'Send Email to user when Portal User is True', '[{"fieldname":"portal","operation":"is","value":"true:boolean"}]', 2, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Potentials', 'Send Email to users on Potential creation', NULL, 1, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Contacts', 'Workflow for Contact Creation or Modification', '', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'HelpDesk', 'Ticket Creation From Portal : Send Email to Record Owner and Contact', '[{"fieldname":"from_portal","operation":"is","value":1,"valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":0},{"fieldname":"from_portal","operation":"is","value":"1","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'HelpDesk', 'Send Email to Contact on Ticket Update', '[{"fieldname":"(contact_id : (Contacts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":0,"valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":0},{"fieldname":"ticketstatus","operation":"has changed to","value":"Closed","valuetype":"rawtext","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"solution","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"description","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Events', 'Workflow for Events when Send Notification is True', '[{"fieldname":"sendnotification","operation":"is","value":"true:boolean"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Calendar', 'Workflow for Calendar Todos when Send Notification is True', '[{"fieldname":"sendnotification","operation":"is","value":"true:boolean"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Potentials', 'Calculate or Update forecast amount', '', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Events', 'Workflow for Events when Send Notification is True', '[{"fieldname":"sendnotification","operation":"is","value":"true:boolean"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Calendar', 'Workflow for Calendar Todos when Send Notification is True', '[{"fieldname":"sendnotification","operation":"is","value":"true:boolean"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'HelpDesk', 'Comment Added From CRM : Send Email to Organization', '[{"fieldname":"_VT_add_comment","operation":"is added","value":"","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":"0","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"(parent_id : (Accounts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'PurchaseOrder', 'Update Inventory Products On Every Save', NULL, 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'HelpDesk', 'Comment Added From Portal : Send Email to Record Owner', '[{"fieldname":"_VT_add_comment","operation":"is added","value":"","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":"1","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'HelpDesk', 'Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User', '[{"fieldname":"(contact_id : (Contacts) portal)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"},{"fieldname":"_VT_add_comment","operation":"is added","value":"","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":"0","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"(contact_id : (Contacts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'HelpDesk', 'Comment Added From CRM : Send Email to Contact, where Contact is Portal User', '[{"fieldname":"(contact_id : (Contacts) portal)","operation":"is","value":"1","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"},{"fieldname":"_VT_add_comment","operation":"is added","value":"","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":"0","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"},{"fieldname":"(contact_id : (Contacts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'HelpDesk', 'Send Email to Record Owner on Ticket Update', '[{"fieldname":"from_portal","operation":"is","value":0,"valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":0},{"fieldname":"ticketstatus","operation":"has changed to","value":"Closed","valuetype":"rawtext","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"solution","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"assigned_user_id","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"description","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'HelpDesk', 'Ticket Creation From CRM : Send Email to Record Owner', '[{"fieldname":"from_portal","operation":"is","value":"0","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'HelpDesk', 'Send Email to Organization on Ticket Update', '[{"fieldname":"(parent_id : (Accounts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":0,"valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":0},{"fieldname":"ticketstatus","operation":"has changed to","value":"Closed","valuetype":"rawtext","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"solution","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"},{"fieldname":"description","operation":"has changed","value":"","valuetype":"","joincondition":"or","groupjoin":"and","groupid":"1"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'HelpDesk', 'Ticket Creation From CRM : Send Email to Organization', '[{"fieldname":"(parent_id : (Accounts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":"0","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'HelpDesk', 'Ticket Creation From CRM : Send Email to Contact', '[{"fieldname":"(contact_id : (Contacts) emailoptout)","operation":"is","value":"0","valuetype":"rawtext","joincondition":"and","groupjoin":"and","groupid":"0"},{"fieldname":"from_portal","operation":"is","value":"0","valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Documents', 'sfd', '[{"fieldname":"assigned_user_id","operation":"has changed","value":null,"valuetype":"rawtext","joincondition":"","groupjoin":"and","groupid":"0"}]', 3, NULL, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflows_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflows_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflows_seq`
--

INSERT INTO `com_vtiger_workflows_seq` (`id`) VALUES
(25);

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflowtask_queue`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtask_queue` (
  `task_id` int(11) DEFAULT NULL,
  `entity_id` varchar(100) DEFAULT NULL,
  `do_after` int(11) DEFAULT NULL,
  `task_contents` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflowtask_queue`
--

INSERT INTO `com_vtiger_workflowtask_queue` (`task_id`, `entity_id`, `do_after`, `task_contents`) VALUES
(5, '13x3', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Potential Assignment","content":"An Potential has been assigned to you on vtigerCRM<br>Details of Potential are :<br><br>Potential No:<b>POT1<\\/b><br>Potential Name:<b>testsdf<\\/b><br>Amount:<b>0.00<\\/b><br>Expected Close Date:<b>2015-01-16 (yyyy-mm-dd)<\\/b><br>Type:<b><\\/b><br><br><br>Description :<br><br>Thank You<br>Admin"}'),
(25, '17x4', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"your-support name","toEmail":",cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Ticket Number : TT1 testi09","content":"Ticket ID : 4<br>Ticket Title : testi09<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tDear CHEN DINNER,<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tThe Ticket is replied the details are :<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tTicket No : TT1<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tStatus : \\u5f85\\u5904\\u7406<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tCategory : \\u5c0f\\u95ee\\u9898<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tSeverity : \\u4e3b\\u8981<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tPriority : \\u4e00\\u822c<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tDescription : <br><br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tSolution : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tRegards<br>Support Administrator"}'),
(6, '12x11', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON1<\\/b><br>LastName:<b>tt<\\/b><br>FirstName:<b>\\u8054\\u7cfb\\u4eba1<\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x11', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON1<\\/b><br>LastName:<b>tt<\\/b><br>FirstName:<b>\\u8054\\u7cfb\\u4eba1<\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x11', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON1<\\/b><br>LastName:<b>tt<\\/b><br>FirstName:<b>\\u8054\\u7cfb\\u4eba1<\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x11', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON1<\\/b><br>LastName:<b>tt<\\/b><br>FirstName:<b>\\u8054\\u7cfb\\u4eba1<\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x20', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON2<\\/b><br>LastName:<b>test<\\/b><br>FirstName:<b><\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x20', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON2<\\/b><br>LastName:<b>test<\\/b><br>FirstName:<b><\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b>test<\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x11', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON1<\\/b><br>LastName:<b>tt<\\/b><br>FirstName:<b>\\u8054\\u7cfb\\u4eba1<\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x26', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON3<\\/b><br>LastName:<b>test<\\/b><br>FirstName:<b><\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(6, '12x27', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON4<\\/b><br>LastName:<b>asf<\\/b><br>FirstName:<b><\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-<br><br>Thank You<br>Admin"}'),
(25, '17x32', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"your-support name","toEmail":",abc@d.e","ccEmail":"","bccEmail":"","subject":"Ticket Number : TT2 asdf","content":"Ticket ID : 32<br>Ticket Title : asdf<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tDear test ,<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tThe Ticket is replied the details are :<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tTicket No : TT2<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tStatus : \\u5f85\\u5904\\u7406<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tCategory : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tSeverity : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tPriority : <br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tDescription : <br><br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tSolution : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tRegards<br>Support Administrator"}'),
(25, '17x34', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"your-support name","toEmail":",cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Ticket Number : TT3 asdf","content":"Ticket ID : 34<br>Ticket Title : asdf<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tDear CHEN DINNER,<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tThe Ticket is replied the details are :<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tTicket No : TT3<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tStatus : \\u5f85\\u5904\\u7406<br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tCategory : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tSeverity : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tPriority : <br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tDescription : <br><br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tSolution : <br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t<br><br>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\tRegards<br>Support Administrator"}'),
(6, '12x11', 0, '{"fromEmail":"cyj91516@aliyun.com","fromName":"admin","toEmail":"cyj91516@aliyun.com","ccEmail":"","bccEmail":"","subject":"Regarding Contact Assignment","content":"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>CON1<\\/b><br>LastName:<b>tt<\\/b><br>FirstName:<b>\\u8054\\u7cfb\\u4eba1<\\/b><br>Lead Source:<b><\\/b><br>Department:<b><\\/b><br>Description:<b><\\/b><br><br><br>And <b>CustomerPortal Login Details<\\/b> is sent to the EmailID :-deb@ac.o<br><br>Thank You<br>Admin"}');

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflowtasks`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks` (
`task_id` int(11) NOT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `summary` varchar(400) NOT NULL,
  `task` text
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflowtasks`
--

INSERT INTO `com_vtiger_workflowtasks` (`task_id`, `workflow_id`, `summary`, `task`) VALUES
(1, 1, '', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:1;s:7:"summary";s:0:"";s:6:"active";b:1;s:10:"methodName";s:15:"UpdateInventory";s:2:"id";i:1;}'),
(2, 2, 'An account has been created ', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:0:"";s:10:"workflowId";s:1:"2";s:7:"summary";s:28:"An account has been created ";s:6:"active";s:1:"1";s:10:"methodName";s:11:"NotifyOwner";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:26:"Regarding Account Creation";s:7:"content";s:301:"An Account has been assigned to you on vtigerCRM<br>Details of account are :<br><br>AccountId:<b>$account_no</b><br>AccountName:<b>$accountname</b><br>Rating:<b>$rating</b><br>Industry:<b>$industry</b><br>AccountType:<b>$accounttype</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin";s:2:"id";s:1:"2";}'),
(3, 3, 'An contact has been created ', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:0:"";s:10:"workflowId";s:1:"3";s:7:"summary";s:28:"An contact has been created ";s:6:"active";s:1:"1";s:10:"methodName";s:11:"NotifyOwner";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:26:"Regarding Contact Creation";s:7:"content";s:305:"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin";s:2:"id";s:1:"3";}'),
(4, 4, 'Email Customer Portal Login Details', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:4;s:7:"summary";s:35:"Email Customer Portal Login Details";s:6:"active";b:1;s:10:"methodName";s:22:"SendPortalLoginDetails";s:2:"id";i:4;}'),
(5, 5, 'An Potential has been created ', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";s:0:"";s:10:"workflowId";s:1:"5";s:7:"summary";s:30:"An Potential has been created ";s:6:"active";s:1:"1";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:30:"Regarding Potential Assignment";s:7:"content";s:342:"An Potential has been assigned to you on vtigerCRM<br>Details of Potential are :<br><br>Potential No:<b>$potential_no</b><br>Potential Name:<b>$potentialname</b><br>Amount:<b>$amount</b><br>Expected Close Date:<b>$closingdate ($_DATE_FORMAT_)</b><br>Type:<b>$opportunity_type</b><br><br><br>Description :$description<br><br>Thank You<br>Admin";s:2:"id";s:1:"5";}'),
(6, 6, 'An contact has been created ', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";s:0:"";s:10:"workflowId";s:1:"6";s:7:"summary";s:28:"An contact has been created ";s:6:"active";s:1:"1";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:28:"Regarding Contact Assignment";s:7:"content";s:384:"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>And <b>CustomerPortal Login Details</b> is sent to the EmailID :-$email<br><br>Thank You<br>Admin";s:2:"id";s:1:"6";}'),
(7, 7, 'Notify Related Contact when Ticket is created from Portal', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:57:"Notify Related Contact when Ticket is created from Portal";s:6:"active";s:1:"1";s:2:"id";s:1:"7";s:10:"workflowId";s:1:"7";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(contact_id : (Contacts) email)";s:7:"subject";s:93:"[From Portal] $ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:161:"Ticket No : $ticket_no<br>\r\n							  Ticket ID : $(general : (__VtigerMeta__) recordId)<br>\r\n							  Ticket Title : $ticket_title<br><br>\r\n							  $description";}'),
(10, 9, 'Send Email to Contact on Ticket Update', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:38:"Send Email to Contact on Ticket Update";s:6:"active";s:1:"1";s:2:"id";s:2:"10";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(contact_id : (Contacts) email)";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:636:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution<br>\r\n								The comments are : <br>\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";s:10:"workflowId";s:1:"9";}'),
(13, 12, 'update forecast amount', 'O:18:"VTUpdateFieldsTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:12;s:7:"summary";s:22:"update forecast amount";s:6:"active";b:1;s:19:"field_value_mapping";s:95:"[{"fieldname":"forecast_amount","valuetype":"expression","value":"amount * probability / 100"}]";s:2:"id";i:13;}'),
(14, 13, 'Send Notification Email to Record Owner', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";s:0:"";s:10:"workflowId";s:2:"13";s:7:"summary";s:39:"Send Notification Email to Record Owner";s:6:"active";s:1:"1";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:17:"Event :  $subject";s:7:"content";s:771:"$(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name) ,<br/><b>Activity Notification Details:</b><br/>Subject             : $subject<br/>Start date and time : $date_start ($(general : (__VtigerMeta__) usertimezone))<br/>End date and time   : $due_date ($(general : (__VtigerMeta__) usertimezone)) <br/>Status              : $eventstatus <br/>Priority            : $taskpriority <br/>Related To          : $(parent_id : (Leads) lastname) $(parent_id : (Leads) firstname) $(parent_id : (Accounts) accountname) $(parent_id : (Potentials) potentialname) $(parent_id : (HelpDesk) ticket_title) $(parent_id : (Campaigns) campaignname) <br/>Contacts List       : $contact_id <br/>Location            : $location <br/>Description         : $description";s:2:"id";s:2:"14";}'),
(15, 14, 'Send Notification Email to Record Owner', 'O:11:"VTEmailTask":8:{s:18:"executeImmediately";s:0:"";s:10:"workflowId";s:2:"14";s:7:"summary";s:39:"Send Notification Email to Record Owner";s:6:"active";s:1:"1";s:9:"recepient";s:36:"$(assigned_user_id : (Users) email1)";s:7:"subject";s:16:"Task :  $subject";s:7:"content";s:689:"$(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name) ,<br/><b>Task Notification Details:</b><br/>Subject : $subject<br/>Start date and time : $date_start ($(general : (__VtigerMeta__) usertimezone))<br/>End date and time   : $due_date ($_DATE_FORMAT_) <br/>Status              : $taskstatus <br/>Priority            : $taskpriority <br/>Related To          : $(parent_id : (Leads) lastname) $(parent_id : (Leads) firstname) $(parent_id : (Accounts) accountname) $(parent_id : (Potentials) potentialname) $(parent_id : (HelpDesk) ticket_title) $(parent_id : (Campaigns) campaignname) <br/>Contacts List       : $contact_id <br/>Description         : $description";s:2:"id";s:2:"15";}'),
(18, 16, 'Update Inventory Products', 'O:18:"VTEntityMethodTask":6:{s:18:"executeImmediately";b:1;s:10:"workflowId";i:16;s:7:"summary";s:25:"Update Inventory Products";s:6:"active";b:1;s:10:"methodName";s:15:"UpdateInventory";s:2:"id";i:18;}'),
(19, 17, 'Comment Added From Portal : Send Email to Record Owner', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:54:"Comment Added From Portal : Send Email to Record Owner";s:6:"active";s:1:"1";s:2:"id";s:2:"19";s:10:"workflowId";s:2:"17";s:9:"fromEmail";s:112:"$(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname)&lt;$(contact_id : (Contacts) email)&gt;";s:9:"recepient";s:37:",$(assigned_user_id : (Users) email1)";s:7:"subject";s:92:"Respond to Ticket ID## $(general : (__VtigerMeta__) recordId) ## in Customer Portal - URGENT";s:7:"content";s:329:"Dear $(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name),<br><br>\r\n								Customer has provided the following additional information to your reply:<br><br>\r\n								<b>$lastComment</b><br><br>\r\n								Kindly respond to above ticket at the earliest.<br><br>\r\n								Regards<br>Support Administrator";}'),
(20, 18, 'Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:82:"Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User";s:6:"active";s:1:"1";s:2:"id";s:2:"20";s:10:"workflowId";s:2:"18";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(contact_id : (Contacts) email)";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:525:"Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\r\n							The Ticket is replied the details are :<br><br>\r\n							Ticket No : $ticket_no<br>\r\n							Status : $ticketstatus<br>\r\n							Category : $ticketcategories<br>\r\n							Severity : $ticketseverities<br>\r\n							Priority : $ticketpriorities<br><br>\r\n							Description : <br>$description<br><br>\r\n							Solution : <br>$solution<br>\r\n							The comments are : <br>\r\n							$allComments<br><br>\r\n							Regards<br>Support Administrator";}'),
(21, 19, 'Comment Added From CRM : Send Email to Contact, where Contact is Portal User', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:76:"Comment Added From CRM : Send Email to Contact, where Contact is Portal User";s:6:"active";s:1:"1";s:2:"id";s:2:"21";s:10:"workflowId";s:2:"19";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(contact_id : (Contacts) email)";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:554:"Ticket No : $ticket_no<br>\r\n										Ticket Id : $(general : (__VtigerMeta__) recordId)<br>\r\n										Subject : $ticket_title<br><br>\r\n										Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\r\n										There is a reply to <b>$ticket_title</b> in the "Customer Portal" at VTiger.\r\n										You can use the following link to view the replies made:<br>\r\n										<a href="$(general : (__VtigerMeta__) portaldetailviewurl)">Ticket Details</a><br><br>\r\n										Thanks<br>$(general : (__VtigerMeta__) supportName)";}'),
(22, 15, 'Comment Added From CRM : Send Email to Organization', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:51:"Comment Added From CRM : Send Email to Organization";s:6:"active";s:1:"1";s:2:"id";s:2:"22";s:10:"workflowId";s:2:"15";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:34:",$(parent_id : (Accounts) email1),";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:601:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(parent_id : (Accounts) accountname),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution<br>\r\n								The comments are : <br>\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";}'),
(23, 7, 'Notify Record Owner when Ticket is created from Portal', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:54:"Notify Record Owner when Ticket is created from Portal";s:6:"active";s:1:"1";s:2:"id";s:2:"23";s:10:"workflowId";s:1:"7";s:9:"fromEmail";s:124:"$(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:37:",$(assigned_user_id : (Users) email1)";s:7:"subject";s:93:"[From Portal] $ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:161:"Ticket No : $ticket_no<br>\r\n							  Ticket ID : $(general : (__VtigerMeta__) recordId)<br>\r\n							  Ticket Title : $ticket_title<br><br>\r\n							  $description";}'),
(24, 20, 'Send Email to Record Owner on Ticket Update', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:43:"Send Email to Record Owner on Ticket Update";s:6:"active";s:1:"1";s:2:"id";s:2:"24";s:10:"workflowId";s:2:"20";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:37:",$(assigned_user_id : (Users) email1)";s:7:"subject";s:40:"Ticket Number : $ticket_no $ticket_title";s:7:"content";s:607:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";}'),
(25, 21, 'Ticket Creation From CRM : Send Email to Record Owner', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:53:"Ticket Creation From CRM : Send Email to Record Owner";s:6:"active";s:1:"1";s:2:"id";s:2:"25";s:10:"workflowId";s:2:"21";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:37:",$(assigned_user_id : (Users) email1)";s:7:"subject";s:40:"Ticket Number : $ticket_no $ticket_title";s:7:"content";s:607:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";}'),
(26, 22, 'Send Email to Organization on Ticket Update', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:43:"Send Email to Organization on Ticket Update";s:6:"active";s:1:"1";s:2:"id";s:2:"26";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(parent_id : (Accounts) email1)";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:601:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(parent_id : (Accounts) accountname),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution<br>\r\n								The comments are : <br>\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";s:10:"workflowId";s:2:"22";}'),
(27, 23, 'Ticket Creation From CRM : Send Email to Organization', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:53:"Ticket Creation From CRM : Send Email to Organization";s:6:"active";s:1:"1";s:2:"id";s:2:"27";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(parent_id : (Accounts) email1)";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:601:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(parent_id : (Accounts) accountname),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution<br>\r\n								The comments are : <br>\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";s:10:"workflowId";s:2:"23";}'),
(28, 24, 'Ticket Creation From CRM : Send Email to Contact', 'O:11:"VTEmailTask":9:{s:18:"executeImmediately";s:1:"0";s:7:"summary";s:48:"Ticket Creation From CRM : Send Email to Contact";s:6:"active";s:1:"1";s:2:"id";s:2:"28";s:9:"fromEmail";s:93:"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;";s:9:"recepient";s:33:",$(contact_id : (Contacts) email)";s:7:"subject";s:79:"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title";s:7:"content";s:636:"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\r\n								Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\r\n								The Ticket is replied the details are :<br><br>\r\n								Ticket No : $ticket_no<br>\r\n								Status : $ticketstatus<br>\r\n								Category : $ticketcategories<br>\r\n								Severity : $ticketseverities<br>\r\n								Priority : $ticketpriorities<br><br>\r\n								Description : <br>$description<br><br>\r\n								Solution : <br>$solution<br>\r\n								The comments are : <br>\r\n								$allComments<br><br>\r\n								Regards<br>Support Administrator";s:10:"workflowId";s:2:"24";}');

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflowtasks_entitymethod`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_entitymethod` (
  `workflowtasks_entitymethod_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `function_path` varchar(400) DEFAULT NULL,
  `function_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflowtasks_entitymethod`
--

INSERT INTO `com_vtiger_workflowtasks_entitymethod` (`workflowtasks_entitymethod_id`, `module_name`, `method_name`, `function_path`, `function_name`) VALUES
(1, 'SalesOrder', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel'),
(2, 'Invoice', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel'),
(3, 'Contacts', 'SendPortalLoginDetails', 'modules/Contacts/ContactsHandler.php', 'Contacts_sendCustomerPortalLoginDetails'),
(4, 'HelpDesk', 'NotifyOnPortalTicketCreation', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_nofifyOnPortalTicketCreation'),
(5, 'HelpDesk', 'NotifyOnPortalTicketComment', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyOnPortalTicketComment'),
(6, 'HelpDesk', 'NotifyOwnerOnTicketChange', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyOwnerOnTicketChange'),
(7, 'HelpDesk', 'NotifyParentOnTicketChange', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyParentOnTicketChange'),
(8, 'ModComments', 'CustomerCommentFromPortal', 'modules/ModComments/ModCommentsHandler.php', 'CustomerCommentFromPortal'),
(9, 'ModComments', 'TicketOwnerComments', 'modules/ModComments/ModCommentsHandler.php', 'TicketOwnerComments'),
(10, 'PurchaseOrder', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel');

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflowtasks_entitymethod_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_entitymethod_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflowtasks_entitymethod_seq`
--

INSERT INTO `com_vtiger_workflowtasks_entitymethod_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflowtasks_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `com_vtiger_workflowtasks_seq`
--

INSERT INTO `com_vtiger_workflowtasks_seq` (`id`) VALUES
(28);

-- --------------------------------------------------------

--
-- 表的结构 `com_vtiger_workflowtemplates`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtemplates` (
`template_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `title` varchar(400) DEFAULT NULL,
  `template` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_account`
--

CREATE TABLE IF NOT EXISTS `vtiger_account` (
  `accountid` int(19) NOT NULL DEFAULT '0',
  `account_no` varchar(100) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `parentid` int(19) DEFAULT '0',
  `account_type` varchar(200) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `annualrevenue` decimal(25,8) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `ownership` varchar(50) DEFAULT NULL,
  `siccode` varchar(50) DEFAULT NULL,
  `tickersymbol` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `otherphone` varchar(30) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `employees` int(10) DEFAULT '0',
  `emailoptout` varchar(3) DEFAULT '0',
  `notify_owner` varchar(3) DEFAULT '0',
  `isconvertedfromlead` varchar(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_account`
--

INSERT INTO `vtiger_account` (`accountid`, `account_no`, `accountname`, `parentid`, `account_type`, `industry`, `annualrevenue`, `rating`, `ownership`, `siccode`, `tickersymbol`, `phone`, `otherphone`, `email1`, `email2`, `website`, `fax`, `employees`, `emailoptout`, `notify_owner`, `isconvertedfromlead`) VALUES
(9, 'ACC1', 'dfadf', 0, '', '', 0.00000000, '', '', '', '', '', '', '', '', '', '', 0, '0', '0', '0'),
(16, 'ACC2', '客户1', 0, '', '', 0.00000000, '', '', '', '', '', '', '', '', '', '', 0, '0', '0', '0'),
(24, 'ACC3', 'test23t', 0, '', '', 0.00000000, '', '', '', '', '', '', '', '', '', '', 0, '0', '0', '0'),
(25, 'ACC4', 'sf', 0, '', '', 0.00000000, '', '', '', '', '', '', '', '', '', '', 0, '0', '0', '0'),
(38, 'ACC5', 'test', 0, '', '', 0.00000000, '', '', '', '', '', '', '', '', 'www.baidu.com', '', 0, '0', '0', '0'),
(40, 'ACC6', '天天', 0, '', '', 0.00000000, '', '', '', '', '', '', '', '', '', '', 0, '0', '0', '0'),
(41, 'ACC7', '中国太平', 0, '', '', NULL, '', '', NULL, NULL, '', NULL, '', NULL, '', '', 0, '0', '0', '0');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_accountbillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountbillads` (
  `accountaddressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_accountbillads`
--

INSERT INTO `vtiger_accountbillads` (`accountaddressid`, `bill_city`, `bill_code`, `bill_country`, `bill_state`, `bill_street`, `bill_pobox`) VALUES
(9, '', '', '', '', '', ''),
(16, '', '', '', '', '', ''),
(24, '', '', '', '', '', ''),
(25, '', '', '', '', '', ''),
(38, '', '', '', '', '', ''),
(40, '', '', '', '', '', ''),
(41, NULL, '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_accountrating`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountrating` (
`accountratingid` int(19) NOT NULL,
  `rating` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_accountscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountscf` (
  `accountid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_accountscf`
--

INSERT INTO `vtiger_accountscf` (`accountid`) VALUES
(9),
(16),
(24),
(25),
(38),
(40),
(41);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_accountshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountshipads` (
  `accountaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_accountshipads`
--

INSERT INTO `vtiger_accountshipads` (`accountaddressid`, `ship_city`, `ship_code`, `ship_country`, `ship_state`, `ship_pobox`, `ship_street`) VALUES
(9, '', '', '', '', '', ''),
(16, '', '', '', '', '', ''),
(24, '', '', '', '', '', ''),
(25, '', '', '', '', '', ''),
(38, '', '', '', '', '', ''),
(40, '', '', '', '', '', ''),
(41, '', NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_accounttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_accounttype` (
`accounttypeid` int(19) NOT NULL,
  `accounttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_accounttype`
--

INSERT INTO `vtiger_accounttype` (`accounttypeid`, `accounttype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Analyst', 1, 2, 1),
(3, 'Competitor', 1, 3, 2),
(4, 'Customer', 1, 4, 3),
(5, 'Integrator', 1, 5, 4),
(6, 'Investor', 1, 6, 5),
(7, 'Partner', 1, 7, 6),
(8, 'Press', 1, 8, 7),
(9, 'Prospect', 1, 9, 8),
(10, 'Reseller', 1, 10, 9),
(11, 'Other', 1, 11, 10);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_accounttype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_accounttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_accounttype_seq`
--

INSERT INTO `vtiger_accounttype_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_actionmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_actionmapping` (
  `actionid` int(19) NOT NULL,
  `actionname` varchar(200) NOT NULL,
  `securitycheck` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_actionmapping`
--

INSERT INTO `vtiger_actionmapping` (`actionid`, `actionname`, `securitycheck`) VALUES
(0, 'Save', 0),
(0, 'SavePriceBook', 1),
(0, 'SaveVendor', 1),
(1, 'DetailViewAjax', 1),
(1, 'EditView', 0),
(1, 'PriceBookEditView', 1),
(1, 'QuickCreate', 1),
(1, 'VendorEditView', 1),
(2, 'Delete', 0),
(2, 'DeletePriceBook', 1),
(2, 'DeleteVendor', 1),
(3, 'index', 0),
(3, 'Popup', 1),
(4, 'DetailView', 0),
(4, 'PriceBookDetailView', 1),
(4, 'TagCloud', 1),
(4, 'VendorDetailView', 1),
(5, 'Import', 0),
(6, 'Export', 0),
(8, 'Merge', 0),
(9, 'ConvertLead', 0),
(10, 'DuplicatesHandling', 0),
(11, 'Print', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activity`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity` (
  `activityid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL,
  `semodule` varchar(20) DEFAULT NULL,
  `activitytype` varchar(200) NOT NULL,
  `date_start` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `time_start` varchar(50) DEFAULT NULL,
  `time_end` varchar(50) DEFAULT NULL,
  `sendnotification` varchar(3) NOT NULL DEFAULT '0',
  `duration_hours` varchar(200) DEFAULT NULL,
  `duration_minutes` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `eventstatus` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `notime` varchar(3) NOT NULL DEFAULT '0',
  `visibility` varchar(50) NOT NULL DEFAULT 'all',
  `recurringtype` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activity`
--

INSERT INTO `vtiger_activity` (`activityid`, `subject`, `semodule`, `activitytype`, `date_start`, `due_date`, `time_start`, `time_end`, `sendnotification`, `duration_hours`, `duration_minutes`, `status`, `eventstatus`, `priority`, `location`, `notime`, `visibility`, `recurringtype`) VALUES
(2, 'test', NULL, 'Call', '2015-01-04', '2015-01-04', '16:15:00', '16:35:00', '0', '0', '', NULL, 'Planned', '', '', '0', 'Public', ''),
(6, 'sdfasdf', '', 'Emails', '2015-01-05', NULL, '15:00', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'all', NULL),
(18, 'sdafas', NULL, 'Task', '2015-01-07', '2015-01-07', '02:09:00', '', '0', '0', '0', 'Not Started', '', '', '', '0', 'Private', ''),
(19, 'test', '', 'Emails', '2015-01-07', NULL, '02:21', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'all', NULL),
(22, 'test23我3', NULL, 'Meeting', '2015-01-18', '2015-01-18', '03:19:00', '03:39:00', '0', '0', '0', NULL, 'Planned', 'High', '', '0', 'Public', '--None--'),
(39, 'asdfasf', NULL, 'Call', '2015-01-06', '2015-01-06', '00:00:00', '00:05:00', '0', '0', '', NULL, 'Planned', '', '', '0', 'Public', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activity_reminder`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_reminder` (
  `activity_id` int(11) NOT NULL,
  `reminder_time` int(11) NOT NULL,
  `reminder_sent` int(2) NOT NULL,
  `recurringid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activity_reminder_popup`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_reminder_popup` (
`reminderid` int(19) NOT NULL,
  `semodule` varchar(100) NOT NULL,
  `recordid` int(19) NOT NULL,
  `date_start` date NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activity_reminder_popup`
--

INSERT INTO `vtiger_activity_reminder_popup` (`reminderid`, `semodule`, `recordid`, `date_start`, `time_start`, `status`) VALUES
(1, 'Calendar', 2, '2015-01-04', '16:15:00', 1),
(2, 'Calendar', 18, '2015-01-07', '02:09:00', 1),
(3, 'Events', 22, '2015-01-18', '03:19:00', 1),
(4, 'Calendar', 39, '2015-01-06', '00:00:00', 1),
(5, 'Calendar', 22, '2015-01-18', '03:19:00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activity_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_view` (
`activity_viewid` int(19) NOT NULL,
  `activity_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activity_view`
--

INSERT INTO `vtiger_activity_view` (`activity_viewid`, `activity_view`, `sortorderid`, `presence`) VALUES
(1, 'Today', 0, 1),
(2, 'This Week', 1, 1),
(3, 'This Month', 2, 1),
(4, 'This Year', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activity_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activity_view_seq`
--

INSERT INTO `vtiger_activity_view_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activitycf`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitycf` (
  `activityid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activitycf`
--

INSERT INTO `vtiger_activitycf` (`activityid`) VALUES
(2),
(18),
(22),
(39);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activityproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_activityproductrel` (
  `activityid` int(19) NOT NULL DEFAULT '0',
  `productid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activitytype`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitytype` (
`activitytypeid` int(19) NOT NULL,
  `activitytype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activitytype`
--

INSERT INTO `vtiger_activitytype` (`activitytypeid`, `activitytype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Call', 0, 12, 0),
(2, 'Meeting', 0, 13, 1),
(3, 'Mobile Call', 0, 321, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_activitytype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitytype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_activitytype_seq`
--

INSERT INTO `vtiger_activitytype_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_announcement`
--

CREATE TABLE IF NOT EXISTS `vtiger_announcement` (
  `creatorid` int(19) NOT NULL,
  `announcement` text,
  `title` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_announcement`
--

INSERT INTO `vtiger_announcement` (`creatorid`, `announcement`, `title`, `time`) VALUES
(1, '', 'announcement', '2015-01-26 19:22:23');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_assets`
--

CREATE TABLE IF NOT EXISTS `vtiger_assets` (
  `assetsid` int(11) NOT NULL,
  `asset_no` varchar(30) NOT NULL,
  `account` int(19) DEFAULT NULL,
  `product` int(19) NOT NULL,
  `serialnumber` varchar(200) DEFAULT NULL,
  `datesold` date DEFAULT NULL,
  `dateinservice` date DEFAULT NULL,
  `assetstatus` varchar(200) DEFAULT 'In Service',
  `tagnumber` varchar(300) DEFAULT NULL,
  `invoiceid` int(19) DEFAULT NULL,
  `shippingmethod` varchar(200) DEFAULT NULL,
  `shippingtrackingnumber` varchar(200) DEFAULT NULL,
  `assetname` varchar(100) DEFAULT NULL,
  `contact` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_assetscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetscf` (
  `assetsid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_assetstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetstatus` (
`assetstatusid` int(11) NOT NULL,
  `assetstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_assetstatus`
--

INSERT INTO `vtiger_assetstatus` (`assetstatusid`, `assetstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'In Service', 1, 235, 1),
(2, 'Out-of-service', 1, 236, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_assetstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_assetstatus_seq`
--

INSERT INTO `vtiger_assetstatus_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_asterisk`
--

CREATE TABLE IF NOT EXISTS `vtiger_asterisk` (
  `server` varchar(30) DEFAULT NULL,
  `port` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_asteriskextensions`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskextensions` (
  `userid` int(11) DEFAULT NULL,
  `asterisk_extension` varchar(50) DEFAULT NULL,
  `use_asterisk` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_asteriskextensions`
--

INSERT INTO `vtiger_asteriskextensions` (`userid`, `asterisk_extension`, `use_asterisk`) VALUES
(1, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_asteriskincomingcalls`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskincomingcalls` (
  `from_number` varchar(50) DEFAULT NULL,
  `from_name` varchar(50) DEFAULT NULL,
  `to_number` varchar(50) DEFAULT NULL,
  `callertype` varchar(30) DEFAULT NULL,
  `flag` int(19) DEFAULT NULL,
  `timer` int(19) DEFAULT NULL,
  `refuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_asteriskincomingevents`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskincomingevents` (
  `uid` varchar(255) NOT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `from_number` bigint(20) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `to_number` bigint(20) DEFAULT NULL,
  `callertype` varchar(100) DEFAULT NULL,
  `timer` int(20) DEFAULT NULL,
  `flag` varchar(3) DEFAULT NULL,
  `pbxrecordid` int(19) DEFAULT NULL,
  `relcrmid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_attachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachments` (
  `attachmentsid` int(19) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` varchar(100) DEFAULT NULL,
  `path` text,
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_attachmentsfolder`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachmentsfolder` (
`folderid` int(19) NOT NULL,
  `foldername` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdby` int(19) NOT NULL,
  `sequence` int(19) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_attachmentsfolder`
--

INSERT INTO `vtiger_attachmentsfolder` (`folderid`, `foldername`, `description`, `createdby`, `sequence`) VALUES
(1, 'Default', 'This is a Default Folder', 1, 1),
(2, 'root', '', 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_attachmentsfolder_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachmentsfolder_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_attachmentsfolder_seq`
--

INSERT INTO `vtiger_attachmentsfolder_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_audit_trial`
--

CREATE TABLE IF NOT EXISTS `vtiger_audit_trial` (
  `auditid` int(19) NOT NULL,
  `userid` int(19) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `recordid` varchar(20) DEFAULT NULL,
  `actiondate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_blocks`
--

CREATE TABLE IF NOT EXISTS `vtiger_blocks` (
  `blockid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `blocklabel` varchar(100) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `show_title` int(2) DEFAULT NULL,
  `visible` int(2) NOT NULL DEFAULT '0',
  `create_view` int(2) NOT NULL DEFAULT '0',
  `edit_view` int(2) NOT NULL DEFAULT '0',
  `detail_view` int(2) NOT NULL DEFAULT '0',
  `display_status` int(1) NOT NULL DEFAULT '1',
  `iscustom` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_blocks`
--

INSERT INTO `vtiger_blocks` (`blockid`, `tabid`, `blocklabel`, `sequence`, `show_title`, `visible`, `create_view`, `edit_view`, `detail_view`, `display_status`, `iscustom`) VALUES
(1, 2, 'LBL_OPPORTUNITY_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(2, 2, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(3, 2, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(4, 4, 'LBL_CONTACT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(5, 4, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(6, 4, 'LBL_CUSTOMER_PORTAL_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(7, 4, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(8, 4, 'LBL_DESCRIPTION_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(9, 6, 'LBL_ACCOUNT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(10, 6, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(11, 6, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(12, 6, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(13, 7, 'LBL_LEAD_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(14, 7, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(15, 7, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(16, 7, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(17, 8, 'LBL_NOTE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(18, 8, 'LBL_FILE_INFORMATION', 3, 1, 0, 0, 0, 0, 1, 0),
(19, 9, 'LBL_TASK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(20, 9, 'LBL_DESCRIPTION_INFORMATION', 2, 1, 0, 0, 0, 0, 1, 0),
(21, 10, 'LBL_EMAIL_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(22, 10, 'Emails_Block1', 2, 1, 0, 0, 0, 0, 1, 0),
(23, 10, 'Emails_Block2', 3, 1, 0, 0, 0, 0, 1, 0),
(24, 10, 'Emails_Block3', 4, 1, 0, 0, 0, 0, 1, 0),
(25, 13, 'LBL_TICKET_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(26, 13, '', 2, 1, 0, 0, 0, 0, 1, 0),
(27, 13, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(28, 13, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(29, 13, 'LBL_TICKET_RESOLUTION', 5, 0, 0, 1, 0, 0, 1, 0),
(30, 13, 'LBL_COMMENTS', 6, 0, 0, 1, 0, 0, 1, 0),
(31, 14, 'LBL_PRODUCT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(32, 14, 'LBL_PRICING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(33, 14, 'LBL_STOCK_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(34, 14, 'LBL_CUSTOM_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(35, 14, 'LBL_IMAGE_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(36, 14, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(37, 15, 'LBL_FAQ_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(38, 15, 'LBL_COMMENT_INFORMATION', 4, 0, 0, 1, 0, 0, 1, 0),
(39, 16, 'LBL_EVENT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(40, 16, 'LBL_REMINDER_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(41, 16, 'LBL_DESCRIPTION_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(42, 18, 'LBL_VENDOR_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(43, 18, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(44, 18, 'LBL_VENDOR_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(45, 18, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(46, 19, 'LBL_PRICEBOOK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(47, 19, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(48, 19, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(49, 20, 'LBL_QUOTE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(50, 20, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(51, 20, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(52, 20, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(53, 20, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(54, 20, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(55, 21, 'LBL_PO_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(56, 21, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(57, 21, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(58, 21, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(59, 21, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(60, 21, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(61, 22, 'LBL_SO_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(62, 22, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(63, 22, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(64, 22, 'LBL_RELATED_PRODUCTS', 5, 0, 0, 0, 0, 0, 1, 0),
(65, 22, 'LBL_TERMS_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(66, 22, 'LBL_DESCRIPTION_INFORMATION', 7, 0, 0, 0, 0, 0, 1, 0),
(67, 23, 'LBL_INVOICE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(68, 23, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(69, 23, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(70, 23, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(71, 23, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(72, 23, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(73, 4, 'LBL_IMAGE_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(74, 26, 'LBL_CAMPAIGN_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(75, 26, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(76, 26, 'LBL_EXPECTATIONS_AND_ACTUALS', 3, 0, 0, 0, 0, 0, 1, 0),
(77, 29, 'LBL_USERLOGIN_ROLE', 1, 0, 0, 0, 0, 0, 1, 0),
(78, 29, 'LBL_CURRENCY_CONFIGURATION', 3, 0, 0, 0, 0, 0, 1, 0),
(79, 29, 'LBL_MORE_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(80, 29, 'LBL_ADDRESS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(81, 26, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(82, 29, 'LBL_USER_IMAGE_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(83, 29, 'LBL_USER_ADV_OPTIONS', 6, 0, 0, 0, 0, 0, 1, 0),
(84, 8, 'LBL_DESCRIPTION', 2, 0, 0, 0, 0, 0, 1, 0),
(85, 22, 'Recurring Invoice Information', 2, 0, 0, 0, 0, 0, 1, 0),
(86, 9, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(87, 16, 'LBL_CUSTOM_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(88, 34, 'LBL_SERVICE_CONTRACT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(89, 34, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(90, 35, 'LBL_SERVICE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(91, 35, 'LBL_PRICING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(92, 35, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(93, 35, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(94, 37, 'LBL_ASSET_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(95, 37, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(96, 37, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(97, 41, 'LBL_MODCOMMENTS_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(98, 41, 'LBL_OTHER_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(99, 41, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(100, 42, 'LBL_PROJECT_MILESTONE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(101, 42, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(102, 42, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(103, 43, 'LBL_PROJECT_TASK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(104, 43, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(105, 43, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(106, 44, 'LBL_PROJECT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(107, 44, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(108, 44, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(109, 46, 'LBL_SMSNOTIFIER_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(110, 46, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(111, 46, 'StatusInformation', 3, 0, 0, 0, 0, 0, 1, 0),
(112, 23, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(113, 22, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(114, 21, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(115, 20, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(116, 16, 'LBL_RECURRENCE_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(117, 29, 'LBL_CALENDAR_SETTINGS', 2, 0, 0, 0, 0, 0, 1, 0),
(118, 16, 'LBL_RELATED_TO', 4, 0, 0, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_blocks_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_blocks_seq`
--

INSERT INTO `vtiger_blocks_seq` (`id`) VALUES
(118);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_calendar_default_activitytypes`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_default_activitytypes` (
  `id` int(19) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `defaultcolor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_calendar_default_activitytypes`
--

INSERT INTO `vtiger_calendar_default_activitytypes` (`id`, `module`, `fieldname`, `defaultcolor`) VALUES
(1, 'Events', 'Events', '#17309A'),
(2, 'Calendar', 'Tasks', '#3A87AD'),
(3, 'Potentials', 'Potentials', '#AA6705'),
(4, 'Contacts', 'support_end_date', '#953B39'),
(5, 'Contacts', 'birthday', '#545252'),
(6, 'Invoice', 'Invoice', '#87865D'),
(7, 'Project', 'Project', '#C71585'),
(8, 'ProjectTask', 'Project Task', '#006400');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_calendar_default_activitytypes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_default_activitytypes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_calendar_default_activitytypes_seq`
--

INSERT INTO `vtiger_calendar_default_activitytypes_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_calendar_user_activitytypes`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_user_activitytypes` (
  `id` int(19) NOT NULL,
  `defaultid` int(19) DEFAULT NULL,
  `userid` int(19) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `visible` int(19) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_calendar_user_activitytypes`
--

INSERT INTO `vtiger_calendar_user_activitytypes` (`id`, `defaultid`, `userid`, `color`, `visible`) VALUES
(1, 1, 1, '#17309A', 1),
(2, 2, 1, '#3A87AD', 1),
(3, 3, 1, '#AA6705', 1),
(4, 4, 1, '#953B39', 1),
(5, 5, 1, '#545252', 1),
(6, 6, 1, '#87865D', 1),
(7, 7, 1, '#C71585', 1),
(8, 8, 1, '#006400', 1),
(9, 1, 5, '#17309A', 1),
(10, 2, 5, '#3A87AD', 1),
(11, 3, 5, '#AA6705', 1),
(12, 4, 5, '#953B39', 1),
(13, 5, 5, '#545252', 1),
(14, 6, 5, '#87865D', 1),
(15, 7, 5, '#C71585', 1),
(16, 8, 5, '#006400', 1),
(17, 1, 6, '#17309A', 1),
(18, 2, 6, '#3A87AD', 1),
(19, 3, 6, '#AA6705', 1),
(20, 4, 6, '#953B39', 1),
(21, 5, 6, '#545252', 1),
(22, 6, 6, '#87865D', 1),
(23, 7, 6, '#C71585', 1),
(24, 8, 6, '#006400', 1),
(25, 1, 7, '#17309A', 1),
(26, 2, 7, '#3A87AD', 1),
(27, 3, 7, '#AA6705', 1),
(28, 4, 7, '#953B39', 1),
(29, 5, 7, '#545252', 1),
(30, 6, 7, '#87865D', 1),
(31, 7, 7, '#C71585', 1),
(32, 8, 7, '#006400', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_calendar_user_activitytypes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_user_activitytypes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_calendar_user_activitytypes_seq`
--

INSERT INTO `vtiger_calendar_user_activitytypes_seq` (`id`) VALUES
(32);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_calendarsharedtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendarsharedtype` (
`calendarsharedtypeid` int(11) NOT NULL,
  `calendarsharedtype` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_calendarsharedtype`
--

INSERT INTO `vtiger_calendarsharedtype` (`calendarsharedtypeid`, `calendarsharedtype`, `sortorderid`, `presence`) VALUES
(1, 'public', 1, 1),
(2, 'private', 2, 1),
(3, 'seletedusers', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_calendarsharedtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendarsharedtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_calendarsharedtype_seq`
--

INSERT INTO `vtiger_calendarsharedtype_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_callduration`
--

CREATE TABLE IF NOT EXISTS `vtiger_callduration` (
`calldurationid` int(11) NOT NULL,
  `callduration` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_callduration`
--

INSERT INTO `vtiger_callduration` (`calldurationid`, `callduration`, `sortorderid`, `presence`) VALUES
(1, '5', 1, 1),
(2, '10', 2, 1),
(3, '30', 3, 1),
(4, '60', 4, 1),
(5, '120', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_callduration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_callduration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_callduration_seq`
--

INSERT INTO `vtiger_callduration_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaign`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaign` (
  `campaign_no` varchar(100) NOT NULL,
  `campaignname` varchar(255) DEFAULT NULL,
  `campaigntype` varchar(200) DEFAULT NULL,
  `campaignstatus` varchar(200) DEFAULT NULL,
  `expectedrevenue` decimal(25,8) DEFAULT NULL,
  `budgetcost` decimal(25,8) DEFAULT NULL,
  `actualcost` decimal(25,8) DEFAULT NULL,
  `expectedresponse` varchar(200) DEFAULT NULL,
  `numsent` decimal(11,0) DEFAULT NULL,
  `product_id` int(19) DEFAULT NULL,
  `sponsor` varchar(255) DEFAULT NULL,
  `targetaudience` varchar(255) DEFAULT NULL,
  `targetsize` int(19) DEFAULT NULL,
  `expectedresponsecount` int(19) DEFAULT NULL,
  `expectedsalescount` int(19) DEFAULT NULL,
  `expectedroi` decimal(25,8) DEFAULT NULL,
  `actualresponsecount` int(19) DEFAULT NULL,
  `actualsalescount` int(19) DEFAULT NULL,
  `actualroi` decimal(25,8) DEFAULT NULL,
  `campaignid` int(19) NOT NULL,
  `closingdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaign`
--

INSERT INTO `vtiger_campaign` (`campaign_no`, `campaignname`, `campaigntype`, `campaignstatus`, `expectedrevenue`, `budgetcost`, `actualcost`, `expectedresponse`, `numsent`, `product_id`, `sponsor`, `targetaudience`, `targetsize`, `expectedresponsecount`, `expectedsalescount`, `expectedroi`, `actualresponsecount`, `actualsalescount`, `actualroi`, `campaignid`, `closingdate`) VALUES
('CAM1', 'asdf', '', '', 0.00000000, 0.00000000, 0.00000000, '', 0, 0, '', '', 0, 0, 0, 0.00000000, 0, 0, 0.00000000, 8, '2015-01-25');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignaccountrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignaccountrel` (
  `campaignid` int(19) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `campaignrelstatusid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaignaccountrel`
--

INSERT INTO `vtiger_campaignaccountrel` (`campaignid`, `accountid`, `campaignrelstatusid`) VALUES
(8, 9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaigncontrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigncontrel` (
  `campaignid` int(19) NOT NULL DEFAULT '0',
  `contactid` int(19) NOT NULL DEFAULT '0',
  `campaignrelstatusid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignleadrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignleadrel` (
  `campaignid` int(19) NOT NULL DEFAULT '0',
  `leadid` int(19) NOT NULL DEFAULT '0',
  `campaignrelstatusid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignrelstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignrelstatus` (
  `campaignrelstatusid` int(19) DEFAULT NULL,
  `campaignrelstatus` varchar(256) DEFAULT NULL,
  `sortorderid` int(19) DEFAULT NULL,
  `presence` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaignrelstatus`
--

INSERT INTO `vtiger_campaignrelstatus` (`campaignrelstatusid`, `campaignrelstatus`, `sortorderid`, `presence`) VALUES
(2, 'Contacted - Successful', 1, 1),
(3, 'Contacted - Unsuccessful', 2, 1),
(4, 'Contacted - Never Contact Again', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignrelstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignrelstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaignrelstatus_seq`
--

INSERT INTO `vtiger_campaignrelstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignscf` (
  `campaignid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaignscf`
--

INSERT INTO `vtiger_campaignscf` (`campaignid`) VALUES
(8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignstatus` (
`campaignstatusid` int(19) NOT NULL,
  `campaignstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaignstatus`
--

INSERT INTO `vtiger_campaignstatus` (`campaignstatusid`, `campaignstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Planning', 1, 15, 1),
(3, 'Active', 1, 16, 2),
(4, 'Inactive', 1, 17, 3),
(5, 'Completed', 1, 18, 4),
(6, 'Cancelled', 1, 19, 5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaignstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaignstatus_seq`
--

INSERT INTO `vtiger_campaignstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaigntype`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigntype` (
`campaigntypeid` int(19) NOT NULL,
  `campaigntype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaigntype`
--

INSERT INTO `vtiger_campaigntype` (`campaigntypeid`, `campaigntype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Conference', 1, 21, 1),
(3, 'Webinar', 1, 22, 2),
(4, 'Trade Show', 1, 23, 3),
(5, 'Public Relations', 1, 24, 4),
(6, 'Partners', 1, 25, 5),
(7, 'Referral Program', 1, 26, 6),
(8, 'Advertisement', 1, 27, 7),
(9, 'Banner Ads', 1, 28, 8),
(10, 'Direct Mail', 1, 29, 9),
(11, 'Email', 1, 30, 10),
(12, 'Telemarketing', 1, 31, 11),
(13, 'Others', 1, 32, 12);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_campaigntype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigntype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_campaigntype_seq`
--

INSERT INTO `vtiger_campaigntype_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_carrier`
--

CREATE TABLE IF NOT EXISTS `vtiger_carrier` (
`carrierid` int(19) NOT NULL,
  `carrier` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_carrier`
--

INSERT INTO `vtiger_carrier` (`carrierid`, `carrier`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'FedEx', 1, 33, 0),
(2, 'UPS', 1, 34, 1),
(3, 'USPS', 1, 35, 2),
(4, 'DHL', 1, 36, 3),
(5, 'BlueDart', 1, 37, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_carrier_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_carrier_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_carrier_seq`
--

INSERT INTO `vtiger_carrier_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_cntactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_cntactivityrel` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  `activityid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contactaddress`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactaddress` (
  `contactaddressid` int(19) NOT NULL DEFAULT '0',
  `mailingcity` varchar(40) DEFAULT NULL,
  `mailingstreet` varchar(250) DEFAULT NULL,
  `mailingcountry` varchar(40) DEFAULT NULL,
  `othercountry` varchar(30) DEFAULT NULL,
  `mailingstate` varchar(30) DEFAULT NULL,
  `mailingpobox` varchar(30) DEFAULT NULL,
  `othercity` varchar(40) DEFAULT NULL,
  `otherstate` varchar(50) DEFAULT NULL,
  `mailingzip` varchar(30) DEFAULT NULL,
  `otherzip` varchar(30) DEFAULT NULL,
  `otherstreet` varchar(250) DEFAULT NULL,
  `otherpobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contactaddress`
--

INSERT INTO `vtiger_contactaddress` (`contactaddressid`, `mailingcity`, `mailingstreet`, `mailingcountry`, `othercountry`, `mailingstate`, `mailingpobox`, `othercity`, `otherstate`, `mailingzip`, `otherzip`, `otherstreet`, `otherpobox`) VALUES
(11, '', '', '', '', '', '', '', '', '', '', '', ''),
(20, '', '', '', '', '', '', '', '', '', '', '', ''),
(26, '', '', '', '', '', '', '', '', '', '', '', ''),
(27, '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contactdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactdetails` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  `contact_no` varchar(100) NOT NULL,
  `accountid` int(19) DEFAULT NULL,
  `salutation` varchar(200) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `reportsto` varchar(30) DEFAULT NULL,
  `training` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `contacttype` varchar(50) DEFAULT NULL,
  `otheremail` varchar(100) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `donotcall` varchar(3) DEFAULT NULL,
  `emailoptout` varchar(3) DEFAULT '0',
  `imagename` varchar(150) DEFAULT NULL,
  `reference` varchar(3) DEFAULT NULL,
  `notify_owner` varchar(3) DEFAULT '0',
  `isconvertedfromlead` varchar(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contactdetails`
--

INSERT INTO `vtiger_contactdetails` (`contactid`, `contact_no`, `accountid`, `salutation`, `firstname`, `lastname`, `email`, `phone`, `mobile`, `title`, `department`, `fax`, `reportsto`, `training`, `usertype`, `contacttype`, `otheremail`, `secondaryemail`, `donotcall`, `emailoptout`, `imagename`, `reference`, `notify_owner`, `isconvertedfromlead`) VALUES
(11, 'CON1', 16, '', '联系人1', 'tt', 'deb@ac.o', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, '', '0', '0', '', '0', '0', '0'),
(20, 'CON2', 16, '', '', 'test', '', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, '', '0', '0', '', '0', '0', '0'),
(26, 'CON3', 0, '', '', 'test', '', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, '', '0', '0', '', '0', '0', '0'),
(27, 'CON4', 0, '', '', 'asf', '', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, '', '0', '0', '', '0', '0', '0');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contactscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactscf` (
  `contactid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contactscf`
--

INSERT INTO `vtiger_contactscf` (`contactid`) VALUES
(11),
(20),
(26),
(27);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contactsubdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactsubdetails` (
  `contactsubscriptionid` int(19) NOT NULL DEFAULT '0',
  `homephone` varchar(50) DEFAULT NULL,
  `otherphone` varchar(50) DEFAULT NULL,
  `assistant` varchar(30) DEFAULT NULL,
  `assistantphone` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `laststayintouchrequest` int(30) DEFAULT '0',
  `laststayintouchsavedate` int(19) DEFAULT '0',
  `leadsource` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contactsubdetails`
--

INSERT INTO `vtiger_contactsubdetails` (`contactsubscriptionid`, `homephone`, `otherphone`, `assistant`, `assistantphone`, `birthday`, `laststayintouchrequest`, `laststayintouchsavedate`, `leadsource`) VALUES
(11, '', '', '', '', NULL, 0, 0, ''),
(20, '', '', '', '', NULL, 0, 0, ''),
(26, '', '', '', '', NULL, 0, 0, ''),
(27, '', '', '', '', NULL, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contpotentialrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_contpotentialrel` (
  `contactid` int(19) NOT NULL DEFAULT '0',
  `potentialid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contract_priority`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_priority` (
`contract_priorityid` int(11) NOT NULL,
  `contract_priority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contract_priority`
--

INSERT INTO `vtiger_contract_priority` (`contract_priorityid`, `contract_priority`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Low', 1, 220, 1),
(2, 'Normal', 1, 221, 2),
(3, 'High', 1, 222, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contract_priority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_priority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contract_priority_seq`
--

INSERT INTO `vtiger_contract_priority_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contract_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_status` (
`contract_statusid` int(11) NOT NULL,
  `contract_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contract_status`
--

INSERT INTO `vtiger_contract_status` (`contract_statusid`, `contract_status`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Undefined', 1, 214, 1),
(2, 'In Planning', 1, 215, 2),
(3, 'In Progress', 1, 216, 3),
(4, 'On Hold', 1, 217, 4),
(5, 'Complete', 0, 218, 5),
(6, 'Archived', 1, 219, 6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contract_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contract_status_seq`
--

INSERT INTO `vtiger_contract_status_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contract_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_type` (
`contract_typeid` int(11) NOT NULL,
  `contract_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contract_type`
--

INSERT INTO `vtiger_contract_type` (`contract_typeid`, `contract_type`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Support', 1, 223, 1),
(2, 'Services', 1, 224, 2),
(3, 'Administrative', 1, 225, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_contract_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_contract_type_seq`
--

INSERT INTO `vtiger_contract_type_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_convertleadmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_convertleadmapping` (
`cfmid` int(19) NOT NULL,
  `leadfid` int(19) NOT NULL,
  `accountfid` int(19) DEFAULT NULL,
  `contactfid` int(19) DEFAULT NULL,
  `potentialfid` int(19) DEFAULT NULL,
  `editable` int(19) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_convertleadmapping`
--

INSERT INTO `vtiger_convertleadmapping` (`cfmid`, `leadfid`, `accountfid`, `contactfid`, `potentialfid`, `editable`) VALUES
(1, 43, 1, 0, 110, 0),
(2, 49, 14, 0, 0, 1),
(3, 40, 3, 69, 0, NULL),
(4, 0, 0, 0, 0, NULL),
(5, 44, 5, 77, 0, 1),
(6, 52, 13, 0, 0, 1),
(7, 46, 9, 80, 0, 0),
(8, 48, 4, 0, 0, 1),
(9, 61, 26, 98, 0, 1),
(10, 60, 30, 0, 0, 1),
(11, 62, 32, 104, 0, 1),
(12, 63, 28, 100, 0, 1),
(13, 59, 24, 96, 0, 1),
(14, 64, 34, 106, 0, 1),
(15, 61, 27, 0, 0, 1),
(16, 60, 31, 0, 0, 1),
(17, 62, 33, 0, 0, 1),
(18, 63, 29, 0, 0, 1),
(19, 59, 25, 0, 0, 1),
(20, 64, 35, 0, 0, 1),
(21, 65, 36, 109, 125, 1),
(22, 37, 0, 66, 0, 1),
(23, 38, 0, 67, 0, 0),
(24, 41, 0, 70, 0, 0),
(25, 42, 0, 71, 0, 1),
(26, 45, 0, 76, 0, 1),
(27, 55, 0, 83, 0, 1),
(28, 47, 0, 74, 117, 1),
(29, 50, 0, 0, 0, 1),
(30, 53, 10, 0, 0, 1),
(31, 51, 17, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_crmentity`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity` (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT '0',
  `smownerid` int(19) NOT NULL DEFAULT '0',
  `modifiedby` int(19) NOT NULL DEFAULT '0',
  `setype` varchar(30) NOT NULL,
  `description` text,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_crmentity`
--

INSERT INTO `vtiger_crmentity` (`crmid`, `smcreatorid`, `smownerid`, `modifiedby`, `setype`, `description`, `createdtime`, `modifiedtime`, `viewedtime`, `status`, `version`, `presence`, `deleted`, `label`) VALUES
(2, 1, 1, 1, 'Calendar', '', '2015-01-05 01:34:46', '2015-01-05 01:35:10', NULL, NULL, 0, 1, 0, 'test'),
(3, 1, 1, 1, 'Potentials', '', '2015-01-05 01:38:24', '2015-01-05 01:38:24', NULL, NULL, 0, 1, 0, 'testsdf'),
(4, 1, 1, 1, 'HelpDesk', '', '2015-01-05 01:39:35', '2015-01-07 11:53:17', NULL, NULL, 0, 1, 0, 'testi09'),
(5, 1, 1, 1, 'Documents', NULL, '2015-01-05 14:19:34', '2015-01-05 15:43:44', NULL, NULL, 0, 1, 1, 'adsf'),
(6, 1, 1, 1, 'Emails', 'asdfasfasdf', '2015-01-05 15:00:10', '2015-01-05 15:00:10', NULL, NULL, 0, 1, 0, 'sdfasdf'),
(7, 1, 1, 1, 'Documents', NULL, '2015-01-05 15:45:16', '2015-01-05 15:45:16', NULL, NULL, 0, 1, 0, 'asdfafd'),
(8, 1, 1, 1, 'Campaigns', '', '2015-01-06 03:17:37', '2015-01-06 03:18:49', NULL, NULL, 0, 1, 0, 'asdf'),
(9, 1, 1, 1, 'Accounts', '', '2015-01-06 03:18:49', '2015-01-07 02:11:58', NULL, NULL, 0, 1, 1, 'dfadf'),
(10, 1, 1, 1, 'Vendors', '', '2015-01-06 06:30:18', '2015-01-06 06:32:15', NULL, NULL, 0, 1, 0, '供应商1'),
(11, 1, 1, 1, 'Contacts', '', '2015-01-06 06:31:54', '2015-01-07 15:29:16', NULL, NULL, 0, 1, 0, '联系人1 tt'),
(12, 1, 1, 1, 'Project', '', '2015-01-06 06:42:13', '2015-01-07 08:06:50', NULL, NULL, 0, 1, 1, '项目1'),
(13, 1, 1, 1, 'ProjectMilestone', '', '2015-01-06 06:42:28', '2015-01-06 06:42:28', NULL, NULL, 0, 1, 0, 'sadf'),
(14, 1, 1, 1, 'Documents', NULL, '2015-01-06 06:43:15', '2015-01-06 06:43:15', NULL, NULL, 0, 1, 0, 'sfd'),
(15, 1, 1, 1, 'ServiceContracts', NULL, '2015-01-06 11:57:54', '2015-01-06 11:57:54', NULL, NULL, 0, 1, 0, 'tstst3'),
(16, 1, 1, 1, 'Accounts', '', '2015-01-07 01:47:37', '2015-01-07 05:25:54', NULL, NULL, 0, 1, 0, '客户1'),
(17, 1, 1, 1, 'ModComments', NULL, '2015-01-07 02:04:00', '2015-01-07 02:04:00', NULL, NULL, 0, 1, 0, 'test'),
(18, 1, 1, 1, 'Calendar', '', '2015-01-07 02:09:39', '2015-01-07 02:09:39', NULL, NULL, 0, 1, 0, 'sdafas'),
(19, 1, 1, 1, 'Emails', ' ', '2015-01-07 02:21:52', '2015-01-07 02:21:52', NULL, NULL, 0, 1, 0, 'test'),
(20, 1, 1, 1, 'Contacts', 'test', '2015-01-07 02:31:05', '2015-01-07 03:08:17', NULL, NULL, 0, 1, 0, ' test'),
(21, 1, 1, 1, 'Documents', NULL, '2015-01-07 03:14:31', '2015-01-07 03:14:31', NULL, NULL, 0, 1, 0, 'sfef'),
(22, 1, 1, 1, 'Calendar', '', '2015-01-07 03:20:24', '2015-01-12 06:55:09', NULL, NULL, 0, 1, 0, 'test23我3'),
(23, 1, 1, 1, 'ServiceContracts', NULL, '2015-01-07 05:25:53', '2015-01-07 05:25:53', NULL, NULL, 0, 1, 0, 'test'),
(24, 1, 1, 1, 'Accounts', '', '2015-01-07 05:29:51', '2015-01-07 05:29:51', NULL, NULL, 0, 1, 0, 'test23t'),
(25, 1, 1, 1, 'Accounts', '', '2015-01-07 06:10:07', '2015-01-07 06:29:10', NULL, NULL, 0, 1, 1, 'sf'),
(26, 1, 1, 1, 'Contacts', '', '2015-01-07 06:49:55', '2015-01-07 06:49:55', NULL, NULL, 0, 1, 0, ' test'),
(27, 1, 1, 1, 'Contacts', '', '2015-01-07 06:52:18', '2015-01-07 06:52:18', NULL, NULL, 0, 1, 0, ' asf'),
(28, 1, 1, 1, 'Products', '', '2015-01-07 07:16:29', '2015-01-07 11:28:11', NULL, NULL, 0, 1, 1, 'wef'),
(29, 1, 1, 1, 'SalesOrder', '', '2015-01-07 07:17:39', '2015-01-07 07:17:39', NULL, NULL, 0, 1, 0, 'safwef'),
(30, 1, 1, 1, 'Project', '', '2015-01-07 07:59:41', '2015-01-07 08:05:00', NULL, NULL, 0, 1, 1, '项目1'),
(31, 1, 1, 1, 'Project', '', '2015-01-07 08:07:06', '2015-01-07 08:07:18', NULL, NULL, 0, 1, 1, 'test'),
(32, 1, 7, 1, 'HelpDesk', '', '2015-01-07 10:22:01', '2015-01-07 10:22:01', NULL, NULL, 0, 1, 0, 'asdf'),
(33, 1, 1, 1, 'Products', '', '2015-01-07 11:09:53', '2015-01-07 11:25:18', NULL, NULL, 0, 1, 1, 'test'),
(34, 1, 1, 1, 'HelpDesk', '', '2015-01-07 11:28:00', '2015-01-07 11:28:00', NULL, NULL, 0, 1, 0, 'asdf'),
(35, 1, 1, 1, 'Products', '', '2015-01-07 11:59:28', '2015-01-07 16:03:11', NULL, NULL, 0, 1, 0, 'test'),
(36, 1, 1, 1, 'Faq', NULL, '2015-01-07 11:59:41', '2015-01-07 11:59:41', NULL, NULL, 0, 1, 0, 'test'),
(37, 7, 7, 7, 'Faq', NULL, '2015-01-07 12:10:17', '2015-01-07 12:10:17', NULL, NULL, 0, 1, 0, 'asfd'),
(38, 1, 1, 1, 'Accounts', '', '2015-01-07 13:24:59', '2015-01-07 13:25:20', NULL, NULL, 0, 1, 0, 'test'),
(39, 1, 1, 1, 'Calendar', '', '2015-01-07 15:35:06', '2015-01-07 15:35:06', NULL, NULL, 0, 1, 0, 'asdfasf'),
(40, 1, 1, 1, 'Accounts', '', '2015-01-07 17:09:42', '2015-01-07 17:09:42', NULL, NULL, 0, 1, 0, '天天'),
(41, 1, 1, 1, 'Accounts', '', '2015-01-27 07:34:21', '2015-01-27 07:34:21', NULL, NULL, 0, 1, 0, '中国太平'),
(42, 1, 1, 1, 'Products', '', '2015-01-28 08:47:30', '2015-01-28 08:47:30', NULL, NULL, 0, 1, 0, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_crmentity_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_crmentity_seq`
--

INSERT INTO `vtiger_crmentity_seq` (`id`) VALUES
(42);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_crmentityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentityrel` (
  `crmid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relcrmid` int(11) NOT NULL,
  `relmodule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_crmentityrel`
--

INSERT INTO `vtiger_crmentityrel` (`crmid`, `module`, `relcrmid`, `relmodule`) VALUES
(12, 'Project', 13, 'ProjectMilestone'),
(16, 'Accounts', 22, 'Calendar'),
(16, 'Accounts', 23, 'ServiceContracts'),
(28, 'Products', 34, 'HelpDesk');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_crmsetup`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmsetup` (
  `userid` int(11) DEFAULT NULL,
  `setup_status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_crmsetup`
--

INSERT INTO `vtiger_crmsetup` (`userid`, `setup_status`) VALUES
(1, 1),
(5, 1),
(7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_cron_task`
--

CREATE TABLE IF NOT EXISTS `vtiger_cron_task` (
`id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `handler_file` varchar(100) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `laststart` int(11) unsigned DEFAULT NULL,
  `lastend` int(11) unsigned DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_cron_task`
--

INSERT INTO `vtiger_cron_task` (`id`, `name`, `handler_file`, `frequency`, `laststart`, `lastend`, `status`, `module`, `sequence`, `description`) VALUES
(1, 'Workflow', 'cron/modules/com_vtiger_workflow/com_vtiger_workflow.service', 900, NULL, NULL, 1, 'com_vtiger_workflow', 1, 'Recommended frequency for Workflow is 15 mins'),
(2, 'RecurringInvoice', 'cron/modules/SalesOrder/RecurringInvoice.service', 43200, NULL, NULL, 1, 'SalesOrder', 2, 'Recommended frequency for RecurringInvoice is 12 hours'),
(3, 'SendReminder', 'cron/SendReminder.service', 900, NULL, NULL, 1, 'Calendar', 3, 'Recommended frequency for SendReminder is 15 mins'),
(5, 'MailScanner', 'cron/MailScanner.service', 900, NULL, NULL, 1, 'Settings', 5, 'Recommended frequency for MailScanner is 15 mins'),
(6, 'Scheduled Import', 'cron/modules/Import/ScheduledImport.service', 900, NULL, NULL, 0, 'Import', 6, 'Recommended frequency for MailScanner is 15 mins'),
(7, 'ScheduleReports', 'cron/modules/Reports/ScheduleReports.service', 900, NULL, NULL, 1, 'Reports', 7, 'Recommended frequency for ScheduleReports is 15 mins');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currencies`
--

CREATE TABLE IF NOT EXISTS `vtiger_currencies` (
`currencyid` int(19) NOT NULL,
  `currency_name` varchar(200) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currencies`
--

INSERT INTO `vtiger_currencies` (`currencyid`, `currency_name`, `currency_code`, `currency_symbol`) VALUES
(1, 'Albania, Leke', 'ALL', 'Lek'),
(2, 'Argentina, Pesos', 'ARS', '$'),
(3, 'Aruba, Guilders', 'AWG', 'ƒ'),
(4, 'Australia, Dollars', 'AUD', '$'),
(5, 'Azerbaijan, New Manats', 'AZN', 'ман'),
(6, 'Bahamas, Dollars', 'BSD', '$'),
(7, 'Bahrain, Dinar', 'BHD', 'BD'),
(8, 'Barbados, Dollars', 'BBD', '$'),
(9, 'Belarus, Rubles', 'BYR', 'p.'),
(10, 'Belize, Dollars', 'BZD', 'BZ$'),
(11, 'Bermuda, Dollars', 'BMD', '$'),
(12, 'Bolivia, Bolivianos', 'BOB', '$b'),
(13, 'China, Yuan Renminbi', 'CNY', '¥'),
(14, 'Convertible Marka', 'BAM', 'KM'),
(15, 'Botswana, Pulas', 'BWP', 'P'),
(16, 'Bulgaria, Leva', 'BGN', 'лв'),
(17, 'Brazil, Reais', 'BRL', 'R$'),
(18, 'Great Britain Pounds', 'GBP', '£'),
(19, 'Brunei Darussalam, Dollars', 'BND', '$'),
(20, 'Canada, Dollars', 'CAD', '$'),
(21, 'Cayman Islands, Dollars', 'KYD', '$'),
(22, 'Chile, Pesos', 'CLP', '$'),
(23, 'Colombia, Pesos', 'COP', '$'),
(24, 'Costa Rica, Colón', 'CRC', '₡'),
(25, 'Croatia, Kuna', 'HRK', 'kn'),
(26, 'Cuba, Pesos', 'CUP', '₱'),
(27, 'Czech Republic, Koruny', 'CZK', 'Kč'),
(28, 'Cyprus, Pounds', 'CYP', '£'),
(29, 'Denmark, Kroner', 'DKK', 'kr'),
(30, 'Dominican Republic, Pesos', 'DOP', 'RD$'),
(31, 'East Caribbean, Dollars', 'XCD', '$'),
(32, 'Egypt, Pounds', 'EGP', '£'),
(33, 'El Salvador, Colón', 'SVC', '₡'),
(34, 'England, Pounds', 'GBP', '£'),
(35, 'Estonia, Krooni', 'EEK', 'kr'),
(36, 'Euro', 'EUR', '€'),
(37, 'Falkland Islands, Pounds', 'FKP', '£'),
(38, 'Fiji, Dollars', 'FJD', '$'),
(39, 'Ghana, Cedis', 'GHC', '¢'),
(40, 'Gibraltar, Pounds', 'GIP', '£'),
(41, 'Guatemala, Quetzales', 'GTQ', 'Q'),
(42, 'Guernsey, Pounds', 'GGP', '£'),
(43, 'Guyana, Dollars', 'GYD', '$'),
(44, 'Honduras, Lempiras', 'HNL', 'L'),
(45, 'Hong Kong, Dollars', 'HKD', 'HK$'),
(46, 'Hungary, Forint', 'HUF', 'Ft'),
(47, 'Iceland, Krona', 'ISK', 'kr'),
(48, 'India, Rupees', 'INR', '₹'),
(49, 'Indonesia, Rupiahs', 'IDR', 'Rp'),
(50, 'Iran, Rials', 'IRR', '﷼'),
(51, 'Isle of Man, Pounds', 'IMP', '£'),
(52, 'Israel, New Shekels', 'ILS', '₪'),
(53, 'Jamaica, Dollars', 'JMD', 'J$'),
(54, 'Japan, Yen', 'JPY', '¥'),
(55, 'Jersey, Pounds', 'JEP', '£'),
(56, 'Jordan, Dinar', 'JOD', 'JOD'),
(57, 'Kazakhstan, Tenge', 'KZT', '〒'),
(58, 'Kenya, Shilling', 'KES', 'KES'),
(59, 'Korea (North), Won', 'KPW', '₩'),
(60, 'Korea (South), Won', 'KRW', '₩'),
(61, 'Kuwait, Dinar', 'KWD', 'KWD'),
(62, 'Kyrgyzstan, Soms', 'KGS', 'лв'),
(63, 'Laos, Kips', 'LAK', '₭'),
(64, 'Latvia, Lati', 'LVL', 'Ls'),
(65, 'Lebanon, Pounds', 'LBP', '£'),
(66, 'Liberia, Dollars', 'LRD', '$'),
(67, 'Switzerland Francs', 'CHF', 'CHF'),
(68, 'Lithuania, Litai', 'LTL', 'Lt'),
(69, 'MADAGASCAR, Malagasy Ariary', 'MGA', 'MGA'),
(70, 'Macedonia, Denars', 'MKD', 'ден'),
(71, 'Malaysia, Ringgits', 'MYR', 'RM'),
(72, 'Malta, Liri', 'MTL', '₤'),
(73, 'Mauritius, Rupees', 'MUR', '₨'),
(74, 'Mexico, Pesos', 'MXN', '$'),
(75, 'Mongolia, Tugriks', 'MNT', '₮'),
(76, 'Mozambique, Meticais', 'MZN', 'MT'),
(77, 'Namibia, Dollars', 'NAD', '$'),
(78, 'Nepal, Rupees', 'NPR', '₨'),
(79, 'Netherlands Antilles, Guilders', 'ANG', 'ƒ'),
(80, 'New Zealand, Dollars', 'NZD', '$'),
(81, 'Nicaragua, Cordobas', 'NIO', 'C$'),
(82, 'Nigeria, Nairas', 'NGN', '₦'),
(83, 'North Korea, Won', 'KPW', '₩'),
(84, 'Norway, Krone', 'NOK', 'kr'),
(85, 'Oman, Rials', 'OMR', '﷼'),
(86, 'Pakistan, Rupees', 'PKR', '₨'),
(87, 'Panama, Balboa', 'PAB', 'B/.'),
(88, 'Paraguay, Guarani', 'PYG', 'Gs'),
(89, 'Peru, Nuevos Soles', 'PEN', 'S/.'),
(90, 'Philippines, Pesos', 'PHP', 'Php'),
(91, 'Poland, Zlotych', 'PLN', 'zł'),
(92, 'Qatar, Rials', 'QAR', '﷼'),
(93, 'Romania, New Lei', 'RON', 'lei'),
(94, 'Russia, Rubles', 'RUB', 'руб'),
(95, 'Saint Helena, Pounds', 'SHP', '£'),
(96, 'Saudi Arabia, Riyals', 'SAR', '﷼'),
(97, 'Serbia, Dinars', 'RSD', 'Дин.'),
(98, 'Seychelles, Rupees', 'SCR', '₨'),
(99, 'Singapore, Dollars', 'SGD', '$'),
(100, 'Solomon Islands, Dollars', 'SBD', '$'),
(101, 'Somalia, Shillings', 'SOS', 'S'),
(102, 'South Africa, Rand', 'ZAR', 'R'),
(103, 'South Korea, Won', 'KRW', '₩'),
(104, 'Sri Lanka, Rupees', 'LKR', '₨'),
(105, 'Sweden, Kronor', 'SEK', 'kr'),
(106, 'Switzerland, Francs', 'CHF', 'CHF'),
(107, 'Suriname, Dollars', 'SRD', '$'),
(108, 'Syria, Pounds', 'SYP', '£'),
(109, 'Taiwan, New Dollars', 'TWD', 'NT$'),
(110, 'Thailand, Baht', 'THB', '฿'),
(111, 'Trinidad and Tobago, Dollars', 'TTD', 'TT$'),
(112, 'Turkey, New Lira', 'TRY', 'YTL'),
(113, 'Turkey, Liras', 'TRL', '₤'),
(114, 'Tuvalu, Dollars', 'TVD', '$'),
(115, 'Ukraine, Hryvnia', 'UAH', '₴'),
(116, 'United Arab Emirates, Dirham', 'AED', 'AED'),
(117, 'United Kingdom, Pounds', 'GBP', '£'),
(118, 'United Republic of Tanzania, Shilling', 'TZS', 'TZS'),
(119, 'USA, Dollars', 'USD', '$'),
(120, 'Uruguay, Pesos', 'UYU', '$U'),
(121, 'Uzbekistan, Sums', 'UZS', 'лв'),
(122, 'Venezuela, Bolivares Fuertes', 'VEF', 'Bs'),
(123, 'Vietnam, Dong', 'VND', '₫'),
(124, 'Zambia, Kwacha', 'ZMK', 'ZMK'),
(125, 'Yemen, Rials', 'YER', '﷼'),
(126, 'Zimbabwe Dollars', 'ZWD', 'Z$'),
(127, 'Malawi, Kwacha', 'MWK', 'MK'),
(128, 'Tunisian, Dinar', 'TD', 'TD'),
(129, 'Moroccan, Dirham', 'MAD', 'DH'),
(130, 'Iraqi Dinar', 'IQD', 'ID'),
(131, 'Maldivian Ruffiya', 'MVR', 'MVR'),
(132, 'Ugandan Shilling', 'UGX', 'Sh'),
(133, 'Sudanese Pound', 'SDG', '£'),
(134, 'CFA Franc BCEAO', 'XOF', 'CFA'),
(135, 'CFA Franc BEAC', 'XAF', 'CFA'),
(136, 'Haiti, Gourde', 'HTG', 'G'),
(137, 'Libya, Dinar', 'LYD', 'LYD');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currencies_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currencies_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currencies_seq`
--

INSERT INTO `vtiger_currencies_seq` (`id`) VALUES
(137);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency` (
`currencyid` int(19) NOT NULL,
  `currency` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_decimal_separator`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_decimal_separator` (
`currency_decimal_separatorid` int(19) NOT NULL,
  `currency_decimal_separator` varchar(2) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_decimal_separator`
--

INSERT INTO `vtiger_currency_decimal_separator` (`currency_decimal_separatorid`, `currency_decimal_separator`, `sortorderid`, `presence`) VALUES
(1, '.', 0, 1),
(2, ',', 1, 1),
(3, '''', 2, 1),
(4, ' ', 3, 1),
(5, '$', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_decimal_separator_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_decimal_separator_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_decimal_separator_seq`
--

INSERT INTO `vtiger_currency_decimal_separator_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_grouping_pattern`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_pattern` (
`currency_grouping_patternid` int(19) NOT NULL,
  `currency_grouping_pattern` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_grouping_pattern`
--

INSERT INTO `vtiger_currency_grouping_pattern` (`currency_grouping_patternid`, `currency_grouping_pattern`, `sortorderid`, `presence`) VALUES
(1, '123,456,789', 0, 1),
(2, '123456789', 1, 1),
(3, '123456,789', 2, 1),
(4, '12,34,56,789', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_grouping_pattern_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_pattern_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_grouping_pattern_seq`
--

INSERT INTO `vtiger_currency_grouping_pattern_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_grouping_separator`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_separator` (
`currency_grouping_separatorid` int(19) NOT NULL,
  `currency_grouping_separator` varchar(2) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_grouping_separator`
--

INSERT INTO `vtiger_currency_grouping_separator` (`currency_grouping_separatorid`, `currency_grouping_separator`, `sortorderid`, `presence`) VALUES
(1, '.', 0, 1),
(2, ',', 1, 1),
(3, '''', 2, 1),
(4, ' ', 3, 1),
(5, '$', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_grouping_separator_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_separator_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_grouping_separator_seq`
--

INSERT INTO `vtiger_currency_grouping_separator_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_info` (
`id` int(11) NOT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(30) DEFAULT NULL,
  `conversion_rate` decimal(12,5) DEFAULT NULL,
  `currency_status` varchar(25) DEFAULT NULL,
  `defaultid` varchar(10) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_info`
--

INSERT INTO `vtiger_currency_info` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `conversion_rate`, `currency_status`, `defaultid`, `deleted`) VALUES
(1, 'China, Yuan Renminbi', 'CNY', '¥', 1.00000, 'Active', '-11', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_info_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_info_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_info_seq`
--

INSERT INTO `vtiger_currency_info_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_symbol_placement`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_symbol_placement` (
`currency_symbol_placementid` int(19) NOT NULL,
  `currency_symbol_placement` varchar(30) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_symbol_placement`
--

INSERT INTO `vtiger_currency_symbol_placement` (`currency_symbol_placementid`, `currency_symbol_placement`, `sortorderid`, `presence`) VALUES
(1, '$1.0', 0, 1),
(2, '1.0$', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_currency_symbol_placement_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_symbol_placement_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_currency_symbol_placement_seq`
--

INSERT INTO `vtiger_currency_symbol_placement_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customaction`
--

CREATE TABLE IF NOT EXISTS `vtiger_customaction` (
  `cvid` int(19) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customerdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerdetails` (
  `customerid` int(19) NOT NULL,
  `portal` varchar(3) DEFAULT NULL,
  `support_start_date` date DEFAULT NULL,
  `support_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_customerdetails`
--

INSERT INTO `vtiger_customerdetails` (`customerid`, `portal`, `support_start_date`, `support_end_date`) VALUES
(11, '0', '2015-01-06', '2016-01-06'),
(20, '0', '2015-01-07', '2016-01-07'),
(26, '0', '2015-01-07', '2016-01-07'),
(27, '0', '2015-01-07', '2016-01-07');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customerportal_fields`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_fields` (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customerportal_prefs`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_prefs` (
  `tabid` int(19) NOT NULL,
  `prefkey` varchar(100) NOT NULL,
  `prefvalue` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_customerportal_prefs`
--

INSERT INTO `vtiger_customerportal_prefs` (`tabid`, `prefkey`, `prefvalue`) VALUES
(0, 'defaultassignee', 1),
(0, 'userid', 1),
(4, 'showrelatedinfo', 1),
(6, 'showrelatedinfo', 1),
(8, 'showrelatedinfo', 1),
(13, 'showrelatedinfo', 1),
(14, 'showrelatedinfo', 1),
(15, 'showrelatedinfo', 1),
(20, 'showrelatedinfo', 1),
(23, 'showrelatedinfo', 1),
(35, 'showrelatedinfo', 1),
(37, 'showrelatedinfo', 1),
(42, 'showrelatedinfo', 1),
(43, 'showrelatedinfo', 1),
(44, 'showrelatedinfo', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customerportal_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_tabs` (
  `tabid` int(19) NOT NULL,
  `visible` int(1) DEFAULT '1',
  `sequence` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_customerportal_tabs`
--

INSERT INTO `vtiger_customerportal_tabs` (`tabid`, `visible`, `sequence`) VALUES
(4, 1, 9),
(6, 1, 10),
(8, 1, 8),
(13, 1, 2),
(14, 1, 6),
(15, 1, 3),
(20, 1, 5),
(23, 1, 4),
(35, 1, 7),
(37, 1, 11),
(42, 1, 12),
(43, 1, 13),
(44, 1, 14);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customview`
--

CREATE TABLE IF NOT EXISTS `vtiger_customview` (
  `cvid` int(19) NOT NULL,
  `viewname` varchar(100) NOT NULL,
  `setdefault` int(1) DEFAULT '0',
  `setmetrics` int(1) DEFAULT '0',
  `entitytype` varchar(25) NOT NULL,
  `status` int(1) DEFAULT '1',
  `userid` int(19) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_customview`
--

INSERT INTO `vtiger_customview` (`cvid`, `viewname`, `setdefault`, `setmetrics`, `entitytype`, `status`, `userid`) VALUES
(1, 'All', 1, 0, 'Leads', 0, 1),
(2, 'Hot Leads', 0, 1, 'Leads', 3, 1),
(3, 'This Month Leads', 0, 0, 'Leads', 3, 1),
(4, 'All', 1, 0, 'Accounts', 0, 1),
(6, 'New This Week', 0, 0, 'Accounts', 3, 1),
(7, 'All', 1, 0, 'Contacts', 0, 1),
(8, 'Contacts Address', 0, 0, 'Contacts', 3, 1),
(9, 'Todays Birthday', 0, 0, 'Contacts', 3, 1),
(10, 'All', 1, 0, 'Potentials', 0, 1),
(11, 'Potentials Won', 0, 1, 'Potentials', 3, 1),
(12, 'Prospecting', 0, 0, 'Potentials', 3, 1),
(13, 'All', 1, 0, 'HelpDesk', 0, 1),
(14, 'Open Tickets', 0, 1, 'HelpDesk', 3, 1),
(15, 'High Prioriy Tickets', 0, 0, 'HelpDesk', 3, 1),
(16, 'All', 1, 0, 'Quotes', 0, 1),
(17, 'Open Quotes', 0, 1, 'Quotes', 3, 1),
(18, 'Rejected Quotes', 0, 0, 'Quotes', 3, 1),
(19, 'All', 1, 0, 'Calendar', 0, 1),
(20, 'All', 1, 0, 'Emails', 0, 1),
(21, 'All', 1, 0, 'Invoice', 0, 1),
(22, 'All', 1, 0, 'Documents', 0, 1),
(23, 'All', 1, 0, 'PriceBooks', 0, 1),
(24, 'All', 1, 0, 'Products', 0, 1),
(25, 'All', 1, 0, 'PurchaseOrder', 0, 1),
(26, 'All', 1, 0, 'SalesOrder', 0, 1),
(27, 'All', 1, 0, 'Vendors', 0, 1),
(28, 'All', 1, 0, 'Faq', 0, 1),
(29, 'All', 1, 0, 'Campaigns', 0, 1),
(30, 'All', 1, 0, 'Webmails', 0, 1),
(31, 'Drafted FAQ', 0, 0, 'Faq', 3, 1),
(32, 'Published FAQ', 0, 0, 'Faq', 3, 1),
(33, 'Open Purchase Orders', 0, 0, 'PurchaseOrder', 3, 1),
(34, 'Received Purchase Orders', 0, 0, 'PurchaseOrder', 3, 1),
(35, 'Open Invoices', 0, 0, 'Invoice', 3, 1),
(36, 'Paid Invoices', 0, 0, 'Invoice', 3, 1),
(37, 'Pending Sales Orders', 0, 0, 'SalesOrder', 3, 1),
(38, 'All', 1, 0, 'ServiceContracts', 0, 1),
(39, 'All', 1, 0, 'Services', 0, 1),
(40, 'All', 1, 0, 'Assets', 0, 1),
(41, 'All', 0, 0, 'ModComments', 0, 1),
(45, 'All', 0, 0, 'SMSNotifier', 0, 1),
(46, 'All', 1, 0, 'ProjectMilestone', 0, 1),
(47, 'All', 1, 0, 'ProjectTask', 0, 1),
(48, 'All', 1, 0, 'Project', 0, 1),
(49, 'ddd', 0, 0, 'Potentials', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_customview_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_customview_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_customview_seq`
--

INSERT INTO `vtiger_customview_seq` (`id`) VALUES
(50);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_cvadvfilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvadvfilter` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `comparator` varchar(20) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL,
  `groupid` int(11) DEFAULT '1',
  `column_condition` varchar(255) DEFAULT 'and'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_cvadvfilter`
--

INSERT INTO `vtiger_cvadvfilter` (`cvid`, `columnindex`, `columnname`, `comparator`, `value`, `groupid`, `column_condition`) VALUES
(2, 0, 'vtiger_leaddetails:leadstatus:leadstatus:Leads_Lead_Status:V', 'e', 'Hot', 1, 'and'),
(11, 0, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V', 'e', 'Closed Won', 1, 'and'),
(12, 0, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V', 'e', 'Prospecting', 1, 'and'),
(14, 0, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V', 'n', 'Closed', 1, 'and'),
(15, 0, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V', 'e', 'High', 1, 'and'),
(17, 0, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'n', 'Accepted', 1, 'and'),
(17, 1, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'n', 'Rejected', 1, 'and'),
(18, 0, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'e', 'Rejected', 1, 'and'),
(31, 0, 'vtiger_faq:status:faqstatus:Faq_Status:V', 'e', 'Draft', 1, 'and'),
(32, 0, 'vtiger_faq:status:faqstatus:Faq_Status:V', 'e', 'Published', 1, 'and'),
(33, 0, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V', 'e', 'Created, Approved, Delivered', 1, 'and'),
(34, 0, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V', 'e', 'Received Shipment', 1, 'and'),
(35, 0, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V', 'e', 'Created, Approved, Sent', 1, 'and'),
(36, 0, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V', 'e', 'Paid', 1, 'and'),
(37, 0, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V', 'e', 'Created, Approved', 1, 'and'),
(49, 0, 'vtiger_crmentity:createdtime:createdtime:Potentials_Created_Time:DT', 'bw', '2014-12-01 16:00:00,2015-01-25 16:00:00', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_cvadvfilter_grouping`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvadvfilter_grouping` (
  `groupid` int(11) NOT NULL,
  `cvid` int(19) NOT NULL,
  `group_condition` varchar(255) DEFAULT NULL,
  `condition_expression` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_cvadvfilter_grouping`
--

INSERT INTO `vtiger_cvadvfilter_grouping` (`groupid`, `cvid`, `group_condition`, `condition_expression`) VALUES
(1, 2, '', ''),
(1, 11, '', ''),
(1, 12, '', ''),
(1, 14, '', ''),
(1, 15, '', ''),
(1, 17, '', ''),
(1, 18, '', ''),
(1, 31, '', ''),
(1, 32, '', ''),
(1, 33, '', ''),
(1, 34, '', ''),
(1, 35, '', ''),
(1, 36, '', ''),
(1, 37, '', ''),
(1, 49, 'and', ' 0 ');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_cvcolumnlist`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvcolumnlist` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_cvcolumnlist`
--

INSERT INTO `vtiger_cvcolumnlist` (`cvid`, `columnindex`, `columnname`) VALUES
(1, 1, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(1, 2, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(1, 3, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(1, 4, 'vtiger_leadaddress:phone:phone:Leads_Phone:V'),
(1, 5, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(1, 6, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(1, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Leads_Assigned_To:V'),
(2, 0, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(2, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(2, 2, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(2, 3, 'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),
(2, 4, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(2, 5, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(3, 0, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(3, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(3, 2, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(3, 3, 'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),
(3, 4, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(3, 5, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(4, 1, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(4, 2, 'vtiger_accountbillads:bill_city:bill_city:Accounts_City:V'),
(4, 3, 'vtiger_account:website:website:Accounts_Website:V'),
(4, 4, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(4, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),
(6, 0, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(6, 1, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(6, 2, 'vtiger_account:website:website:Accounts_Website:V'),
(6, 3, 'vtiger_accountbillads:bill_city:bill_city:Accounts_City:V'),
(6, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Accounts_Assigned_To:V'),
(7, 1, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(7, 2, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(7, 3, 'vtiger_contactdetails:title:title:Contacts_Title:V'),
(7, 4, 'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:I'),
(7, 5, 'vtiger_contactdetails:email:email:Contacts_Email:E'),
(7, 6, 'vtiger_contactdetails:phone:phone:Contacts_Office_Phone:V'),
(7, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),
(8, 0, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(8, 1, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(8, 2, 'vtiger_contactaddress:mailingstreet:mailingstreet:Contacts_Mailing_Street:V'),
(8, 3, 'vtiger_contactaddress:mailingcity:mailingcity:Contacts_Mailing_City:V'),
(8, 4, 'vtiger_contactaddress:mailingstate:mailingstate:Contacts_Mailing_State:V'),
(8, 5, 'vtiger_contactaddress:mailingzip:mailingzip:Contacts_Mailing_Zip:V'),
(8, 6, 'vtiger_contactaddress:mailingcountry:mailingcountry:Contacts_Mailing_Country:V'),
(9, 0, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(9, 1, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(9, 2, 'vtiger_contactdetails:title:title:Contacts_Title:V'),
(9, 3, 'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:I'),
(9, 4, 'vtiger_contactdetails:email:email:Contacts_Email:E'),
(9, 5, 'vtiger_contactsubdetails:otherphone:otherphone:Contacts_Phone:V'),
(9, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),
(10, 1, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(10, 2, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(10, 3, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V'),
(10, 4, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(10, 5, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(10, 6, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(10, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(10, 8, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V'),
(11, 0, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(11, 1, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(11, 2, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(11, 3, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(11, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(11, 5, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V'),
(12, 0, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(12, 1, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(12, 2, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(12, 3, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(12, 4, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(12, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(12, 6, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V'),
(13, 1, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(13, 2, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(13, 3, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),
(13, 4, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),
(13, 5, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(13, 6, 'vtiger_troubletickets:contact_id:contact_id:HelpDesk_Contact_Name:V'),
(14, 0, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(14, 1, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(14, 2, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),
(14, 3, 'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),
(14, 4, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(14, 5, 'vtiger_troubletickets:contact_id:contact_id:HelpDesk_Contact_Name:V'),
(15, 0, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(15, 1, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(15, 2, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),
(15, 3, 'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),
(15, 4, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(15, 5, 'vtiger_troubletickets:contact_id:contact_id:HelpDesk_Contact_Name:V'),
(16, 1, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(16, 2, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),
(16, 3, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(16, 4, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(16, 5, 'vtiger_quotes:total:hdnGrandTotal:Quotes_Total:I'),
(16, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(17, 0, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(17, 1, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),
(17, 2, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(17, 3, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(17, 4, 'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),
(17, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(18, 0, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(18, 1, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(18, 2, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(18, 3, 'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),
(18, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(19, 0, 'vtiger_activity:status:taskstatus:Calendar_Status:V'),
(19, 1, 'vtiger_activity:activitytype:activitytype:Calendar_Type:V'),
(19, 2, 'vtiger_activity:subject:subject:Calendar_Subject:V'),
(19, 3, 'vtiger_seactivityrel:crmid:parent_id:Calendar_Related_to:V'),
(19, 4, 'vtiger_activity:date_start:date_start:Calendar_Start_Date:D'),
(19, 5, 'vtiger_activity:due_date:due_date:Calendar_End_Date:D'),
(19, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Calendar_Assigned_To:V'),
(20, 0, 'vtiger_activity:subject:subject:Emails_Subject:V'),
(20, 1, 'vtiger_emaildetails:to_email:saved_toid:Emails_To:V'),
(20, 2, 'vtiger_activity:date_start:date_start:Emails_Date_Sent:D'),
(21, 1, 'vtiger_invoice:subject:subject:Invoice_Subject:V'),
(21, 2, 'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),
(21, 3, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(21, 4, 'vtiger_invoice:total:hdnGrandTotal:Invoice_Total:I'),
(21, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(22, 1, 'vtiger_notes:title:notes_title:Notes_Title:V'),
(22, 2, 'vtiger_notes:filename:filename:Notes_File:V'),
(22, 3, 'vtiger_crmentity:modifiedtime:modifiedtime:Notes_Modified_Time:DT'),
(22, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Notes_Assigned_To:V'),
(23, 1, 'vtiger_pricebook:bookname:bookname:PriceBooks_Price_Book_Name:V'),
(23, 2, 'vtiger_pricebook:active:active:PriceBooks_Active:V'),
(23, 3, 'vtiger_pricebook:currency_id:currency_id:PriceBooks_Currency:I'),
(24, 1, 'vtiger_products:productname:productname:Products_Product_Name:V'),
(24, 2, 'vtiger_products:productcode:productcode:Products_Part_Number:V'),
(24, 3, 'vtiger_products:commissionrate:commissionrate:Products_Commission_Rate:V'),
(24, 4, 'vtiger_products:qtyinstock:qtyinstock:Products_Quantity_In_Stock:V'),
(24, 5, 'vtiger_products:qty_per_unit:qty_per_unit:Products_Qty/Unit:V'),
(24, 6, 'vtiger_products:unit_price:unit_price:Products_Unit_Price:V'),
(25, 1, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(25, 2, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(25, 3, 'vtiger_purchaseorder:tracking_no:tracking_no:PurchaseOrder_Tracking_Number:V'),
(25, 4, 'vtiger_purchaseorder:total:hdnGrandTotal:PurchaseOrder_Total:V'),
(25, 5, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(26, 1, 'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),
(26, 2, 'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),
(26, 3, 'vtiger_salesorder:quoteid:quote_id:SalesOrder_Quote_Name:I'),
(26, 4, 'vtiger_salesorder:total:hdnGrandTotal:SalesOrder_Total:V'),
(26, 5, 'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),
(27, 1, 'vtiger_vendor:vendorname:vendorname:Vendors_Vendor_Name:V'),
(27, 2, 'vtiger_vendor:phone:phone:Vendors_Phone:V'),
(27, 3, 'vtiger_vendor:email:email:Vendors_Email:E'),
(27, 4, 'vtiger_vendor:category:category:Vendors_Category:V'),
(27, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Vendors_Assigned_To:V'),
(28, 1, 'vtiger_faq:question:question:Faq_Question:V'),
(28, 2, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(28, 3, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(28, 4, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(28, 5, 'vtiger_crmentity:modifiedtime:modifiedtime:Faq_Modified_Time:DT'),
(29, 1, 'vtiger_campaign:campaignname:campaignname:Campaigns_Campaign_Name:V'),
(29, 2, 'vtiger_campaign:campaigntype:campaigntype:Campaigns_Campaign_Type:N'),
(29, 3, 'vtiger_campaign:campaignstatus:campaignstatus:Campaigns_Campaign_Status:N'),
(29, 4, 'vtiger_campaign:expectedrevenue:expectedrevenue:Campaigns_Expected_Revenue:V'),
(29, 5, 'vtiger_campaign:closingdate:closingdate:Campaigns_Expected_Close_Date:D'),
(29, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Campaigns_Assigned_To:V'),
(30, 0, 'subject:subject:subject:Subject:V'),
(30, 1, 'from:fromname:fromname:From:N'),
(30, 2, 'to:tpname:toname:To:N'),
(30, 3, 'body:body:body:Body:V'),
(31, 0, 'vtiger_faq:question:question:Faq_Question:V'),
(31, 1, 'vtiger_faq:status:faqstatus:Faq_Status:V'),
(31, 2, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(31, 3, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(31, 4, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(32, 0, 'vtiger_faq:question:question:Faq_Question:V'),
(32, 1, 'vtiger_faq:answer:faq_answer:Faq_Answer:V'),
(32, 2, 'vtiger_faq:status:faqstatus:Faq_Status:V'),
(32, 3, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(32, 4, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(32, 5, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(33, 0, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(33, 1, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V'),
(33, 2, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(33, 3, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(33, 4, 'vtiger_purchaseorder:duedate:duedate:PurchaseOrder_Due_Date:V'),
(34, 0, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(34, 1, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(34, 2, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(34, 3, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V'),
(34, 4, 'vtiger_purchaseorder:carrier:carrier:PurchaseOrder_Carrier:V'),
(34, 5, 'vtiger_poshipads:ship_street:ship_street:PurchaseOrder_Shipping_Address:V'),
(35, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(35, 1, 'vtiger_invoice:subject:subject:Invoice_Subject:V'),
(35, 2, 'vtiger_invoice:accountid:account_id:Invoice_Account_Name:I'),
(35, 3, 'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),
(35, 4, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(35, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(35, 6, 'vtiger_crmentity:createdtime:createdtime:Invoice_Created_Time:DT'),
(36, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(36, 1, 'vtiger_invoice:subject:subject:Invoice_Subject:V'),
(36, 2, 'vtiger_invoice:accountid:account_id:Invoice_Account_Name:I'),
(36, 3, 'vtiger_invoice:salesorderid:salesorder_id:Invoice_Sales_Order:I'),
(36, 4, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(36, 5, 'vtiger_invoiceshipads:ship_street:ship_street:Invoice_Shipping_Address:V'),
(36, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(37, 0, 'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),
(37, 1, 'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),
(37, 2, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V'),
(37, 3, 'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),
(37, 4, 'vtiger_soshipads:ship_street:ship_street:SalesOrder_Shipping_Address:V'),
(37, 5, 'vtiger_salesorder:carrier:carrier:SalesOrder_Carrier:V'),
(38, 1, 'vtiger_servicecontracts:subject:subject:ServiceContracts_Subject:V'),
(38, 2, 'vtiger_servicecontracts:sc_related_to:sc_related_to:ServiceContracts_Related_to:V'),
(38, 3, 'vtiger_crmentity:smownerid:assigned_user_id:ServiceContracts_Assigned_To:V'),
(38, 4, 'vtiger_servicecontracts:start_date:start_date:ServiceContracts_Start_Date:D'),
(38, 5, 'vtiger_servicecontracts:due_date:due_date:ServiceContracts_Due_date:D'),
(38, 7, 'vtiger_servicecontracts:progress:progress:ServiceContracts_Progress:N'),
(38, 8, 'vtiger_servicecontracts:contract_status:contract_status:ServiceContracts_Status:V'),
(39, 1, 'vtiger_service:servicename:servicename:Services_Service_Name:V'),
(39, 2, 'vtiger_service:service_usageunit:service_usageunit:Services_Usage_Unit:V'),
(39, 3, 'vtiger_service:unit_price:unit_price:Services_Price:N'),
(39, 4, 'vtiger_service:qty_per_unit:qty_per_unit:Services_No_of_Units:N'),
(39, 5, 'vtiger_service:servicecategory:servicecategory:Services_Service_Category:V'),
(39, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Services_Owner:I'),
(40, 1, 'vtiger_assets:assetname:assetname:Assets_Asset_Name:V'),
(40, 2, 'vtiger_assets:account:account:Assets_Customer_Name:V'),
(40, 3, 'vtiger_assets:product:product:Assets_Product_Name:V'),
(41, 0, 'vtiger_modcomments:commentcontent:commentcontent:ModComments_Comment:V'),
(41, 1, 'vtiger_modcomments:related_to:related_to:ModComments_Related_To:V'),
(41, 2, 'vtiger_crmentity:modifiedtime:modifiedtime:ModComments_Modified_Time:DT'),
(41, 3, 'vtiger_crmentity:smownerid:assigned_user_id:ModComments_Assigned_To:V'),
(45, 0, 'vtiger_smsnotifier:message:message:SMSNotifier_message:V'),
(45, 2, 'vtiger_crmentity:smownerid:assigned_user_id:SMSNotifier_Assigned_To:V'),
(45, 3, 'vtiger_crmentity:createdtime:createdtime:SMSNotifier_Created_Time:DT'),
(45, 4, 'vtiger_crmentity:modifiedtime:modifiedtime:SMSNotifier_Modified_Time:DT'),
(46, 0, 'vtiger_projectmilestone:projectmilestonename:projectmilestonename:ProjectMilestone_Project_Milestone_Name:V'),
(46, 1, 'vtiger_projectmilestone:projectmilestonedate:projectmilestonedate:ProjectMilestone_Milestone_Date:D'),
(46, 3, 'vtiger_crmentity:description:description:ProjectMilestone_description:V'),
(46, 4, 'vtiger_crmentity:createdtime:createdtime:ProjectMilestone_Created_Time:T'),
(46, 5, 'vtiger_crmentity:modifiedtime:modifiedtime:ProjectMilestone_Modified_Time:T'),
(47, 2, 'vtiger_projecttask:projecttaskname:projecttaskname:ProjectTask_Project_Task_Name:V'),
(47, 3, 'vtiger_projecttask:projectid:projectid:ProjectTask_Related_to:V'),
(47, 4, 'vtiger_projecttask:projecttaskpriority:projecttaskpriority:ProjectTask_Priority:V'),
(47, 5, 'vtiger_projecttask:projecttaskprogress:projecttaskprogress:ProjectTask_Progress:V'),
(47, 6, 'vtiger_projecttask:projecttaskhours:projecttaskhours:ProjectTask_Worked_Hours:V'),
(47, 7, 'vtiger_projecttask:startdate:startdate:ProjectTask_Start_Date:D'),
(47, 8, 'vtiger_projecttask:enddate:enddate:ProjectTask_End_Date:D'),
(47, 9, 'vtiger_crmentity:smownerid:assigned_user_id:ProjectTask_Assigned_To:V'),
(48, 0, 'vtiger_project:projectname:projectname:Project_Project_Name:V'),
(48, 1, 'vtiger_project:linktoaccountscontacts:linktoaccountscontacts:Project_Related_to:V'),
(48, 2, 'vtiger_project:startdate:startdate:Project_Start_Date:D'),
(48, 3, 'vtiger_project:targetenddate:targetenddate:Project_Target_End_Date:D'),
(48, 4, 'vtiger_project:actualenddate:actualenddate:Project_Actual_End_Date:D'),
(48, 5, 'vtiger_project:targetbudget:targetbudget:Project_Target_Budget:V'),
(48, 6, 'vtiger_project:progress:progress:Project_Progress:V'),
(48, 7, 'vtiger_project:projectstatus:projectstatus:Project_Status:V'),
(48, 8, 'vtiger_crmentity:smownerid:assigned_user_id:Project_Assigned_To:V'),
(49, 1, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(49, 2, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(49, 3, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V'),
(49, 4, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(49, 5, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(49, 6, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(49, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(49, 8, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_cvstdfilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvstdfilter` (
  `cvid` int(19) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `stdfilter` varchar(250) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_cvstdfilter`
--

INSERT INTO `vtiger_cvstdfilter` (`cvid`, `columnname`, `stdfilter`, `startdate`, `enddate`) VALUES
(3, 'vtiger_crmentity:modifiedtime:modifiedtime:Leads_Modified_Time', 'thismonth', '2005-06-01', '2005-06-30'),
(6, 'vtiger_crmentity:createdtime:createdtime:Accounts_Created_Time', 'thisweek', '2005-06-19', '2005-06-25'),
(9, 'vtiger_contactsubdetails:birthday:birthday:Contacts_Birthdate', 'today', '2005-06-25', '2005-06-25');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_grp2grp`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2grp` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_grp2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2role` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_grp2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2rs` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_module_rel`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_module_rel` (
  `shareid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `relationtype` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_module_rel_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_module_rel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_datashare_module_rel_seq`
--

INSERT INTO `vtiger_datashare_module_rel_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_relatedmodule_permission`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodule_permission` (
  `shareid` int(19) NOT NULL,
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_relatedmodules`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodules` (
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `tabid` int(19) DEFAULT NULL,
  `relatedto_tabid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_datashare_relatedmodules`
--

INSERT INTO `vtiger_datashare_relatedmodules` (`datashare_relatedmodule_id`, `tabid`, `relatedto_tabid`) VALUES
(1, 6, 2),
(2, 6, 13),
(3, 6, 20),
(4, 6, 22),
(5, 6, 23),
(6, 2, 20),
(7, 2, 22),
(8, 20, 22),
(9, 22, 23);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_relatedmodules_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodules_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_datashare_relatedmodules_seq`
--

INSERT INTO `vtiger_datashare_relatedmodules_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_role2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2group` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_role2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2role` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_role2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_rs2grp`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2grp` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_rs2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2role` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_datashare_rs2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_date_format`
--

CREATE TABLE IF NOT EXISTS `vtiger_date_format` (
`date_formatid` int(19) NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_date_format`
--

INSERT INTO `vtiger_date_format` (`date_formatid`, `date_format`, `sortorderid`, `presence`) VALUES
(1, 'dd-mm-yyyy', 0, 1),
(2, 'mm-dd-yyyy', 1, 1),
(3, 'yyyy-mm-dd', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_date_format_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_date_format_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_date_format_seq`
--

INSERT INTO `vtiger_date_format_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_dayoftheweek`
--

CREATE TABLE IF NOT EXISTS `vtiger_dayoftheweek` (
`dayoftheweekid` int(11) NOT NULL,
  `dayoftheweek` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_dayoftheweek`
--

INSERT INTO `vtiger_dayoftheweek` (`dayoftheweekid`, `dayoftheweek`, `sortorderid`, `presence`) VALUES
(1, 'Sunday', 1, 1),
(2, 'Monday', 2, 1),
(3, 'Tuesday', 3, 1),
(4, 'Wednesday', 4, 1),
(5, 'Thursday', 5, 1),
(6, 'Friday', 6, 1),
(7, 'Saturday', 7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_dayoftheweek_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_dayoftheweek_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_dayoftheweek_seq`
--

INSERT INTO `vtiger_dayoftheweek_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_def_org_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_field` (
  `tabid` int(10) DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) DEFAULT NULL,
  `readonly` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_def_org_field`
--

INSERT INTO `vtiger_def_org_field` (`tabid`, `fieldid`, `visible`, `readonly`) VALUES
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(6, 8, 0, 0),
(6, 9, 0, 0),
(6, 10, 0, 0),
(6, 11, 0, 0),
(6, 12, 0, 0),
(6, 13, 0, 0),
(6, 14, 0, 0),
(6, 15, 0, 0),
(6, 16, 0, 0),
(6, 17, 0, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(6, 20, 0, 0),
(6, 21, 0, 0),
(6, 22, 0, 0),
(6, 23, 0, 0),
(6, 24, 0, 0),
(6, 25, 0, 0),
(6, 26, 0, 0),
(6, 27, 0, 0),
(6, 28, 0, 0),
(6, 29, 0, 0),
(6, 30, 0, 0),
(6, 31, 0, 0),
(6, 32, 0, 0),
(6, 33, 0, 0),
(6, 34, 0, 0),
(6, 35, 0, 0),
(6, 36, 0, 0),
(7, 37, 0, 0),
(7, 38, 0, 0),
(7, 39, 0, 0),
(7, 40, 0, 0),
(7, 41, 0, 0),
(7, 42, 0, 0),
(7, 43, 0, 0),
(7, 44, 0, 0),
(7, 45, 0, 0),
(7, 46, 0, 0),
(7, 47, 0, 0),
(7, 48, 0, 0),
(7, 49, 0, 0),
(7, 50, 0, 0),
(7, 51, 0, 0),
(7, 52, 0, 0),
(7, 53, 0, 0),
(7, 54, 0, 0),
(7, 55, 0, 0),
(7, 56, 0, 0),
(7, 57, 0, 0),
(7, 58, 0, 0),
(7, 59, 0, 0),
(7, 60, 0, 0),
(7, 61, 0, 0),
(7, 62, 0, 0),
(7, 63, 0, 0),
(7, 64, 0, 0),
(7, 65, 0, 0),
(4, 66, 0, 0),
(4, 67, 0, 0),
(4, 68, 0, 0),
(4, 69, 0, 0),
(4, 70, 0, 0),
(4, 71, 0, 0),
(4, 72, 0, 0),
(4, 73, 0, 0),
(4, 74, 0, 0),
(4, 75, 0, 0),
(4, 76, 0, 0),
(4, 77, 0, 0),
(4, 78, 0, 0),
(4, 79, 0, 0),
(4, 80, 0, 0),
(4, 81, 0, 0),
(4, 82, 0, 0),
(4, 83, 0, 0),
(4, 84, 0, 0),
(4, 85, 0, 0),
(4, 86, 0, 0),
(4, 87, 0, 0),
(4, 88, 0, 0),
(4, 89, 0, 0),
(4, 90, 0, 0),
(4, 91, 0, 0),
(4, 92, 0, 0),
(4, 93, 0, 0),
(4, 94, 0, 0),
(4, 95, 0, 0),
(4, 96, 0, 0),
(4, 97, 0, 0),
(4, 98, 0, 0),
(4, 99, 0, 0),
(4, 100, 0, 0),
(4, 101, 0, 0),
(4, 102, 0, 0),
(4, 103, 0, 0),
(4, 104, 0, 0),
(4, 105, 0, 0),
(4, 106, 0, 0),
(4, 107, 0, 0),
(4, 108, 0, 0),
(4, 109, 0, 0),
(2, 110, 0, 0),
(2, 111, 0, 0),
(2, 112, 0, 0),
(2, 113, 0, 0),
(2, 114, 0, 0),
(2, 115, 0, 0),
(2, 116, 0, 0),
(2, 117, 0, 0),
(2, 118, 0, 0),
(2, 119, 0, 0),
(2, 120, 0, 0),
(2, 121, 0, 0),
(2, 122, 0, 0),
(2, 123, 0, 0),
(2, 124, 0, 0),
(2, 125, 0, 0),
(26, 126, 0, 0),
(26, 127, 0, 0),
(26, 128, 0, 0),
(26, 129, 0, 0),
(26, 130, 0, 0),
(26, 131, 0, 0),
(26, 132, 0, 0),
(26, 133, 0, 0),
(26, 134, 0, 0),
(26, 135, 0, 0),
(26, 136, 0, 0),
(26, 137, 0, 0),
(26, 138, 0, 0),
(26, 139, 0, 0),
(26, 140, 0, 0),
(26, 141, 0, 0),
(26, 142, 0, 0),
(26, 143, 0, 0),
(26, 144, 0, 0),
(26, 145, 0, 0),
(26, 146, 0, 0),
(26, 147, 0, 0),
(26, 148, 0, 0),
(26, 149, 0, 0),
(26, 150, 0, 0),
(4, 151, 0, 0),
(6, 152, 0, 0),
(7, 153, 0, 0),
(26, 154, 0, 0),
(13, 155, 0, 0),
(13, 156, 0, 0),
(13, 157, 0, 0),
(13, 158, 0, 0),
(13, 159, 0, 0),
(13, 160, 0, 0),
(13, 161, 0, 0),
(13, 162, 0, 0),
(13, 163, 0, 0),
(13, 164, 0, 0),
(13, 165, 0, 0),
(13, 166, 0, 0),
(13, 167, 0, 0),
(13, 168, 0, 0),
(13, 169, 0, 0),
(13, 170, 0, 0),
(13, 171, 0, 0),
(13, 172, 0, 0),
(14, 173, 0, 0),
(14, 174, 0, 0),
(14, 175, 0, 0),
(14, 176, 0, 0),
(14, 177, 0, 0),
(14, 178, 0, 0),
(14, 179, 0, 0),
(14, 180, 0, 0),
(14, 181, 0, 0),
(14, 182, 0, 0),
(14, 183, 0, 0),
(14, 184, 0, 0),
(14, 185, 0, 0),
(14, 186, 0, 0),
(14, 187, 0, 0),
(14, 188, 0, 0),
(14, 189, 0, 0),
(14, 190, 0, 0),
(14, 191, 0, 0),
(14, 192, 0, 0),
(14, 193, 0, 0),
(14, 194, 0, 0),
(14, 195, 0, 0),
(14, 196, 0, 0),
(14, 197, 0, 0),
(14, 198, 0, 0),
(14, 199, 0, 0),
(14, 200, 0, 0),
(14, 201, 0, 0),
(14, 202, 0, 0),
(14, 203, 0, 0),
(8, 204, 0, 0),
(8, 205, 0, 0),
(8, 206, 0, 0),
(8, 207, 0, 0),
(8, 208, 0, 0),
(8, 209, 0, 0),
(8, 210, 0, 0),
(8, 211, 0, 0),
(8, 212, 0, 0),
(8, 213, 0, 0),
(8, 214, 0, 0),
(8, 215, 0, 0),
(8, 216, 0, 0),
(8, 217, 0, 0),
(8, 218, 0, 0),
(10, 219, 0, 0),
(10, 220, 0, 0),
(10, 221, 0, 0),
(10, 222, 0, 0),
(10, 223, 0, 0),
(10, 224, 0, 0),
(10, 225, 0, 0),
(10, 226, 0, 0),
(10, 227, 0, 0),
(10, 228, 0, 0),
(10, 229, 0, 0),
(10, 230, 0, 0),
(9, 231, 0, 0),
(9, 232, 0, 0),
(9, 233, 0, 0),
(9, 234, 0, 0),
(9, 235, 0, 0),
(9, 236, 0, 0),
(9, 237, 0, 0),
(9, 238, 0, 0),
(9, 239, 0, 0),
(9, 240, 0, 0),
(9, 241, 0, 0),
(9, 242, 0, 0),
(9, 243, 0, 0),
(9, 244, 0, 0),
(9, 245, 0, 0),
(9, 246, 0, 0),
(9, 247, 0, 0),
(9, 248, 0, 0),
(9, 249, 0, 0),
(9, 250, 0, 0),
(9, 251, 0, 0),
(9, 252, 0, 0),
(9, 253, 0, 0),
(9, 254, 0, 0),
(16, 255, 0, 0),
(16, 256, 0, 0),
(16, 257, 0, 0),
(16, 258, 0, 0),
(16, 259, 0, 0),
(16, 260, 0, 0),
(16, 261, 0, 0),
(16, 262, 0, 0),
(16, 263, 0, 0),
(16, 264, 0, 0),
(16, 265, 0, 0),
(16, 266, 0, 0),
(16, 267, 0, 0),
(16, 268, 0, 0),
(16, 269, 0, 0),
(16, 270, 0, 0),
(16, 271, 0, 0),
(16, 272, 0, 0),
(16, 273, 0, 0),
(16, 274, 0, 0),
(16, 275, 0, 0),
(16, 276, 0, 0),
(16, 277, 0, 0),
(15, 278, 0, 0),
(15, 279, 0, 0),
(15, 280, 0, 0),
(15, 281, 0, 0),
(15, 282, 0, 0),
(15, 283, 0, 0),
(15, 284, 0, 0),
(15, 285, 0, 0),
(15, 286, 0, 0),
(15, 287, 0, 0),
(18, 288, 0, 0),
(18, 289, 0, 0),
(18, 290, 0, 0),
(18, 291, 0, 0),
(18, 292, 0, 0),
(18, 293, 0, 0),
(18, 294, 0, 0),
(18, 295, 0, 0),
(18, 296, 0, 0),
(18, 297, 0, 0),
(18, 298, 0, 0),
(18, 299, 0, 0),
(18, 300, 0, 0),
(18, 301, 0, 0),
(18, 302, 0, 0),
(18, 303, 0, 0),
(18, 304, 0, 0),
(19, 305, 0, 0),
(19, 306, 0, 0),
(19, 307, 0, 0),
(19, 308, 0, 0),
(19, 309, 0, 0),
(19, 310, 0, 0),
(19, 311, 0, 0),
(19, 312, 0, 0),
(20, 313, 0, 0),
(20, 314, 0, 0),
(20, 315, 0, 0),
(20, 316, 0, 0),
(20, 317, 0, 0),
(20, 318, 0, 0),
(20, 319, 0, 0),
(20, 320, 0, 0),
(20, 321, 0, 0),
(20, 322, 0, 0),
(20, 323, 0, 0),
(20, 324, 0, 0),
(20, 325, 0, 0),
(20, 326, 0, 0),
(20, 327, 0, 0),
(20, 328, 0, 0),
(20, 329, 0, 0),
(20, 330, 0, 0),
(20, 331, 0, 0),
(20, 332, 0, 0),
(20, 333, 0, 0),
(20, 334, 0, 0),
(20, 335, 0, 0),
(20, 336, 0, 0),
(20, 337, 0, 0),
(20, 338, 0, 0),
(20, 339, 0, 0),
(20, 340, 0, 0),
(20, 341, 0, 0),
(20, 342, 0, 0),
(20, 343, 0, 0),
(20, 344, 0, 0),
(20, 345, 0, 0),
(20, 346, 0, 0),
(20, 347, 0, 0),
(20, 348, 0, 0),
(20, 349, 0, 0),
(21, 350, 0, 0),
(21, 351, 0, 0),
(21, 352, 0, 0),
(21, 353, 0, 0),
(21, 354, 0, 0),
(21, 355, 0, 0),
(21, 356, 0, 0),
(21, 357, 0, 0),
(21, 358, 0, 0),
(21, 359, 0, 0),
(21, 360, 0, 0),
(21, 361, 0, 0),
(21, 362, 0, 0),
(21, 363, 0, 0),
(21, 364, 0, 0),
(21, 365, 0, 0),
(21, 366, 0, 0),
(21, 367, 0, 0),
(21, 368, 0, 0),
(21, 369, 0, 0),
(21, 370, 0, 0),
(21, 371, 0, 0),
(21, 372, 0, 0),
(21, 373, 0, 0),
(21, 374, 0, 0),
(21, 375, 0, 0),
(21, 376, 0, 0),
(21, 377, 0, 0),
(21, 378, 0, 0),
(21, 379, 0, 0),
(21, 380, 0, 0),
(21, 381, 0, 0),
(21, 382, 0, 0),
(21, 383, 0, 0),
(21, 384, 0, 0),
(21, 385, 0, 0),
(21, 386, 0, 0),
(21, 387, 0, 0),
(22, 388, 0, 0),
(22, 389, 0, 0),
(22, 390, 0, 0),
(22, 391, 0, 0),
(22, 392, 0, 0),
(22, 393, 0, 0),
(22, 394, 0, 0),
(22, 395, 0, 0),
(22, 396, 0, 0),
(22, 397, 0, 0),
(22, 398, 0, 0),
(22, 399, 0, 0),
(22, 400, 0, 0),
(22, 401, 0, 0),
(22, 402, 0, 0),
(22, 403, 0, 0),
(22, 404, 0, 0),
(22, 405, 0, 0),
(22, 406, 0, 0),
(22, 407, 0, 0),
(22, 408, 0, 0),
(22, 409, 0, 0),
(22, 410, 0, 0),
(22, 411, 0, 0),
(22, 412, 0, 0),
(22, 413, 0, 0),
(22, 414, 0, 0),
(22, 415, 0, 0),
(22, 416, 0, 0),
(22, 417, 0, 0),
(22, 418, 0, 0),
(22, 419, 0, 0),
(22, 420, 0, 0),
(22, 421, 0, 0),
(22, 422, 0, 0),
(22, 423, 0, 0),
(22, 424, 0, 0),
(22, 425, 0, 0),
(22, 426, 0, 0),
(22, 427, 0, 0),
(22, 428, 0, 0),
(22, 429, 0, 0),
(22, 430, 0, 0),
(22, 431, 0, 0),
(22, 432, 0, 0),
(22, 433, 0, 0),
(22, 434, 0, 0),
(23, 435, 0, 0),
(23, 436, 0, 0),
(23, 437, 0, 0),
(23, 438, 0, 0),
(23, 439, 0, 0),
(23, 440, 0, 0),
(23, 441, 0, 0),
(23, 442, 0, 0),
(23, 443, 0, 0),
(23, 444, 0, 0),
(23, 445, 0, 0),
(23, 446, 0, 0),
(23, 447, 0, 0),
(23, 448, 0, 0),
(23, 449, 0, 0),
(23, 450, 0, 0),
(23, 451, 0, 0),
(23, 452, 0, 0),
(23, 453, 0, 0),
(23, 454, 0, 0),
(23, 455, 0, 0),
(23, 456, 0, 0),
(23, 457, 0, 0),
(23, 458, 0, 0),
(23, 459, 0, 0),
(23, 460, 0, 0),
(23, 461, 0, 0),
(23, 462, 0, 0),
(23, 463, 0, 0),
(23, 464, 0, 0),
(23, 465, 0, 0),
(23, 466, 0, 0),
(23, 467, 0, 0),
(23, 468, 0, 0),
(23, 469, 0, 0),
(23, 470, 0, 0),
(23, 471, 0, 0),
(23, 472, 0, 0),
(23, 473, 0, 0),
(29, 474, 0, 0),
(29, 478, 0, 0),
(29, 479, 0, 0),
(29, 481, 0, 0),
(29, 488, 0, 0),
(29, 489, 0, 0),
(29, 490, 0, 0),
(29, 491, 0, 0),
(29, 493, 0, 0),
(29, 494, 0, 0),
(29, 495, 0, 0),
(29, 496, 0, 0),
(29, 497, 0, 0),
(29, 502, 0, 0),
(29, 503, 0, 0),
(29, 504, 0, 0),
(29, 505, 0, 0),
(29, 513, 0, 0),
(10, 518, 0, 0),
(10, 519, 0, 0),
(10, 520, 0, 0),
(10, 521, 0, 0),
(10, 522, 0, 0),
(10, 523, 0, 0),
(34, 524, 0, 0),
(34, 525, 0, 0),
(34, 526, 0, 0),
(34, 527, 0, 0),
(34, 528, 0, 0),
(34, 529, 0, 0),
(34, 530, 0, 0),
(34, 531, 0, 0),
(34, 532, 0, 0),
(34, 533, 0, 0),
(34, 534, 0, 0),
(34, 535, 0, 0),
(34, 536, 0, 0),
(34, 537, 0, 0),
(34, 538, 0, 0),
(34, 539, 0, 0),
(34, 540, 0, 0),
(34, 541, 0, 0),
(34, 542, 0, 0),
(35, 543, 0, 0),
(35, 544, 0, 0),
(35, 545, 0, 0),
(35, 546, 0, 0),
(35, 547, 0, 0),
(35, 548, 0, 0),
(35, 549, 0, 0),
(35, 550, 0, 0),
(35, 551, 0, 0),
(35, 552, 0, 0),
(35, 553, 0, 0),
(35, 554, 0, 0),
(35, 555, 0, 0),
(35, 556, 0, 0),
(35, 557, 0, 0),
(35, 558, 0, 0),
(35, 559, 0, 0),
(35, 560, 0, 0),
(35, 561, 0, 0),
(37, 562, 0, 0),
(37, 563, 0, 0),
(37, 564, 0, 0),
(37, 565, 0, 0),
(37, 566, 0, 0),
(37, 567, 0, 0),
(37, 568, 0, 0),
(37, 569, 0, 0),
(37, 570, 0, 0),
(37, 571, 0, 0),
(37, 572, 0, 0),
(37, 573, 0, 0),
(37, 574, 0, 0),
(37, 575, 0, 0),
(37, 576, 0, 0),
(37, 577, 0, 0),
(37, 578, 0, 0),
(37, 579, 0, 0),
(41, 580, 0, 0),
(41, 581, 0, 0),
(41, 582, 0, 0),
(41, 583, 0, 0),
(41, 584, 0, 0),
(41, 585, 0, 0),
(41, 586, 0, 0),
(42, 587, 0, 0),
(42, 588, 0, 0),
(42, 589, 0, 0),
(42, 590, 0, 0),
(42, 591, 0, 0),
(42, 592, 0, 0),
(42, 593, 0, 0),
(42, 594, 0, 0),
(42, 595, 0, 0),
(42, 596, 0, 0),
(43, 597, 0, 0),
(43, 598, 0, 0),
(43, 599, 0, 0),
(43, 600, 0, 0),
(43, 601, 0, 0),
(43, 602, 0, 0),
(43, 603, 0, 0),
(43, 604, 0, 0),
(43, 605, 0, 0),
(43, 606, 0, 0),
(43, 607, 0, 0),
(43, 608, 0, 0),
(43, 609, 0, 0),
(43, 610, 0, 0),
(43, 611, 0, 0),
(44, 612, 0, 0),
(44, 613, 0, 0),
(44, 614, 0, 0),
(44, 615, 0, 0),
(44, 616, 0, 0),
(44, 617, 0, 0),
(44, 618, 0, 0),
(44, 619, 0, 0),
(44, 620, 0, 0),
(44, 621, 0, 0),
(44, 622, 0, 0),
(44, 623, 0, 0),
(44, 624, 0, 0),
(44, 625, 0, 0),
(44, 626, 0, 0),
(44, 627, 0, 0),
(44, 628, 0, 0),
(46, 629, 0, 0),
(46, 630, 0, 0),
(46, 631, 0, 0),
(46, 632, 0, 0),
(46, 633, 0, 0),
(2, 634, 0, 0),
(29, 635, 0, 0),
(23, 636, 0, 0),
(23, 637, 0, 0),
(23, 638, 0, 0),
(23, 639, 0, 0),
(23, 640, 0, 0),
(23, 641, 0, 0),
(23, 642, 0, 0),
(23, 643, 0, 0),
(23, 644, 0, 0),
(22, 645, 0, 0),
(22, 646, 0, 0),
(22, 647, 0, 0),
(22, 648, 0, 0),
(22, 649, 0, 0),
(22, 650, 0, 0),
(22, 651, 0, 0),
(22, 652, 0, 0),
(22, 653, 0, 0),
(21, 654, 0, 0),
(21, 655, 0, 0),
(21, 656, 0, 0),
(21, 657, 0, 0),
(21, 658, 0, 0),
(21, 659, 0, 0),
(21, 660, 0, 0),
(21, 661, 0, 0),
(21, 662, 0, 0),
(20, 663, 0, 0),
(20, 664, 0, 0),
(20, 665, 0, 0),
(20, 666, 0, 0),
(20, 667, 0, 0),
(20, 668, 0, 0),
(20, 669, 0, 0),
(20, 670, 0, 0),
(20, 671, 0, 0),
(29, 672, 0, 0),
(43, 673, 0, 0),
(41, 674, 0, 0),
(29, 675, 0, 0),
(29, 676, 0, 0),
(29, 677, 0, 0),
(23, 678, 0, 0),
(22, 679, 0, 0),
(21, 680, 0, 0),
(20, 681, 0, 0),
(29, 682, 0, 0),
(6, 683, 0, 0),
(4, 684, 0, 0),
(2, 685, 0, 0),
(29, 686, 0, 0),
(23, 687, 0, 0),
(23, 688, 0, 0),
(21, 689, 0, 0),
(21, 690, 0, 0),
(18, 691, 0, 0),
(7, 692, 0, 0),
(41, 693, 0, 0),
(41, 694, 0, 0),
(23, 695, 0, 0),
(20, 696, 0, 0),
(21, 697, 0, 0),
(22, 698, 0, 0),
(29, 699, 0, 0),
(2, 700, 0, 0),
(13, 701, 0, 0),
(29, 702, 0, 0),
(13, 703, 0, 0),
(29, 704, 0, 0),
(29, 705, 0, 0),
(29, 706, 0, 0),
(2, 707, 0, 0),
(4, 708, 0, 0),
(6, 709, 0, 0),
(7, 710, 0, 0),
(9, 712, 0, 0),
(13, 713, 0, 0),
(18, 717, 0, 0),
(21, 720, 0, 0),
(23, 722, 0, 0),
(41, 727, 0, 0),
(42, 728, 0, 0),
(43, 729, 0, 0),
(44, 730, 0, 0),
(29, 732, 0, 0),
(2, 734, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_def_org_share`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_share` (
`ruleid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `permission` int(19) DEFAULT NULL,
  `editstatus` int(19) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_def_org_share`
--

INSERT INTO `vtiger_def_org_share` (`ruleid`, `tabid`, `permission`, `editstatus`) VALUES
(1, 2, 3, 0),
(2, 4, 3, 2),
(3, 6, 3, 0),
(4, 7, 3, 0),
(5, 9, 3, 1),
(6, 13, 3, 0),
(7, 16, 3, 2),
(8, 20, 3, 0),
(9, 21, 3, 0),
(10, 22, 3, 0),
(11, 23, 3, 0),
(12, 26, 3, 0),
(13, 8, 3, 0),
(14, 14, 3, 0),
(15, 34, 3, 0),
(16, 35, 3, 0),
(17, 37, 3, 0),
(18, 41, 3, 0),
(19, 42, 3, 0),
(20, 43, 3, 0),
(21, 44, 3, 0),
(22, 46, 3, 0),
(23, 18, 3, 0),
(24, 10, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_def_org_share_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_share_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_def_org_share_seq`
--

INSERT INTO `vtiger_def_org_share_seq` (`id`) VALUES
(24);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_default_record_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_default_record_view` (
`default_record_viewid` int(11) NOT NULL,
  `default_record_view` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_default_record_view`
--

INSERT INTO `vtiger_default_record_view` (`default_record_viewid`, `default_record_view`, `sortorderid`, `presence`) VALUES
(1, 'Summary', 1, 1),
(2, 'Detail', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_default_record_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_default_record_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_default_record_view_seq`
--

INSERT INTO `vtiger_default_record_view_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_defaultactivitytype`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultactivitytype` (
`defaultactivitytypeid` int(11) NOT NULL,
  `defaultactivitytype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_defaultactivitytype`
--

INSERT INTO `vtiger_defaultactivitytype` (`defaultactivitytypeid`, `defaultactivitytype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Call', 1, 325, 1),
(2, 'Meeting', 1, 326, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_defaultactivitytype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultactivitytype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_defaultactivitytype_seq`
--

INSERT INTO `vtiger_defaultactivitytype_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_defaultcv`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultcv` (
  `tabid` int(19) NOT NULL,
  `defaultviewname` varchar(50) NOT NULL,
  `query` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_defaulteventstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaulteventstatus` (
`defaulteventstatusid` int(11) NOT NULL,
  `defaulteventstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_defaulteventstatus`
--

INSERT INTO `vtiger_defaulteventstatus` (`defaulteventstatusid`, `defaulteventstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Planned', 1, 322, 1),
(2, 'Held', 1, 323, 2),
(3, 'Not Held', 1, 324, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_defaulteventstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaulteventstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_defaulteventstatus_seq`
--

INSERT INTO `vtiger_defaulteventstatus_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_duration_minutes`
--

CREATE TABLE IF NOT EXISTS `vtiger_duration_minutes` (
`minutesid` int(19) NOT NULL,
  `duration_minutes` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_duration_minutes`
--

INSERT INTO `vtiger_duration_minutes` (`minutesid`, `duration_minutes`, `sortorderid`, `presence`) VALUES
(1, '00', 0, 1),
(2, '15', 1, 1),
(3, '30', 2, 1),
(4, '45', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_duration_minutes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_duration_minutes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_duration_minutes_seq`
--

INSERT INTO `vtiger_duration_minutes_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_durationhrs`
--

CREATE TABLE IF NOT EXISTS `vtiger_durationhrs` (
`hrsid` int(19) NOT NULL,
  `hrs` varchar(50) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_durationmins`
--

CREATE TABLE IF NOT EXISTS `vtiger_durationmins` (
`minsid` int(19) NOT NULL,
  `mins` varchar(50) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_email_access`
--

CREATE TABLE IF NOT EXISTS `vtiger_email_access` (
  `crmid` int(11) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `accessdate` date DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_email_access`
--

INSERT INTO `vtiger_email_access` (`crmid`, `mailid`, `accessdate`, `accesstime`) VALUES
(1, 6, '2015-01-05', '2015-01-05 15:00:51');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_email_track`
--

CREATE TABLE IF NOT EXISTS `vtiger_email_track` (
  `crmid` int(11) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `access_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_email_track`
--

INSERT INTO `vtiger_email_track` (`crmid`, `mailid`, `access_count`) VALUES
(1, 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_emaildetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_emaildetails` (
  `emailid` int(19) NOT NULL,
  `from_email` varchar(50) NOT NULL DEFAULT '',
  `to_email` text,
  `cc_email` text,
  `bcc_email` text,
  `assigned_user_email` varchar(50) NOT NULL DEFAULT '',
  `idlists` text,
  `email_flag` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_emaildetails`
--

INSERT INTO `vtiger_emaildetails` (`emailid`, `from_email`, `to_email`, `cc_email`, `bcc_email`, `assigned_user_email`, `idlists`, `email_flag`) VALUES
(6, 'cyj91516@aliyun.com', '["cyj91516@aliyun.com"]', '[""]', '[""]', '', '1@-1|', 'SENT'),
(19, 'cyj91516@aliyun.com', '["cyj91516@aliyun.com"]', '[""]', '[""]', '', '1@-1|', 'SAVED');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_emailtemplates`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailtemplates` (
  `foldername` varchar(100) DEFAULT NULL,
  `templatename` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `description` text,
  `body` text,
  `deleted` int(1) NOT NULL DEFAULT '0',
`templateid` int(19) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_emailtemplates`
--

INSERT INTO `vtiger_emailtemplates` (`foldername`, `templatename`, `subject`, `description`, `body`, `deleted`, `templateid`) VALUES
('Public', 'Announcement for Release', 'Announcement for Release', 'Announcement of a release', 'Hello!   <br />\n	<br />\n	On behalf of the vtiger team,  I am pleased to announce the release of vtiger crm4.2 . This is a feature packed release including the mass email template handling, custom view feature, vtiger_reports feature and a host of other utilities. vtiger runs on all platforms.    <br />\n        <br />\n	Notable Features of vtiger are :   <br />\n	<br />\n	-Email Client Integration    <br />\n	-Trouble Ticket Integration   <br />\n	-Invoice Management Integration   <br />\n	-Reports Integration   <br />\n	-Portal Integration   <br />\n	-Enhanced Word Plugin Support   <br />\n	-Custom View Integration   <br />\n	<br />\n	Known Issues:   <br />\n	-ABCD   <br />\n	-EFGH   <br />\n	-IJKL   <br />\n	-MNOP   <br />\n	-QRST', 0, 1),
('Public', 'Pending Invoices', 'Invoices Pending', 'Payment Due', 'name <br />\nstreet, <br />\ncity, <br />\nstate, <br />\n zip) <br />\n  <br />\n Dear <br />\n <br />\n Please check the following invoices that are yet to be paid by you: <br />\n <br />\n No. Date      Amount <br />\n 1   1/1/01    $4000 <br />\n 2   2/2//01   $5000 <br />\n 3   3/3/01    $10000 <br />\n 4   7/4/01    $23560 <br />\n <br />\n Kindly let us know if there are any issues that you feel are pending to be discussed. <br />\n We will be more than happy to give you a call. <br />\n We would like to continue our business with you.', 0, 2),
('Public', 'Acceptance Proposal', 'Acceptance Proposal', 'Acceptance of Proposal', ' Dear <br />\n <br />\nYour proposal on the project XYZW has been reviewed by us <br />\nand is acceptable in its entirety. <br />\n <br />\nWe are eagerly looking forward to this project <br />\nand are pleased about having the opportunity to work <br />\ntogether. We look forward to a long standing relationship <br />\nwith your esteemed firm. <br />\n<br />\nI would like to take this opportunity to invite you <br />\nto a game of golf on Wednesday morning 9am at the <br />\nCuff Links Ground. We will be waiting for you in the <br />\nExecutive Lounge. <br />\n<br />\nLooking forward to seeing you there.', 0, 3),
('Public', 'Goods received acknowledgement', 'Goods received acknowledgement', 'Acknowledged Receipt of Goods', ' The undersigned hereby acknowledges receipt and delivery of the goods. <br />\nThe undersigned will release the payment subject to the goods being discovered not satisfactory. <br />\n<br />\nSigned under seal this <date>', 0, 4),
('Public', 'Accept Order', 'Accept Order', 'Acknowledgement/Acceptance of Order', ' Dear <br />\n         We are in receipt of your order as contained in the <br />\n   purchase order form.We consider this to be final and binding on both sides. <br />\nIf there be any exceptions noted, we shall consider them <br />\nonly if the objection is received within ten days of receipt of <br />\nthis notice. <br />\n <br />\nThank you for your patronage.', 0, 5),
('Public', 'Address Change', 'Change of Address', 'Address Change', 'Dear <br />\n <br />\nWe are relocating our office to <br />\n11111,XYZDEF Cross, <br />\nUVWWX Circle <br />\nThe telephone number for this new location is (101) 1212-1328. <br />\n<br />\nOur Manufacturing Division will continue operations <br />\nat 3250 Lovedale Square Avenue, in Frankfurt. <br />\n<br />\nWe hope to keep in touch with you all. <br />\nPlease update your addressbooks.', 0, 6),
('Public', 'Follow Up', 'Follow Up', 'Follow Up of meeting', 'Dear <br />\n<br />\nThank you for extending us the opportunity to meet with <br />\nyou and members of your staff. <br />\n<br />\nI know that John Doe serviced your account <br />\nfor many years and made many friends at your firm. He has personally <br />\ndiscussed with me the deep relationship that he had with your firm. <br />\nWhile his presence will be missed, I can promise that we will <br />\ncontinue to provide the fine service that was accorded by <br />\nJohn to your firm. <br />\n<br />\nI was genuinely touched to receive such fine hospitality. <br />\n<br />\nThank you once again.', 0, 7),
('Public', 'Target Crossed!', 'Target Crossed!', 'Fantastic Sales Spree!', 'Congratulations! <br />\n<br />\nThe numbers are in and I am proud to inform you that our <br />\ntotal sales for the previous quarter <br />\namounts to $100,000,00.00!. This is the first time <br />\nwe have exceeded the target by almost 30%. <br />\nWe have also beat the previous quarter record by a <br />\nwhopping 75%! <br />\n<br />\nLet us meet at Smoking Joe for a drink in the evening! <br />\n\nC you all there guys!', 0, 8),
('Public', 'Thanks Note', 'Thanks Note', 'Note of thanks', 'Dear <br />\n<br />\nThank you for your confidence in our ability to serve you. <br />\nWe are glad to be given the chance to serve you.I look <br />\nforward to establishing a long term partnership with you. <br />\nConsider me as a friend. <br />\nShould any need arise,please do give us a call.', 0, 9),
('Public', 'Customer Login Details', 'Customer Portal Login Details', 'Send Portal login details to customer', '<table width="700" cellspacing="0" cellpadding="0" border="0" align="center" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width="50"> </td>\n            <td>\n            <table width="100%" cellspacing="0" cellpadding="0" border="0">\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;">\n                                <tr>\n                                    <td align="center" rowspan="4">$logo$</td>\n                                    <td align="center"> </td>\n                                </tr>\n                                <tr>\n                                    <td align="left" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;">vtiger CRM<br /> </td>\n                                </tr>\n                                <tr>\n                                    <td align="right" style="padding-right: 100px;">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">\n                                <tr>\n                                    <td valign="top">\n                                    <table width="100%" cellspacing="0" cellpadding="5" border="0">\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;">Dear $contact_name$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;"> Thank you very much for subscribing to the vtiger CRM - annual support service.<br />Here is your self service portal login details:</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="center">\n                                                <table width="75%" cellspacing="0" cellpadding="10" border="0" style="border: 2px solid rgb(180, 180, 179); background-color: rgb(226, 226, 225); font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal;">\n                                                        <tr>\n                                                            <td><br />User ID     : <font color="#990000"><strong> $login_name$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td>Password: <font color="#990000"><strong> $password$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td align="center"> <strong>  $URL$<br /> </strong> </td>\n                                                        </tr>\n                                                </table>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;"><strong>NOTE:</strong> We suggest you to change your password after logging in first time. <br /><br /> <strong><u>Help Documentation</u></strong><br />  <br /> After logging in to vtiger Self-service Portal first time, you can access the vtiger CRM documents from the <strong>Documents</strong> tab. Following documents are available for your reference:<br />\n                                                <ul>\n                                                    <li>Installation Manual (Windows &amp; Linux OS)<br /> </li>\n                                                    <li>User &amp; Administrator Manual<br /> </li>\n                                                    <li>vtiger Customer Portal - User Manual<br /> </li>\n                                                    <li>vtiger Outlook Plugin - User Manual<br /> </li>\n                                                    <li>vtiger Office Plug-in - User Manual<br /> </li>\n                                                    <li>vtiger Thunderbird Extension - User Manual<br /> </li>\n                                                    <li>vtiger Web Forms - User Manual<br /> </li>\n                                                    <li>vtiger Firefox Tool bar - User Manual<br /> </li>\n                                                </ul>\n                                                <br />  <br /> <strong><u>Knowledge Base</u></strong><br /> <br /> Periodically we update frequently asked question based on our customer experiences. You can access the latest articles from the <strong>FAQ</strong> tab.<br /> <br /> <strong><u>vtiger CRM - Details</u></strong><br /> <br /> Kindly let us know your current vtiger CRM version and system specification so that we can provide you necessary guidelines to enhance your vtiger CRM system performance. Based on your system specification we alert you about the latest security &amp; upgrade patches.<br />  <br />			 Thank you once again and wish you a wonderful experience with vtiger CRM.<br /> </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><strong style="padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;"><br /><br />Best Regards</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;">$support_team$ </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);" href="http://www.vtiger.com">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width="1%" valign="top"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="5" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);">\n                                <tr>\n                                    <td align="center">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Email Id: <a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);" href="mailto:support@vtiger.com">support@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width="50"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 10),
('Public', 'Support end notification before a week', 'VtigerCRM Support Notification', 'Send Notification mail to customer before a week of support end date', '<table width="700" cellspacing="0" cellpadding="0" border="0" align="center" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width="50"> </td>\n            <td>\n            <table width="100%" cellspacing="0" cellpadding="0" border="0">\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;">\n                                <tr>\n                                    <td align="center" rowspan="4">$logo$</td>\n                                    <td align="center"> </td>\n                                </tr>\n                                <tr>\n                                    <td align="left" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align="right" style="padding-right: 100px;">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">\n                                <tr>\n                                    <td valign="top">\n                                    <table width="100%" cellspacing="0" cellpadding="5" border="0">\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;">This is just a notification mail regarding your support end.<br /><span style="font-weight: bold;">Priority:</span> Urgent<br />Your Support is going to expire on next week<br />Please contact support@vtiger.com.<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="center"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><strong style="padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);" href="http://www.vtiger.com">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width="1%" valign="top"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="5" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);">\n                                <tr>\n                                    <td align="center">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Email Id: <a style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);" href="mailto:info@vtiger.com">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width="50"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 11),
('Public', 'Support end notification before a month', 'VtigerCRM Support Notification', 'Send Notification mail to customer before a month of support end date', '<table width="700" cellspacing="0" cellpadding="0" border="0" align="center" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width="50"> </td>\n            <td>\n            <table width="100%" cellspacing="0" cellpadding="0" border="0">\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;">\n                                <tr>\n                                    <td align="center" rowspan="4">$logo$</td>\n                                    <td align="center"> </td>\n                                </tr>\n                                <tr>\n                                    <td align="left" style="background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align="right" style="padding-right: 100px;">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">\n                                <tr>\n                                    <td valign="top">\n                                    <table width="100%" cellspacing="0" cellpadding="5" border="0">\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;">This is just a notification mail regarding your support end.<br /><span style="font-weight: bold;">Priority:</span> Normal<br />Your Support is going to expire on next month.<br />Please contact support@vtiger.com<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="center"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><strong style="padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align="right"><a href="http://www.vtiger.com" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width="1%" valign="top"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width="100%" cellspacing="0" cellpadding="5" border="0" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);">\n                                <tr>\n                                    <td align="center">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align="center">Email Id: <a href="mailto:info@vtiger.com" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width="50"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 12);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_emailtemplates_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailtemplates_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_emailtemplates_seq`
--

INSERT INTO `vtiger_emailtemplates_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_entityname`
--

CREATE TABLE IF NOT EXISTS `vtiger_entityname` (
  `tabid` int(19) NOT NULL DEFAULT '0',
  `modulename` varchar(50) NOT NULL,
  `tablename` varchar(100) NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `entityidfield` varchar(150) NOT NULL,
  `entityidcolumn` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_entityname`
--

INSERT INTO `vtiger_entityname` (`tabid`, `modulename`, `tablename`, `fieldname`, `entityidfield`, `entityidcolumn`) VALUES
(2, 'Potentials', 'vtiger_potential', 'potentialname', 'potentialid', 'potential_id'),
(4, 'Contacts', 'vtiger_contactdetails', 'firstname,lastname', 'contactid', 'contact_id'),
(6, 'Accounts', 'vtiger_account', 'accountname', 'accountid', 'account_id'),
(7, 'Leads', 'vtiger_leaddetails', 'firstname,lastname', 'leadid', 'leadid'),
(8, 'Documents', 'vtiger_notes', 'title', 'notesid', 'notesid'),
(9, 'Calendar', 'vtiger_activity', 'subject', 'activityid', 'activityid'),
(10, 'Emails', 'vtiger_activity', 'subject', 'activityid', 'activityid'),
(13, 'HelpDesk', 'vtiger_troubletickets', 'title', 'ticketid', 'ticketid'),
(14, 'Products', 'vtiger_products', 'productname', 'productid', 'product_id'),
(15, 'Faq', 'vtiger_faq', 'question', 'id', 'id'),
(18, 'Vendors', 'vtiger_vendor', 'vendorname', 'vendorid', 'vendor_id'),
(19, 'PriceBooks', 'vtiger_pricebook', 'bookname', 'pricebookid', 'pricebookid'),
(20, 'Quotes', 'vtiger_quotes', 'subject', 'quoteid', 'quote_id'),
(21, 'PurchaseOrder', 'vtiger_purchaseorder', 'subject', 'purchaseorderid', 'purchaseorderid'),
(22, 'SalesOrder', 'vtiger_salesorder', 'subject', 'salesorderid', 'salesorder_id'),
(23, 'Invoice', 'vtiger_invoice', 'subject', 'invoiceid', 'invoiceid'),
(26, 'Campaigns', 'vtiger_campaign', 'campaignname', 'campaignid', 'campaignid'),
(29, 'Users', 'vtiger_users', 'first_name,last_name', 'id', 'id'),
(34, 'ServiceContracts', 'vtiger_servicecontracts', 'subject', 'servicecontractsid', 'servicecontractsid'),
(35, 'Services', 'vtiger_service', 'servicename', 'serviceid', 'serviceid'),
(37, 'Assets', 'vtiger_assets', 'assetname', 'assetsid', 'assetsid'),
(41, 'ModComments', 'vtiger_modcomments', 'commentcontent', 'modcommentsid', 'modcommentsid'),
(42, 'ProjectMilestone', 'vtiger_projectmilestone', 'projectmilestonename', 'projectmilestoneid', 'projectmilestoneid'),
(43, 'ProjectTask', 'vtiger_projecttask', 'projecttaskname', 'projecttaskid', 'projecttaskid'),
(44, 'Project', 'vtiger_project', 'projectname', 'projectid', 'projectid'),
(46, 'SMSNotifier', 'vtiger_smsnotifier', 'message', 'smsnotifierid', 'smsnotifierid');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_eventhandler_module`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandler_module` (
`eventhandler_module_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `handler_class` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_eventhandler_module`
--

INSERT INTO `vtiger_eventhandler_module` (`eventhandler_module_id`, `module_name`, `handler_class`) VALUES
(1, 'ModTracker', 'ModTrackerHandler'),
(2, 'ServiceContracts', 'ServiceContractsHandler'),
(3, 'Home', 'Vtiger_RecordLabelUpdater_Handler'),
(4, 'Invoice', 'InvoiceHandler'),
(5, 'PurchaseOrder', 'PurchaseOrderHandler');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_eventhandler_module_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandler_module_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_eventhandler_module_seq`
--

INSERT INTO `vtiger_eventhandler_module_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_eventhandlers`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandlers` (
`eventhandler_id` int(11) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `handler_path` varchar(400) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `cond` text,
  `is_active` int(1) NOT NULL,
  `dependent_on` varchar(255) DEFAULT '[]'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_eventhandlers`
--

INSERT INTO `vtiger_eventhandlers` (`eventhandler_id`, `event_name`, `handler_path`, `handler_class`, `cond`, `is_active`, `dependent_on`) VALUES
(1, 'vtiger.entity.aftersave', 'modules/SalesOrder/RecurringInvoiceHandler.php', 'RecurringInvoiceHandler', '', 1, '[]'),
(2, 'vtiger.entity.beforesave', 'data/VTEntityDelta.php', 'VTEntityDelta', '', 1, '[]'),
(3, 'vtiger.entity.aftersave', 'data/VTEntityDelta.php', 'VTEntityDelta', '', 1, '[]'),
(4, 'vtiger.entity.aftersave', 'modules/com_vtiger_workflow/VTEventHandler.inc', 'VTWorkflowEventHandler', '', 1, '["VTEntityDelta"]'),
(5, 'vtiger.entity.afterrestore', 'modules/com_vtiger_workflow/VTEventHandler.inc', 'VTWorkflowEventHandler', '', 1, '[]'),
(6, 'vtiger.entity.aftersave.final', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDeskHandler', '', 1, '[]'),
(7, 'vtiger.entity.aftersave.final', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(8, 'vtiger.entity.beforedelete', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(9, 'vtiger.entity.afterrestore', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(10, 'vtiger.entity.beforesave', 'modules/ServiceContracts/ServiceContractsHandler.php', 'ServiceContractsHandler', '', 1, '[]'),
(11, 'vtiger.entity.aftersave', 'modules/ServiceContracts/ServiceContractsHandler.php', 'ServiceContractsHandler', '', 1, '[]'),
(12, 'vtiger.entity.aftersave', 'modules/WSAPP/WorkFlowHandlers/WSAPPAssignToTracker.php', 'WSAPPAssignToTracker', '', 1, '["VTEntityDelta"]'),
(13, 'vtiger.entity.aftersave', 'modules/Vtiger/handlers/RecordLabelUpdater.php', 'Vtiger_RecordLabelUpdater_Handler', '', 1, '[]'),
(14, 'vtiger.entity.aftersave', 'modules/Invoice/InvoiceHandler.php', 'InvoiceHandler', '', 1, '[]'),
(15, 'vtiger.entity.aftersave', 'modules/PurchaseOrder/PurchaseOrderHandler.php', 'PurchaseOrderHandler', '', 1, '[]'),
(16, 'vtiger.entity.aftersave', 'modules/ModComments/ModCommentsHandler.php', 'ModCommentsHandler', '', 1, '[]'),
(17, 'vtiger.picklist.afterrename', 'modules/Settings/Picklist/handlers/PickListHandler.php', 'PickListHandler', '', 1, '[]'),
(18, 'vtiger.picklist.afterdelete', 'modules/Settings/Picklist/handlers/PickListHandler.php', 'PickListHandler', '', 1, '[]');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_eventhandlers_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandlers_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_eventhandlers_seq`
--

INSERT INTO `vtiger_eventhandlers_seq` (`id`) VALUES
(18);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_eventstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventstatus` (
`eventstatusid` int(19) NOT NULL,
  `eventstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_eventstatus`
--

INSERT INTO `vtiger_eventstatus` (`eventstatusid`, `eventstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Planned', 0, 38, 0),
(2, 'Held', 0, 39, 1),
(3, 'Not Held', 0, 40, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_eventstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_eventstatus_seq`
--

INSERT INTO `vtiger_eventstatus_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_expectedresponse`
--

CREATE TABLE IF NOT EXISTS `vtiger_expectedresponse` (
`expectedresponseid` int(19) NOT NULL,
  `expectedresponse` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_expectedresponse`
--

INSERT INTO `vtiger_expectedresponse` (`expectedresponseid`, `expectedresponse`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Excellent', 1, 42, 1),
(3, 'Good', 1, 43, 2),
(4, 'Average', 1, 44, 3),
(5, 'Poor', 1, 45, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_expectedresponse_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_expectedresponse_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_expectedresponse_seq`
--

INSERT INTO `vtiger_expectedresponse_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faq` (
`id` int(11) NOT NULL,
  `faq_no` varchar(100) NOT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `question` text,
  `answer` text,
  `category` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_faq`
--

INSERT INTO `vtiger_faq` (`id`, `faq_no`, `product_id`, `question`, `answer`, `category`, `status`) VALUES
(36, 'FAQ1', '35', 'test', 'afds', 'General', 'Published'),
(37, 'FAQ2', '0', 'asfd', 'asfd', '', 'Obsolete');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faqcategories`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcategories` (
`faqcategories_id` int(19) NOT NULL,
  `faqcategories` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_faqcategories`
--

INSERT INTO `vtiger_faqcategories` (`faqcategories_id`, `faqcategories`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'General', 1, 46, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faqcategories_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_faqcategories_seq`
--

INSERT INTO `vtiger_faqcategories_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faqcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcf` (
  `faqid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_faqcf`
--

INSERT INTO `vtiger_faqcf` (`faqid`) VALUES
(36),
(37);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faqcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcomments` (
`commentid` int(19) NOT NULL,
  `faqid` int(19) DEFAULT NULL,
  `comments` text,
  `createdtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faqstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqstatus` (
`faqstatus_id` int(19) NOT NULL,
  `faqstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_faqstatus`
--

INSERT INTO `vtiger_faqstatus` (`faqstatus_id`, `faqstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Draft', 0, 47, 0),
(2, 'Reviewed', 0, 48, 1),
(3, 'Published', 0, 49, 2),
(4, 'Obsolete', 0, 50, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_faqstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_faqstatus_seq`
--

INSERT INTO `vtiger_faqstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_feedback`
--

CREATE TABLE IF NOT EXISTS `vtiger_feedback` (
  `userid` int(19) DEFAULT NULL,
  `dontshow` varchar(19) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_field` (
  `tabid` int(19) NOT NULL,
`fieldid` int(19) NOT NULL,
  `columnname` varchar(30) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `generatedtype` int(19) NOT NULL DEFAULT '0',
  `uitype` varchar(30) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `fieldlabel` varchar(50) NOT NULL,
  `readonly` int(1) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT '1',
  `defaultvalue` text,
  `maximumlength` int(19) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  `block` int(19) DEFAULT NULL,
  `displaytype` int(19) DEFAULT NULL,
  `typeofdata` varchar(100) DEFAULT NULL,
  `quickcreate` int(10) NOT NULL DEFAULT '1',
  `quickcreatesequence` int(19) DEFAULT NULL,
  `info_type` varchar(20) DEFAULT NULL,
  `masseditable` int(10) NOT NULL DEFAULT '1',
  `helpinfo` text,
  `summaryfield` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=735 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_field`
--

INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`) VALUES
(6, 1, 'accountname', 'vtiger_account', 1, '2', 'accountname', 'Account Name', 1, 0, '', 100, 1, 9, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(6, 2, 'account_no', 'vtiger_account', 1, '4', 'account_no', 'Account No', 1, 0, '', 100, 2, 9, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(6, 3, 'phone', 'vtiger_account', 1, '11', 'phone', 'Phone', 1, 2, '', 100, 4, 9, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 1),
(6, 4, 'website', 'vtiger_account', 1, '17', 'website', 'Website', 1, 2, '', 100, 3, 9, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 1),
(6, 5, 'fax', 'vtiger_account', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 6, 9, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 6, 'tickersymbol', 'vtiger_account', 1, '1', 'tickersymbol', 'Ticker Symbol', 1, 1, '', 100, 5, 9, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 7, 'otherphone', 'vtiger_account', 1, '11', 'otherphone', 'Other Phone', 1, 1, '', 100, 8, 9, 1, 'V~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 8, 'parentid', 'vtiger_account', 1, '51', 'account_id', 'Member Of', 1, 1, '', 100, 7, 9, 1, 'I~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 9, 'email1', 'vtiger_account', 1, '13', 'email1', 'Email', 1, 2, '', 100, 10, 9, 1, 'E~O', 1, NULL, 'BAS', 1, NULL, 1),
(6, 10, 'employees', 'vtiger_account', 1, '7', 'employees', 'Employees', 1, 1, '', 100, 9, 9, 1, 'I~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 11, 'email2', 'vtiger_account', 1, '13', 'email2', 'Other Email', 1, 1, '', 100, 11, 9, 1, 'E~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 12, 'ownership', 'vtiger_account', 1, '1', 'ownership', 'Ownership', 1, 1, '', 100, 12, 9, 1, 'V~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 13, 'rating', 'vtiger_account', 1, '15', 'rating', 'Rating', 1, 2, '', 100, 14, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(6, 14, 'industry', 'vtiger_account', 1, '15', 'industry', 'industry', 1, 2, '', 100, 13, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(6, 15, 'siccode', 'vtiger_account', 1, '1', 'siccode', 'SIC Code', 1, 1, '', 100, 27, 9, 1, 'V~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 16, 'account_type', 'vtiger_account', 1, '15', 'accounttype', 'Type', 1, 1, '', 100, 15, 9, 1, 'V~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 17, 'annualrevenue', 'vtiger_account', 1, '71', 'annual_revenue', 'Annual Revenue', 1, 1, '', 100, 18, 9, 1, 'N~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 18, 'emailoptout', 'vtiger_account', 1, '56', 'emailoptout', 'Email Opt Out', 1, 1, '', 100, 17, 9, 1, 'C~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 19, 'notify_owner', 'vtiger_account', 1, '56', 'notify_owner', 'Notify Owner', 1, 2, '1', 10, 26, 9, 1, 'C~O', 1, NULL, 'ADV', 2, NULL, 0),
(6, 20, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 19, 9, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1),
(6, 21, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 22, 9, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(6, 22, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 21, 9, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(6, 23, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 23, 9, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(6, 24, 'bill_street', 'vtiger_accountbillads', 1, '21', 'bill_street', 'Billing Address', 1, 1, '', 100, 1, 11, 1, 'V~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 25, 'ship_street', 'vtiger_accountshipads', 1, '21', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 26, 'bill_city', 'vtiger_accountbillads', 1, '1', 'bill_city', 'Billing City', 1, 1, '', 100, 5, 11, 1, 'V~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 27, 'ship_city', 'vtiger_accountshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 28, 'bill_state', 'vtiger_accountbillads', 1, '1', 'bill_state', 'Billing State', 1, 1, '', 100, 7, 11, 1, 'V~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 29, 'ship_state', 'vtiger_accountshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 30, 'bill_code', 'vtiger_accountbillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 31, 'ship_code', 'vtiger_accountshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 1, '', 100, 10, 11, 1, 'V~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 32, 'bill_country', 'vtiger_accountbillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(6, 33, 'ship_country', 'vtiger_accountshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 1, '', 100, 12, 11, 1, 'V~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 34, 'bill_pobox', 'vtiger_accountbillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 1, '', 100, 3, 11, 1, 'V~O', 1, NULL, 'BAS', 2, NULL, 0),
(6, 35, 'ship_pobox', 'vtiger_accountshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(6, 36, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 12, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 37, 'salutation', 'vtiger_leaddetails', 1, '55', 'salutationtype', 'Salutation', 1, 0, '', 100, 1, 13, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 38, 'firstname', 'vtiger_leaddetails', 1, '55', 'firstname', 'First Name', 1, 0, '', 100, 2, 13, 1, 'V~O', 2, 1, 'BAS', 1, NULL, 1),
(7, 39, 'lead_no', 'vtiger_leaddetails', 1, '4', 'lead_no', 'Lead No', 1, 0, '', 100, 3, 13, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(7, 40, 'phone', 'vtiger_leadaddress', 1, '11', 'phone', 'Phone', 1, 2, '', 100, 5, 13, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 1),
(7, 41, 'lastname', 'vtiger_leaddetails', 1, '255', 'lastname', 'Last Name', 1, 0, '', 100, 4, 13, 1, 'V~M', 0, 2, 'BAS', 1, NULL, 1),
(7, 42, 'mobile', 'vtiger_leadaddress', 1, '11', 'mobile', 'Mobile', 1, 2, '', 100, 7, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 43, 'company', 'vtiger_leaddetails', 1, '2', 'company', 'Company', 1, 2, '', 100, 6, 13, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 1),
(7, 44, 'fax', 'vtiger_leadaddress', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 9, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 45, 'designation', 'vtiger_leaddetails', 1, '1', 'designation', 'Designation', 1, 2, '', 100, 8, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 46, 'email', 'vtiger_leaddetails', 1, '13', 'email', 'Email', 1, 2, '', 100, 11, 13, 1, 'E~O', 2, 5, 'BAS', 1, NULL, 1),
(7, 47, 'leadsource', 'vtiger_leaddetails', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 10, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(7, 48, 'website', 'vtiger_leadsubdetails', 1, '17', 'website', 'Website', 1, 2, '', 100, 13, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 1),
(7, 49, 'industry', 'vtiger_leaddetails', 1, '15', 'industry', 'Industry', 1, 2, '', 100, 12, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(7, 50, 'leadstatus', 'vtiger_leaddetails', 1, '15', 'leadstatus', 'Lead Status', 1, 2, '', 100, 15, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 51, 'annualrevenue', 'vtiger_leaddetails', 1, '71', 'annualrevenue', 'Annual Revenue', 1, 2, '', 100, 14, 13, 1, 'N~O', 1, NULL, 'ADV', 1, NULL, 0),
(7, 52, 'rating', 'vtiger_leaddetails', 1, '15', 'rating', 'Rating', 1, 2, '', 100, 17, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(7, 53, 'noofemployees', 'vtiger_leaddetails', 1, '1', 'noofemployees', 'No Of Employees', 1, 2, '', 100, 16, 13, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0),
(7, 54, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 19, 13, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1),
(7, 55, 'secondaryemail', 'vtiger_leaddetails', 1, '13', 'secondaryemail', 'Secondary Email', 1, 2, '', 100, 18, 13, 1, 'E~O', 1, NULL, 'ADV', 1, NULL, 0),
(7, 56, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 21, 13, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(7, 57, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 20, 13, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(7, 58, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 23, 13, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(7, 59, 'lane', 'vtiger_leadaddress', 1, '21', 'lane', 'Street', 1, 2, '', 100, 1, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 60, 'code', 'vtiger_leadaddress', 1, '1', 'code', 'Postal Code', 1, 2, '', 100, 3, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 61, 'city', 'vtiger_leadaddress', 1, '1', 'city', 'City', 1, 2, '', 100, 4, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(7, 62, 'country', 'vtiger_leadaddress', 1, '1', 'country', 'Country', 1, 2, '', 100, 5, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(7, 63, 'state', 'vtiger_leadaddress', 1, '1', 'state', 'State', 1, 2, '', 100, 6, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 64, 'pobox', 'vtiger_leadaddress', 1, '1', 'pobox', 'Po Box', 1, 2, '', 100, 2, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(7, 65, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 16, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 66, 'salutation', 'vtiger_contactdetails', 1, '55', 'salutationtype', 'Salutation', 1, 0, '', 100, 1, 4, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 67, 'firstname', 'vtiger_contactdetails', 1, '55', 'firstname', 'First Name', 1, 0, '', 100, 2, 4, 1, 'V~O', 2, 1, 'BAS', 1, NULL, 1),
(4, 68, 'contact_no', 'vtiger_contactdetails', 1, '4', 'contact_no', 'Contact Id', 1, 0, '', 100, 3, 4, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(4, 69, 'phone', 'vtiger_contactdetails', 1, '11', 'phone', 'Office Phone', 1, 2, '', 100, 5, 4, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 1),
(4, 70, 'lastname', 'vtiger_contactdetails', 1, '255', 'lastname', 'Last Name', 1, 0, '', 100, 4, 4, 1, 'V~M', 0, 2, 'BAS', 1, NULL, 1),
(4, 71, 'mobile', 'vtiger_contactdetails', 1, '11', 'mobile', 'Mobile', 1, 2, '', 100, 7, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 72, 'accountid', 'vtiger_contactdetails', 1, '51', 'account_id', 'Account Name', 1, 0, '', 100, 6, 4, 1, 'I~O', 2, 3, 'BAS', 1, NULL, 1),
(4, 73, 'homephone', 'vtiger_contactsubdetails', 1, '11', 'homephone', 'Home Phone', 1, 2, '', 100, 9, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 74, 'leadsource', 'vtiger_contactsubdetails', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 8, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 75, 'otherphone', 'vtiger_contactsubdetails', 1, '11', 'otherphone', 'Other Phone', 1, 2, '', 100, 11, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 76, 'title', 'vtiger_contactdetails', 1, '1', 'title', 'Title', 1, 2, '', 100, 10, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(4, 77, 'fax', 'vtiger_contactdetails', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 13, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 78, 'department', 'vtiger_contactdetails', 1, '1', 'department', 'Department', 1, 2, '', 100, 12, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 79, 'birthday', 'vtiger_contactsubdetails', 1, '5', 'birthday', 'Birthdate', 1, 2, '', 100, 16, 4, 1, 'D~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 80, 'email', 'vtiger_contactdetails', 1, '13', 'email', 'Email', 1, 2, '', 100, 15, 4, 1, 'E~O', 2, 5, 'BAS', 1, NULL, 1),
(4, 81, 'reportsto', 'vtiger_contactdetails', 1, '57', 'contact_id', 'Reports To', 1, 2, '', 100, 18, 4, 1, 'V~O', 1, NULL, 'ADV', 0, NULL, 0),
(4, 82, 'assistant', 'vtiger_contactsubdetails', 1, '1', 'assistant', 'Assistant', 1, 2, '', 100, 17, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 83, 'secondaryemail', 'vtiger_contactdetails', 1, '13', 'secondaryemail', 'Secondary Email', 1, 2, '', 100, 20, 4, 1, 'E~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 84, 'assistantphone', 'vtiger_contactsubdetails', 1, '11', 'assistantphone', 'Assistant Phone', 1, 2, '', 100, 19, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 85, 'donotcall', 'vtiger_contactdetails', 1, '56', 'donotcall', 'Do Not Call', 1, 2, '', 100, 22, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 86, 'emailoptout', 'vtiger_contactdetails', 1, '56', 'emailoptout', 'Email Opt Out', 1, 2, '', 100, 21, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 87, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 24, 4, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1),
(4, 88, 'reference', 'vtiger_contactdetails', 1, '56', 'reference', 'Reference', 1, 2, '', 10, 23, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 89, 'notify_owner', 'vtiger_contactdetails', 1, '56', 'notify_owner', 'Notify Owner', 1, 2, '', 10, 26, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 90, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 25, 4, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(4, 91, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 27, 4, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(4, 92, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 28, 4, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(4, 93, 'portal', 'vtiger_customerdetails', 1, '56', 'portal', 'Portal User', 1, 2, '', 100, 1, 6, 1, 'C~O', 1, NULL, 'ADV', 0, NULL, 0),
(4, 94, 'support_start_date', 'vtiger_customerdetails', 1, '5', 'support_start_date', 'Support Start Date', 1, 2, '', 100, 2, 6, 1, 'D~O', 1, NULL, 'ADV', 1, NULL, 0),
(4, 95, 'support_end_date', 'vtiger_customerdetails', 1, '5', 'support_end_date', 'Support End Date', 1, 2, '', 100, 3, 6, 1, 'D~O~OTH~GE~support_start_date~Support Start Date', 1, NULL, 'ADV', 1, NULL, 0),
(4, 96, 'mailingstreet', 'vtiger_contactaddress', 1, '21', 'mailingstreet', 'Mailing Street', 1, 2, '', 100, 1, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 97, 'otherstreet', 'vtiger_contactaddress', 1, '21', 'otherstreet', 'Other Street', 1, 2, '', 100, 2, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 98, 'mailingcity', 'vtiger_contactaddress', 1, '1', 'mailingcity', 'Mailing City', 1, 2, '', 100, 5, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(4, 99, 'othercity', 'vtiger_contactaddress', 1, '1', 'othercity', 'Other City', 1, 2, '', 100, 6, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 100, 'mailingstate', 'vtiger_contactaddress', 1, '1', 'mailingstate', 'Mailing State', 1, 2, '', 100, 7, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 101, 'otherstate', 'vtiger_contactaddress', 1, '1', 'otherstate', 'Other State', 1, 2, '', 100, 8, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 102, 'mailingzip', 'vtiger_contactaddress', 1, '1', 'mailingzip', 'Mailing Zip', 1, 2, '', 100, 9, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 103, 'otherzip', 'vtiger_contactaddress', 1, '1', 'otherzip', 'Other Zip', 1, 2, '', 100, 10, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 104, 'mailingcountry', 'vtiger_contactaddress', 1, '1', 'mailingcountry', 'Mailing Country', 1, 2, '', 100, 11, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(4, 105, 'othercountry', 'vtiger_contactaddress', 1, '1', 'othercountry', 'Other Country', 1, 2, '', 100, 12, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 106, 'mailingpobox', 'vtiger_contactaddress', 1, '1', 'mailingpobox', 'Mailing Po Box', 1, 2, '', 100, 3, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 107, 'otherpobox', 'vtiger_contactaddress', 1, '1', 'otherpobox', 'Other Po Box', 1, 2, '', 100, 4, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 108, 'imagename', 'vtiger_contactdetails', 1, '69', 'imagename', 'Contact Image', 1, 2, '', 100, 1, 73, 1, 'V~O', 3, NULL, 'ADV', 0, NULL, 0),
(4, 109, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 8, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(2, 110, 'potentialname', 'vtiger_potential', 1, '2', 'potentialname', 'Potential Name', 1, 0, '', 100, 1, 1, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(2, 111, 'potential_no', 'vtiger_potential', 1, '4', 'potential_no', 'Potential No', 1, 0, '', 100, 2, 1, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(2, 112, 'amount', 'vtiger_potential', 1, '71', 'amount', 'Amount', 1, 2, '', 100, 5, 1, 1, 'N~O', 2, 5, 'BAS', 1, NULL, 1),
(2, 113, 'related_to', 'vtiger_potential', 1, '10', 'related_to', 'Related To', 1, 0, '', 100, 3, 1, 1, 'V~O', 0, 2, 'BAS', 1, NULL, 1),
(2, 114, 'closingdate', 'vtiger_potential', 1, '23', 'closingdate', 'Expected Close Date', 1, 2, '', 100, 8, 1, 1, 'D~M', 2, 3, 'BAS', 1, NULL, 1),
(2, 115, 'potentialtype', 'vtiger_potential', 1, '15', 'opportunity_type', 'Type', 1, 2, '', 100, 7, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(2, 116, 'nextstep', 'vtiger_potential', 1, '1', 'nextstep', 'Next Step', 1, 2, '', 100, 10, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(2, 117, 'leadsource', 'vtiger_potential', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 9, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(2, 118, 'sales_stage', 'vtiger_potential', 1, '15', 'sales_stage', 'Sales Stage', 1, 2, '', 100, 12, 1, 1, 'V~M', 2, 4, 'BAS', 1, NULL, 1),
(2, 119, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 11, 1, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1),
(2, 120, 'probability', 'vtiger_potential', 1, '9', 'probability', 'Probability', 1, 2, '', 100, 14, 1, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(2, 121, 'campaignid', 'vtiger_potential', 1, '58', 'campaignid', 'Campaign Source', 1, 2, '', 100, 13, 1, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(2, 122, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 16, 1, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(2, 123, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 1, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(2, 124, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 1, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(2, 125, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 3, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 126, 'campaignname', 'vtiger_campaign', 1, '2', 'campaignname', 'Campaign Name', 1, 0, '', 100, 1, 74, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(26, 127, 'campaign_no', 'vtiger_campaign', 1, '4', 'campaign_no', 'Campaign No', 1, 0, '', 100, 2, 74, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(26, 128, 'campaigntype', 'vtiger_campaign', 1, '15', 'campaigntype', 'Campaign Type', 1, 2, '', 100, 5, 74, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 1),
(26, 129, 'product_id', 'vtiger_campaign', 1, '59', 'product_id', 'Product', 1, 2, '', 100, 6, 74, 1, 'I~O', 2, 5, 'BAS', 1, NULL, 0),
(26, 130, 'campaignstatus', 'vtiger_campaign', 1, '15', 'campaignstatus', 'Campaign Status', 1, 2, '', 100, 4, 74, 1, 'V~O', 2, 6, 'BAS', 1, NULL, 1),
(26, 131, 'closingdate', 'vtiger_campaign', 1, '23', 'closingdate', 'Expected Close Date', 1, 2, '', 100, 8, 74, 1, 'D~M', 2, 2, 'BAS', 1, NULL, 1),
(26, 132, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 3, 74, 1, 'V~M', 0, 7, 'BAS', 1, NULL, 1),
(26, 133, 'numsent', 'vtiger_campaign', 1, '9', 'numsent', 'Num Sent', 1, 2, '', 100, 12, 74, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 134, 'sponsor', 'vtiger_campaign', 1, '1', 'sponsor', 'Sponsor', 1, 2, '', 100, 9, 74, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 135, 'targetaudience', 'vtiger_campaign', 1, '1', 'targetaudience', 'Target Audience', 1, 2, '', 100, 7, 74, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 136, 'targetsize', 'vtiger_campaign', 1, '1', 'targetsize', 'TargetSize', 1, 2, '', 100, 10, 74, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 137, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 11, 74, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(26, 138, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 13, 74, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(26, 139, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 74, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(26, 140, 'expectedresponse', 'vtiger_campaign', 1, '15', 'expectedresponse', 'Expected Response', 1, 2, '', 100, 3, 76, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 0),
(26, 141, 'expectedrevenue', 'vtiger_campaign', 1, '71', 'expectedrevenue', 'Expected Revenue', 1, 2, '', 100, 4, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 1),
(26, 142, 'budgetcost', 'vtiger_campaign', 1, '71', 'budgetcost', 'Budget Cost', 1, 2, '', 100, 1, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 143, 'actualcost', 'vtiger_campaign', 1, '71', 'actualcost', 'Actual Cost', 1, 2, '', 100, 2, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 144, 'expectedresponsecount', 'vtiger_campaign', 1, '1', 'expectedresponsecount', 'Expected Response Count', 1, 2, '', 100, 7, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 145, 'expectedsalescount', 'vtiger_campaign', 1, '1', 'expectedsalescount', 'Expected Sales Count', 1, 2, '', 100, 5, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 146, 'expectedroi', 'vtiger_campaign', 1, '71', 'expectedroi', 'Expected ROI', 1, 2, '', 100, 9, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 147, 'actualresponsecount', 'vtiger_campaign', 1, '1', 'actualresponsecount', 'Actual Response Count', 1, 2, '', 100, 8, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 148, 'actualsalescount', 'vtiger_campaign', 1, '1', 'actualsalescount', 'Actual Sales Count', 1, 2, '', 100, 6, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 149, 'actualroi', 'vtiger_campaign', 1, '71', 'actualroi', 'Actual ROI', 1, 2, '', 100, 10, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0),
(26, 150, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 81, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(4, 151, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0),
(6, 152, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0),
(7, 153, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0),
(26, 154, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0),
(13, 155, 'ticket_no', 'vtiger_troubletickets', 1, '4', 'ticket_no', 'Ticket No', 1, 0, '', 100, 14, 25, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1),
(13, 156, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 5, 25, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1),
(13, 157, 'parent_id', 'vtiger_troubletickets', 1, '10', 'parent_id', 'Related To', 1, 0, '', 100, 2, 25, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 1),
(13, 158, 'priority', 'vtiger_troubletickets', 1, '15', 'ticketpriorities', 'Priority', 1, 2, '', 100, 7, 25, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 1),
(13, 159, 'product_id', 'vtiger_troubletickets', 1, '59', 'product_id', 'Product Name', 1, 2, '', 100, 6, 25, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(13, 160, 'severity', 'vtiger_troubletickets', 1, '15', 'ticketseverities', 'Severity', 1, 2, '', 100, 9, 25, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(13, 161, 'status', 'vtiger_troubletickets', 1, '15', 'ticketstatus', 'Status', 1, 2, '', 100, 8, 25, 1, 'V~M', 1, 2, 'BAS', 1, NULL, 1),
(13, 162, 'category', 'vtiger_troubletickets', 1, '15', 'ticketcategories', 'Category', 1, 2, '', 100, 11, 25, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(13, 163, 'update_log', 'vtiger_troubletickets', 1, '19', 'update_log', 'Update History', 1, 0, '', 100, 12, 25, 3, 'V~O', 1, NULL, 'BAS', 0, NULL, 0),
(13, 164, 'hours', 'vtiger_troubletickets', 1, '1', 'hours', 'Hours', 1, 2, '', 100, 10, 25, 1, 'N~O', 1, NULL, 'BAS', 1, 'This gives the estimated hours for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.', 0),
(13, 165, 'days', 'vtiger_troubletickets', 1, '1', 'days', 'Days', 1, 2, '', 100, 11, 25, 1, 'N~O', 1, NULL, 'BAS', 1, 'This gives the estimated days for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.', 0),
(13, 166, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 25, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(13, 167, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 13, 25, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(13, 168, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 25, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(13, 169, 'title', 'vtiger_troubletickets', 1, '22', 'ticket_title', 'Title', 1, 0, '', 100, 1, 25, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(13, 170, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 28, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 1),
(13, 171, 'solution', 'vtiger_troubletickets', 1, '19', 'solution', 'Solution', 1, 0, '', 100, 1, 29, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(13, 172, 'comments', 'vtiger_ticketcomments', 1, '19', 'comments', 'Add Comment', 1, 1, '', 100, 1, 30, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(14, 173, 'productname', 'vtiger_products', 1, '2', 'productname', 'Product Name', 1, 0, '', 100, 1, 31, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(14, 174, 'product_no', 'vtiger_products', 1, '4', 'product_no', 'Product No', 1, 0, '', 100, 2, 31, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(14, 175, 'productcode', 'vtiger_products', 1, '1', 'productcode', 'Part Number', 1, 2, '', 100, 4, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(14, 176, 'discontinued', 'vtiger_products', 1, '56', 'discontinued', 'Product Active', 1, 2, '', 100, 3, 31, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 0),
(14, 177, 'manufacturer', 'vtiger_products', 1, '15', 'manufacturer', 'Manufacturer', 1, 2, '', 100, 6, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 178, 'productcategory', 'vtiger_products', 1, '15', 'productcategory', 'Product Category', 1, 2, '', 100, 6, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 179, 'sales_start_date', 'vtiger_products', 1, '5', 'sales_start_date', 'Sales Start Date', 1, 2, '', 100, 5, 31, 1, 'D~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 180, 'sales_end_date', 'vtiger_products', 1, '5', 'sales_end_date', 'Sales End Date', 1, 2, '', 100, 8, 31, 1, 'D~O~OTH~GE~sales_start_date~Sales Start Date', 1, NULL, 'BAS', 1, NULL, 0),
(14, 181, 'start_date', 'vtiger_products', 1, '5', 'start_date', 'Support Start Date', 1, 2, '', 100, 7, 31, 1, 'D~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 182, 'expiry_date', 'vtiger_products', 1, '5', 'expiry_date', 'Support Expiry Date', 1, 2, '', 100, 10, 31, 1, 'D~O~OTH~GE~start_date~Start Date', 1, NULL, 'BAS', 1, NULL, 0),
(14, 183, 'website', 'vtiger_products', 1, '17', 'website', 'Website', 1, 2, '', 100, 14, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 184, 'vendor_id', 'vtiger_products', 1, '75', 'vendor_id', 'Vendor Name', 1, 2, '', 100, 13, 31, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 185, 'mfr_part_no', 'vtiger_products', 1, '1', 'mfr_part_no', 'Mfr PartNo', 1, 2, '', 100, 16, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 186, 'vendor_part_no', 'vtiger_products', 1, '1', 'vendor_part_no', 'Vendor PartNo', 1, 2, '', 100, 15, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 187, 'serialno', 'vtiger_products', 1, '1', 'serial_no', 'Serial No', 1, 2, '', 100, 18, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 188, 'productsheet', 'vtiger_products', 1, '1', 'productsheet', 'Product Sheet', 1, 2, '', 100, 17, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 189, 'glacct', 'vtiger_products', 1, '15', 'glacct', 'GL Account', 1, 2, '', 100, 20, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(14, 190, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 19, 31, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(14, 191, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 21, 31, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(14, 192, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 31, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(14, 193, 'unit_price', 'vtiger_products', 1, '72', 'unit_price', 'Unit Price', 1, 0, '', 100, 1, 32, 1, 'N~O', 2, 3, 'BAS', 0, NULL, 1),
(14, 194, 'commissionrate', 'vtiger_products', 1, '9', 'commissionrate', 'Commission Rate', 1, 2, '', 100, 2, 32, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 1),
(14, 195, 'taxclass', 'vtiger_products', 1, '83', 'taxclass', 'Tax Class', 1, 2, '', 100, 4, 32, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(14, 196, 'usageunit', 'vtiger_products', 1, '15', 'usageunit', 'Usage Unit', 1, 2, '', 100, 1, 33, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(14, 197, 'qty_per_unit', 'vtiger_products', 1, '1', 'qty_per_unit', 'Qty/Unit', 1, 2, '', 100, 2, 33, 1, 'N~O', 1, NULL, 'ADV', 1, NULL, 1),
(14, 198, 'qtyinstock', 'vtiger_products', 1, '1', 'qtyinstock', 'Qty In Stock', 1, 2, '', 100, 3, 33, 1, 'NN~O', 0, 4, 'ADV', 1, NULL, 0),
(14, 199, 'reorderlevel', 'vtiger_products', 1, '1', 'reorderlevel', 'Reorder Level', 1, 2, '', 100, 4, 33, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0),
(14, 200, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Handler', 1, 0, '', 100, 5, 33, 1, 'V~M', 0, 5, 'BAS', 1, NULL, 0),
(14, 201, 'qtyindemand', 'vtiger_products', 1, '1', 'qtyindemand', 'Qty In Demand', 1, 2, '', 100, 6, 33, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0),
(14, 202, 'imagename', 'vtiger_products', 1, '69', 'imagename', 'Product Image', 1, 2, '', 100, 1, 35, 1, 'V~O', 3, NULL, 'ADV', 0, NULL, 0),
(14, 203, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 36, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(8, 204, 'title', 'vtiger_notes', 1, '2', 'notes_title', 'Title', 1, 0, '', 100, 1, 17, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(8, 205, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 17, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(8, 206, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 17, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 1),
(8, 207, 'filename', 'vtiger_notes', 1, '28', 'filename', 'File Name', 1, 2, '', 100, 3, 18, 1, 'V~O', 0, NULL, 'BAS', 0, NULL, 1),
(8, 208, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 4, 17, 1, 'V~M', 0, 3, 'BAS', 1, NULL, 1),
(8, 209, 'notecontent', 'vtiger_notes', 1, '19', 'notecontent', 'Note', 1, 2, '', 100, 1, 84, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(8, 210, 'filetype', 'vtiger_notes', 1, '1', 'filetype', 'File Type', 1, 2, '', 100, 5, 18, 2, 'V~O', 3, 0, 'BAS', 0, NULL, 0),
(8, 211, 'filesize', 'vtiger_notes', 1, '1', 'filesize', 'File Size', 1, 2, '', 100, 4, 18, 2, 'I~O', 3, 0, 'BAS', 0, NULL, 0),
(8, 212, 'filelocationtype', 'vtiger_notes', 1, '27', 'filelocationtype', 'Download Type', 1, 0, '', 100, 1, 18, 1, 'V~O', 0, 0, 'BAS', 0, NULL, 0),
(8, 213, 'fileversion', 'vtiger_notes', 1, '1', 'fileversion', 'Version', 1, 2, '', 100, 6, 18, 1, 'V~O', 1, 0, 'BAS', 1, NULL, 0),
(8, 214, 'filestatus', 'vtiger_notes', 1, '56', 'filestatus', 'Active', 1, 2, '1', 100, 2, 18, 1, 'V~O', 1, 0, 'BAS', 1, NULL, 0),
(8, 215, 'filedownloadcount', 'vtiger_notes', 1, '1', 'filedownloadcount', 'Download Count', 1, 2, '', 100, 7, 18, 2, 'I~O', 3, 0, 'BAS', 0, NULL, 0),
(8, 216, 'folderid', 'vtiger_notes', 1, '26', 'folderid', 'Folder Name', 1, 2, '', 100, 2, 17, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 1),
(8, 217, 'note_no', 'vtiger_notes', 1, '4', 'note_no', 'Document No', 1, 0, '', 100, 3, 17, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(8, 218, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 17, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(10, 219, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Date & Time Sent', 1, 0, '', 100, 1, 21, 1, 'DT~M~time_start~Time Start', 1, NULL, 'BAS', 1, NULL, 0),
(10, 220, 'semodule', 'vtiger_activity', 1, '2', 'parent_type', 'Sales Enity Module', 1, 0, '', 100, 2, 21, 3, '', 1, NULL, 'BAS', 1, NULL, 0),
(10, 221, 'activitytype', 'vtiger_activity', 1, '2', 'activitytype', 'Activtiy Type', 1, 0, '', 100, 3, 21, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(10, 222, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 5, 21, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0),
(10, 223, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 23, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0),
(10, 224, 'name', 'vtiger_attachments', 1, '61', 'filename', 'Attachment', 1, 0, '', 100, 2, 23, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(10, 225, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 24, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(10, 226, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 9, 23, 1, 'T~O', 1, NULL, 'BAS', 1, NULL, 0),
(10, 227, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 22, 1, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(10, 228, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 11, 21, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(10, 229, 'access_count', 'vtiger_email_track', 1, '25', 'access_count', 'Access Count', 1, 0, '0', 100, 6, 21, 3, 'V~O', 1, NULL, 'BAS', 0, NULL, 0),
(10, 230, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 21, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(9, 231, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 19, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(9, 232, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 19, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1),
(9, 233, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Start Date & Time', 1, 0, '', 100, 3, 19, 1, 'DT~M~time_start', 0, 2, 'BAS', 1, NULL, 1),
(9, 234, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 4, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 1),
(9, 235, 'time_end', 'vtiger_activity', 1, '2', 'time_end', 'End Time', 1, 0, '', 100, 4, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 1),
(9, 236, 'due_date', 'vtiger_activity', 1, '23', 'due_date', 'Due Date', 1, 0, '', 100, 5, 19, 1, 'D~M~OTH~GE~date_start~Start Date & Time', 1, NULL, 'BAS', 1, NULL, 1),
(9, 237, 'crmid', 'vtiger_seactivityrel', 1, '66', 'parent_id', 'Related To', 1, 0, '', 100, 7, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 1),
(9, 238, 'contactid', 'vtiger_cntactivityrel', 1, '57', 'contact_id', 'Contact Name', 1, 0, '', 100, 8, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 239, 'status', 'vtiger_activity', 1, '15', 'taskstatus', 'Status', 1, 0, '', 100, 8, 19, 1, 'V~M', 0, 3, 'BAS', 1, NULL, 0),
(9, 240, 'eventstatus', 'vtiger_activity', 1, '15', 'eventstatus', 'Status', 1, 0, '', 100, 9, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 241, 'priority', 'vtiger_activity', 1, '15', 'taskpriority', 'Priority', 1, 0, '', 100, 10, 19, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 242, 'sendnotification', 'vtiger_activity', 1, '56', 'sendnotification', 'Send Notification', 1, 0, '', 100, 11, 19, 1, 'C~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 243, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 19, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(9, 244, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 19, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(9, 245, 'activitytype', 'vtiger_activity', 1, '15', 'activitytype', 'Activity Type', 1, 0, '', 100, 16, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(9, 246, 'visibility', 'vtiger_activity', 1, '16', 'visibility', 'Visibility', 1, 0, '', 100, 17, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 247, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 20, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 248, 'duration_hours', 'vtiger_activity', 1, '63', 'duration_hours', 'Duration', 1, 0, '', 100, 17, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 249, 'duration_minutes', 'vtiger_activity', 1, '16', 'duration_minutes', 'Duration Minutes', 1, 0, '', 100, 18, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 250, 'location', 'vtiger_activity', 1, '1', 'location', 'Location', 1, 0, '', 100, 19, 19, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 251, 'reminder_time', 'vtiger_activity_reminder', 1, '30', 'reminder_time', 'Send Reminder', 1, 0, '', 100, 1, 19, 3, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 252, 'recurringtype', 'vtiger_activity', 1, '16', 'recurringtype', 'Recurrence', 1, 0, '', 100, 6, 19, 3, 'O~O', 1, NULL, 'BAS', 1, NULL, 1),
(9, 253, 'notime', 'vtiger_activity', 1, '56', 'notime', 'No Time', 1, 0, '', 100, 20, 19, 3, 'C~O', 1, NULL, 'BAS', 1, NULL, 0),
(9, 254, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 19, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(16, 255, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 39, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(16, 256, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 39, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1),
(16, 257, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Start Date & Time', 1, 0, '', 100, 3, 39, 1, 'DT~M~time_start', 0, 2, 'BAS', 1, NULL, 1),
(16, 258, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 4, 39, 3, 'T~M', 1, NULL, 'BAS', 1, NULL, 1),
(16, 259, 'due_date', 'vtiger_activity', 1, '23', 'due_date', 'End Date', 1, 0, '', 100, 5, 39, 1, 'D~M~OTH~GE~date_start~Start Date & Time', 0, 5, 'BAS', 1, NULL, 1),
(16, 260, 'time_end', 'vtiger_activity', 1, '2', 'time_end', 'End Time', 1, 0, '', 100, 5, 39, 3, 'T~M', 1, NULL, 'BAS', 1, NULL, 1),
(16, 261, 'recurringtype', 'vtiger_activity', 1, '16', 'recurringtype', 'Recurrence', 1, 0, '', 100, 6, 116, 1, 'O~O', 1, NULL, 'BAS', 1, NULL, 1),
(16, 262, 'duration_hours', 'vtiger_activity', 1, '63', 'duration_hours', 'Duration', 1, 0, '', 100, 7, 39, 3, 'I~M', 1, NULL, 'BAS', 1, NULL, 0),
(16, 263, 'duration_minutes', 'vtiger_activity', 1, '16', 'duration_minutes', 'Duration Minutes', 1, 0, '', 100, 8, 39, 3, 'O~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 264, 'crmid', 'vtiger_seactivityrel', 1, '66', 'parent_id', 'Related To', 1, 0, '', 100, 9, 118, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 1),
(16, 265, 'eventstatus', 'vtiger_activity', 1, '15', 'eventstatus', 'Status', 1, 0, '', 100, 10, 39, 1, 'V~M', 0, 3, 'BAS', 1, NULL, 0),
(16, 266, 'sendnotification', 'vtiger_activity', 1, '56', 'sendnotification', 'Send Notification', 1, 0, '', 100, 11, 39, 1, 'C~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 267, 'activitytype', 'vtiger_activity', 1, '15', 'activitytype', 'Activity Type', 1, 0, '', 100, 12, 39, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1),
(16, 268, 'location', 'vtiger_activity', 1, '1', 'location', 'Location', 1, 0, '', 100, 13, 39, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 269, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 39, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(16, 270, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 39, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(16, 271, 'priority', 'vtiger_activity', 1, '15', 'taskpriority', 'Priority', 1, 0, '', 100, 16, 39, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 272, 'notime', 'vtiger_activity', 1, '56', 'notime', 'No Time', 1, 0, '', 100, 17, 39, 3, 'C~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 273, 'visibility', 'vtiger_activity', 1, '16', 'visibility', 'Visibility', 1, 0, '', 100, 18, 39, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 274, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 39, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(16, 275, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 41, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 276, 'reminder_time', 'vtiger_activity_reminder', 1, '30', 'reminder_time', 'Send Reminder', 1, 0, '', 100, 1, 40, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(16, 277, 'contactid', 'vtiger_cntactivityrel', 1, '57', 'contact_id', 'Contact Name', 1, 0, '', 100, 1, 118, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(15, 278, 'product_id', 'vtiger_faq', 1, '59', 'product_id', 'Product Name', 1, 2, '', 100, 1, 37, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 1),
(15, 279, 'faq_no', 'vtiger_faq', 1, '4', 'faq_no', 'Faq No', 1, 0, '', 100, 2, 37, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(15, 280, 'category', 'vtiger_faq', 1, '15', 'faqcategories', 'Category', 1, 2, '', 100, 4, 37, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 1),
(15, 281, 'status', 'vtiger_faq', 1, '15', 'faqstatus', 'Status', 1, 2, '', 100, 3, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(15, 282, 'question', 'vtiger_faq', 1, '20', 'question', 'Question', 1, 2, '', 100, 7, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(15, 283, 'answer', 'vtiger_faq', 1, '20', 'faq_answer', 'Answer', 1, 2, '', 100, 8, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(15, 284, 'comments', 'vtiger_faqcomments', 1, '19', 'comments', 'Add Comment', 1, 1, '', 100, 1, 38, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(15, 285, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 37, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 1),
(15, 286, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 37, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 1),
(15, 287, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 37, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(18, 288, 'vendorname', 'vtiger_vendor', 1, '2', 'vendorname', 'Vendor Name', 1, 0, '', 100, 1, 42, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(18, 289, 'vendor_no', 'vtiger_vendor', 1, '4', 'vendor_no', 'Vendor No', 1, 0, '', 100, 2, 42, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(18, 290, 'phone', 'vtiger_vendor', 1, '1', 'phone', 'Phone', 1, 2, '', 100, 4, 42, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 1),
(18, 291, 'email', 'vtiger_vendor', 1, '13', 'email', 'Email', 1, 2, '', 100, 3, 42, 1, 'E~O', 2, 3, 'BAS', 1, NULL, 1),
(18, 292, 'website', 'vtiger_vendor', 1, '17', 'website', 'Website', 1, 2, '', 100, 6, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(18, 293, 'glacct', 'vtiger_vendor', 1, '15', 'glacct', 'GL Account', 1, 2, '', 100, 5, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(18, 294, 'category', 'vtiger_vendor', 1, '1', 'category', 'Category', 1, 2, '', 100, 8, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1),
(18, 295, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 7, 42, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(18, 296, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 9, 42, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(18, 297, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 42, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(18, 298, 'street', 'vtiger_vendor', 1, '21', 'street', 'Street', 1, 2, '', 100, 1, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(18, 299, 'pobox', 'vtiger_vendor', 1, '1', 'pobox', 'Po Box', 1, 2, '', 100, 2, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(18, 300, 'city', 'vtiger_vendor', 1, '1', 'city', 'City', 1, 2, '', 100, 3, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(18, 301, 'state', 'vtiger_vendor', 1, '1', 'state', 'State', 1, 2, '', 100, 4, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(18, 302, 'postalcode', 'vtiger_vendor', 1, '1', 'postalcode', 'Postal Code', 1, 2, '', 100, 5, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(18, 303, 'country', 'vtiger_vendor', 1, '1', 'country', 'Country', 1, 2, '', 100, 6, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(18, 304, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 45, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0),
(19, 305, 'bookname', 'vtiger_pricebook', 1, '2', 'bookname', 'Price Book Name', 1, 0, '', 100, 1, 46, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1),
(19, 306, 'pricebook_no', 'vtiger_pricebook', 1, '4', 'pricebook_no', 'PriceBook No', 1, 0, '', 100, 3, 46, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(19, 307, 'active', 'vtiger_pricebook', 1, '56', 'active', 'Active', 1, 2, '1', 100, 2, 46, 1, 'C~O', 2, 2, 'BAS', 1, NULL, 1),
(19, 308, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 4, 46, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(19, 309, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 5, 46, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(19, 310, 'currency_id', 'vtiger_pricebook', 1, '117', 'currency_id', 'Currency', 1, 0, '', 100, 5, 46, 1, 'I~M', 0, 3, 'BAS', 0, NULL, 0),
(19, 311, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 46, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(19, 312, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 48, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(20, 313, 'quote_no', 'vtiger_quotes', 1, '4', 'quote_no', 'Quote No', 1, 0, '', 100, 3, 49, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1),
(20, 314, 'subject', 'vtiger_quotes', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 49, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 1),
(20, 315, 'potentialid', 'vtiger_quotes', 1, '76', 'potential_id', 'Potential Name', 1, 2, '', 100, 2, 49, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 1),
(20, 316, 'quotestage', 'vtiger_quotes', 1, '15', 'quotestage', 'Quote Stage', 1, 2, '', 100, 4, 49, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(20, 317, 'validtill', 'vtiger_quotes', 1, '5', 'validtill', 'Valid Till', 1, 2, '', 100, 5, 49, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 318, 'contactid', 'vtiger_quotes', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 319, 'carrier', 'vtiger_quotes', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 8, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 320, 'subtotal', 'vtiger_quotes', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 9, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 321, 'shipping', 'vtiger_quotes', 1, '1', 'shipping', 'Shipping', 1, 2, '', 100, 10, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 322, 'inventorymanager', 'vtiger_quotes', 1, '77', 'assigned_user_id1', 'Inventory Manager', 1, 2, '', 100, 11, 49, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 323, 'adjustment', 'vtiger_quotes', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 20, 49, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 324, 'total', 'vtiger_quotes', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1),
(20, 325, 'taxtype', 'vtiger_quotes', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 14, 49, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 326, 'discount_percent', 'vtiger_quotes', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 327, 'discount_amount', 'vtiger_quotes', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 328, 's_h_amount', 'vtiger_quotes', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 329, 'accountid', 'vtiger_quotes', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 16, 49, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 1),
(20, 330, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 17, 49, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(20, 331, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 18, 49, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(20, 332, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 49, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(20, 333, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 49, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(20, 334, 'currency_id', 'vtiger_quotes', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 20, 49, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 335, 'conversion_rate', 'vtiger_quotes', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 21, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 336, 'bill_street', 'vtiger_quotesbillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 51, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(20, 337, 'ship_street', 'vtiger_quotesshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 51, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(20, 338, 'bill_city', 'vtiger_quotesbillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 339, 'ship_city', 'vtiger_quotesshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 340, 'bill_state', 'vtiger_quotesbillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 341, 'ship_state', 'vtiger_quotesshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 342, 'bill_code', 'vtiger_quotesbillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 343, 'ship_code', 'vtiger_quotesshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 344, 'bill_country', 'vtiger_quotesbillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 345, 'ship_country', 'vtiger_quotesshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 346, 'bill_pobox', 'vtiger_quotesbillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 347, 'ship_pobox', 'vtiger_quotesshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(20, 348, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 54, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0);
INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`) VALUES
(20, 349, 'terms_conditions', 'vtiger_quotes', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 53, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(21, 350, 'purchaseorder_no', 'vtiger_purchaseorder', 1, '4', 'purchaseorder_no', 'PurchaseOrder No', 1, 0, '', 100, 2, 55, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1),
(21, 351, 'subject', 'vtiger_purchaseorder', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(21, 352, 'vendorid', 'vtiger_purchaseorder', 1, '81', 'vendor_id', 'Vendor Name', 1, 0, '', 100, 3, 55, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 1),
(21, 353, 'requisition_no', 'vtiger_purchaseorder', 1, '1', 'requisition_no', 'Requisition No', 1, 2, '', 100, 4, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 354, 'tracking_no', 'vtiger_purchaseorder', 1, '1', 'tracking_no', 'Tracking Number', 1, 2, '', 100, 5, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 1),
(21, 355, 'contactid', 'vtiger_purchaseorder', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 55, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 356, 'duedate', 'vtiger_purchaseorder', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 7, 55, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 357, 'carrier', 'vtiger_purchaseorder', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 8, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 358, 'adjustment', 'vtiger_purchaseorder', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 10, 55, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 359, 'salescommission', 'vtiger_purchaseorder', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 100, 11, 55, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 360, 'exciseduty', 'vtiger_purchaseorder', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 12, 55, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 361, 'total', 'vtiger_purchaseorder', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 13, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1),
(21, 362, 'subtotal', 'vtiger_purchaseorder', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 363, 'taxtype', 'vtiger_purchaseorder', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 14, 55, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 364, 'discount_percent', 'vtiger_purchaseorder', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 365, 'discount_amount', 'vtiger_purchaseorder', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 0, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 366, 's_h_amount', 'vtiger_purchaseorder', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 367, 'postatus', 'vtiger_purchaseorder', 1, '15', 'postatus', 'Status', 1, 2, '', 100, 15, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(21, 368, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 16, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(21, 369, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 55, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(21, 370, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 55, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(21, 371, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 55, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(21, 372, 'currency_id', 'vtiger_purchaseorder', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 19, 55, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 373, 'conversion_rate', 'vtiger_purchaseorder', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 20, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 374, 'bill_street', 'vtiger_pobillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 57, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(21, 375, 'ship_street', 'vtiger_poshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 57, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(21, 376, 'bill_city', 'vtiger_pobillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 377, 'ship_city', 'vtiger_poshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 378, 'bill_state', 'vtiger_pobillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 379, 'ship_state', 'vtiger_poshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 380, 'bill_code', 'vtiger_pobillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 381, 'ship_code', 'vtiger_poshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 382, 'bill_country', 'vtiger_pobillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 383, 'ship_country', 'vtiger_poshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 384, 'bill_pobox', 'vtiger_pobillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 385, 'ship_pobox', 'vtiger_poshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(21, 386, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 60, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(21, 387, 'terms_conditions', 'vtiger_purchaseorder', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 59, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(22, 388, 'salesorder_no', 'vtiger_salesorder', 1, '4', 'salesorder_no', 'SalesOrder No', 1, 0, '', 100, 4, 61, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1),
(22, 389, 'subject', 'vtiger_salesorder', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(22, 390, 'potentialid', 'vtiger_salesorder', 1, '76', 'potential_id', 'Potential Name', 1, 2, '', 100, 2, 61, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 391, 'customerno', 'vtiger_salesorder', 1, '1', 'customerno', 'Customer No', 1, 2, '', 100, 3, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 392, 'quoteid', 'vtiger_salesorder', 1, '78', 'quote_id', 'Quote Name', 1, 2, '', 100, 5, 61, 1, 'I~O', 3, NULL, 'BAS', 0, NULL, 1),
(22, 393, 'purchaseorder', 'vtiger_salesorder', 1, '1', 'vtiger_purchaseorder', 'Purchase Order', 1, 2, '', 100, 5, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 394, 'contactid', 'vtiger_salesorder', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 61, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 395, 'duedate', 'vtiger_salesorder', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 8, 61, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 396, 'carrier', 'vtiger_salesorder', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 9, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 397, 'pending', 'vtiger_salesorder', 1, '1', 'pending', 'Pending', 1, 2, '', 100, 10, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 398, 'sostatus', 'vtiger_salesorder', 1, '15', 'sostatus', 'Status', 1, 2, '', 100, 11, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(22, 399, 'adjustment', 'vtiger_salesorder', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 12, 61, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 400, 'salescommission', 'vtiger_salesorder', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 100, 13, 61, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 401, 'exciseduty', 'vtiger_salesorder', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 13, 61, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 402, 'total', 'vtiger_salesorder', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 14, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1),
(22, 403, 'subtotal', 'vtiger_salesorder', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 404, 'taxtype', 'vtiger_salesorder', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 15, 61, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 405, 'discount_percent', 'vtiger_salesorder', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 406, 'discount_amount', 'vtiger_salesorder', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 0, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 407, 's_h_amount', 'vtiger_salesorder', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 408, 'accountid', 'vtiger_salesorder', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 16, 61, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 1),
(22, 409, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 17, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(22, 410, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 18, 61, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 411, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 61, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 412, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 61, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 413, 'currency_id', 'vtiger_salesorder', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 20, 61, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 414, 'conversion_rate', 'vtiger_salesorder', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 21, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 415, 'bill_street', 'vtiger_sobillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 63, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(22, 416, 'ship_street', 'vtiger_soshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 63, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(22, 417, 'bill_city', 'vtiger_sobillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 418, 'ship_city', 'vtiger_soshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 419, 'bill_state', 'vtiger_sobillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 420, 'ship_state', 'vtiger_soshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 421, 'bill_code', 'vtiger_sobillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 422, 'ship_code', 'vtiger_soshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 423, 'bill_country', 'vtiger_sobillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 424, 'ship_country', 'vtiger_soshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 425, 'bill_pobox', 'vtiger_sobillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 426, 'ship_pobox', 'vtiger_soshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(22, 427, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 66, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(22, 428, 'terms_conditions', 'vtiger_salesorder', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 65, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(22, 429, 'enable_recurring', 'vtiger_salesorder', 1, '56', 'enable_recurring', 'Enable Recurring', 1, 0, '', 100, 1, 85, 1, 'C~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 430, 'recurring_frequency', 'vtiger_invoice_recurring_info', 1, '16', 'recurring_frequency', 'Frequency', 1, 0, '', 100, 2, 85, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 431, 'start_period', 'vtiger_invoice_recurring_info', 1, '5', 'start_period', 'Start Period', 1, 0, '', 100, 3, 85, 1, 'D~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 432, 'end_period', 'vtiger_invoice_recurring_info', 1, '5', 'end_period', 'End Period', 1, 0, '', 100, 4, 85, 1, 'D~O~OTH~G~start_period~Start Period', 3, NULL, 'BAS', 0, NULL, 0),
(22, 433, 'payment_duration', 'vtiger_invoice_recurring_info', 1, '16', 'payment_duration', 'Payment Duration', 1, 0, '', 100, 5, 85, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(22, 434, 'invoice_status', 'vtiger_invoice_recurring_info', 1, '15', 'invoicestatus', 'Invoice Status', 1, 0, '', 100, 6, 85, 1, 'V~M', 3, NULL, 'BAS', 0, NULL, 0),
(23, 435, 'subject', 'vtiger_invoice', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 67, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(23, 436, 'salesorderid', 'vtiger_invoice', 1, '80', 'salesorder_id', 'Sales Order', 1, 2, '', 100, 2, 67, 1, 'I~O', 3, NULL, 'BAS', 0, NULL, 1),
(23, 437, 'customerno', 'vtiger_invoice', 1, '1', 'customerno', 'Customer No', 1, 2, '', 100, 3, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 438, 'contactid', 'vtiger_invoice', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 4, 67, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 439, 'invoicedate', 'vtiger_invoice', 1, '5', 'invoicedate', 'Invoice Date', 1, 2, '', 100, 5, 67, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 440, 'duedate', 'vtiger_invoice', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 6, 67, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 441, 'purchaseorder', 'vtiger_invoice', 1, '1', 'vtiger_purchaseorder', 'Purchase Order', 1, 2, '', 100, 8, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 442, 'adjustment', 'vtiger_invoice', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 9, 67, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 443, 'salescommission', 'vtiger_invoice', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 10, 13, 67, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 444, 'exciseduty', 'vtiger_invoice', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 11, 67, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 445, 'subtotal', 'vtiger_invoice', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 12, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 446, 'total', 'vtiger_invoice', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1),
(23, 447, 'taxtype', 'vtiger_invoice', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 13, 67, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 448, 'discount_percent', 'vtiger_invoice', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 449, 'discount_amount', 'vtiger_invoice', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 450, 's_h_amount', 'vtiger_invoice', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 451, 'accountid', 'vtiger_invoice', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 14, 67, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 0),
(23, 452, 'invoicestatus', 'vtiger_invoice', 1, '15', 'invoicestatus', 'Status', 1, 2, '', 100, 15, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 1),
(23, 453, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 16, 67, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1),
(23, 454, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 67, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(23, 455, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 67, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0),
(23, 456, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 67, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(23, 457, 'currency_id', 'vtiger_invoice', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 19, 67, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 458, 'conversion_rate', 'vtiger_invoice', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 20, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 459, 'bill_street', 'vtiger_invoicebillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 69, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(23, 460, 'ship_street', 'vtiger_invoiceshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 69, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0),
(23, 461, 'bill_city', 'vtiger_invoicebillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 462, 'ship_city', 'vtiger_invoiceshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 463, 'bill_state', 'vtiger_invoicebillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 464, 'ship_state', 'vtiger_invoiceshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 465, 'bill_code', 'vtiger_invoicebillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 466, 'ship_code', 'vtiger_invoiceshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 467, 'bill_country', 'vtiger_invoicebillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 468, 'ship_country', 'vtiger_invoiceshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 469, 'bill_pobox', 'vtiger_invoicebillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 470, 'ship_pobox', 'vtiger_invoiceshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0),
(23, 471, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 72, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(23, 472, 'terms_conditions', 'vtiger_invoice', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 71, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0),
(23, 473, 'invoice_no', 'vtiger_invoice', 1, '4', 'invoice_no', 'Invoice No', 1, 0, '', 100, 3, 67, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1),
(29, 474, 'user_name', 'vtiger_users', 1, '106', 'user_name', 'User Name', 1, 0, '', 11, 1, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0),
(29, 475, 'is_admin', 'vtiger_users', 1, '156', 'is_admin', 'Admin', 1, 0, '', 3, 7, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 476, 'user_password', 'vtiger_users', 1, '99', 'user_password', 'Password', 1, 0, '', 30, 5, 77, 4, 'P~M', 1, NULL, 'BAS', 1, NULL, 0),
(29, 477, 'confirm_password', 'vtiger_users', 1, '99', 'confirm_password', 'Confirm Password', 1, 0, '', 30, 6, 77, 4, 'P~M', 1, NULL, 'BAS', 1, NULL, 0),
(29, 478, 'first_name', 'vtiger_users', 1, '1', 'first_name', 'First Name', 1, 0, '', 30, 3, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 479, 'last_name', 'vtiger_users', 1, '2', 'last_name', 'Last Name', 1, 0, '', 30, 4, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0),
(29, 480, 'roleid', 'vtiger_user2role', 1, '98', 'roleid', 'Role', 1, 0, '', 200, 8, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0),
(29, 481, 'email1', 'vtiger_users', 1, '104', 'email1', 'Email', 1, 0, '', 100, 2, 77, 1, 'E~M', 1, NULL, 'BAS', 1, NULL, 0),
(29, 482, 'status', 'vtiger_users', 1, '115', 'status', 'Status', 1, 0, 'Active', 100, 10, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 483, 'activity_view', 'vtiger_users', 1, '16', 'activity_view', 'Default Activity View', 1, 0, '', 100, 6, 117, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 484, 'lead_view', 'vtiger_users', 1, '16', 'lead_view', 'Default Lead View', 1, 0, '', 100, 9, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 485, 'hour_format', 'vtiger_users', 1, '16', 'hour_format', 'Calendar Hour Format', 1, 0, '12', 100, 4, 117, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 486, 'end_hour', 'vtiger_users', 1, '116', 'end_hour', 'Day ends at', 1, 0, '', 100, 11, 77, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 487, 'start_hour', 'vtiger_users', 1, '16', 'start_hour', 'Day starts at', 1, 0, '', 100, 2, 117, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 488, 'title', 'vtiger_users', 1, '1', 'title', 'Title', 1, 0, '', 50, 1, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 489, 'phone_work', 'vtiger_users', 1, '11', 'phone_work', 'Office Phone', 1, 0, '', 50, 5, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 490, 'department', 'vtiger_users', 1, '1', 'department', 'Department', 1, 0, '', 50, 3, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 491, 'phone_mobile', 'vtiger_users', 1, '11', 'phone_mobile', 'Mobile', 1, 0, '', 50, 7, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 492, 'reports_to_id', 'vtiger_users', 1, '101', 'reports_to_id', 'Reports To', 1, 0, '', 50, 8, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 493, 'phone_other', 'vtiger_users', 1, '11', 'phone_other', 'Other Phone', 1, 0, '', 50, 11, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 494, 'email2', 'vtiger_users', 1, '13', 'email2', 'Other Email', 1, 0, '', 100, 4, 79, 1, 'E~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 495, 'phone_fax', 'vtiger_users', 1, '11', 'phone_fax', 'Fax', 1, 0, '', 50, 2, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 496, 'secondaryemail', 'vtiger_users', 1, '13', 'secondaryemail', 'Secondary Email', 1, 0, '', 100, 6, 79, 1, 'E~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 497, 'phone_home', 'vtiger_users', 1, '11', 'phone_home', 'Home Phone', 1, 0, '', 50, 9, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 498, 'date_format', 'vtiger_users', 1, '16', 'date_format', 'Date Format', 1, 0, '', 30, 3, 117, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 499, 'signature', 'vtiger_users', 1, '21', 'signature', 'Signature', 1, 0, '', 250, 13, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 500, 'description', 'vtiger_users', 1, '21', 'description', 'Documents', 1, 0, '', 250, 14, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 501, 'address_street', 'vtiger_users', 1, '21', 'address_street', 'Street Address', 1, 0, '', 250, 1, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 502, 'address_city', 'vtiger_users', 1, '1', 'address_city', 'City', 1, 0, '', 100, 3, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 503, 'address_state', 'vtiger_users', 1, '1', 'address_state', 'State', 1, 0, '', 100, 5, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 504, 'address_postalcode', 'vtiger_users', 1, '1', 'address_postalcode', 'Postal Code', 1, 0, '', 100, 4, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 505, 'address_country', 'vtiger_users', 1, '1', 'address_country', 'Country', 1, 0, '', 100, 2, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 506, 'accesskey', 'vtiger_users', 1, '3', 'accesskey', 'Webservice Access Key', 1, 0, '', 100, 2, 83, 2, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 507, 'time_zone', 'vtiger_users', 1, '16', 'time_zone', 'Time Zone', 1, 0, '', 200, 5, 117, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 508, 'currency_id', 'vtiger_users', 1, '117', 'currency_id', 'Currency', 1, 0, '', 100, 1, 78, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 509, 'currency_grouping_pattern', 'vtiger_users', 1, '16', 'currency_grouping_pattern', 'Digit Grouping Pattern', 1, 0, '', 100, 2, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Digit Grouping Pattern</b> <br/><br/>This pattern specifies the format in which the currency separator will be placed.', 0),
(29, 510, 'currency_decimal_separator', 'vtiger_users', 1, '16', 'currency_decimal_separator', 'Decimal Separator', 1, 0, '', 2, 3, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Decimal Separator</b> <br/><br/>Decimal separator specifies the separator to be used to separate the fractional values from the whole number part. <br/><b>Eg:</b> <br/>. => 123.45 <br/>, => 123,45 <br/>'' => 123''45 <br/>  => 123 45 <br/>$ => 123$45 <br/>', 0),
(29, 511, 'currency_grouping_separator', 'vtiger_users', 1, '16', 'currency_grouping_separator', 'Digit Grouping Separator', 1, 0, '', 2, 4, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Grouping Separator</b> <br/><br/>Grouping separator specifies the separator to be used to group the whole number part into hundreds, thousands etc. <br/><b>Eg:</b> <br/>. => 123.456.789 <br/>, => 123,456,789 <br/>'' => 123''456''789 <br/>  => 123 456 789 <br/>$ => 123$456$789 <br/>', 0),
(29, 512, 'currency_symbol_placement', 'vtiger_users', 1, '16', 'currency_symbol_placement', 'Symbol Placement', 1, 0, '', 20, 5, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Symbol Placement</b> <br/><br/>Symbol Placement allows you to configure the position of the currency symbol with respect to the currency value.<br/><b>Eg:</b> <br/>$1.0 => $123,456,789.50 <br/>1.0$ => 123,456,789.50$ <br/>', 0),
(29, 513, 'imagename', 'vtiger_users', 1, '105', 'imagename', 'User Image', 1, 0, '', 250, 10, 82, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 514, 'internal_mailer', 'vtiger_users', 1, '56', 'internal_mailer', 'INTERNAL_MAIL_COMPOSER', 1, 0, '', 50, 15, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 515, 'theme', 'vtiger_users', 1, '31', 'theme', 'Theme', 1, 0, 'softed', 100, 16, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 516, 'language', 'vtiger_users', 1, '32', 'language', 'Language', 1, 0, '', 100, 17, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(29, 517, 'reminder_interval', 'vtiger_users', 1, '16', 'reminder_interval', 'Reminder Interval', 1, 0, '', 100, 11, 117, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0),
(10, 518, 'from_email', 'vtiger_emaildetails', 1, '12', 'from_email', 'From', 1, 2, '', 100, 1, 21, 3, 'V~M', 3, NULL, 'BAS', 0, NULL, 0),
(10, 519, 'to_email', 'vtiger_emaildetails', 1, '8', 'saved_toid', 'To', 1, 2, '', 100, 2, 21, 1, 'V~M', 3, NULL, 'BAS', 0, NULL, 0),
(10, 520, 'cc_email', 'vtiger_emaildetails', 1, '8', 'ccmail', 'CC', 1, 2, '', 1000, 3, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(10, 521, 'bcc_email', 'vtiger_emaildetails', 1, '8', 'bccmail', 'BCC', 1, 2, '', 1000, 4, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(10, 522, 'idlists', 'vtiger_emaildetails', 1, '357', 'parent_id', 'Parent ID', 1, 2, '', 1000, 5, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(10, 523, 'email_flag', 'vtiger_emaildetails', 1, '16', 'email_flag', 'Email Flag', 1, 2, '', 1000, 6, 21, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0),
(34, 524, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 88, 1, 'V~M', 2, 2, 'BAS', 1, '', 1),
(34, 525, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 88, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0),
(34, 526, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 88, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0),
(34, 527, 'start_date', 'vtiger_servicecontracts', 1, '5', 'start_date', 'Start Date', 1, 2, '', 100, 7, 88, 1, 'D~O', 2, 4, 'BAS', 1, '', 0),
(34, 528, 'end_date', 'vtiger_servicecontracts', 1, '5', 'end_date', 'End Date', 1, 2, '', 100, 11, 88, 2, 'D~O', 3, 0, 'BAS', 0, '', 0),
(34, 529, 'sc_related_to', 'vtiger_servicecontracts', 1, '10', 'sc_related_to', 'Related to', 1, 2, '', 100, 3, 88, 1, 'V~O', 2, 6, 'BAS', 1, '', 0),
(34, 530, 'tracking_unit', 'vtiger_servicecontracts', 1, '15', 'tracking_unit', 'Tracking Unit', 1, 2, '', 100, 6, 88, 1, 'V~O', 2, 7, 'BAS', 1, '', 0),
(34, 531, 'total_units', 'vtiger_servicecontracts', 1, '7', 'total_units', 'Total Units', 1, 2, '', 100, 8, 88, 1, 'V~O', 2, 8, 'BAS', 1, '', 1),
(34, 532, 'used_units', 'vtiger_servicecontracts', 1, '7', 'used_units', 'Used Units', 1, 2, '', 100, 10, 88, 1, 'V~O', 2, 9, 'BAS', 1, '', 1),
(34, 533, 'subject', 'vtiger_servicecontracts', 1, '1', 'subject', 'Subject', 1, 0, '', 100, 1, 88, 1, 'V~M', 0, 1, 'BAS', 1, '', 1),
(34, 534, 'due_date', 'vtiger_servicecontracts', 1, '23', 'due_date', 'Due date', 1, 2, '', 100, 9, 88, 1, 'D~O', 2, 5, 'BAS', 1, '', 0),
(34, 535, 'planned_duration', 'vtiger_servicecontracts', 1, '1', 'planned_duration', 'Planned Duration', 1, 2, '', 100, 13, 88, 2, 'V~O', 3, 0, 'BAS', 0, '', 0),
(34, 536, 'actual_duration', 'vtiger_servicecontracts', 1, '1', 'actual_duration', 'Actual Duration', 1, 2, '', 100, 15, 88, 2, 'V~O', 3, 0, 'BAS', 0, '', 0),
(34, 537, 'contract_status', 'vtiger_servicecontracts', 1, '15', 'contract_status', 'Status', 1, 2, '', 100, 12, 88, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(34, 538, 'priority', 'vtiger_servicecontracts', 1, '15', 'contract_priority', 'Priority', 1, 2, '', 100, 14, 88, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(34, 539, 'contract_type', 'vtiger_servicecontracts', 1, '15', 'contract_type', 'Type', 1, 2, '', 100, 5, 88, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(34, 540, 'progress', 'vtiger_servicecontracts', 1, '9', 'progress', 'Progress', 1, 2, '', 100, 16, 88, 2, 'N~O~2~2', 3, 3, 'BAS', 0, '', 0),
(34, 541, 'contract_no', 'vtiger_servicecontracts', 1, '4', 'contract_no', 'Contract No', 1, 0, '', 100, 2, 88, 1, 'V~O', 3, 0, 'BAS', 0, '', 1),
(34, 542, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 88, 3, 'V~O', 3, 0, 'BAS', 0, '', 0),
(35, 543, 'servicename', 'vtiger_service', 1, '2', 'servicename', 'Service Name', 1, 0, '', 100, 1, 90, 1, 'V~M', 0, 1, 'BAS', 1, '', 1),
(35, 544, 'service_no', 'vtiger_service', 1, '4', 'service_no', 'Service No', 1, 0, '', 100, 2, 90, 1, 'V~O', 3, 0, 'BAS', 0, '', 1),
(35, 545, 'discontinued', 'vtiger_service', 1, '56', 'discontinued', 'Service Active', 1, 2, '', 100, 4, 90, 1, 'V~O', 2, 3, 'BAS', 1, '', 0),
(35, 546, 'sales_start_date', 'vtiger_service', 1, '5', 'sales_start_date', 'Sales Start Date', 1, 2, '', 100, 9, 90, 1, 'D~O', 1, NULL, 'BAS', 1, '', 0),
(35, 547, 'sales_end_date', 'vtiger_service', 1, '5', 'sales_end_date', 'Sales End Date', 1, 2, '', 100, 10, 90, 1, 'D~O~OTH~GE~sales_start_date~Sales Start Date', 1, NULL, 'BAS', 1, '', 0),
(35, 548, 'start_date', 'vtiger_service', 1, '5', 'start_date', 'Support Start Date', 1, 2, '', 100, 11, 90, 1, 'D~O', 1, NULL, 'BAS', 1, '', 0),
(35, 549, 'expiry_date', 'vtiger_service', 1, '5', 'expiry_date', 'Support Expiry Date', 1, 2, '', 100, 12, 90, 1, 'D~O~OTH~GE~start_date~Start Date', 1, NULL, 'BAS', 1, '', 0),
(35, 550, 'website', 'vtiger_service', 1, '17', 'website', 'Website', 1, 2, '', 100, 6, 90, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(35, 551, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 13, 90, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0),
(35, 552, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 14, 90, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0),
(35, 553, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 90, 3, 'V~O', 3, 0, 'BAS', 0, '', 0),
(35, 554, 'service_usageunit', 'vtiger_service', 1, '15', 'service_usageunit', 'Usage Unit', 1, 2, '', 100, 3, 90, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(35, 555, 'qty_per_unit', 'vtiger_service', 1, '1', 'qty_per_unit', 'No of Units', 1, 2, '', 100, 5, 90, 1, 'N~O', 1, NULL, 'BAS', 1, '', 1),
(35, 556, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Owner', 1, 0, '', 100, 8, 90, 1, 'I~O', 1, NULL, 'BAS', 1, '', 0),
(35, 557, 'servicecategory', 'vtiger_service', 1, '15', 'servicecategory', 'Service Category', 1, 2, '', 100, 7, 90, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(35, 558, 'unit_price', 'vtiger_service', 1, '72', 'unit_price', 'Price', 1, 0, '', 100, 1, 91, 1, 'N~O', 2, 2, 'BAS', 0, '', 1),
(35, 559, 'taxclass', 'vtiger_service', 1, '83', 'taxclass', 'Tax Class', 1, 2, '', 100, 4, 91, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(35, 560, 'commissionrate', 'vtiger_service', 1, '9', 'commissionrate', 'Commission Rate', 1, 2, '', 100, 2, 91, 1, 'N~O', 1, NULL, 'BAS', 1, '', 1),
(35, 561, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 93, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(37, 562, 'asset_no', 'vtiger_assets', 1, '4', 'asset_no', 'Asset No', 1, 0, '', 100, 2, 94, 1, 'V~O', 3, 0, 'BAS', 0, '\n                    ', 1),
(37, 563, 'product', 'vtiger_assets', 1, '10', 'product', 'Product Name', 1, 2, '', 100, 3, 94, 1, 'V~M', 0, 3, 'BAS', 1, '\n                    ', 1),
(37, 564, 'serialnumber', 'vtiger_assets', 1, '2', 'serialnumber', 'Serial Number', 1, 2, '', 100, 4, 94, 1, 'V~M', 0, 5, 'BAS', 1, '\n                    ', 0),
(37, 565, 'datesold', 'vtiger_assets', 1, '5', 'datesold', 'Date Sold', 1, 2, '', 100, 5, 94, 1, 'D~M~OTH~GE~datesold~Date Sold', 0, 0, 'BAS', 1, '\n                    ', 0),
(37, 566, 'dateinservice', 'vtiger_assets', 1, '5', 'dateinservice', 'Date in Service', 1, 2, '', 100, 6, 94, 1, 'D~M~OTH~GE~dateinservice~Date in Service', 0, 4, 'BAS', 1, '\n                    ', 0),
(37, 567, 'assetstatus', 'vtiger_assets', 1, '15', 'assetstatus', 'Status', 1, 2, '', 100, 7, 94, 1, 'V~M', 0, 0, 'BAS', 1, '\n                    ', 0),
(37, 568, 'tagnumber', 'vtiger_assets', 1, '2', 'tagnumber', 'Tag Number', 1, 2, '', 100, 8, 94, 1, 'V~O', 1, NULL, 'BAS', 1, '\n                    ', 0),
(37, 569, 'invoiceid', 'vtiger_assets', 1, '10', 'invoiceid', 'Invoice Name', 1, 2, '', 100, 9, 94, 1, 'V~O', 1, NULL, 'BAS', 1, '\n                    ', 0),
(37, 570, 'shippingmethod', 'vtiger_assets', 1, '2', 'shippingmethod', 'Shipping Method', 1, 2, '', 100, 10, 94, 1, 'V~O', 1, NULL, 'BAS', 1, '\n                    ', 0),
(37, 571, 'shippingtrackingnumber', 'vtiger_assets', 1, '2', 'shippingtrackingnumber', 'Shipping Tracking Number', 1, 2, '', 100, 11, 94, 1, 'V~O', 1, NULL, 'BAS', 1, '\n                    ', 0),
(37, 572, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 94, 1, 'V~M', 0, 2, 'BAS', 1, '\n                    ', 0),
(37, 573, 'assetname', 'vtiger_assets', 1, '1', 'assetname', 'Asset Name', 1, 0, '', 100, 12, 94, 1, 'V~M', 0, 6, 'BAS', 1, '\n                    ', 1),
(37, 574, 'account', 'vtiger_assets', 1, '10', 'account', 'Customer Name', 1, 2, '', 100, 13, 94, 1, 'V~M', 0, 0, 'BAS', 1, '\n                    ', 1),
(37, 575, 'contact', 'vtiger_assets', 1, '10', 'contact', 'Contact Name', 1, 2, '', 100, 14, 94, 1, 'V~O', 0, 0, 'BAS', 1, '\n                    ', 0),
(37, 576, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 94, 2, 'DT~O', 3, 0, 'BAS', 0, '\n                    ', 0),
(37, 577, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 94, 2, 'DT~O', 3, 0, 'BAS', 0, '\n                    ', 0),
(37, 578, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 94, 3, 'V~O', 3, 0, 'BAS', 0, '\n                    ', 0),
(37, 579, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Notes', 1, 2, '', 100, 1, 96, 1, 'V~O', 1, NULL, 'BAS', 1, '\n                    ', 0),
(41, 580, 'commentcontent', 'vtiger_modcomments', 1, '19', 'commentcontent', 'Comment', 1, 0, '', 100, 4, 97, 1, 'V~M', 0, 4, 'BAS', 2, '', 1),
(41, 581, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 1, 98, 1, 'V~M', 0, 1, 'BAS', 2, '', 1),
(41, 582, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 98, 2, 'DT~O', 0, 2, 'BAS', 0, '', 0),
(41, 583, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 98, 2, 'DT~O', 0, 3, 'BAS', 0, '', 0),
(41, 584, 'related_to', 'vtiger_modcomments', 1, '10', 'related_to', 'Related To', 1, 2, '', 100, 2, 98, 1, 'V~M', 2, 5, 'BAS', 2, '', 0),
(41, 585, 'smcreatorid', 'vtiger_crmentity', 1, '52', 'creator', 'Creator', 1, 2, '', 100, 4, 98, 2, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(41, 586, 'parent_comments', 'vtiger_modcomments', 1, '10', 'parent_comments', 'Related To Comments', 1, 2, '', 100, 7, 98, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(42, 587, 'projectmilestonename', 'vtiger_projectmilestone', 1, '2', 'projectmilestonename', 'Project Milestone Name', 1, 2, '', 100, 1, 100, 1, 'V~M', 0, 1, 'BAS', 1, '', 1),
(42, 588, 'projectmilestonedate', 'vtiger_projectmilestone', 1, '5', 'projectmilestonedate', 'Milestone Date', 1, 2, '', 100, 5, 100, 1, 'D~O', 0, 3, 'BAS', 1, '', 1),
(42, 589, 'projectid', 'vtiger_projectmilestone', 1, '10', 'projectid', 'Related to', 1, 0, '', 100, 4, 100, 1, 'V~M', 0, 4, 'BAS', 1, '', 0),
(42, 590, 'projectmilestonetype', 'vtiger_projectmilestone', 1, '15', 'projectmilestonetype', 'Type', 1, 2, '', 100, 7, 100, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(42, 591, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 6, 100, 1, 'V~M', 0, 2, 'BAS', 1, '', 0),
(42, 592, 'projectmilestone_no', 'vtiger_projectmilestone', 2, '4', 'projectmilestone_no', 'Project Milestone No', 1, 0, '', 100, 2, 100, 1, 'V~O', 3, 4, 'BAS', 0, '', 0),
(42, 593, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 1, 101, 2, 'T~O', 1, NULL, 'BAS', 1, '', 0),
(42, 594, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 2, 101, 2, 'T~O', 1, NULL, 'BAS', 1, '', 0),
(42, 595, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 3, 101, 3, 'V~O', 3, 0, 'BAS', 0, '', 0),
(42, 596, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 102, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(43, 597, 'projecttaskname', 'vtiger_projecttask', 1, '2', 'projecttaskname', 'Project Task Name', 1, 2, '', 100, 1, 103, 1, 'V~M', 0, 1, 'BAS', 1, '', 1),
(43, 598, 'projecttasktype', 'vtiger_projecttask', 1, '15', 'projecttasktype', 'Type', 1, 2, '', 100, 4, 103, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(43, 599, 'projecttaskpriority', 'vtiger_projecttask', 1, '15', 'projecttaskpriority', 'Priority', 1, 2, '', 100, 3, 103, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(43, 600, 'projectid', 'vtiger_projecttask', 1, '10', 'projectid', 'Related to', 1, 0, '', 100, 6, 103, 1, 'V~M', 0, 5, 'BAS', 1, '', 0),
(43, 601, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 7, 103, 1, 'V~M', 0, 2, 'BAS', 1, '', 1),
(43, 602, 'projecttasknumber', 'vtiger_projecttask', 1, '7', 'projecttasknumber', 'Project Task Number', 1, 2, '', 100, 5, 103, 1, 'I~O', 1, NULL, 'BAS', 1, '', 0),
(43, 603, 'projecttask_no', 'vtiger_projecttask', 2, '4', 'projecttask_no', 'Project Task No', 1, 0, '', 100, 2, 103, 1, 'V~O', 3, 4, 'BAS', 0, '', 0),
(43, 604, 'projecttaskprogress', 'vtiger_projecttask', 1, '15', 'projecttaskprogress', 'Progress', 1, 2, '', 100, 1, 104, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(43, 605, 'projecttaskhours', 'vtiger_projecttask', 1, '7', 'projecttaskhours', 'Worked Hours', 1, 2, '', 100, 2, 104, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(43, 606, 'startdate', 'vtiger_projecttask', 1, '5', 'startdate', 'Start Date', 1, 2, '', 100, 3, 104, 1, 'D~O', 0, 3, 'BAS', 1, '', 1),
(43, 607, 'enddate', 'vtiger_projecttask', 1, '5', 'enddate', 'End Date', 1, 2, '', 100, 4, 104, 1, 'D~O~OTH~GE~startdate~Start Date', 1, NULL, 'BAS', 1, '', 1),
(43, 608, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 5, 104, 2, 'T~O', 1, NULL, 'BAS', 1, '', 0),
(43, 609, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 6, 104, 2, 'T~O', 1, NULL, 'BAS', 1, '', 0),
(43, 610, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 104, 3, 'V~O', 3, 0, 'BAS', 0, '', 0),
(43, 611, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 105, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(44, 612, 'projectname', 'vtiger_project', 1, '2', 'projectname', 'Project Name', 1, 2, '', 100, 1, 106, 1, 'V~M', 0, 1, 'BAS', 1, '', 1),
(44, 613, 'startdate', 'vtiger_project', 1, '23', 'startdate', 'Start Date', 1, 2, '', 100, 3, 106, 1, 'D~O', 0, 3, 'BAS', 1, '', 1),
(44, 614, 'targetenddate', 'vtiger_project', 1, '23', 'targetenddate', 'Target End Date', 1, 2, '', 100, 5, 106, 1, 'D~O~OTH~GE~startdate~Start Date', 0, 4, 'BAS', 1, '', 1),
(44, 615, 'actualenddate', 'vtiger_project', 1, '23', 'actualenddate', 'Actual End Date', 1, 2, '', 100, 6, 106, 1, 'D~O~OTH~GE~startdate~Start Date', 1, NULL, 'BAS', 1, '', 0),
(44, 616, 'projectstatus', 'vtiger_project', 1, '15', 'projectstatus', 'Status', 1, 2, '', 100, 7, 106, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(44, 617, 'projecttype', 'vtiger_project', 1, '15', 'projecttype', 'Type', 1, 2, '', 100, 8, 106, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(44, 618, 'linktoaccountscontacts', 'vtiger_project', 1, '10', 'linktoaccountscontacts', 'Related to', 1, 2, '', 100, 9, 106, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(44, 619, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 106, 1, 'V~M', 0, 2, 'BAS', 1, '', 1),
(44, 620, 'project_no', 'vtiger_project', 2, '4', 'project_no', 'Project No', 1, 0, '', 100, 2, 106, 1, 'V~O', 3, 0, 'BAS', 0, '', 0),
(44, 621, 'targetbudget', 'vtiger_project', 1, '7', 'targetbudget', 'Target Budget', 1, 2, '', 100, 1, 107, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(44, 622, 'projecturl', 'vtiger_project', 1, '17', 'projecturl', 'Project Url', 1, 2, '', 100, 2, 107, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(44, 623, 'projectpriority', 'vtiger_project', 1, '15', 'projectpriority', 'Priority', 1, 2, '', 100, 3, 107, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(44, 624, 'progress', 'vtiger_project', 1, '15', 'progress', 'Progress', 1, 2, '', 100, 4, 107, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(44, 625, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 5, 107, 2, 'T~O', 1, NULL, 'BAS', 1, '', 0),
(44, 626, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 6, 107, 2, 'T~O', 1, NULL, 'BAS', 1, '', 0),
(44, 627, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 107, 3, 'V~O', 3, 0, 'BAS', 0, '', 0),
(44, 628, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 108, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(46, 629, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 109, 1, 'V~M', 1, NULL, 'BAS', 1, '', 1),
(46, 630, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 109, 2, 'DT~O', 1, NULL, 'BAS', 0, '', 0),
(46, 631, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 109, 2, 'DT~O', 1, NULL, 'BAS', 0, '', 0),
(46, 632, 'message', 'vtiger_smsnotifier', 1, '21', 'message', 'message', 1, 0, '', 100, 1, 109, 1, 'V~M', 1, NULL, 'BAS', 1, '', 1),
(46, 633, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 109, 3, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(2, 634, 'forecast_amount', 'vtiger_potential', 1, '71', 'forecast_amount', 'Forecast Amount', 1, 2, '', 100, 18, 1, 1, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(29, 635, 'no_of_currency_decimals', 'vtiger_users', 1, '16', 'no_of_currency_decimals', 'Number Of Currency Decimals', 1, 2, '2', 100, 6, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Number of Decimal places</b> <br/><br/>Number of decimal places specifies how many number of decimals will be shown after decimal separator.<br/><b>Eg:</b> 123.00', 0),
(23, 636, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 112, 5, 'V~M', 1, NULL, 'BAS', 0, '', 0),
(23, 637, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 112, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(23, 638, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 112, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(23, 639, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 112, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(23, 640, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Discount', 0, 2, '', 100, 5, 112, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(23, 641, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 112, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(23, 642, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'Tax1', 0, 2, '', 100, 7, 112, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(23, 643, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Tax2', 0, 2, '', 100, 8, 112, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(23, 644, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Tax3', 0, 2, '', 100, 9, 112, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(22, 645, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 113, 5, 'V~M', 1, NULL, 'BAS', 0, '', 0),
(22, 646, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 113, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(22, 647, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 113, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(22, 648, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 113, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(22, 649, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Discount', 0, 2, '', 100, 5, 113, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(22, 650, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 113, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(22, 651, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'Tax1', 0, 2, '', 100, 7, 113, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(22, 652, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Tax2', 0, 2, '', 100, 8, 113, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(22, 653, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Tax3', 0, 2, '', 100, 9, 113, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(21, 654, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 114, 5, 'V~M', 1, NULL, 'BAS', 0, '', 0),
(21, 655, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 114, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(21, 656, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 114, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(21, 657, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 114, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(21, 658, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Discount', 0, 2, '', 100, 5, 114, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(21, 659, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 114, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(21, 660, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'Tax1', 0, 2, '', 100, 7, 114, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(21, 661, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Tax2', 0, 2, '', 100, 8, 114, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(21, 662, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Tax3', 0, 2, '', 100, 9, 114, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(20, 663, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 115, 5, 'V~M', 1, NULL, 'BAS', 0, '', 0),
(20, 664, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 115, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(20, 665, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 115, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(20, 666, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 115, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(20, 667, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Discount', 0, 2, '', 100, 5, 115, 5, 'N~O', 1, NULL, 'BAS', 0, '', 0),
(20, 668, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 115, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(20, 669, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'Tax1', 0, 2, '', 100, 7, 115, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(20, 670, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Tax2', 0, 2, '', 100, 8, 115, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(20, 671, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Tax3', 0, 2, '', 100, 9, 115, 5, 'V~O', 1, NULL, 'BAS', 0, '', 0),
(29, 672, 'truncate_trailing_zeros', 'vtiger_users', 1, '56', 'truncate_trailing_zeros', 'Truncate Trailing Zeros', 1, 2, '0', 100, 7, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b> Truncate Trailing Zeros </b> <br/><br/>It truncated trailing 0s in any of Currency, Decimal and Percentage Field types<br/><br/><b>Ex:</b><br/>If value is 89.00000 then <br/>decimal and Percentage fields were shows 89<br/>currency field type - shows 89.00<br/>', 0),
(43, 673, 'projecttaskstatus', 'vtiger_projecttask', 1, '15', 'projecttaskstatus', 'Status', 1, 2, '', 100, 8, 103, 1, 'V~O', 0, 6, 'BAS', 1, '', 0),
(41, 674, 'customer', 'vtiger_modcomments', 1, '10', 'customer', 'Customer', 1, 2, '', 100, 5, 97, 3, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(29, 675, 'dayoftheweek', 'vtiger_users', 1, '16', 'dayoftheweek', 'Starting Day of the week', 1, 2, 'Monday', 100, 1, 117, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(29, 676, 'callduration', 'vtiger_users', 1, '16', 'callduration', 'Default Call Duration', 1, 2, '5', 100, 7, 117, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(29, 677, 'othereventduration', 'vtiger_users', 1, '16', 'othereventduration', 'Other Event Duration', 1, 2, '5', 100, 8, 117, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(23, 678, 'pre_tax_total', 'vtiger_invoice', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 67, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0);
INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`) VALUES
(22, 679, 'pre_tax_total', 'vtiger_salesorder', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 61, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(21, 680, 'pre_tax_total', 'vtiger_purchaseorder', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 55, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(20, 681, 'pre_tax_total', 'vtiger_quotes', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 49, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(29, 682, 'calendarsharedtype', 'vtiger_users', 1, '16', 'calendarsharedtype', 'Calendar Shared Type', 1, 2, 'Public', 100, 12, 117, 3, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(6, 683, 'isconvertedfromlead', 'vtiger_account', 1, '56', 'isconvertedfromlead', 'Is Converted From Lead', 1, 2, 'no', 100, 24, 9, 2, 'C~O', 1, NULL, 'BAS', 1, '', 0),
(4, 684, 'isconvertedfromlead', 'vtiger_contactdetails', 1, '56', 'isconvertedfromlead', 'Is Converted From Lead', 1, 2, 'no', 100, 29, 4, 2, 'C~O', 1, NULL, 'BAS', 1, '', 0),
(2, 685, 'isconvertedfromlead', 'vtiger_potential', 1, '56', 'isconvertedfromlead', 'Is Converted From Lead', 1, 2, 'no', 100, 19, 1, 2, 'C~O', 1, NULL, 'BAS', 1, '', 0),
(29, 686, 'default_record_view', 'vtiger_users', 1, '16', 'default_record_view', 'Default Record View', 1, 2, 'Summary', 100, 18, 79, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(23, 687, 'received', 'vtiger_invoice', 1, '72', 'received', 'Received', 1, 2, '0', 100, 24, 67, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(23, 688, 'balance', 'vtiger_invoice', 1, '72', 'balance', 'Balance', 1, 2, '0', 100, 25, 67, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(21, 689, 'paid', 'vtiger_purchaseorder', 1, '72', 'paid', 'Paid', 1, 2, '0', 100, 24, 55, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(21, 690, 'balance', 'vtiger_purchaseorder', 1, '72', 'balance', 'Balance', 1, 2, '0', 100, 25, 55, 3, 'N~O', 1, NULL, 'BAS', 1, '', 0),
(18, 691, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 13, 42, 1, 'V~M', 1, NULL, 'BAS', 1, '', 0),
(7, 692, 'emailoptout', 'vtiger_leaddetails', 1, '56', 'emailoptout', 'Email Opt Out', 1, 2, '', 100, 24, 13, 1, 'C~O', 1, NULL, 'BAS', 1, '', 0),
(41, 693, 'userid', 'vtiger_modcomments', 1, '10', 'userid', 'UserId', 1, 2, '', 100, 6, 97, 3, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(41, 694, 'reasontoedit', 'vtiger_modcomments', 1, '19', 'reasontoedit', 'ReasonToEdit', 1, 2, '', 100, 7, 97, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(23, 695, 's_h_percent', 'vtiger_invoice', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 112, 5, 'N~O', 0, 1, 'BAS', 0, '', 0),
(20, 696, 's_h_percent', 'vtiger_quotes', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 115, 5, 'N~O', 0, 1, 'BAS', 0, '', 0),
(21, 697, 's_h_percent', 'vtiger_purchaseorder', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 114, 5, 'N~O', 0, 1, 'BAS', 0, '', 0),
(22, 698, 's_h_percent', 'vtiger_salesorder', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 113, 5, 'N~O', 0, 1, 'BAS', 0, '', 0),
(29, 699, 'leftpanelhide', 'vtiger_users', 1, '56', 'leftpanelhide', 'Left Panel Hide', 1, 2, '0', 100, 19, 79, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(2, 700, 'contact_id', 'vtiger_potential', 1, '10', 'contact_id', 'Contact Name', 1, 2, '', 100, 20, 1, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(13, 701, 'contact_id', 'vtiger_troubletickets', 1, '10', 'contact_id', 'Contact Name', 1, 2, '', 100, 18, 25, 1, 'V~O', 1, NULL, 'BAS', 1, '', 1),
(29, 702, 'rowheight', 'vtiger_users', 1, '16', 'rowheight', 'Row Height', 1, 2, 'medium', 100, 20, 79, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(13, 703, 'from_portal', 'vtiger_ticketcf', 1, '56', 'from_portal', 'From Portal', 1, 0, '', 100, 19, 25, 3, 'C~O', 1, NULL, 'BAS', 1, '', 0),
(29, 704, 'defaulteventstatus', 'vtiger_users', 1, '15', 'defaulteventstatus', 'Default Event Status', 1, 2, '', 100, 9, 117, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(29, 705, 'defaultactivitytype', 'vtiger_users', 1, '15', 'defaultactivitytype', 'Default Activity Type', 1, 2, '', 100, 10, 117, 1, 'V~O', 1, NULL, 'BAS', 1, '', 0),
(29, 706, 'hidecompletedevents', 'vtiger_users', 1, '56', 'hidecompletedevents', 'LBL_HIDE_COMPLETED_EVENTS', 1, 2, '0', 100, 13, 117, 1, 'C~O', 1, NULL, 'BAS', 1, '', 0),
(2, 707, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 21, 1, 2, 'V~O', 3, 7, 'BAS', 0, '', 0),
(4, 708, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 30, 4, 2, 'V~O', 3, 7, 'BAS', 0, '', 0),
(6, 709, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 25, 9, 2, 'V~O', 3, 5, 'BAS', 0, '', 0),
(7, 710, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 25, 13, 2, 'V~O', 3, 7, 'BAS', 0, '', 0),
(9, 712, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 23, 19, 2, 'V~O', 3, 5, 'BAS', 0, '', 0),
(13, 713, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 20, 25, 2, 'V~O', 3, 5, 'BAS', 0, '', 0),
(18, 717, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 14, 42, 2, 'V~O', 3, 4, 'BAS', 0, '', 0),
(21, 720, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 26, 55, 2, 'V~O', 3, 2, 'BAS', 0, '', 0),
(23, 722, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 26, 67, 2, 'V~O', 3, 2, 'BAS', 0, '', 0),
(41, 727, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 8, 97, 2, 'V~O', 3, 6, 'BAS', 0, '', 0),
(42, 728, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 8, 100, 2, 'V~O', 3, 5, 'BAS', 0, '', 0),
(43, 729, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 9, 103, 2, 'V~O', 3, 7, 'BAS', 0, '', 0),
(44, 730, 'smcreatorid', 'vtiger_crmentity', 1, '53', 'created_user_id', 'Created By', 1, 2, '', 100, 10, 106, 2, 'V~O', 3, 5, 'BAS', 0, '', 0),
(29, 732, 'is_owner', 'vtiger_users', 1, '1', 'is_owner', 'Account Owner', 0, 2, '0', 100, 12, 77, 5, 'V~O', 0, 1, 'BAS', 0, '', 0),
(2, 734, 'cf_733', 'vtiger_potentialscf', 2, '1', 'cf_733', '技术支持', 1, 2, '', 100, 22, 1, 1, 'V~O~LE~20', 2, NULL, 'BAS', 1, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_field_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_field_seq`
--

INSERT INTO `vtiger_field_seq` (`id`) VALUES
(742);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_fieldmodulerel`
--

CREATE TABLE IF NOT EXISTS `vtiger_fieldmodulerel` (
  `fieldid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relmodule` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_fieldmodulerel`
--

INSERT INTO `vtiger_fieldmodulerel` (`fieldid`, `module`, `relmodule`, `status`, `sequence`) VALUES
(113, 'Potentials', 'Accounts', NULL, 0),
(529, 'ServiceContracts', 'Contacts', NULL, NULL),
(529, 'ServiceContracts', 'Accounts', NULL, NULL),
(563, 'Assets', 'Products', NULL, NULL),
(569, 'Assets', 'Invoice', NULL, NULL),
(574, 'Assets', 'Accounts', NULL, NULL),
(575, 'Assets', 'Contacts', NULL, NULL),
(584, 'ModComments', 'Leads', NULL, NULL),
(584, 'ModComments', 'Contacts', NULL, NULL),
(584, 'ModComments', 'Accounts', NULL, NULL),
(586, 'ModComments', 'ModComments', NULL, NULL),
(584, 'ModComments', 'Potentials', NULL, NULL),
(589, 'ProjectMilestone', 'Project', NULL, NULL),
(600, 'ProjectTask', 'Project', NULL, NULL),
(584, 'ModComments', 'ProjectTask', NULL, NULL),
(618, 'Project', 'Accounts', NULL, NULL),
(618, 'Project', 'Contacts', NULL, NULL),
(584, 'ModComments', 'Project', NULL, NULL),
(636, 'Invoice', 'Products', NULL, NULL),
(636, 'Invoice', 'Services', NULL, NULL),
(645, 'SalesOrder', 'Products', NULL, NULL),
(645, 'SalesOrder', 'Services', NULL, NULL),
(654, 'PurchaseOrder', 'Products', NULL, NULL),
(654, 'PurchaseOrder', 'Services', NULL, NULL),
(663, 'Quotes', 'Products', NULL, NULL),
(663, 'Quotes', 'Services', NULL, NULL),
(584, 'ModComments', 'HelpDesk', NULL, NULL),
(584, 'ModComments', 'Faq', NULL, NULL),
(674, 'ModComments', 'Contacts', NULL, NULL),
(700, 'Potentials', 'Contacts', NULL, NULL),
(157, 'HelpDesk', 'Accounts', NULL, NULL),
(701, 'HelpDesk', 'Contacts', NULL, NULL),
(237, 'Accounts', 'Calendar', NULL, NULL),
(237, 'Leads', 'Calendar', NULL, NULL),
(237, 'HelpDesk', 'Calendar', NULL, NULL),
(237, 'Campaigns', 'Calendar', NULL, NULL),
(237, 'Potentials', 'Calendar', NULL, NULL),
(237, 'PurchaseOrder', 'Calendar', NULL, NULL),
(237, 'SalesOrder', 'Calendar', NULL, NULL),
(237, 'Quotes', 'Calendar', NULL, NULL),
(237, 'Invoice', 'Calendar', NULL, NULL),
(238, 'Contacts', 'Calendar', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_freetagged_objects`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetagged_objects` (
  `tag_id` int(20) NOT NULL DEFAULT '0',
  `tagger_id` int(20) NOT NULL DEFAULT '0',
  `object_id` int(20) NOT NULL DEFAULT '0',
  `tagged_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_freetagged_objects`
--

INSERT INTO `vtiger_freetagged_objects` (`tag_id`, `tagger_id`, `object_id`, `tagged_on`, `module`) VALUES
(3, 1, 20, '2015-01-07 16:02:32', 'Contacts'),
(3, 1, 35, '2015-01-07 16:03:04', 'Products'),
(4, 1, 35, '2015-01-07 16:03:28', 'Products');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_freetags`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetags` (
  `id` int(19) NOT NULL,
  `tag` varchar(50) NOT NULL DEFAULT '',
  `raw_tag` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_freetags`
--

INSERT INTO `vtiger_freetags` (`id`, `tag`, `raw_tag`) VALUES
(2, 'a', 'a'),
(3, 'asdf', 'asdf'),
(4, 'asdf32r23', 'asdf32r23');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_freetags_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetags_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_freetags_seq`
--

INSERT INTO `vtiger_freetags_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_glacct`
--

CREATE TABLE IF NOT EXISTS `vtiger_glacct` (
`glacctid` int(19) NOT NULL,
  `glacct` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_glacct`
--

INSERT INTO `vtiger_glacct` (`glacctid`, `glacct`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, '300-Sales-Software', 1, 51, 0),
(2, '301-Sales-Hardware', 1, 52, 1),
(3, '302-Rental-Income', 1, 53, 2),
(4, '303-Interest-Income', 1, 54, 3),
(5, '304-Sales-Software-Support', 1, 55, 4),
(6, '305-Sales Other', 1, 56, 5),
(7, '306-Internet Sales', 1, 57, 6),
(8, '307-Service-Hardware Labor', 1, 58, 7),
(9, '308-Sales-Books', 1, 59, 8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_glacct_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_glacct_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_glacct_seq`
--

INSERT INTO `vtiger_glacct_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_group2grouprel`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2grouprel` (
  `groupid` int(19) NOT NULL,
  `containsgroupid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_group2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2role` (
  `groupid` int(19) NOT NULL,
  `roleid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_group2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2rs` (
  `groupid` int(19) NOT NULL,
  `roleandsubid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_groups`
--

CREATE TABLE IF NOT EXISTS `vtiger_groups` (
  `groupid` int(19) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_home_layout`
--

CREATE TABLE IF NOT EXISTS `vtiger_home_layout` (
  `userid` int(19) NOT NULL,
  `layout` int(19) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homedashbd`
--

CREATE TABLE IF NOT EXISTS `vtiger_homedashbd` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `dashbdname` varchar(100) DEFAULT NULL,
  `dashbdtype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homedefault`
--

CREATE TABLE IF NOT EXISTS `vtiger_homedefault` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `hometype` varchar(30) NOT NULL,
  `maxentries` int(19) DEFAULT NULL,
  `setype` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_homedefault`
--

INSERT INTO `vtiger_homedefault` (`stuffid`, `hometype`, `maxentries`, `setype`) VALUES
(1, 'ALVT', 5, 'Accounts'),
(2, 'HDB', 5, 'Dashboard'),
(3, 'PLVT', 5, 'Potentials'),
(4, 'QLTQ', 5, 'Quotes'),
(5, 'CVLVT', 5, 'NULL'),
(6, 'HLT', 5, 'HelpDesk'),
(7, 'UA', 5, 'Calendar'),
(8, 'GRT', 5, 'NULL'),
(9, 'OLTSO', 5, 'SalesOrder'),
(10, 'ILTI', 5, 'Invoice'),
(11, 'MNL', 5, 'Leads'),
(12, 'OLTPO', 5, 'PurchaseOrder'),
(13, 'PA', 5, 'Calendar'),
(14, 'LTFAQ', 5, 'Faq'),
(16, 'ALVT', 5, 'Accounts'),
(17, 'HDB', 5, 'Dashboard'),
(18, 'PLVT', 5, 'Potentials'),
(19, 'QLTQ', 5, 'Quotes'),
(20, 'CVLVT', 5, 'NULL'),
(21, 'HLT', 5, 'HelpDesk'),
(22, 'UA', 5, 'Calendar'),
(23, 'GRT', 5, 'NULL'),
(24, 'OLTSO', 5, 'SalesOrder'),
(25, 'ILTI', 5, 'Invoice'),
(26, 'MNL', 5, 'Leads'),
(27, 'OLTPO', 5, 'PurchaseOrder'),
(28, 'PA', 5, 'Calendar'),
(29, 'LTFAQ', 5, 'Faq'),
(31, 'ALVT', 5, 'Accounts'),
(32, 'HDB', 5, 'Dashboard'),
(33, 'PLVT', 5, 'Potentials'),
(34, 'QLTQ', 5, 'Quotes'),
(35, 'CVLVT', 5, 'NULL'),
(36, 'HLT', 5, 'HelpDesk'),
(37, 'UA', 5, 'Calendar'),
(38, 'GRT', 5, 'NULL'),
(39, 'OLTSO', 5, 'SalesOrder'),
(40, 'ILTI', 5, 'Invoice'),
(41, 'MNL', 5, 'Leads'),
(42, 'OLTPO', 5, 'PurchaseOrder'),
(43, 'PA', 5, 'Calendar'),
(44, 'LTFAQ', 5, 'Faq'),
(46, 'ALVT', 5, 'Accounts'),
(47, 'HDB', 5, 'Dashboard'),
(48, 'PLVT', 5, 'Potentials'),
(49, 'QLTQ', 5, 'Quotes'),
(50, 'CVLVT', 5, 'NULL'),
(51, 'HLT', 5, 'HelpDesk'),
(52, 'UA', 5, 'Calendar'),
(53, 'GRT', 5, 'NULL'),
(54, 'OLTSO', 5, 'SalesOrder'),
(55, 'ILTI', 5, 'Invoice'),
(56, 'MNL', 5, 'Leads'),
(57, 'OLTPO', 5, 'PurchaseOrder'),
(58, 'PA', 5, 'Calendar'),
(59, 'LTFAQ', 5, 'Faq');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homemodule`
--

CREATE TABLE IF NOT EXISTS `vtiger_homemodule` (
  `stuffid` int(19) NOT NULL,
  `modulename` varchar(100) DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  `customviewid` int(19) NOT NULL,
  `setype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homemoduleflds`
--

CREATE TABLE IF NOT EXISTS `vtiger_homemoduleflds` (
  `stuffid` int(19) DEFAULT NULL,
  `fieldname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homereportchart`
--

CREATE TABLE IF NOT EXISTS `vtiger_homereportchart` (
  `stuffid` int(11) NOT NULL,
  `reportid` int(19) DEFAULT NULL,
  `reportcharttype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homerss`
--

CREATE TABLE IF NOT EXISTS `vtiger_homerss` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  `maxentries` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homestuff`
--

CREATE TABLE IF NOT EXISTS `vtiger_homestuff` (
  `stuffid` int(19) NOT NULL DEFAULT '0',
  `stuffsequence` int(19) NOT NULL DEFAULT '0',
  `stufftype` varchar(100) DEFAULT NULL,
  `userid` int(19) NOT NULL,
  `visible` int(10) NOT NULL DEFAULT '0',
  `stufftitle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_homestuff`
--

INSERT INTO `vtiger_homestuff` (`stuffid`, `stuffsequence`, `stufftype`, `userid`, `visible`, `stufftitle`) VALUES
(1, 1, 'Default', 1, 1, 'Top Accounts'),
(2, 2, 'Default', 1, 1, 'Home Page Dashboard'),
(3, 3, 'Default', 1, 1, 'Top Potentials'),
(4, 4, 'Default', 1, 1, 'Top Quotes'),
(5, 5, 'Default', 1, 1, 'Key Metrics'),
(6, 6, 'Default', 1, 1, 'Top Trouble Tickets'),
(7, 7, 'Default', 1, 1, 'Upcoming Activities'),
(8, 8, 'Default', 1, 1, 'My Group Allocation'),
(9, 9, 'Default', 1, 1, 'Top Sales Orders'),
(10, 10, 'Default', 1, 1, 'Top Invoices'),
(11, 11, 'Default', 1, 1, 'My New Leads'),
(12, 12, 'Default', 1, 1, 'Top Purchase Orders'),
(13, 13, 'Default', 1, 1, 'Pending Activities'),
(14, 14, 'Default', 1, 1, 'My Recent FAQs'),
(15, 15, 'Tag Cloud', 1, 0, 'Tag Cloud'),
(46, 1, 'Default', 7, 1, 'Top Accounts'),
(47, 2, 'Default', 7, 1, 'Home Page Dashboard'),
(48, 3, 'Default', 7, 1, 'Top Potentials'),
(49, 4, 'Default', 7, 1, 'Top Quotes'),
(50, 5, 'Default', 7, 1, 'Key Metrics'),
(51, 6, 'Default', 7, 1, 'Top Trouble Tickets'),
(52, 7, 'Default', 7, 1, 'Upcoming Activities'),
(53, 8, 'Default', 7, 1, 'My Group Allocation'),
(54, 9, 'Default', 7, 1, 'Top Sales Orders'),
(55, 10, 'Default', 7, 1, 'Top Invoices'),
(56, 11, 'Default', 7, 1, 'My New Leads'),
(57, 12, 'Default', 7, 1, 'Top Purchase Orders'),
(58, 13, 'Default', 7, 1, 'Pending Activities'),
(59, 14, 'Default', 7, 1, 'My Recent FAQs'),
(60, 15, 'Tag Cloud', 7, 0, 'Tag Cloud');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_homestuff_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_homestuff_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_homestuff_seq`
--

INSERT INTO `vtiger_homestuff_seq` (`id`) VALUES
(60);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_hour_format`
--

CREATE TABLE IF NOT EXISTS `vtiger_hour_format` (
`hour_formatid` int(11) NOT NULL,
  `hour_format` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_hour_format`
--

INSERT INTO `vtiger_hour_format` (`hour_formatid`, `hour_format`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, '12', 1, 295, 1),
(2, '24', 1, 296, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_hour_format_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_hour_format_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_hour_format_seq`
--

INSERT INTO `vtiger_hour_format_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_import_locks`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_locks` (
  `vtiger_import_lock_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `importid` int(11) NOT NULL,
  `locked_since` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_import_maps`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_maps` (
`id` int(19) NOT NULL,
  `name` varchar(36) NOT NULL,
  `module` varchar(36) NOT NULL,
  `content` longblob,
  `has_header` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `is_published` varchar(3) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_import_queue`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_queue` (
  `importid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `field_mapping` text,
  `default_values` text,
  `merge_type` int(11) DEFAULT NULL,
  `merge_fields` text,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_industry`
--

CREATE TABLE IF NOT EXISTS `vtiger_industry` (
`industryid` int(19) NOT NULL,
  `industry` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_industry`
--

INSERT INTO `vtiger_industry` (`industryid`, `industry`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Apparel', 1, 61, 1),
(3, 'Banking', 1, 62, 2),
(4, 'Biotechnology', 1, 63, 3),
(5, 'Chemicals', 1, 64, 4),
(6, 'Communications', 1, 65, 5),
(7, 'Construction', 1, 66, 6),
(8, 'Consulting', 1, 67, 7),
(9, 'Education', 1, 68, 8),
(10, 'Electronics', 1, 69, 9),
(11, 'Energy', 1, 70, 10),
(12, 'Engineering', 1, 71, 11),
(13, 'Entertainment', 1, 72, 12),
(14, 'Environmental', 1, 73, 13),
(15, 'Finance', 1, 74, 14),
(16, 'Food & Beverage', 1, 75, 15),
(17, 'Government', 1, 76, 16),
(18, 'Healthcare', 1, 77, 17),
(19, 'Hospitality', 1, 78, 18),
(20, 'Insurance', 1, 79, 19),
(21, 'Machinery', 1, 80, 20),
(22, 'Manufacturing', 1, 81, 21),
(23, 'Media', 1, 82, 22),
(24, 'Not For Profit', 1, 83, 23),
(25, 'Recreation', 1, 84, 24),
(26, 'Retail', 1, 85, 25),
(27, 'Shipping', 1, 86, 26),
(28, 'Technology', 1, 87, 27),
(29, 'Telecommunications', 1, 88, 28),
(30, 'Transportation', 1, 89, 29),
(31, 'Utilities', 1, 90, 30),
(32, 'Other', 1, 91, 31);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_industry_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_industry_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_industry_seq`
--

INSERT INTO `vtiger_industry_seq` (`id`) VALUES
(32);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventory_tandc`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventory_tandc` (
  `id` int(19) NOT NULL,
  `type` varchar(30) NOT NULL,
  `tandc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventory_tandc`
--

INSERT INTO `vtiger_inventory_tandc` (`id`, `type`, `tandc`) VALUES
(1, 'Inventory', '\n - Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventory_tandc_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventory_tandc_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventory_tandc_seq`
--

INSERT INTO `vtiger_inventory_tandc_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventorynotification`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorynotification` (
`notificationid` int(19) NOT NULL,
  `notificationname` varchar(200) DEFAULT NULL,
  `notificationsubject` varchar(200) DEFAULT NULL,
  `notificationbody` text,
  `label` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventorynotification`
--

INSERT INTO `vtiger_inventorynotification` (`notificationid`, `notificationname`, `notificationsubject`, `notificationbody`, `label`, `status`) VALUES
(1, 'InvoiceNotification', '{PRODUCTNAME} Stock Level is Low', 'Dear {HANDLER},\n\nThe current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}. Kindly procure required number of units as the stock level is below reorder level {REORDERLEVELVALUE}.\n\nPlease treat this information as Urgent as the invoice is already sent  to the customer.\n\nSeverity: Critical\n\nThanks,\n{CURRENTUSER} ', 'InvoiceNotificationDescription', NULL),
(2, 'QuoteNotification', 'Quote given for {PRODUCTNAME}', 'Dear {HANDLER},\n\nQuote is generated for {QUOTEQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}.\n\nSeverity: Minor\n\nThanks,\n{CURRENTUSER} ', 'QuoteNotificationDescription', NULL),
(3, 'SalesOrderNotification', 'Sales Order generated for {PRODUCTNAME}', 'Dear {HANDLER},\n\nSalesOrder is generated for {SOQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}.\n\nPlease treat this information  with priority as the sales order is already generated.\n\nSeverity: Major\n\nThanks,\n{CURRENTUSER} ', 'SalesOrderNotificationDescription', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventorynotification_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorynotification_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventorynotification_seq`
--

INSERT INTO `vtiger_inventorynotification_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventoryproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryproductrel` (
  `id` int(19) DEFAULT NULL,
  `productid` int(19) DEFAULT NULL,
  `sequence_no` int(4) DEFAULT NULL,
  `quantity` decimal(25,3) DEFAULT NULL,
  `listprice` decimal(27,8) DEFAULT NULL,
  `discount_percent` decimal(7,3) DEFAULT NULL,
  `discount_amount` decimal(27,8) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `description` text,
  `incrementondel` int(11) NOT NULL DEFAULT '0',
`lineitem_id` int(11) NOT NULL,
  `tax1` decimal(7,3) DEFAULT NULL,
  `tax2` decimal(7,3) DEFAULT NULL,
  `tax3` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventoryproductrel`
--

INSERT INTO `vtiger_inventoryproductrel` (`id`, `productid`, `sequence_no`, `quantity`, `listprice`, `discount_percent`, `discount_amount`, `comment`, `description`, `incrementondel`, `lineitem_id`, `tax1`, `tax2`, `tax3`) VALUES
(29, 28, 1, 1.000, 0.00000000, NULL, NULL, '', NULL, 0, 1, 4.500, 10.000, 12.500);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventoryproductrel_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryproductrel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventoryproductrel_seq`
--

INSERT INTO `vtiger_inventoryproductrel_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventoryshippingrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryshippingrel` (
  `id` int(19) DEFAULT NULL,
  `shtax1` decimal(7,3) DEFAULT NULL,
  `shtax2` decimal(7,3) DEFAULT NULL,
  `shtax3` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventoryshippingrel`
--

INSERT INTO `vtiger_inventoryshippingrel` (`id`, `shtax1`, `shtax2`, `shtax3`) VALUES
(29, 4.500, 10.000, 12.500);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventorysubproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorysubproductrel` (
  `id` int(19) NOT NULL,
  `sequence_no` int(10) NOT NULL,
  `productid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventorytaxinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorytaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) DEFAULT NULL,
  `taxlabel` varchar(50) DEFAULT NULL,
  `percentage` decimal(7,3) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventorytaxinfo`
--

INSERT INTO `vtiger_inventorytaxinfo` (`taxid`, `taxname`, `taxlabel`, `percentage`, `deleted`) VALUES
(1, 'tax1', 'VAT', 4.500, 0),
(2, 'tax2', 'Sales', 10.000, 0),
(3, 'tax3', 'Service', 12.500, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_inventorytaxinfo_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorytaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_inventorytaxinfo_seq`
--

INSERT INTO `vtiger_inventorytaxinfo_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invitees`
--

CREATE TABLE IF NOT EXISTS `vtiger_invitees` (
  `activityid` int(19) NOT NULL,
  `inviteeid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoice`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoice` (
  `invoiceid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `salesorderid` int(19) DEFAULT NULL,
  `customerno` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `invoiceterms` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text,
  `purchaseorder` varchar(200) DEFAULT NULL,
  `invoicestatus` varchar(200) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `received` decimal(25,8) DEFAULT NULL,
  `balance` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoice_recurring_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoice_recurring_info` (
  `salesorderid` int(11) NOT NULL DEFAULT '0',
  `recurring_frequency` varchar(200) DEFAULT NULL,
  `start_period` date DEFAULT NULL,
  `end_period` date DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `payment_duration` varchar(200) DEFAULT NULL,
  `invoice_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoicebillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicebillads` (
  `invoicebilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoicecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicecf` (
  `invoiceid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoiceshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoiceshipads` (
  `invoiceshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoicestatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatus` (
`invoicestatusid` int(19) NOT NULL,
  `invoicestatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_invoicestatus`
--

INSERT INTO `vtiger_invoicestatus` (`invoicestatusid`, `invoicestatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'AutoCreated', 0, 92, 0),
(2, 'Created', 0, 93, 1),
(3, 'Approved', 0, 94, 2),
(4, 'Sent', 0, 95, 3),
(5, 'Credit Invoice', 0, 96, 4),
(6, 'Paid', 0, 97, 5),
(7, 'Cancel', 1, 288, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoicestatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_invoicestatus_seq`
--

INSERT INTO `vtiger_invoicestatus_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_invoicestatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatushistory` (
`historyid` int(19) NOT NULL,
  `invoiceid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `invoicestatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_language`
--

CREATE TABLE IF NOT EXISTS `vtiger_language` (
`id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `label` varchar(30) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `isdefault` int(1) DEFAULT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_language`
--

INSERT INTO `vtiger_language` (`id`, `name`, `prefix`, `label`, `lastupdated`, `sequence`, `isdefault`, `active`) VALUES
(1, 'English', 'en_us', 'US English', '2015-01-05 01:21:20', NULL, 1, 1),
(2, 'Brazilian', 'pt_br', 'PT Brasil', '2015-01-05 01:21:35', NULL, 0, 1),
(3, 'British English', 'en_gb', 'British English', '2015-01-05 01:21:30', NULL, 0, 1),
(4, 'Deutsch', 'de_de', 'DE Deutsch', '2015-01-05 01:21:30', NULL, 0, 1),
(5, 'Dutch', 'nl_nl', 'NL-Dutch', '2015-01-05 01:21:30', NULL, 0, 1),
(6, 'Pack de langue français', 'fr_fr', 'Pack de langue français', '2015-01-05 01:21:35', NULL, 0, 1),
(7, 'Hungarian', 'hu_hu', 'HU Magyar', '2015-01-05 01:21:31', NULL, 0, 1),
(8, 'Italian', 'it_it', 'IT Italian', '2015-01-05 01:21:31', NULL, 0, 1),
(9, 'Mexican Spanish', 'es_mx', 'ES Mexico', '2015-01-05 01:21:31', NULL, 0, 1),
(10, 'Język Polski', 'pl_pl', 'Język Polski', '2015-01-05 01:21:36', NULL, 0, 1),
(11, 'Romana', 'ro_ro', 'Romana', '2015-01-05 01:21:35', NULL, 0, 1),
(12, 'Russian', 'ru_ru', 'Russian', '2015-01-05 01:21:34', NULL, 0, 1),
(13, 'Spanish', 'es_es', 'ES Spanish', '2015-01-05 01:21:34', NULL, 0, 1),
(14, 'Turkce', 'tr_tr', 'Turkce Dil Paketi', '2015-01-05 01:21:35', NULL, 0, 1),
(15, 'Chinese(Simplified)', 'zh_cn', '简体中文', '2015-01-05 01:33:52', NULL, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_language_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_language_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_language_seq`
--

INSERT INTO `vtiger_language_seq` (`id`) VALUES
(15);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_lead_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_lead_view` (
`lead_viewid` int(19) NOT NULL,
  `lead_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_lead_view`
--

INSERT INTO `vtiger_lead_view` (`lead_viewid`, `lead_view`, `sortorderid`, `presence`) VALUES
(1, 'Today', 0, 1),
(2, 'Last 2 Days', 1, 1),
(3, 'Last Week', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_lead_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_lead_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_lead_view_seq`
--

INSERT INTO `vtiger_lead_view_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadaddress`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadaddress` (
  `leadaddressid` int(19) NOT NULL DEFAULT '0',
  `city` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pobox` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `lane` varchar(250) DEFAULT NULL,
  `leadaddresstype` varchar(30) DEFAULT 'Billing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leaddetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_leaddetails` (
  `leadid` int(19) NOT NULL,
  `lead_no` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `interest` varchar(50) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `salutation` varchar(200) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `company` varchar(100) NOT NULL,
  `annualrevenue` decimal(25,8) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `campaign` varchar(30) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `leadstatus` varchar(50) DEFAULT NULL,
  `leadsource` varchar(200) DEFAULT NULL,
  `converted` int(1) DEFAULT '0',
  `designation` varchar(50) DEFAULT 'SalesMan',
  `licencekeystatus` varchar(50) DEFAULT NULL,
  `space` varchar(250) DEFAULT NULL,
  `comments` text,
  `priority` varchar(50) DEFAULT NULL,
  `demorequest` varchar(50) DEFAULT NULL,
  `partnercontact` varchar(50) DEFAULT NULL,
  `productversion` varchar(20) DEFAULT NULL,
  `product` varchar(50) DEFAULT NULL,
  `maildate` date DEFAULT NULL,
  `nextstepdate` date DEFAULT NULL,
  `fundingsituation` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `evaluationstatus` varchar(50) DEFAULT NULL,
  `transferdate` date DEFAULT NULL,
  `revenuetype` varchar(50) DEFAULT NULL,
  `noofemployees` int(50) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `assignleadchk` int(1) DEFAULT '0',
  `emailoptout` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadscf` (
  `leadid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadsource`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsource` (
`leadsourceid` int(19) NOT NULL,
  `leadsource` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_leadsource`
--

INSERT INTO `vtiger_leadsource` (`leadsourceid`, `leadsource`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Cold Call', 1, 99, 1),
(3, 'Existing Customer', 1, 100, 2),
(4, 'Self Generated', 1, 101, 3),
(5, 'Employee', 1, 102, 4),
(6, 'Partner', 1, 103, 5),
(7, 'Public Relations', 1, 104, 6),
(8, 'Direct Mail', 1, 105, 7),
(9, 'Conference', 1, 106, 8),
(10, 'Trade Show', 1, 107, 9),
(11, 'Web Site', 1, 108, 10),
(12, 'Word of mouth', 1, 109, 11),
(13, 'Other', 1, 110, 12);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadsource_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsource_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_leadsource_seq`
--

INSERT INTO `vtiger_leadsource_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadstage`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstage` (
`leadstageid` int(19) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstatus` (
`leadstatusid` int(19) NOT NULL,
  `leadstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_leadstatus`
--

INSERT INTO `vtiger_leadstatus` (`leadstatusid`, `leadstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Attempted to Contact', 1, 112, 1),
(3, 'Cold', 1, 113, 2),
(4, 'Contact in Future', 1, 114, 3),
(5, 'Contacted', 1, 115, 4),
(6, 'Hot', 1, 116, 5),
(7, 'Junk Lead', 1, 117, 6),
(8, 'Lost Lead', 1, 118, 7),
(9, 'Not Contacted', 1, 119, 8),
(10, 'Pre Qualified', 1, 120, 9),
(11, 'Qualified', 1, 121, 10),
(12, 'Warm', 1, 122, 11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_leadstatus_seq`
--

INSERT INTO `vtiger_leadstatus_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_leadsubdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsubdetails` (
  `leadsubscriptionid` int(19) NOT NULL DEFAULT '0',
  `website` varchar(255) DEFAULT NULL,
  `callornot` int(1) DEFAULT '0',
  `readornot` int(1) DEFAULT '0',
  `empct` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_links`
--

CREATE TABLE IF NOT EXISTS `vtiger_links` (
  `linkid` int(11) NOT NULL,
  `tabid` int(11) DEFAULT NULL,
  `linktype` varchar(50) DEFAULT NULL,
  `linklabel` varchar(50) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `linkicon` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `handler_path` varchar(128) DEFAULT NULL,
  `handler_class` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_links`
--

INSERT INTO `vtiger_links` (`linkid`, `tabid`, `linktype`, `linklabel`, `linkurl`, `linkicon`, `sequence`, `handler_path`, `handler_class`, `handler`) VALUES
(1, 6, 'DETAILVIEWBASIC', 'LBL_ADD_NOTE', 'index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', 'themes/images/bookMark.gif', 0, 'modules/Documents/Documents.php', 'Documents', 'isLinkPermitted'),
(2, 6, 'DETAILVIEWBASIC', 'LBL_SHOW_ACCOUNT_HIERARCHY', 'index.php?module=Accounts&action=AccountHierarchy&accountid=$RECORD$', '', 0, NULL, NULL, NULL),
(3, 7, 'DETAILVIEWBASIC', 'LBL_ADD_NOTE', 'index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', 'themes/images/bookMark.gif', 0, 'modules/Documents/Documents.php', 'Documents', 'isLinkPermitted'),
(4, 4, 'DETAILVIEWBASIC', 'LBL_ADD_NOTE', 'index.php?module=Documents&action=EditView&return_module=$MODULE$&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', 'themes/images/bookMark.gif', 0, 'modules/Documents/Documents.php', 'Documents', 'isLinkPermitted'),
(9, 41, 'HEADERSCRIPT', 'ModCommentsCommonHeaderScript', 'modules/ModComments/ModCommentsCommon.js', '', 0, NULL, NULL, NULL),
(10, 7, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(11, 4, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(12, 6, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(13, 2, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(19, 46, 'DETAILVIEWBASIC', 'LBL_CHECK_STATUS', 'javascript:SMSNotifier.checkstatus($RECORD$)', 'themes/images/reload.gif', 0, NULL, NULL, NULL),
(21, 46, 'HEADERSCRIPT', 'SMSNotifierCommonJS', 'modules/SMSNotifier/SMSNotifierCommon.js', '', 0, NULL, NULL, NULL),
(22, 7, 'LISTVIEWBASIC', 'Send SMS', 'SMSNotifierCommon.displaySelectWizard(this, ''$MODULE$'');', '', 0, NULL, NULL, NULL),
(23, 7, 'DETAILVIEWBASIC', 'Send SMS', 'javascript:SMSNotifierCommon.displaySelectWizard_DetailView(''$MODULE$'', ''$RECORD$'');', '', 0, NULL, NULL, NULL),
(24, 4, 'LISTVIEWBASIC', 'Send SMS', 'SMSNotifierCommon.displaySelectWizard(this, ''$MODULE$'');', '', 0, NULL, NULL, NULL),
(25, 4, 'DETAILVIEWBASIC', 'Send SMS', 'javascript:SMSNotifierCommon.displaySelectWizard_DetailView(''$MODULE$'', ''$RECORD$'');', '', 0, NULL, NULL, NULL),
(26, 6, 'LISTVIEWBASIC', 'Send SMS', 'SMSNotifierCommon.displaySelectWizard(this, ''$MODULE$'');', '', 0, NULL, NULL, NULL),
(27, 6, 'DETAILVIEWBASIC', 'Send SMS', 'javascript:SMSNotifierCommon.displaySelectWizard_DetailView(''$MODULE$'', ''$RECORD$'');', '', 0, NULL, NULL, NULL),
(28, 43, 'DETAILVIEWBASIC', 'Add Note', 'index.php?module=Documents&action=EditView&return_module=ProjectTask&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', '', 0, 'modules/Documents/Documents.php', 'Documents', 'isLinkPermitted'),
(29, 43, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(30, 44, 'DETAILVIEWBASIC', 'Add Project Task', 'index.php?module=ProjectTask&action=EditView&projectid=$RECORD$&return_module=Project&return_action=DetailView&return_id=$RECORD$', '', 0, 'modules/ProjectTask/ProjectTask.php', 'ProjectTask', 'isLinkPermitted'),
(31, 44, 'DETAILVIEWBASIC', 'Add Note', 'index.php?module=Documents&action=EditView&return_module=Project&return_action=DetailView&return_id=$RECORD$&parent_id=$RECORD$', '', 1, 'modules/Documents/Documents.php', 'Documents', 'isLinkPermitted'),
(32, 44, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(33, 2, 'DASHBOARDWIDGET', 'History', 'index.php?module=Potentials&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL),
(34, 2, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Potentials&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL),
(35, 2, 'DASHBOARDWIDGET', 'Funnel', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesStage', '', 3, NULL, NULL, NULL),
(36, 2, 'DASHBOARDWIDGET', 'Potentials by Stage', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesPerson', '', 4, NULL, NULL, NULL),
(37, 2, 'DASHBOARDWIDGET', 'Pipelined Amount', 'index.php?module=Potentials&view=ShowWidget&name=PipelinedAmountPerSalesPerson', '', 5, NULL, NULL, NULL),
(38, 2, 'DASHBOARDWIDGET', 'Total Revenue', 'index.php?module=Potentials&view=ShowWidget&name=TotalRevenuePerSalesPerson', '', 6, NULL, NULL, NULL),
(39, 2, 'DASHBOARDWIDGET', 'Top Potentials', 'index.php?module=Potentials&view=ShowWidget&name=TopPotentials', '', 7, NULL, NULL, NULL),
(40, 2, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Potentials&view=ShowWidget&name=OverdueActivities', '', 9, NULL, NULL, NULL),
(41, 6, 'DASHBOARDWIDGET', 'History', 'index.php?module=Accounts&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL),
(42, 6, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Accounts&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL),
(43, 6, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Accounts&view=ShowWidget&name=OverdueActivities', '', 3, NULL, NULL, NULL),
(44, 4, 'DASHBOARDWIDGET', 'History', 'index.php?module=Contacts&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL),
(45, 4, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Contacts&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL),
(46, 4, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Contacts&view=ShowWidget&name=OverdueActivities', '', 3, NULL, NULL, NULL),
(47, 7, 'DASHBOARDWIDGET', 'History', 'index.php?module=Leads&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL),
(48, 7, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Leads&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL),
(49, 7, 'DASHBOARDWIDGET', 'Leads by Status', 'index.php?module=Leads&view=ShowWidget&name=LeadsByStatus', '', 4, NULL, NULL, NULL),
(50, 7, 'DASHBOARDWIDGET', 'Leads by Source', 'index.php?module=Leads&view=ShowWidget&name=LeadsBySource', '', 5, NULL, NULL, NULL),
(51, 7, 'DASHBOARDWIDGET', 'Leads by Industry', 'index.php?module=Leads&view=ShowWidget&name=LeadsByIndustry', '', 6, NULL, NULL, NULL),
(52, 7, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Leads&view=ShowWidget&name=OverdueActivities', '', 7, NULL, NULL, NULL),
(53, 13, 'DASHBOARDWIDGET', 'Tickets by Status', 'index.php?module=HelpDesk&view=ShowWidget&name=TicketsByStatus', '', 1, NULL, NULL, NULL),
(54, 13, 'DASHBOARDWIDGET', 'Open Tickets', 'index.php?module=HelpDesk&view=ShowWidget&name=OpenTickets', '', 2, NULL, NULL, NULL),
(55, 3, 'DASHBOARDWIDGET', 'History', 'index.php?module=Home&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL),
(56, 3, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Home&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL),
(57, 3, 'DASHBOARDWIDGET', 'Funnel', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesStage', '', 3, NULL, NULL, NULL),
(58, 3, 'DASHBOARDWIDGET', 'Potentials by Stage', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesPerson', '', 4, NULL, NULL, NULL),
(59, 3, 'DASHBOARDWIDGET', 'Pipelined Amount', 'index.php?module=Potentials&view=ShowWidget&name=PipelinedAmountPerSalesPerson', '', 5, NULL, NULL, NULL),
(60, 3, 'DASHBOARDWIDGET', 'Total Revenue', 'index.php?module=Potentials&view=ShowWidget&name=TotalRevenuePerSalesPerson', '', 6, NULL, NULL, NULL),
(61, 3, 'DASHBOARDWIDGET', 'Top Potentials', 'index.php?module=Potentials&view=ShowWidget&name=TopPotentials', '', 7, NULL, NULL, NULL),
(62, 3, 'DASHBOARDWIDGET', 'Leads by Status', 'index.php?module=Leads&view=ShowWidget&name=LeadsByStatus', '', 10, NULL, NULL, NULL),
(63, 3, 'DASHBOARDWIDGET', 'Leads by Source', 'index.php?module=Leads&view=ShowWidget&name=LeadsBySource', '', 11, NULL, NULL, NULL),
(64, 3, 'DASHBOARDWIDGET', 'Leads by Industry', 'index.php?module=Leads&view=ShowWidget&name=LeadsByIndustry', '', 12, NULL, NULL, NULL),
(65, 3, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Home&view=ShowWidget&name=OverdueActivities', '', 13, NULL, NULL, NULL),
(66, 3, 'DASHBOARDWIDGET', 'Tickets by Status', 'index.php?module=HelpDesk&view=ShowWidget&name=TicketsByStatus', '', 13, NULL, NULL, NULL),
(67, 3, 'DASHBOARDWIDGET', 'Open Tickets', 'index.php?module=HelpDesk&view=ShowWidget&name=OpenTickets', '', 14, NULL, NULL, NULL),
(68, 13, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(69, 15, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL),
(97, 3, 'DASHBOARDWIDGET', 'Key Metrics', 'index.php?module=Home&view=ShowWidget&name=KeyMetrics', '', 0, NULL, NULL, NULL),
(98, 3, 'DASHBOARDWIDGET', 'Mini List', 'index.php?module=Home&view=ShowWidget&name=MiniList', '', 0, NULL, NULL, NULL),
(99, 3, 'DASHBOARDWIDGET', 'Tag Cloud', 'index.php?module=Home&view=ShowWidget&name=TagCloud', '', 0, NULL, NULL, NULL),
(100, 2, 'DASHBOARDWIDGET', 'Funnel Amount', 'index.php?module=Potentials&view=ShowWidget&name=FunnelAmount', '', 10, NULL, NULL, NULL),
(101, 3, 'DASHBOARDWIDGET', 'Funnel Amount', 'index.php?module=Potentials&view=ShowWidget&name=FunnelAmount', '', 10, NULL, NULL, NULL),
(102, 3, 'DASHBOARDWIDGET', 'Notebook', 'index.php?module=Home&view=ShowWidget&name=Notebook', '', 0, NULL, NULL, NULL),
(103, 6, 'DETAILVIEWSIDEBARWIDGET', 'Google Map', 'module=Google&view=Map&mode=showMap&viewtype=detail', '', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_links_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_links_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_links_seq`
--

INSERT INTO `vtiger_links_seq` (`id`) VALUES
(107);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_loginhistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_loginhistory` (
`login_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_ip` varchar(25) NOT NULL,
  `logout_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_loginhistory`
--

INSERT INTO `vtiger_loginhistory` (`login_id`, `user_name`, `user_ip`, `logout_time`, `login_time`, `status`) VALUES
(1, 'admin', '::1', '2015-01-06 02:41:45', '2015-01-04 17:21:41', 'Signed off'),
(2, 'test', '::1', '0000-00-00 00:00:00', '2015-01-05 22:06:28', 'Signed in'),
(3, 'test', '::1', '0000-00-00 00:00:00', '2015-01-06 01:03:35', 'Signed in'),
(4, 'test', '::1', '2015-01-06 01:07:22', '2015-01-06 01:06:51', 'Signed off'),
(5, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-06 02:42:42', 'Signed in'),
(6, 'test', '::1', '2015-01-06 02:52:59', '2015-01-06 02:49:02', 'Signed off'),
(7, 'admin', '::1', '2015-01-06 06:28:43', '2015-01-06 02:54:17', 'Signed off'),
(8, 'test', '::1', '0000-00-00 00:00:00', '2015-01-06 04:02:05', 'Signed in'),
(9, 'test', '::1', '2015-01-06 06:30:12', '2015-01-06 06:28:49', 'Signed off'),
(10, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-06 06:30:21', 'Signed in'),
(11, 'test', '::1', '0000-00-00 00:00:00', '2015-01-06 19:21:07', 'Signed in'),
(12, 'test', '::1', '0000-00-00 00:00:00', '2015-01-07 04:04:04', 'Signed in'),
(13, 'test', '::1', '0000-00-00 00:00:00', '2015-01-07 07:56:30', 'Signed in'),
(14, 'admin', '::1', '2015-01-11 23:33:28', '2015-01-11 22:53:17', 'Signed off'),
(15, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-16 22:33:56', 'Signed in'),
(16, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-23 05:35:22', 'Signed in'),
(17, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-25 20:38:51', 'Signed in'),
(18, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-26 23:25:21', 'Signed in'),
(19, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-27 00:17:39', 'Signed in'),
(20, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-27 00:32:08', 'Signed in'),
(21, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-27 00:55:18', 'Signed in'),
(22, 'admin', '::1', '2015-01-27 18:21:03', '2015-01-27 18:20:50', 'Signed off'),
(23, 'test', '::1', '2015-01-27 18:30:06', '2015-01-27 18:21:09', 'Signed off'),
(24, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-27 18:32:04', 'Signed in'),
(25, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-27 22:53:11', 'Signed in'),
(26, 'admin', '::1', '0000-00-00 00:00:00', '2015-01-31 06:54:09', 'Signed in');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mail_accounts`
--

CREATE TABLE IF NOT EXISTS `vtiger_mail_accounts` (
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `mail_protocol` varchar(20) DEFAULT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(250) NOT NULL,
  `mail_servername` varchar(50) DEFAULT NULL,
  `box_refresh` int(10) DEFAULT NULL,
  `mails_per_page` int(10) DEFAULT NULL,
  `ssltype` varchar(50) DEFAULT NULL,
  `sslmeth` varchar(50) DEFAULT NULL,
  `int_mailer` int(1) DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `set_default` int(2) DEFAULT NULL,
  `sent_folder` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailmanager_mailattachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailattachments` (
  `userid` int(11) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `aname` varchar(100) DEFAULT NULL,
  `lastsavedtime` int(11) DEFAULT NULL,
  `attachid` int(19) NOT NULL,
  `path` varchar(200) NOT NULL,
  `cid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailmanager_mailrecord`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailrecord` (
  `userid` int(11) DEFAULT NULL,
  `mfrom` varchar(255) DEFAULT NULL,
  `mto` varchar(255) DEFAULT NULL,
  `mcc` varchar(500) DEFAULT NULL,
  `mbcc` varchar(500) DEFAULT NULL,
  `mdate` varchar(20) DEFAULT NULL,
  `msubject` varchar(500) DEFAULT NULL,
  `mbody` text,
  `mcharset` varchar(10) DEFAULT NULL,
  `misbodyhtml` int(1) DEFAULT NULL,
  `mplainmessage` int(1) DEFAULT NULL,
  `mhtmlmessage` int(1) DEFAULT NULL,
  `muniqueid` varchar(500) DEFAULT NULL,
  `mbodyparsed` int(1) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `lastsavedtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailmanager_mailrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailrel` (
  `mailuid` varchar(999) DEFAULT NULL,
  `crmid` int(11) DEFAULT NULL,
  `emailid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailscanner`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner` (
`scannerid` int(11) NOT NULL,
  `scannername` varchar(30) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ssltype` varchar(10) DEFAULT NULL,
  `sslmethod` varchar(30) DEFAULT NULL,
  `connecturl` varchar(255) DEFAULT NULL,
  `searchfor` varchar(10) DEFAULT NULL,
  `markas` varchar(10) DEFAULT NULL,
  `isvalid` int(1) DEFAULT NULL,
  `time_zone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailscanner_actions`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_actions` (
`actionid` int(11) NOT NULL,
  `scannerid` int(11) DEFAULT NULL,
  `actiontype` varchar(10) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `lookup` varchar(30) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailscanner_folders`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_folders` (
`folderid` int(11) NOT NULL,
  `scannerid` int(11) DEFAULT NULL,
  `foldername` varchar(255) DEFAULT NULL,
  `lastscan` varchar(30) DEFAULT NULL,
  `rescan` int(1) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailscanner_ids`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_ids` (
  `scannerid` int(11) DEFAULT NULL,
  `messageid` varchar(512) DEFAULT NULL,
  `crmid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailscanner_ruleactions`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_ruleactions` (
  `ruleid` int(11) DEFAULT NULL,
  `actionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mailscanner_rules`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_rules` (
`ruleid` int(11) NOT NULL,
  `scannerid` int(11) DEFAULT NULL,
  `fromaddress` varchar(255) DEFAULT NULL,
  `toaddress` varchar(255) DEFAULT NULL,
  `subjectop` varchar(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `bodyop` varchar(20) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `matchusing` varchar(5) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `assigned_to` int(10) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_manufacturer`
--

CREATE TABLE IF NOT EXISTS `vtiger_manufacturer` (
`manufacturerid` int(19) NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_manufacturer`
--

INSERT INTO `vtiger_manufacturer` (`manufacturerid`, `manufacturer`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'AltvetPet Inc.', 1, 124, 1),
(3, 'LexPon Inc.', 1, 125, 2),
(4, 'MetBeat Corp', 1, 126, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_manufacturer_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_manufacturer_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_manufacturer_seq`
--

INSERT INTO `vtiger_manufacturer_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_mobile_alerts`
--

CREATE TABLE IF NOT EXISTS `vtiger_mobile_alerts` (
`id` int(11) NOT NULL,
  `handler_path` varchar(500) DEFAULT NULL,
  `handler_class` varchar(50) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_mobile_alerts`
--

INSERT INTO `vtiger_mobile_alerts` (`id`, `handler_path`, `handler_class`, `sequence`, `deleted`) VALUES
(1, 'modules/Mobile/api/ws/models/alerts/IdleTicketsOfMine.php', 'Mobile_WS_AlertModel_IdleTicketsOfMine', NULL, 0),
(2, 'modules/Mobile/api/ws/models/alerts/NewTicketOfMine.php', 'Mobile_WS_AlertModel_NewTicketOfMine', NULL, 0),
(3, 'modules/Mobile/api/ws/models/alerts/PendingTicketsOfMine.php', 'Mobile_WS_AlertModel_PendingTicketsOfMine', NULL, 0),
(4, 'modules/Mobile/api/ws/models/alerts/PotentialsDueIn5Days.php', 'Mobile_WS_AlertModel_PotentialsDueIn5Days', NULL, 0),
(5, 'modules/Mobile/api/ws/models/alerts/EventsOfMineToday.php', 'Mobile_WS_AlertModel_EventsOfMineToday', NULL, 0),
(6, 'modules/Mobile/api/ws/models/alerts/ProjectTasksOfMine.php', 'Mobile_WS_AlertModel_ProjectTasksOfMine', NULL, 0),
(7, 'modules/Mobile/api/ws/models/alerts/Projects.php', 'Mobile_WS_AlertModel_Projects', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_modcomments` (
  `modcommentsid` int(11) DEFAULT NULL,
  `commentcontent` text,
  `related_to` int(19) DEFAULT NULL,
  `parent_comments` varchar(100) DEFAULT NULL,
  `customer` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `reasontoedit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modcomments`
--

INSERT INTO `vtiger_modcomments` (`modcommentsid`, `commentcontent`, `related_to`, `parent_comments`, `customer`, `userid`, `reasontoedit`) VALUES
(17, 'test', 16, '', '', '1', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modcommentscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_modcommentscf` (
  `modcommentsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modcommentscf`
--

INSERT INTO `vtiger_modcommentscf` (`modcommentsid`) VALUES
(17);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modentity_num`
--

CREATE TABLE IF NOT EXISTS `vtiger_modentity_num` (
  `num_id` int(19) NOT NULL,
  `semodule` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `start_id` varchar(50) NOT NULL,
  `cur_id` varchar(50) NOT NULL,
  `active` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modentity_num`
--

INSERT INTO `vtiger_modentity_num` (`num_id`, `semodule`, `prefix`, `start_id`, `cur_id`, `active`) VALUES
(1, 'Leads', 'LEA', '1', '1', '1'),
(2, 'Accounts', 'ACC', '1', '8', '1'),
(3, 'Campaigns', 'CAM', '1', '2', '1'),
(4, 'Contacts', 'CON', '1', '5', '1'),
(5, 'Potentials', 'POT', '1', '2', '1'),
(6, 'HelpDesk', 'TT', '1', '4', '1'),
(7, 'Quotes', 'QUO', '1', '1', '1'),
(8, 'SalesOrder', 'SO', '1', '2', '1'),
(9, 'PurchaseOrder', 'PO', '1', '1', '1'),
(10, 'Invoice', 'INV', '1', '1', '1'),
(11, 'Products', 'PRO', '1', '5', '1'),
(12, 'Vendors', 'VEN', '1', '2', '1'),
(13, 'PriceBooks', 'PB', '1', '1', '1'),
(14, 'Faq', 'FAQ', '1', '3', '1'),
(15, 'Documents', 'DOC', '1', '5', '1'),
(16, 'ServiceContracts', 'SERCON', '1', '3', '1'),
(17, 'Services', 'SER', '1', '1', '1'),
(18, 'Assets', 'ASSET', '1', '1', '1'),
(19, 'ProjectMilestone', 'PM', '1', '2', '1'),
(20, 'ProjectTask', 'PT', '1', '1', '1'),
(21, 'Project', 'PROJ', '1', '4', '1');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modentity_num_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_modentity_num_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modentity_num_seq`
--

INSERT INTO `vtiger_modentity_num_seq` (`id`) VALUES
(21);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modtracker_basic`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_basic` (
  `id` int(20) NOT NULL,
  `crmid` int(20) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `whodid` int(20) DEFAULT NULL,
  `changedon` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modtracker_basic`
--

INSERT INTO `vtiger_modtracker_basic` (`id`, `crmid`, `module`, `whodid`, `changedon`, `status`) VALUES
(1, 2, 'Events', 1, '2015-01-05 01:34:46', 2),
(2, 2, 'Events', 1, '2015-01-05 01:35:10', 0),
(3, 3, 'Potentials', 1, '2015-01-05 01:38:24', 2),
(4, 4, 'HelpDesk', 1, '2015-01-05 01:39:35', 2),
(5, 5, 'Documents', 1, '2015-01-05 14:19:34', 2),
(6, 5, 'Documents', 1, '2015-01-05 14:20:05', 0),
(7, 6, 'Emails', 1, '2015-01-05 15:00:10', 2),
(8, 5, 'Documents', 1, '2015-01-05 15:43:44', 1),
(9, 7, 'Documents', 1, '2015-01-05 15:45:16', 2),
(10, 8, 'Campaigns', 1, '2015-01-06 03:17:37', 2),
(11, 9, 'Accounts', 1, '2015-01-06 03:18:49', 2),
(12, 8, 'Campaigns', 1, '2015-01-06 03:18:49', 4),
(13, 10, 'Vendors', 1, '2015-01-06 06:30:18', 2),
(14, 11, 'Contacts', 1, '2015-01-06 06:31:54', 2),
(15, 10, 'Vendors', 1, '2015-01-06 06:32:15', 4),
(16, 12, 'Project', 1, '2015-01-06 06:42:13', 2),
(17, 13, 'ProjectMilestone', 1, '2015-01-06 06:42:28', 2),
(18, 12, 'Project', 1, '2015-01-06 06:42:29', 4),
(19, 14, 'Documents', 1, '2015-01-06 06:43:15', 2),
(20, 12, 'Project', 1, '2015-01-06 06:43:15', 4),
(21, 15, 'ServiceContracts', 1, '2015-01-06 11:57:54', 2),
(22, 16, 'Accounts', 1, '2015-01-07 01:47:37', 2),
(23, 17, 'ModComments', 1, '2015-01-07 02:04:00', 2),
(24, 18, 'Calendar', 1, '2015-01-07 02:09:39', 2),
(25, 9, 'Accounts', 1, '2015-01-07 02:11:58', 1),
(26, 19, 'Emails', 1, '2015-01-07 02:21:52', 2),
(27, 20, 'Contacts', 1, '2015-01-07 02:31:05', 2),
(28, 20, 'Contacts', 1, '2015-01-07 03:08:17', 0),
(29, 21, 'Documents', 1, '2015-01-07 03:14:31', 2),
(30, 11, 'Contacts', 1, '2015-01-07 03:14:31', 4),
(31, 22, 'Events', 1, '2015-01-07 03:20:24', 2),
(32, 16, 'Accounts', 1, '2015-01-07 03:20:24', 4),
(33, 23, 'ServiceContracts', 1, '2015-01-07 05:25:53', 2),
(34, 16, 'Accounts', 1, '2015-01-07 05:25:54', 4),
(35, 11, 'Contacts', 1, '2015-01-07 05:29:20', 0),
(36, 24, 'Accounts', 1, '2015-01-07 05:29:51', 2),
(37, 25, 'Accounts', 1, '2015-01-07 06:10:07', 2),
(38, 12, 'Project', 1, '2015-01-07 06:28:44', 0),
(39, 25, 'Accounts', 1, '2015-01-07 06:29:10', 1),
(40, 26, 'Contacts', 1, '2015-01-07 06:49:55', 2),
(41, 27, 'Contacts', 1, '2015-01-07 06:52:18', 2),
(42, 28, 'Products', 1, '2015-01-07 07:16:29', 2),
(43, 28, 'Products', 1, '2015-01-07 07:16:57', 0),
(44, 28, 'Products', 1, '2015-01-07 07:17:27', 0),
(45, 28, 'Products', 1, '2015-01-07 07:17:31', 0),
(46, 29, 'SalesOrder', 1, '2015-01-07 07:17:39', 2),
(47, 30, 'Project', 1, '2015-01-07 07:59:41', 2),
(48, 30, 'Project', 1, '2015-01-07 08:04:21', 0),
(49, 30, 'Project', 1, '2015-01-07 08:05:00', 1),
(50, 12, 'Project', 1, '2015-01-07 08:06:36', 0),
(51, 12, 'Project', 1, '2015-01-07 08:06:50', 1),
(52, 31, 'Project', 1, '2015-01-07 08:07:06', 2),
(53, 31, 'Project', 1, '2015-01-07 08:07:18', 1),
(54, 32, 'HelpDesk', 1, '2015-01-07 10:22:01', 2),
(55, 33, 'Products', 1, '2015-01-07 11:09:53', 2),
(56, 33, 'Products', 1, '2015-01-07 11:25:18', 1),
(57, 34, 'HelpDesk', 1, '2015-01-07 11:28:00', 2),
(58, 28, 'Products', 1, '2015-01-07 11:28:00', 4),
(59, 28, 'Products', 1, '2015-01-07 11:28:11', 1),
(60, 35, 'Products', 1, '2015-01-07 11:59:28', 2),
(61, 36, 'Faq', 1, '2015-01-07 11:59:41', 2),
(62, 37, 'Faq', 7, '2015-01-07 12:10:17', 2),
(63, 38, 'Accounts', 1, '2015-01-07 13:24:59', 2),
(64, 38, 'Accounts', 1, '2015-01-07 13:25:20', 0),
(65, 11, 'Contacts', 1, '2015-01-07 15:29:16', 0),
(66, 39, 'Events', 1, '2015-01-07 15:35:06', 2),
(67, 35, 'Products', 1, '2015-01-07 16:03:11', 0),
(68, 40, 'Accounts', 1, '2015-01-07 17:09:42', 2),
(69, 22, 'Events', 1, '2015-01-12 06:55:09', 0),
(70, 41, 'Accounts', 1, '2015-01-27 07:34:21', 2),
(71, 42, 'Products', 1, '2015-01-28 08:47:30', 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modtracker_basic_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_basic_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modtracker_basic_seq`
--

INSERT INTO `vtiger_modtracker_basic_seq` (`id`) VALUES
(71);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modtracker_detail`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_detail` (
  `id` int(11) DEFAULT NULL,
  `fieldname` varchar(100) DEFAULT NULL,
  `prevalue` text,
  `postvalue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modtracker_detail`
--

INSERT INTO `vtiger_modtracker_detail` (`id`, `fieldname`, `prevalue`, `postvalue`) VALUES
(1, 'subject', NULL, 'test'),
(1, 'assigned_user_id', NULL, '1'),
(1, 'date_start', NULL, '2015-01-04'),
(1, 'time_start', NULL, '16:15:00'),
(1, 'time_end', NULL, '16:20:00'),
(1, 'due_date', NULL, '2015-01-04'),
(1, 'eventstatus', NULL, 'Planned'),
(1, 'createdtime', NULL, '2015-01-05 01:34:46'),
(1, 'activitytype', NULL, 'Call'),
(1, 'visibility', NULL, 'Public'),
(1, 'modifiedby', NULL, '1'),
(1, 'created_user_id', NULL, '1'),
(1, 'record_id', NULL, '2'),
(1, 'record_module', NULL, 'Events'),
(2, 'time_end', '16:20:00', '16:35:00'),
(3, 'potentialname', NULL, 'testsdf'),
(3, 'potential_no', NULL, 'POT1'),
(3, 'amount', NULL, '0.00000000'),
(3, 'closingdate', NULL, '2015-01-16'),
(3, 'sales_stage', NULL, 'Prospecting'),
(3, 'assigned_user_id', NULL, '1'),
(3, 'probability', NULL, '0.000'),
(3, 'createdtime', NULL, '2015-01-05 01:38:24'),
(3, 'modifiedby', NULL, '1'),
(3, 'forecast_amount', NULL, '0.00000000'),
(3, 'created_user_id', NULL, '1'),
(3, 'cf_733', NULL, 'test'),
(3, 'record_id', NULL, '3'),
(3, 'record_module', NULL, 'Potentials'),
(4, 'ticket_no', NULL, 'TT1'),
(4, 'assigned_user_id', NULL, '1'),
(4, 'ticketpriorities', NULL, 'Normal'),
(4, 'ticketseverities', NULL, 'Major'),
(4, 'ticketstatus', NULL, 'Open'),
(4, 'ticketcategories', NULL, 'Small Problem'),
(4, 'hours', NULL, '0.00000000'),
(4, 'days', NULL, '0.00000000'),
(4, 'createdtime', NULL, '2015-01-05 01:39:35'),
(4, 'modifiedby', NULL, '1'),
(4, 'ticket_title', NULL, 'testi09'),
(4, 'created_user_id', NULL, '1'),
(4, 'record_id', NULL, '4'),
(4, 'record_module', NULL, 'HelpDesk'),
(5, 'notes_title', NULL, 'adsf'),
(5, 'createdtime', NULL, '2015-01-05 14:19:34'),
(5, 'assigned_user_id', NULL, '1'),
(5, 'notecontent', NULL, '&nbsp;'),
(5, 'filelocationtype', NULL, 'I'),
(5, 'filestatus', NULL, '1'),
(5, 'folderid', NULL, '1'),
(5, 'note_no', NULL, 'DOC1'),
(5, 'modifiedby', NULL, '1'),
(5, 'record_id', NULL, '5'),
(5, 'record_module', NULL, 'Documents'),
(6, 'folderid', '1', '2'),
(7, 'date_start', NULL, '2015-01-05'),
(7, 'activitytype', NULL, 'Emails'),
(7, 'assigned_user_id', NULL, '1'),
(7, 'subject', NULL, 'sdfasdf'),
(7, 'description', NULL, 'asdfasfasdf'),
(7, 'time_start', NULL, '15:00'),
(7, 'createdtime', NULL, '2015-01-05 15:00:10'),
(7, 'modifiedby', NULL, '1'),
(7, 'from_email', NULL, 'cyj91516@aliyun.com'),
(7, 'saved_toid', NULL, '[&quot;cyj91516@aliyun.com&quot;]'),
(7, 'ccmail', NULL, '[&quot;&quot;]'),
(7, 'bccmail', NULL, '[&quot;&quot;]'),
(7, 'parent_id', NULL, '1@-1|'),
(7, 'email_flag', NULL, 'SENT'),
(7, 'record_id', NULL, '6'),
(7, 'record_module', NULL, 'Emails'),
(9, 'notes_title', NULL, 'asdfafd'),
(9, 'createdtime', NULL, '2015-01-05 15:45:16'),
(9, 'assigned_user_id', NULL, '1'),
(9, 'notecontent', NULL, '&nbsp;'),
(9, 'filelocationtype', NULL, 'I'),
(9, 'filestatus', NULL, '1'),
(9, 'folderid', NULL, '2'),
(9, 'note_no', NULL, 'DOC2'),
(9, 'modifiedby', NULL, '1'),
(9, 'record_id', NULL, '7'),
(9, 'record_module', NULL, 'Documents'),
(10, 'campaignname', NULL, 'asdf'),
(10, 'campaign_no', NULL, 'CAM1'),
(10, 'closingdate', NULL, '2015-01-25'),
(10, 'assigned_user_id', NULL, '1'),
(10, 'createdtime', NULL, '2015-01-06 03:17:37'),
(10, 'modifiedby', NULL, '1'),
(10, 'expectedrevenue', NULL, '0.00000000'),
(10, 'budgetcost', NULL, '0.00000000'),
(10, 'actualcost', NULL, '0.00000000'),
(10, 'expectedroi', NULL, '0.00000000'),
(10, 'actualroi', NULL, '0.00000000'),
(10, 'record_id', NULL, '8'),
(10, 'record_module', NULL, 'Campaigns'),
(11, 'accountname', NULL, 'dfadf'),
(11, 'account_no', NULL, 'ACC1'),
(11, 'annual_revenue', NULL, '0.00000000'),
(11, 'assigned_user_id', NULL, '1'),
(11, 'createdtime', NULL, '2015-01-06 03:18:49'),
(11, 'modifiedby', NULL, '1'),
(11, 'created_user_id', NULL, '1'),
(11, 'record_id', NULL, '9'),
(11, 'record_module', NULL, 'Accounts'),
(13, 'vendorname', NULL, '供应商1'),
(13, 'vendor_no', NULL, 'VEN1'),
(13, 'createdtime', NULL, '2015-01-06 06:30:18'),
(13, 'modifiedby', NULL, '1'),
(13, 'assigned_user_id', NULL, '1'),
(13, 'created_user_id', NULL, '1'),
(13, 'record_id', NULL, '10'),
(13, 'record_module', NULL, 'Vendors'),
(14, 'firstname', NULL, '联系人1'),
(14, 'contact_no', NULL, 'CON1'),
(14, 'lastname', NULL, 'tt'),
(14, 'assigned_user_id', NULL, '1'),
(14, 'createdtime', NULL, '2015-01-06 06:31:54'),
(14, 'modifiedby', NULL, '1'),
(14, 'support_start_date', NULL, '2015-01-06'),
(14, 'support_end_date', NULL, '2016-01-06'),
(14, 'created_user_id', NULL, '1'),
(14, 'record_id', NULL, '11'),
(14, 'record_module', NULL, 'Contacts'),
(16, 'projectname', NULL, '项目1'),
(16, 'assigned_user_id', NULL, '1'),
(16, 'project_no', NULL, 'PROJ1'),
(16, 'createdtime', NULL, '2015-01-06 06:42:13'),
(16, 'modifiedby', NULL, '1'),
(16, 'created_user_id', NULL, '1'),
(16, 'record_id', NULL, '12'),
(16, 'record_module', NULL, 'Project'),
(17, 'projectmilestonename', NULL, 'sadf'),
(17, 'projectid', NULL, '12'),
(17, 'assigned_user_id', NULL, '1'),
(17, 'projectmilestone_no', NULL, 'PM1'),
(17, 'createdtime', NULL, '2015-01-06 06:42:28'),
(17, 'modifiedby', NULL, '1'),
(17, 'created_user_id', NULL, '1'),
(17, 'record_id', NULL, '13'),
(17, 'record_module', NULL, 'ProjectMilestone'),
(19, 'notes_title', NULL, 'sfd'),
(19, 'createdtime', NULL, '2015-01-06 06:43:15'),
(19, 'assigned_user_id', NULL, '1'),
(19, 'filelocationtype', NULL, 'I'),
(19, 'filestatus', NULL, '1'),
(19, 'folderid', NULL, '2'),
(19, 'note_no', NULL, 'DOC3'),
(19, 'modifiedby', NULL, '1'),
(19, 'record_id', NULL, '14'),
(19, 'record_module', NULL, 'Documents'),
(21, 'assigned_user_id', NULL, '1'),
(21, 'createdtime', NULL, '2015-01-06 11:57:54'),
(21, 'total_units', NULL, '0.00'),
(21, 'used_units', NULL, '0.00'),
(21, 'subject', NULL, 'tstst3'),
(21, 'contract_no', NULL, 'SERCON1'),
(21, 'modifiedby', NULL, '1'),
(21, 'record_id', NULL, '15'),
(21, 'record_module', NULL, 'ServiceContracts'),
(22, 'accountname', NULL, '客户1'),
(22, 'account_no', NULL, 'ACC2'),
(22, 'annual_revenue', NULL, '0.00000000'),
(22, 'assigned_user_id', NULL, '1'),
(22, 'createdtime', NULL, '2015-01-07 01:47:37'),
(22, 'modifiedby', NULL, '1'),
(22, 'created_user_id', NULL, '1'),
(22, 'record_id', NULL, '16'),
(22, 'record_module', NULL, 'Accounts'),
(23, 'commentcontent', NULL, 'test'),
(23, 'assigned_user_id', NULL, '1'),
(23, 'createdtime', NULL, '2015-01-07 02:04:00'),
(23, 'related_to', NULL, '16'),
(23, 'creator', NULL, '1'),
(23, 'userid', NULL, '1'),
(23, 'created_user_id', NULL, '1'),
(23, 'record_id', NULL, '17'),
(23, 'record_module', NULL, 'ModComments'),
(24, 'subject', NULL, 'sdafas'),
(24, 'assigned_user_id', NULL, '1'),
(24, 'date_start', NULL, '2015-01-07'),
(24, 'time_start', NULL, '02:09:00'),
(24, 'due_date', NULL, '2015-01-07'),
(24, 'parent_id', NULL, '16'),
(24, 'taskstatus', NULL, 'Not Started'),
(24, 'createdtime', NULL, '2015-01-07 02:09:39'),
(24, 'activitytype', NULL, 'Task'),
(24, 'visibility', NULL, 'Private'),
(24, 'modifiedby', NULL, '1'),
(24, 'created_user_id', NULL, '1'),
(24, 'record_id', NULL, '18'),
(24, 'record_module', NULL, 'Calendar'),
(26, 'date_start', NULL, '2015-01-07'),
(26, 'activitytype', NULL, 'Emails'),
(26, 'assigned_user_id', NULL, '1'),
(26, 'subject', NULL, 'test'),
(26, 'description', NULL, '&nbsp;'),
(26, 'time_start', NULL, '02:21'),
(26, 'createdtime', NULL, '2015-01-07 02:21:52'),
(26, 'modifiedby', NULL, '1'),
(26, 'from_email', NULL, 'cyj91516@aliyun.com'),
(26, 'saved_toid', NULL, '[&quot;cyj91516@aliyun.com&quot;]'),
(26, 'ccmail', NULL, '[&quot;&quot;]'),
(26, 'bccmail', NULL, '[&quot;&quot;]'),
(26, 'parent_id', NULL, '1@-1|'),
(26, 'email_flag', NULL, 'SAVED'),
(26, 'record_id', NULL, '19'),
(26, 'record_module', NULL, 'Emails'),
(27, 'contact_no', NULL, 'CON2'),
(27, 'lastname', NULL, 'test'),
(27, 'account_id', NULL, '16'),
(27, 'assigned_user_id', NULL, '1'),
(27, 'createdtime', NULL, '2015-01-07 02:31:05'),
(27, 'modifiedby', NULL, '1'),
(27, 'support_start_date', NULL, '2015-01-07'),
(27, 'support_end_date', NULL, '2016-01-07'),
(27, 'created_user_id', NULL, '1'),
(27, 'record_id', NULL, '20'),
(27, 'record_module', NULL, 'Contacts'),
(28, 'description', '', 'test'),
(29, 'notes_title', NULL, 'sfef'),
(29, 'createdtime', NULL, '2015-01-07 03:14:31'),
(29, 'assigned_user_id', NULL, '1'),
(29, 'filelocationtype', NULL, 'I'),
(29, 'filestatus', NULL, '1'),
(29, 'folderid', NULL, '2'),
(29, 'note_no', NULL, 'DOC4'),
(29, 'modifiedby', NULL, '1'),
(29, 'record_id', NULL, '21'),
(29, 'record_module', NULL, 'Documents'),
(31, 'subject', NULL, 'test23我3'),
(31, 'assigned_user_id', NULL, '1'),
(31, 'date_start', NULL, '2015-01-18'),
(31, 'time_start', NULL, '03:19:00'),
(31, 'time_end', NULL, '03:24:00'),
(31, 'due_date', NULL, '2015-01-18'),
(31, 'parent_id', NULL, '16'),
(31, 'eventstatus', NULL, 'Planned'),
(31, 'taskpriority', NULL, 'High'),
(31, 'createdtime', NULL, '2015-01-07 03:20:24'),
(31, 'activitytype', NULL, 'Meeting'),
(31, 'visibility', NULL, 'Public'),
(31, 'recurringtype', NULL, '--None--'),
(31, 'modifiedby', NULL, '1'),
(31, 'created_user_id', NULL, '1'),
(31, 'record_id', NULL, '22'),
(31, 'record_module', NULL, 'Events'),
(33, 'assigned_user_id', NULL, '1'),
(33, 'createdtime', NULL, '2015-01-07 05:25:53'),
(33, 'sc_related_to', NULL, '16'),
(33, 'tracking_unit', NULL, 'Days'),
(33, 'total_units', NULL, '0.00'),
(33, 'used_units', NULL, '0.00'),
(33, 'subject', NULL, 'test'),
(33, 'contract_no', NULL, 'SERCON2'),
(33, 'modifiedby', NULL, '1'),
(33, 'record_id', NULL, '23'),
(33, 'record_module', NULL, 'ServiceContracts'),
(35, 'account_id', '0', '16'),
(36, 'accountname', NULL, 'test23t'),
(36, 'account_no', NULL, 'ACC3'),
(36, 'annual_revenue', NULL, '0.00000000'),
(36, 'assigned_user_id', NULL, '1'),
(36, 'createdtime', NULL, '2015-01-07 05:29:51'),
(36, 'modifiedby', NULL, '1'),
(36, 'created_user_id', NULL, '1'),
(36, 'record_id', NULL, '24'),
(36, 'record_module', NULL, 'Accounts'),
(37, 'accountname', NULL, 'sf'),
(37, 'account_no', NULL, 'ACC4'),
(37, 'annual_revenue', NULL, '0.00000000'),
(37, 'assigned_user_id', NULL, '1'),
(37, 'createdtime', NULL, '2015-01-07 06:10:07'),
(37, 'modifiedby', NULL, '1'),
(37, 'created_user_id', NULL, '1'),
(37, 'record_id', NULL, '25'),
(37, 'record_module', NULL, 'Accounts'),
(38, 'linktoaccountscontacts', '', '25'),
(40, 'contact_no', NULL, 'CON3'),
(40, 'lastname', NULL, 'test'),
(40, 'assigned_user_id', NULL, '1'),
(40, 'createdtime', NULL, '2015-01-07 06:49:55'),
(40, 'modifiedby', NULL, '1'),
(40, 'support_start_date', NULL, '2015-01-07'),
(40, 'support_end_date', NULL, '2016-01-07'),
(40, 'created_user_id', NULL, '1'),
(40, 'record_id', NULL, '26'),
(40, 'record_module', NULL, 'Contacts'),
(41, 'contact_no', NULL, 'CON4'),
(41, 'lastname', NULL, 'asf'),
(41, 'assigned_user_id', NULL, '1'),
(41, 'createdtime', NULL, '2015-01-07 06:52:18'),
(41, 'modifiedby', NULL, '1'),
(41, 'support_start_date', NULL, '2015-01-07'),
(41, 'support_end_date', NULL, '2016-01-07'),
(41, 'created_user_id', NULL, '1'),
(41, 'record_id', NULL, '27'),
(41, 'record_module', NULL, 'Contacts'),
(42, 'productname', NULL, 'wef'),
(42, 'product_no', NULL, 'PRO1'),
(42, 'createdtime', NULL, '2015-01-07 07:16:29'),
(42, 'modifiedby', NULL, '1'),
(42, 'unit_price', NULL, '0.00000000'),
(42, 'commissionrate', NULL, '0.000'),
(42, 'qty_per_unit', NULL, '0.00'),
(42, 'qtyinstock', NULL, '0.000'),
(42, 'assigned_user_id', NULL, '1'),
(42, 'record_id', NULL, '28'),
(42, 'record_module', NULL, 'Products'),
(43, 'discontinued', '0', '1'),
(44, 'qtyinstock', '0.000', '10.000'),
(45, 'usageunit', '', 'Each'),
(46, 'salesorder_no', NULL, 'SO1'),
(46, 'subject', NULL, 'safwef'),
(46, 'sostatus', NULL, 'Created'),
(46, 'txtAdjustment', NULL, '0.00000000'),
(46, 'salescommission', NULL, '0.000'),
(46, 'exciseduty', NULL, '0.000'),
(46, 'hdnGrandTotal', NULL, '0.00000000'),
(46, 'hdnSubTotal', NULL, '0.00000000'),
(46, 'hdnTaxType', NULL, 'group'),
(46, 'hdnS_H_Amount', NULL, '0.00000000'),
(46, 'account_id', NULL, '16'),
(46, 'assigned_user_id', NULL, '1'),
(46, 'createdtime', NULL, '2015-01-07 07:17:39'),
(46, 'modifiedby', NULL, '1'),
(46, 'currency_id', NULL, '1'),
(46, 'conversion_rate', NULL, '1.000'),
(46, 'bill_street', NULL, 'asf'),
(46, 'ship_street', NULL, 'sadf'),
(46, 'terms_conditions', NULL, '- Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.'),
(46, 'productid', NULL, '28'),
(46, 'quantity', NULL, '1.000'),
(46, 'listprice', NULL, '0.00000000'),
(46, 'tax1', NULL, '4.500'),
(46, 'tax2', NULL, '10.000'),
(46, 'tax3', NULL, '12.500'),
(46, 'pre_tax_total', NULL, '0.00000000'),
(46, 'hdnS_H_Percent', NULL, '27'),
(46, 'record_id', NULL, '29'),
(46, 'record_module', NULL, 'SalesOrder'),
(47, 'projectname', NULL, '项目1'),
(47, 'assigned_user_id', NULL, '1'),
(47, 'project_no', NULL, 'PROJ2'),
(47, 'createdtime', NULL, '2015-01-07 07:59:41'),
(47, 'modifiedby', NULL, '1'),
(47, 'created_user_id', NULL, '1'),
(47, 'record_id', NULL, '30'),
(47, 'record_module', NULL, 'Project'),
(48, 'projectstatus', '', 'initiated'),
(50, 'projectstatus', '', 'completed'),
(52, 'projectname', NULL, 'test'),
(52, 'projectstatus', NULL, 'archived'),
(52, 'assigned_user_id', NULL, '1'),
(52, 'project_no', NULL, 'PROJ3'),
(52, 'createdtime', NULL, '2015-01-07 08:07:06'),
(52, 'modifiedby', NULL, '1'),
(52, 'created_user_id', NULL, '1'),
(52, 'record_id', NULL, '31'),
(52, 'record_module', NULL, 'Project'),
(54, 'ticket_no', NULL, 'TT2'),
(54, 'assigned_user_id', NULL, '7'),
(54, 'ticketstatus', NULL, 'Open'),
(54, 'hours', NULL, '0.00000000'),
(54, 'days', NULL, '0.00000000'),
(54, 'createdtime', NULL, '2015-01-07 10:22:01'),
(54, 'modifiedby', NULL, '1'),
(54, 'ticket_title', NULL, 'asdf'),
(54, 'created_user_id', NULL, '1'),
(54, 'record_id', NULL, '32'),
(54, 'record_module', NULL, 'HelpDesk'),
(55, 'productname', NULL, 'test'),
(55, 'product_no', NULL, 'PRO2'),
(55, 'createdtime', NULL, '2015-01-07 11:09:53'),
(55, 'modifiedby', NULL, '1'),
(55, 'unit_price', NULL, '0.00000000'),
(55, 'commissionrate', NULL, '0.000'),
(55, 'qty_per_unit', NULL, '0.00'),
(55, 'qtyinstock', NULL, '0.000'),
(55, 'assigned_user_id', NULL, '1'),
(55, 'record_id', NULL, '33'),
(55, 'record_module', NULL, 'Products'),
(57, 'ticket_no', NULL, 'TT3'),
(57, 'assigned_user_id', NULL, '1'),
(57, 'product_id', NULL, '28'),
(57, 'ticketstatus', NULL, 'Open'),
(57, 'hours', NULL, '0.00000000'),
(57, 'days', NULL, '0.00000000'),
(57, 'createdtime', NULL, '2015-01-07 11:28:00'),
(57, 'modifiedby', NULL, '1'),
(57, 'ticket_title', NULL, 'asdf'),
(57, 'created_user_id', NULL, '1'),
(57, 'record_id', NULL, '34'),
(57, 'record_module', NULL, 'HelpDesk'),
(60, 'productname', NULL, 'test'),
(60, 'product_no', NULL, 'PRO3'),
(60, 'discontinued', NULL, '1'),
(60, 'createdtime', NULL, '2015-01-07 11:59:28'),
(60, 'modifiedby', NULL, '1'),
(60, 'unit_price', NULL, '0.00000000'),
(60, 'commissionrate', NULL, '0.000'),
(60, 'qty_per_unit', NULL, '0.00'),
(60, 'qtyinstock', NULL, '11.000'),
(60, 'assigned_user_id', NULL, '1'),
(60, 'record_id', NULL, '35'),
(60, 'record_module', NULL, 'Products'),
(61, 'product_id', NULL, '35'),
(61, 'faq_no', NULL, 'FAQ1'),
(61, 'faqcategories', NULL, 'General'),
(61, 'faqstatus', NULL, 'Published'),
(61, 'question', NULL, 'test'),
(61, 'faq_answer', NULL, 'afds'),
(61, 'createdtime', NULL, '2015-01-07 11:59:41'),
(61, 'modifiedby', NULL, '1'),
(61, 'record_id', NULL, '36'),
(61, 'record_module', NULL, 'Faq'),
(62, 'faq_no', NULL, 'FAQ2'),
(62, 'faqstatus', NULL, 'Obsolete'),
(62, 'question', NULL, 'asfd'),
(62, 'faq_answer', NULL, 'asfd'),
(62, 'createdtime', NULL, '2015-01-07 12:10:17'),
(62, 'modifiedby', NULL, '7'),
(62, 'record_id', NULL, '37'),
(62, 'record_module', NULL, 'Faq'),
(63, 'accountname', NULL, 'test'),
(63, 'account_no', NULL, 'ACC5'),
(63, 'annual_revenue', NULL, '0.00000000'),
(63, 'assigned_user_id', NULL, '1'),
(63, 'createdtime', NULL, '2015-01-07 13:24:59'),
(63, 'modifiedby', NULL, '1'),
(63, 'created_user_id', NULL, '1'),
(63, 'record_id', NULL, '38'),
(63, 'record_module', NULL, 'Accounts'),
(64, 'website', '', 'www.baidu.com'),
(65, 'email', '', 'deb@ac.o'),
(66, 'subject', NULL, 'asdfasf'),
(66, 'assigned_user_id', NULL, '1'),
(66, 'date_start', NULL, '2015-01-06'),
(66, 'time_start', NULL, '00:00:00'),
(66, 'time_end', NULL, '00:05:00'),
(66, 'due_date', NULL, '2015-01-06'),
(66, 'eventstatus', NULL, 'Planned'),
(66, 'createdtime', NULL, '2015-01-07 15:35:06'),
(66, 'activitytype', NULL, 'Call'),
(66, 'visibility', NULL, 'Public'),
(66, 'modifiedby', NULL, '1'),
(66, 'created_user_id', NULL, '1'),
(66, 'record_id', NULL, '39'),
(66, 'record_module', NULL, 'Events'),
(67, 'sales_start_date', '', '2015-01-10'),
(68, 'accountname', NULL, '天天'),
(68, 'account_no', NULL, 'ACC6'),
(68, 'annual_revenue', NULL, '0.00000000'),
(68, 'assigned_user_id', NULL, '1'),
(68, 'createdtime', NULL, '2015-01-07 17:09:42'),
(68, 'modifiedby', NULL, '1'),
(68, 'created_user_id', NULL, '1'),
(68, 'record_id', NULL, '40'),
(68, 'record_module', NULL, 'Accounts'),
(69, 'time_end', '03:24:00', '03:39:00'),
(70, 'accountname', NULL, '中国太平'),
(70, 'account_no', NULL, 'ACC7'),
(70, 'assigned_user_id', NULL, '1'),
(70, 'createdtime', NULL, '2015-01-27 07:34:21'),
(70, 'modifiedby', NULL, '1'),
(70, 'created_user_id', NULL, '1'),
(70, 'record_id', NULL, '41'),
(70, 'record_module', NULL, 'Accounts'),
(71, 'productname', NULL, 'test'),
(71, 'product_no', NULL, 'PRO4'),
(71, 'createdtime', NULL, '2015-01-28 08:47:30'),
(71, 'modifiedby', NULL, '1'),
(71, 'unit_price', NULL, '0.00000000'),
(71, 'commissionrate', NULL, '0.000'),
(71, 'qty_per_unit', NULL, '0.00'),
(71, 'qtyinstock', NULL, '0.000'),
(71, 'assigned_user_id', NULL, '1'),
(71, 'cf_735', NULL, 'kjhih'),
(71, 'record_id', NULL, '42'),
(71, 'record_module', NULL, 'Products');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modtracker_relations`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_relations` (
  `id` int(19) NOT NULL,
  `targetmodule` varchar(100) NOT NULL,
  `targetid` int(19) NOT NULL,
  `changedon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modtracker_relations`
--

INSERT INTO `vtiger_modtracker_relations` (`id`, `targetmodule`, `targetid`, `changedon`) VALUES
(12, 'Accounts', 9, '2015-01-06 03:18:49'),
(15, 'Contacts', 11, '2015-01-06 06:32:15'),
(18, 'ProjectMilestone', 13, '2015-01-06 06:42:29'),
(20, 'Documents', 14, '2015-01-06 06:43:15'),
(30, 'Documents', 21, '2015-01-07 03:14:31'),
(32, 'Calendar', 22, '2015-01-07 03:20:24'),
(34, 'ServiceContracts', 23, '2015-01-07 05:25:54'),
(58, 'HelpDesk', 34, '2015-01-07 11:28:00');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_modtracker_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_tabs` (
  `tabid` int(11) NOT NULL,
  `visible` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_modtracker_tabs`
--

INSERT INTO `vtiger_modtracker_tabs` (`tabid`, `visible`) VALUES
(2, 1),
(4, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(26, 1),
(28, 1),
(34, 1),
(35, 1),
(37, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(46, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_module_dashboard_widgets`
--

CREATE TABLE IF NOT EXISTS `vtiger_module_dashboard_widgets` (
`id` int(19) NOT NULL,
  `linkid` int(19) DEFAULT NULL,
  `userid` int(19) DEFAULT NULL,
  `filterid` int(19) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `data` text,
  `position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_module_dashboard_widgets`
--

INSERT INTO `vtiger_module_dashboard_widgets` (`id`, `linkid`, `userid`, `filterid`, `title`, `data`, `position`) VALUES
(3, 66, 1, NULL, NULL, 'null', '{"row":"2","col":"1"}'),
(4, 102, 1, 0, 'test', '{"contents":"","lastSavedOn":"2015-01-06 06:58:08"}', '{"row":"3","col":"5"}'),
(6, 65, 1, NULL, NULL, 'null', NULL),
(7, 56, 7, NULL, NULL, 'null', NULL),
(8, 65, 7, NULL, NULL, 'null', NULL),
(9, 99, 1, NULL, NULL, 'null', NULL),
(10, 97, 1, NULL, NULL, 'null', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_no_of_currency_decimals`
--

CREATE TABLE IF NOT EXISTS `vtiger_no_of_currency_decimals` (
`no_of_currency_decimalsid` int(11) NOT NULL,
  `no_of_currency_decimals` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_no_of_currency_decimals`
--

INSERT INTO `vtiger_no_of_currency_decimals` (`no_of_currency_decimalsid`, `no_of_currency_decimals`, `sortorderid`, `presence`) VALUES
(2, '2', 2, 1),
(3, '3', 3, 1),
(4, '4', 4, 1),
(5, '5', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_no_of_currency_decimals_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_no_of_currency_decimals_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_no_of_currency_decimals_seq`
--

INSERT INTO `vtiger_no_of_currency_decimals_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_notebook_contents`
--

CREATE TABLE IF NOT EXISTS `vtiger_notebook_contents` (
  `userid` int(19) NOT NULL,
  `notebookid` int(19) NOT NULL,
  `contents` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_notes`
--

CREATE TABLE IF NOT EXISTS `vtiger_notes` (
  `notesid` int(19) NOT NULL DEFAULT '0',
  `note_no` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `notecontent` text,
  `folderid` int(19) NOT NULL DEFAULT '1',
  `filetype` varchar(50) DEFAULT NULL,
  `filelocationtype` varchar(5) DEFAULT NULL,
  `filedownloadcount` int(19) DEFAULT NULL,
  `filestatus` int(19) DEFAULT NULL,
  `filesize` int(19) NOT NULL DEFAULT '0',
  `fileversion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_notes`
--

INSERT INTO `vtiger_notes` (`notesid`, `note_no`, `title`, `filename`, `notecontent`, `folderid`, `filetype`, `filelocationtype`, `filedownloadcount`, `filestatus`, `filesize`, `fileversion`) VALUES
(5, 'DOC1', 'adsf', '', ' ', 2, '', 'I', NULL, 1, 0, ''),
(7, 'DOC2', 'asdfafd', '', ' ', 2, '', 'I', NULL, 1, 0, ''),
(14, 'DOC3', 'sfd', '', '', 2, '', 'I', NULL, 1, 0, ''),
(21, 'DOC4', 'sfef', '', '', 2, '', 'I', NULL, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_notescf`
--

CREATE TABLE IF NOT EXISTS `vtiger_notescf` (
  `notesid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_notescf`
--

INSERT INTO `vtiger_notescf` (`notesid`) VALUES
(5),
(7),
(14),
(21);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_notificationscheduler`
--

CREATE TABLE IF NOT EXISTS `vtiger_notificationscheduler` (
`schedulednotificationid` int(19) NOT NULL,
  `schedulednotificationname` varchar(200) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `notificationsubject` varchar(200) DEFAULT NULL,
  `notificationbody` text,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_notificationscheduler`
--

INSERT INTO `vtiger_notificationscheduler` (`schedulednotificationid`, `schedulednotificationname`, `active`, `notificationsubject`, `notificationbody`, `label`, `type`) VALUES
(1, 'LBL_TASK_NOTIFICATION_DESCRITPION', 1, 'Task Delay Notification', 'Tasks delayed beyond 24 hrs ', 'LBL_TASK_NOTIFICATION', NULL),
(2, 'LBL_BIG_DEAL_DESCRIPTION', 1, 'Big Deal notification', 'Success! A big deal has been won! ', 'LBL_BIG_DEAL', NULL),
(3, 'LBL_TICKETS_DESCRIPTION', 1, 'Pending Tickets notification', 'Ticket pending please ', 'LBL_PENDING_TICKETS', NULL),
(4, 'LBL_MANY_TICKETS_DESCRIPTION', 1, 'Too many tickets Notification', 'Too many tickets pending against this entity ', 'LBL_MANY_TICKETS', NULL),
(5, 'LBL_START_DESCRIPTION', 1, 'Support Start Notification', '10', 'LBL_START_NOTIFICATION', 'select'),
(6, 'LBL_SUPPORT_DESCRIPTION', 1, 'Support ending please', '11', 'LBL_SUPPORT_NOTICIATION', 'select'),
(7, 'LBL_SUPPORT_DESCRIPTION_MONTH', 1, 'Support ending please', '12', 'LBL_SUPPORT_NOTICIATION_MONTH', 'select'),
(8, 'LBL_ACTIVITY_REMINDER_DESCRIPTION', 1, 'Activity Reminder Notification', 'This is a reminder notification for the Activity', 'LBL_ACTIVITY_NOTIFICATION', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_notificationscheduler_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_notificationscheduler_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_notificationscheduler_seq`
--

INSERT INTO `vtiger_notificationscheduler_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_opportunity_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunity_type` (
`opptypeid` int(19) NOT NULL,
  `opportunity_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_opportunity_type`
--

INSERT INTO `vtiger_opportunity_type` (`opptypeid`, `opportunity_type`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Existing Business', 1, 128, 1),
(3, 'New Business', 1, 129, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_opportunity_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunity_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_opportunity_type_seq`
--

INSERT INTO `vtiger_opportunity_type_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_opportunitystage`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunitystage` (
`potstageid` int(19) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1',
  `probability` decimal(3,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_org_share_action2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_org_share_action2tab` (
  `share_action_id` int(19) NOT NULL,
  `tabid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_org_share_action2tab`
--

INSERT INTO `vtiger_org_share_action2tab` (`share_action_id`, `tabid`) VALUES
(0, 2),
(0, 4),
(0, 6),
(0, 7),
(0, 8),
(0, 9),
(0, 10),
(0, 13),
(0, 14),
(0, 16),
(0, 18),
(0, 20),
(0, 21),
(0, 22),
(0, 23),
(0, 26),
(0, 34),
(0, 35),
(0, 37),
(0, 41),
(0, 42),
(0, 43),
(0, 44),
(0, 46),
(1, 2),
(1, 4),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 13),
(1, 14),
(1, 16),
(1, 18),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 26),
(1, 34),
(1, 35),
(1, 37),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 46),
(2, 2),
(2, 4),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 13),
(2, 14),
(2, 16),
(2, 18),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 26),
(2, 34),
(2, 35),
(2, 37),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 46),
(3, 2),
(3, 4),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 13),
(3, 14),
(3, 16),
(3, 18),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 26),
(3, 34),
(3, 35),
(3, 37),
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 46);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_org_share_action_mapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_org_share_action_mapping` (
  `share_action_id` int(19) NOT NULL,
  `share_action_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_org_share_action_mapping`
--

INSERT INTO `vtiger_org_share_action_mapping` (`share_action_id`, `share_action_name`) VALUES
(0, 'Public: Read Only'),
(1, 'Public: Read, Create/Edit'),
(2, 'Public: Read, Create/Edit, Delete'),
(3, 'Private'),
(4, 'Hide Details'),
(5, 'Hide Details and Add Events'),
(6, 'Show Details'),
(7, 'Show Details and Add Events');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_organizationdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_organizationdetails` (
  `organization_id` int(11) NOT NULL,
  `organizationname` varchar(60) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `logoname` varchar(50) DEFAULT NULL,
  `logo` text,
  `vatid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_organizationdetails`
--

INSERT INTO `vtiger_organizationdetails` (`organization_id`, `organizationname`, `address`, `city`, `state`, `country`, `code`, `phone`, `fax`, `website`, `logoname`, `logo`, `vatid`) VALUES
(1, '上海度特信息科技有限公司', '上海市闵行区莘建东路58号绿地蓝海科技岛C座716-717', '上海市', '上海市', '中国', '201199', '+86 021-64134835', '+86 021-64134855', 'www.doitchina.com', 'homepage_kv.jpg', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_organizationdetails_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_organizationdetails_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_organizationdetails_seq`
--

INSERT INTO `vtiger_organizationdetails_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_othereventduration`
--

CREATE TABLE IF NOT EXISTS `vtiger_othereventduration` (
`othereventdurationid` int(11) NOT NULL,
  `othereventduration` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_othereventduration`
--

INSERT INTO `vtiger_othereventduration` (`othereventdurationid`, `othereventduration`, `sortorderid`, `presence`) VALUES
(1, '5', 1, 1),
(2, '10', 2, 1),
(3, '30', 3, 1),
(4, '60', 4, 1),
(5, '120', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_othereventduration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_othereventduration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_othereventduration_seq`
--

INSERT INTO `vtiger_othereventduration_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_parenttab`
--

CREATE TABLE IF NOT EXISTS `vtiger_parenttab` (
  `parenttabid` int(19) NOT NULL,
  `parenttab_label` varchar(100) NOT NULL,
  `sequence` int(10) NOT NULL,
  `visible` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_parenttab`
--

INSERT INTO `vtiger_parenttab` (`parenttabid`, `parenttab_label`, `sequence`, `visible`) VALUES
(1, 'My Home Page', 1, 0),
(2, 'Marketing', 2, 0),
(3, 'Sales', 3, 0),
(4, 'Support', 4, 0),
(5, 'Analytics', 5, 0),
(6, 'Inventory', 6, 0),
(7, 'Tools', 7, 0),
(8, 'Settings', 8, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_parenttabrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_parenttabrel` (
  `parenttabid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sequence` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_parenttabrel`
--

INSERT INTO `vtiger_parenttabrel` (`parenttabid`, `tabid`, `sequence`) VALUES
(1, 9, 2),
(1, 28, 4),
(1, 3, 1),
(3, 7, 1),
(3, 6, 2),
(3, 4, 3),
(3, 2, 4),
(3, 20, 5),
(3, 22, 6),
(3, 23, 7),
(3, 19, 8),
(3, 8, 9),
(4, 13, 1),
(4, 15, 2),
(4, 6, 3),
(4, 4, 4),
(4, 8, 5),
(5, 1, 2),
(5, 25, 1),
(6, 14, 1),
(6, 18, 2),
(6, 19, 3),
(6, 21, 4),
(6, 22, 5),
(6, 20, 6),
(6, 23, 7),
(7, 24, 1),
(7, 27, 2),
(7, 8, 3),
(2, 26, 1),
(2, 6, 2),
(2, 4, 3),
(2, 28, 4),
(4, 28, 7),
(2, 7, 5),
(2, 9, 6),
(4, 9, 8),
(2, 8, 8),
(3, 9, 11),
(7, 31, 4),
(7, 31, 5),
(4, 34, 9),
(4, 34, 10),
(6, 35, 8),
(6, 35, 9),
(6, 37, 10),
(6, 37, 11),
(7, 39, 6),
(7, 39, 7),
(7, 41, 8),
(7, 41, 9),
(4, 42, 11),
(4, 42, 12),
(4, 43, 13),
(4, 43, 14),
(4, 44, 15),
(4, 44, 16),
(7, 45, 10),
(7, 45, 11),
(7, 46, 12),
(7, 46, 13);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_payment_duration`
--

CREATE TABLE IF NOT EXISTS `vtiger_payment_duration` (
  `payment_duration_id` int(11) DEFAULT NULL,
  `payment_duration` varchar(200) DEFAULT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_payment_duration`
--

INSERT INTO `vtiger_payment_duration` (`payment_duration_id`, `payment_duration`, `sortorderid`, `presence`) VALUES
(1, 'Net 30 days', 0, 1),
(2, 'Net 45 days', 1, 1),
(3, 'Net 60 days', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_payment_duration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_payment_duration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_payment_duration_seq`
--

INSERT INTO `vtiger_payment_duration_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_picklist`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist` (
`picklistid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_picklist`
--

INSERT INTO `vtiger_picklist` (`picklistid`, `name`) VALUES
(1, 'accounttype'),
(2, 'activitytype'),
(37, 'assetstatus'),
(3, 'campaignstatus'),
(4, 'campaigntype'),
(5, 'carrier'),
(51, 'cf_737'),
(33, 'contract_priority'),
(32, 'contract_status'),
(34, 'contract_type'),
(50, 'defaultactivitytype'),
(49, 'defaulteventstatus'),
(6, 'eventstatus'),
(7, 'expectedresponse'),
(8, 'faqcategories'),
(9, 'faqstatus'),
(10, 'glacct'),
(47, 'hour_format'),
(11, 'industry'),
(12, 'invoicestatus'),
(13, 'leadsource'),
(14, 'leadstatus'),
(15, 'manufacturer'),
(16, 'opportunity_type'),
(17, 'postatus'),
(18, 'productcategory'),
(45, 'progress'),
(38, 'projectmilestonetype'),
(44, 'projectpriority'),
(42, 'projectstatus'),
(40, 'projecttaskpriority'),
(41, 'projecttaskprogress'),
(46, 'projecttaskstatus'),
(39, 'projecttasktype'),
(43, 'projecttype'),
(19, 'quotestage'),
(20, 'rating'),
(21, 'sales_stage'),
(22, 'salutationtype'),
(36, 'servicecategory'),
(35, 'service_usageunit'),
(23, 'sostatus'),
(48, 'start_hour'),
(24, 'taskpriority'),
(25, 'taskstatus'),
(26, 'ticketcategories'),
(27, 'ticketpriorities'),
(28, 'ticketseverities'),
(29, 'ticketstatus'),
(31, 'tracking_unit'),
(30, 'usageunit');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_picklist_dependency`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_dependency` (
  `id` int(11) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sourcefield` varchar(255) DEFAULT NULL,
  `targetfield` varchar(255) DEFAULT NULL,
  `sourcevalue` varchar(100) DEFAULT NULL,
  `targetvalues` text,
  `criteria` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_picklist_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_picklist_seq`
--

INSERT INTO `vtiger_picklist_seq` (`id`) VALUES
(51);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_picklistvalues_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklistvalues_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_picklistvalues_seq`
--

INSERT INTO `vtiger_picklistvalues_seq` (`id`) VALUES
(328);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_pobillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_pobillads` (
  `pobilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_portal`
--

CREATE TABLE IF NOT EXISTS `vtiger_portal` (
  `portalid` int(19) NOT NULL,
  `portalname` varchar(200) NOT NULL,
  `portalurl` varchar(255) NOT NULL,
  `sequence` int(3) NOT NULL,
  `setdefault` int(3) NOT NULL DEFAULT '0',
  `createdtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_portal`
--

INSERT INTO `vtiger_portal` (`portalid`, `portalname`, `portalurl`, `sequence`, `setdefault`, `createdtime`) VALUES
(1, 'asdfadf', 'www.baidu.com', 0, 0, '2015-01-05 15:42:17');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_portal_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_portal_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_portal_seq`
--

INSERT INTO `vtiger_portal_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_portalinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_portalinfo` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(30) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_poshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_poshipads` (
  `poshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_postatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatus` (
`postatusid` int(19) NOT NULL,
  `postatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_postatus`
--

INSERT INTO `vtiger_postatus` (`postatusid`, `postatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Created', 0, 130, 0),
(2, 'Approved', 0, 131, 1),
(3, 'Delivered', 0, 132, 2),
(4, 'Cancelled', 0, 133, 3),
(5, 'Received Shipment', 0, 134, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_postatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_postatus_seq`
--

INSERT INTO `vtiger_postatus_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_postatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatushistory` (
`historyid` int(19) NOT NULL,
  `purchaseorderid` int(19) NOT NULL,
  `vendorname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_potential`
--

CREATE TABLE IF NOT EXISTS `vtiger_potential` (
  `potentialid` int(19) NOT NULL DEFAULT '0',
  `potential_no` varchar(100) NOT NULL,
  `related_to` int(19) DEFAULT NULL,
  `potentialname` varchar(120) NOT NULL,
  `amount` decimal(25,8) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `closingdate` date DEFAULT NULL,
  `typeofrevenue` varchar(50) DEFAULT NULL,
  `nextstep` varchar(100) DEFAULT NULL,
  `private` int(1) DEFAULT '0',
  `probability` decimal(7,3) DEFAULT '0.000',
  `campaignid` int(19) DEFAULT NULL,
  `sales_stage` varchar(200) DEFAULT NULL,
  `potentialtype` varchar(200) DEFAULT NULL,
  `leadsource` varchar(200) DEFAULT NULL,
  `productid` int(50) DEFAULT NULL,
  `productversion` varchar(50) DEFAULT NULL,
  `quotationref` varchar(50) DEFAULT NULL,
  `partnercontact` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `runtimefee` int(19) DEFAULT '0',
  `followupdate` date DEFAULT NULL,
  `evaluationstatus` varchar(50) DEFAULT NULL,
  `description` text,
  `forecastcategory` int(19) DEFAULT '0',
  `outcomeanalysis` int(19) DEFAULT '0',
  `forecast_amount` decimal(25,8) DEFAULT NULL,
  `isconvertedfromlead` varchar(3) DEFAULT '0',
  `contact_id` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_potential`
--

INSERT INTO `vtiger_potential` (`potentialid`, `potential_no`, `related_to`, `potentialname`, `amount`, `currency`, `closingdate`, `typeofrevenue`, `nextstep`, `private`, `probability`, `campaignid`, `sales_stage`, `potentialtype`, `leadsource`, `productid`, `productversion`, `quotationref`, `partnercontact`, `remarks`, `runtimefee`, `followupdate`, `evaluationstatus`, `description`, `forecastcategory`, `outcomeanalysis`, `forecast_amount`, `isconvertedfromlead`, `contact_id`) VALUES
(3, 'POT1', 0, 'testsdf', 0.00000000, NULL, '2015-01-16', NULL, '', 0, 0.000, 0, 'Prospecting', '', '', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0.00000000, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_potentialscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_potentialscf` (
  `potentialid` int(19) NOT NULL DEFAULT '0',
  `cf_733` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_potentialscf`
--

INSERT INTO `vtiger_potentialscf` (`potentialid`, `cf_733`) VALUES
(3, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_potstagehistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_potstagehistory` (
`historyid` int(19) NOT NULL,
  `potentialid` int(19) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `stage` varchar(100) DEFAULT NULL,
  `probability` decimal(7,3) DEFAULT NULL,
  `expectedrevenue` decimal(10,0) DEFAULT NULL,
  `closedate` date DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_pricebook`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebook` (
  `pricebookid` int(19) NOT NULL DEFAULT '0',
  `pricebook_no` varchar(100) NOT NULL,
  `bookname` varchar(100) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_pricebookcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebookcf` (
  `pricebookid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_pricebookproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebookproductrel` (
  `pricebookid` int(19) NOT NULL,
  `productid` int(19) NOT NULL,
  `listprice` decimal(27,8) DEFAULT NULL,
  `usedcurrency` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_priority`
--

CREATE TABLE IF NOT EXISTS `vtiger_priority` (
`priorityid` int(19) NOT NULL,
  `priority` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_productcategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcategory` (
`productcategoryid` int(19) NOT NULL,
  `productcategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_productcategory`
--

INSERT INTO `vtiger_productcategory` (`productcategoryid`, `productcategory`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Hardware', 1, 136, 1),
(3, 'Software', 1, 137, 2),
(4, 'CRM Applications', 1, 138, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_productcategory_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_productcategory_seq`
--

INSERT INTO `vtiger_productcategory_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_productcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcf` (
  `productid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_productcf`
--

INSERT INTO `vtiger_productcf` (`productid`) VALUES
(28),
(33),
(35),
(42);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_productcurrencyrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcurrencyrel` (
  `productid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `converted_price` decimal(28,8) DEFAULT NULL,
  `actual_price` decimal(28,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_productcurrencyrel`
--

INSERT INTO `vtiger_productcurrencyrel` (`productid`, `currencyid`, `converted_price`, `actual_price`) VALUES
(28, 1, 0.00000000, 0.00000000),
(33, 1, 0.00000000, 0.00000000),
(42, 1, 0.00000000, 0.00000000);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_products`
--

CREATE TABLE IF NOT EXISTS `vtiger_products` (
  `productid` int(11) NOT NULL,
  `product_no` varchar(100) NOT NULL,
  `productname` varchar(100) DEFAULT NULL,
  `productcode` varchar(40) DEFAULT NULL,
  `productcategory` varchar(200) DEFAULT NULL,
  `manufacturer` varchar(200) DEFAULT NULL,
  `qty_per_unit` decimal(11,2) DEFAULT '0.00',
  `unit_price` decimal(25,8) DEFAULT NULL,
  `weight` decimal(11,3) DEFAULT NULL,
  `pack_size` int(11) DEFAULT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `cost_factor` int(11) DEFAULT NULL,
  `commissionrate` decimal(7,3) DEFAULT NULL,
  `commissionmethod` varchar(50) DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT '0',
  `usageunit` varchar(200) DEFAULT NULL,
  `reorderlevel` int(11) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `taxclass` varchar(200) DEFAULT NULL,
  `mfr_part_no` varchar(200) DEFAULT NULL,
  `vendor_part_no` varchar(200) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `qtyinstock` decimal(25,3) DEFAULT NULL,
  `productsheet` varchar(200) DEFAULT NULL,
  `qtyindemand` int(11) DEFAULT NULL,
  `glacct` varchar(200) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `imagename` text,
  `currency_id` int(19) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_products`
--

INSERT INTO `vtiger_products` (`productid`, `product_no`, `productname`, `productcode`, `productcategory`, `manufacturer`, `qty_per_unit`, `unit_price`, `weight`, `pack_size`, `sales_start_date`, `sales_end_date`, `start_date`, `expiry_date`, `cost_factor`, `commissionrate`, `commissionmethod`, `discontinued`, `usageunit`, `reorderlevel`, `website`, `taxclass`, `mfr_part_no`, `vendor_part_no`, `serialno`, `qtyinstock`, `productsheet`, `qtyindemand`, `glacct`, `vendor_id`, `imagename`, `currency_id`) VALUES
(28, 'PRO1', 'wef', '', '', '', 0.00, 0.00000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.000, NULL, 1, 'Each', 0, '', '', '', '', '', 10.000, '', 0, '', 0, '', 1),
(33, 'PRO2', 'test', '', '', '', 0.00, 0.00000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.000, NULL, 0, '', 0, '', '', '', '', '', 0.000, '', 0, '', 0, '', 1),
(35, 'PRO3', 'test', '', '', '', 0.00, 0.00000000, NULL, NULL, '2015-01-10', NULL, NULL, NULL, NULL, 0.000, NULL, 1, '', 0, '', '', '', '', '', 11.000, '', 0, '', 0, '', 1),
(42, 'PRO4', 'test', '', '', '', 0.00, 0.00000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.000, NULL, 0, '', 0, '', '', '', '', '', 0.000, '', 0, '', 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_producttaxrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_producttaxrel` (
  `productid` int(11) NOT NULL,
  `taxid` int(3) NOT NULL,
  `taxpercentage` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile` (
`profileid` int(10) NOT NULL,
  `profilename` varchar(50) NOT NULL,
  `description` text,
  `directly_related_to_role` int(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile`
--

INSERT INTO `vtiger_profile` (`profileid`, `profilename`, `description`, `directly_related_to_role`) VALUES
(5, 'CEO+配置', NULL, 1),
(6, '总经理', '', 0),
(7, '项目经理', '', 0),
(8, '项目经理+配置', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile2field`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2field` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) DEFAULT NULL,
  `readonly` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile2field`
--

INSERT INTO `vtiger_profile2field` (`profileid`, `tabid`, `fieldid`, `visible`, `readonly`) VALUES
(5, 6, 1, 0, 0),
(5, 6, 2, 0, 0),
(5, 6, 3, 0, 0),
(5, 6, 4, 0, 0),
(5, 6, 5, 0, 0),
(5, 6, 6, 0, 0),
(5, 6, 7, 0, 0),
(5, 6, 8, 0, 0),
(5, 6, 9, 0, 0),
(5, 6, 10, 0, 0),
(5, 6, 11, 0, 0),
(5, 6, 12, 0, 0),
(5, 6, 13, 0, 0),
(5, 6, 14, 0, 0),
(5, 6, 15, 0, 0),
(5, 6, 16, 0, 0),
(5, 6, 17, 0, 0),
(5, 6, 18, 0, 0),
(5, 6, 19, 0, 0),
(5, 6, 20, 0, 0),
(5, 6, 21, 0, 1),
(5, 6, 22, 0, 1),
(5, 6, 23, 0, 0),
(5, 6, 24, 0, 0),
(5, 6, 25, 0, 0),
(5, 6, 26, 0, 0),
(5, 6, 27, 0, 0),
(5, 6, 28, 0, 0),
(5, 6, 29, 0, 0),
(5, 6, 30, 0, 0),
(5, 6, 31, 0, 0),
(5, 6, 32, 0, 0),
(5, 6, 33, 0, 0),
(5, 6, 34, 0, 0),
(5, 6, 35, 0, 0),
(5, 6, 36, 0, 0),
(5, 7, 37, 0, 0),
(5, 7, 38, 0, 0),
(5, 7, 39, 0, 0),
(5, 7, 40, 0, 0),
(5, 7, 41, 0, 0),
(5, 7, 42, 0, 0),
(5, 7, 43, 0, 0),
(5, 7, 44, 0, 0),
(5, 7, 45, 0, 0),
(5, 7, 46, 0, 0),
(5, 7, 47, 0, 0),
(5, 7, 48, 0, 0),
(5, 7, 49, 0, 0),
(5, 7, 50, 0, 0),
(5, 7, 51, 0, 0),
(5, 7, 52, 0, 0),
(5, 7, 53, 0, 0),
(5, 7, 54, 0, 0),
(5, 7, 55, 0, 0),
(5, 7, 56, 0, 1),
(5, 7, 57, 0, 1),
(5, 7, 58, 0, 0),
(5, 7, 59, 0, 0),
(5, 7, 60, 0, 0),
(5, 7, 61, 0, 0),
(5, 7, 62, 0, 0),
(5, 7, 63, 0, 0),
(5, 7, 64, 0, 0),
(5, 7, 65, 0, 0),
(5, 4, 66, 0, 0),
(5, 4, 67, 0, 0),
(5, 4, 68, 0, 0),
(5, 4, 69, 0, 0),
(5, 4, 70, 0, 0),
(5, 4, 71, 0, 0),
(5, 4, 72, 0, 0),
(5, 4, 73, 0, 0),
(5, 4, 74, 0, 0),
(5, 4, 75, 0, 0),
(5, 4, 76, 0, 0),
(5, 4, 77, 0, 0),
(5, 4, 78, 0, 0),
(5, 4, 79, 0, 0),
(5, 4, 80, 0, 0),
(5, 4, 81, 0, 0),
(5, 4, 82, 0, 0),
(5, 4, 83, 0, 0),
(5, 4, 84, 0, 0),
(5, 4, 85, 0, 0),
(5, 4, 86, 0, 0),
(5, 4, 87, 0, 0),
(5, 4, 88, 0, 0),
(5, 4, 89, 0, 0),
(5, 4, 90, 0, 1),
(5, 4, 91, 0, 1),
(5, 4, 92, 0, 0),
(5, 4, 93, 0, 0),
(5, 4, 94, 0, 0),
(5, 4, 95, 0, 0),
(5, 4, 96, 0, 0),
(5, 4, 97, 0, 0),
(5, 4, 98, 0, 0),
(5, 4, 99, 0, 0),
(5, 4, 100, 0, 0),
(5, 4, 101, 0, 0),
(5, 4, 102, 0, 0),
(5, 4, 103, 0, 0),
(5, 4, 104, 0, 0),
(5, 4, 105, 0, 0),
(5, 4, 106, 0, 0),
(5, 4, 107, 0, 0),
(5, 4, 108, 0, 0),
(5, 4, 109, 0, 0),
(5, 2, 110, 0, 0),
(5, 2, 111, 0, 0),
(5, 2, 112, 0, 0),
(5, 2, 113, 0, 0),
(5, 2, 114, 0, 0),
(5, 2, 115, 0, 0),
(5, 2, 116, 0, 0),
(5, 2, 117, 0, 0),
(5, 2, 118, 0, 0),
(5, 2, 119, 0, 0),
(5, 2, 120, 0, 0),
(5, 2, 121, 0, 0),
(5, 2, 122, 0, 1),
(5, 2, 123, 0, 1),
(5, 2, 124, 0, 0),
(5, 2, 125, 0, 0),
(5, 26, 126, 0, 0),
(5, 26, 127, 0, 0),
(5, 26, 128, 0, 0),
(5, 26, 129, 0, 0),
(5, 26, 130, 0, 0),
(5, 26, 131, 0, 0),
(5, 26, 132, 0, 0),
(5, 26, 133, 0, 0),
(5, 26, 134, 0, 0),
(5, 26, 135, 0, 0),
(5, 26, 136, 0, 0),
(5, 26, 137, 0, 1),
(5, 26, 138, 0, 1),
(5, 26, 139, 0, 0),
(5, 26, 140, 0, 0),
(5, 26, 141, 0, 0),
(5, 26, 142, 0, 0),
(5, 26, 143, 0, 0),
(5, 26, 144, 0, 0),
(5, 26, 145, 0, 0),
(5, 26, 146, 0, 0),
(5, 26, 147, 0, 0),
(5, 26, 148, 0, 0),
(5, 26, 149, 0, 0),
(5, 26, 150, 0, 0),
(5, 13, 155, 0, 0),
(5, 13, 156, 0, 0),
(5, 13, 157, 0, 0),
(5, 13, 158, 0, 0),
(5, 13, 159, 0, 0),
(5, 13, 160, 0, 0),
(5, 13, 161, 0, 0),
(5, 13, 162, 0, 0),
(5, 13, 163, 0, 0),
(5, 13, 164, 0, 0),
(5, 13, 165, 0, 0),
(5, 13, 166, 0, 1),
(5, 13, 167, 0, 1),
(5, 13, 168, 0, 0),
(5, 13, 169, 0, 0),
(5, 13, 170, 0, 0),
(5, 13, 171, 0, 0),
(5, 14, 173, 0, 0),
(5, 14, 174, 0, 0),
(5, 14, 175, 0, 0),
(5, 14, 176, 0, 0),
(5, 14, 177, 0, 0),
(5, 14, 178, 0, 0),
(5, 14, 179, 0, 0),
(5, 14, 180, 0, 0),
(5, 14, 181, 0, 0),
(5, 14, 182, 0, 0),
(5, 14, 183, 0, 0),
(5, 14, 184, 0, 0),
(5, 14, 185, 0, 0),
(5, 14, 186, 0, 0),
(5, 14, 187, 0, 0),
(5, 14, 188, 0, 0),
(5, 14, 189, 0, 0),
(5, 14, 190, 0, 1),
(5, 14, 191, 0, 1),
(5, 14, 192, 0, 0),
(5, 14, 193, 0, 0),
(5, 14, 194, 0, 0),
(5, 14, 195, 0, 0),
(5, 14, 196, 0, 0),
(5, 14, 197, 0, 0),
(5, 14, 198, 0, 0),
(5, 14, 199, 0, 0),
(5, 14, 200, 0, 0),
(5, 14, 201, 0, 0),
(5, 14, 202, 0, 0),
(5, 14, 203, 0, 0),
(5, 8, 204, 0, 0),
(5, 8, 205, 0, 1),
(5, 8, 206, 0, 1),
(5, 8, 207, 0, 0),
(5, 8, 208, 0, 0),
(5, 8, 209, 0, 0),
(5, 8, 210, 0, 1),
(5, 8, 211, 0, 1),
(5, 8, 212, 0, 0),
(5, 8, 213, 0, 0),
(5, 8, 214, 0, 0),
(5, 8, 215, 0, 1),
(5, 8, 216, 0, 0),
(5, 8, 217, 0, 0),
(5, 8, 218, 0, 0),
(5, 10, 219, 0, 0),
(5, 10, 220, 0, 0),
(5, 10, 221, 0, 0),
(5, 10, 222, 0, 0),
(5, 10, 223, 0, 0),
(5, 10, 224, 0, 0),
(5, 10, 225, 0, 0),
(5, 10, 226, 0, 0),
(5, 10, 227, 0, 0),
(5, 10, 228, 0, 1),
(5, 10, 229, 0, 0),
(5, 10, 230, 0, 0),
(5, 9, 231, 0, 0),
(5, 9, 232, 0, 0),
(5, 9, 233, 0, 0),
(5, 9, 234, 0, 0),
(5, 9, 235, 0, 0),
(5, 9, 236, 0, 0),
(5, 9, 237, 0, 0),
(5, 9, 238, 0, 0),
(5, 9, 239, 0, 0),
(5, 9, 240, 0, 0),
(5, 9, 241, 0, 0),
(5, 9, 242, 0, 0),
(5, 9, 243, 0, 1),
(5, 9, 244, 0, 1),
(5, 9, 245, 0, 0),
(5, 9, 246, 0, 0),
(5, 9, 247, 0, 0),
(5, 9, 248, 0, 0),
(5, 9, 249, 0, 0),
(5, 9, 250, 0, 0),
(5, 9, 251, 0, 0),
(5, 9, 252, 0, 0),
(5, 9, 253, 0, 0),
(5, 9, 254, 0, 0),
(5, 16, 255, 0, 0),
(5, 16, 256, 0, 0),
(5, 16, 257, 0, 0),
(5, 16, 258, 0, 0),
(5, 16, 259, 0, 0),
(5, 16, 260, 0, 0),
(5, 16, 261, 0, 0),
(5, 16, 262, 0, 0),
(5, 16, 263, 0, 0),
(5, 16, 264, 0, 0),
(5, 16, 265, 0, 0),
(5, 16, 266, 0, 0),
(5, 16, 267, 0, 0),
(5, 16, 268, 0, 0),
(5, 16, 269, 0, 1),
(5, 16, 270, 0, 1),
(5, 16, 271, 0, 0),
(5, 16, 272, 0, 0),
(5, 16, 273, 0, 0),
(5, 16, 274, 0, 0),
(5, 16, 275, 0, 0),
(5, 16, 276, 0, 0),
(5, 16, 277, 0, 0),
(5, 15, 278, 0, 0),
(5, 15, 279, 0, 0),
(5, 15, 280, 0, 0),
(5, 15, 281, 0, 0),
(5, 15, 282, 0, 0),
(5, 15, 283, 0, 0),
(5, 15, 285, 0, 1),
(5, 15, 286, 0, 1),
(5, 15, 287, 0, 0),
(5, 18, 288, 0, 0),
(5, 18, 289, 0, 0),
(5, 18, 290, 0, 0),
(5, 18, 291, 0, 0),
(5, 18, 292, 0, 0),
(5, 18, 293, 0, 0),
(5, 18, 294, 0, 0),
(5, 18, 295, 0, 1),
(5, 18, 296, 0, 1),
(5, 18, 297, 0, 0),
(5, 18, 298, 0, 0),
(5, 18, 299, 0, 0),
(5, 18, 300, 0, 0),
(5, 18, 301, 0, 0),
(5, 18, 302, 0, 0),
(5, 18, 303, 0, 0),
(5, 18, 304, 0, 0),
(5, 19, 305, 0, 0),
(5, 19, 306, 0, 0),
(5, 19, 307, 0, 0),
(5, 19, 308, 0, 1),
(5, 19, 309, 0, 1),
(5, 19, 310, 0, 0),
(5, 19, 311, 0, 0),
(5, 19, 312, 0, 0),
(5, 20, 313, 0, 0),
(5, 20, 314, 0, 0),
(5, 20, 315, 0, 0),
(5, 20, 316, 0, 0),
(5, 20, 317, 0, 0),
(5, 20, 318, 0, 0),
(5, 20, 319, 0, 0),
(5, 20, 320, 0, 0),
(5, 20, 321, 0, 0),
(5, 20, 322, 0, 0),
(5, 20, 323, 0, 0),
(5, 20, 324, 0, 0),
(5, 20, 325, 0, 0),
(5, 20, 326, 0, 0),
(5, 20, 327, 0, 0),
(5, 20, 328, 0, 0),
(5, 20, 329, 0, 0),
(5, 20, 330, 0, 0),
(5, 20, 331, 0, 1),
(5, 20, 332, 0, 1),
(5, 20, 333, 0, 0),
(5, 20, 334, 0, 0),
(5, 20, 335, 0, 0),
(5, 20, 336, 0, 0),
(5, 20, 337, 0, 0),
(5, 20, 338, 0, 0),
(5, 20, 339, 0, 0),
(5, 20, 340, 0, 0),
(5, 20, 341, 0, 0),
(5, 20, 342, 0, 0),
(5, 20, 343, 0, 0),
(5, 20, 344, 0, 0),
(5, 20, 345, 0, 0),
(5, 20, 346, 0, 0),
(5, 20, 347, 0, 0),
(5, 20, 348, 0, 0),
(5, 20, 349, 0, 0),
(5, 21, 350, 0, 0),
(5, 21, 351, 0, 0),
(5, 21, 352, 0, 0),
(5, 21, 353, 0, 0),
(5, 21, 354, 0, 0),
(5, 21, 355, 0, 0),
(5, 21, 356, 0, 0),
(5, 21, 357, 0, 0),
(5, 21, 358, 0, 0),
(5, 21, 359, 0, 0),
(5, 21, 360, 0, 0),
(5, 21, 361, 0, 0),
(5, 21, 362, 0, 0),
(5, 21, 363, 0, 0),
(5, 21, 364, 0, 0),
(5, 21, 365, 0, 0),
(5, 21, 366, 0, 0),
(5, 21, 367, 0, 0),
(5, 21, 368, 0, 0),
(5, 21, 369, 0, 1),
(5, 21, 370, 0, 1),
(5, 21, 371, 0, 0),
(5, 21, 372, 0, 0),
(5, 21, 373, 0, 0),
(5, 21, 374, 0, 0),
(5, 21, 375, 0, 0),
(5, 21, 376, 0, 0),
(5, 21, 377, 0, 0),
(5, 21, 378, 0, 0),
(5, 21, 379, 0, 0),
(5, 21, 380, 0, 0),
(5, 21, 381, 0, 0),
(5, 21, 382, 0, 0),
(5, 21, 383, 0, 0),
(5, 21, 384, 0, 0),
(5, 21, 385, 0, 0),
(5, 21, 386, 0, 0),
(5, 21, 387, 0, 0),
(5, 22, 388, 0, 0),
(5, 22, 389, 0, 0),
(5, 22, 390, 0, 0),
(5, 22, 391, 0, 0),
(5, 22, 392, 0, 0),
(5, 22, 393, 0, 0),
(5, 22, 394, 0, 0),
(5, 22, 395, 0, 0),
(5, 22, 396, 0, 0),
(5, 22, 397, 0, 0),
(5, 22, 398, 0, 0),
(5, 22, 399, 0, 0),
(5, 22, 400, 0, 0),
(5, 22, 401, 0, 0),
(5, 22, 402, 0, 0),
(5, 22, 403, 0, 0),
(5, 22, 404, 0, 0),
(5, 22, 405, 0, 0),
(5, 22, 406, 0, 0),
(5, 22, 407, 0, 0),
(5, 22, 408, 0, 0),
(5, 22, 409, 0, 0),
(5, 22, 410, 0, 1),
(5, 22, 411, 0, 1),
(5, 22, 412, 0, 0),
(5, 22, 413, 0, 0),
(5, 22, 414, 0, 0),
(5, 22, 415, 0, 0),
(5, 22, 416, 0, 0),
(5, 22, 417, 0, 0),
(5, 22, 418, 0, 0),
(5, 22, 419, 0, 0),
(5, 22, 420, 0, 0),
(5, 22, 421, 0, 0),
(5, 22, 422, 0, 0),
(5, 22, 423, 0, 0),
(5, 22, 424, 0, 0),
(5, 22, 425, 0, 0),
(5, 22, 426, 0, 0),
(5, 22, 427, 0, 0),
(5, 22, 428, 0, 0),
(5, 22, 429, 0, 0),
(5, 22, 430, 0, 0),
(5, 22, 431, 0, 0),
(5, 22, 432, 0, 0),
(5, 22, 433, 0, 0),
(5, 22, 434, 0, 0),
(5, 23, 435, 0, 0),
(5, 23, 436, 0, 0),
(5, 23, 437, 0, 0),
(5, 23, 438, 0, 0),
(5, 23, 439, 0, 0),
(5, 23, 440, 0, 0),
(5, 23, 441, 0, 0),
(5, 23, 442, 0, 0),
(5, 23, 443, 0, 0),
(5, 23, 444, 0, 0),
(5, 23, 445, 0, 0),
(5, 23, 446, 0, 0),
(5, 23, 447, 0, 0),
(5, 23, 448, 0, 0),
(5, 23, 449, 0, 0),
(5, 23, 450, 0, 0),
(5, 23, 451, 0, 0),
(5, 23, 452, 0, 0),
(5, 23, 453, 0, 0),
(5, 23, 454, 0, 1),
(5, 23, 455, 0, 1),
(5, 23, 456, 0, 0),
(5, 23, 457, 0, 0),
(5, 23, 458, 0, 0),
(5, 23, 459, 0, 0),
(5, 23, 460, 0, 0),
(5, 23, 461, 0, 0),
(5, 23, 462, 0, 0),
(5, 23, 463, 0, 0),
(5, 23, 464, 0, 0),
(5, 23, 465, 0, 0),
(5, 23, 466, 0, 0),
(5, 23, 467, 0, 0),
(5, 23, 468, 0, 0),
(5, 23, 469, 0, 0),
(5, 23, 470, 0, 0),
(5, 23, 471, 0, 0),
(5, 23, 472, 0, 0),
(5, 23, 473, 0, 0),
(5, 29, 474, 0, 0),
(5, 29, 478, 0, 0),
(5, 29, 479, 0, 0),
(5, 29, 481, 0, 0),
(5, 29, 488, 0, 0),
(5, 29, 489, 0, 0),
(5, 29, 490, 0, 0),
(5, 29, 491, 0, 0),
(5, 29, 493, 0, 0),
(5, 29, 494, 0, 0),
(5, 29, 495, 0, 0),
(5, 29, 496, 0, 0),
(5, 29, 497, 0, 0),
(5, 29, 502, 0, 0),
(5, 29, 503, 0, 0),
(5, 29, 504, 0, 0),
(5, 29, 505, 0, 0),
(5, 10, 518, 0, 0),
(5, 10, 519, 0, 0),
(5, 10, 520, 0, 0),
(5, 10, 521, 0, 0),
(5, 10, 522, 0, 0),
(5, 10, 523, 0, 0),
(5, 34, 524, 0, 0),
(5, 34, 525, 0, 1),
(5, 34, 526, 0, 1),
(5, 34, 527, 0, 0),
(5, 34, 528, 0, 1),
(5, 34, 529, 0, 0),
(5, 34, 530, 0, 0),
(5, 34, 531, 0, 0),
(5, 34, 532, 0, 0),
(5, 34, 533, 0, 0),
(5, 34, 534, 0, 0),
(5, 34, 535, 0, 1),
(5, 34, 536, 0, 1),
(5, 34, 537, 0, 0),
(5, 34, 538, 0, 0),
(5, 34, 539, 0, 0),
(5, 34, 540, 0, 1),
(5, 34, 541, 0, 0),
(5, 34, 542, 0, 0),
(5, 35, 543, 0, 0),
(5, 35, 544, 0, 0),
(5, 35, 545, 0, 0),
(5, 35, 546, 0, 0),
(5, 35, 547, 0, 0),
(5, 35, 548, 0, 0),
(5, 35, 549, 0, 0),
(5, 35, 550, 0, 0),
(5, 35, 551, 0, 1),
(5, 35, 552, 0, 1),
(5, 35, 553, 0, 0),
(5, 35, 554, 0, 0),
(5, 35, 555, 0, 0),
(5, 35, 556, 0, 0),
(5, 35, 557, 0, 0),
(5, 35, 558, 0, 0),
(5, 35, 559, 0, 0),
(5, 35, 560, 0, 0),
(5, 35, 561, 0, 0),
(5, 37, 562, 0, 0),
(5, 37, 563, 0, 0),
(5, 37, 564, 0, 0),
(5, 37, 565, 0, 0),
(5, 37, 566, 0, 0),
(5, 37, 567, 0, 0),
(5, 37, 568, 0, 0),
(5, 37, 569, 0, 0),
(5, 37, 570, 0, 0),
(5, 37, 571, 0, 0),
(5, 37, 572, 0, 0),
(5, 37, 573, 0, 0),
(5, 37, 574, 0, 0),
(5, 37, 575, 0, 0),
(5, 37, 576, 0, 1),
(5, 37, 577, 0, 1),
(5, 37, 578, 0, 0),
(5, 37, 579, 0, 0),
(5, 41, 580, 0, 0),
(5, 41, 581, 0, 0),
(5, 41, 582, 0, 1),
(5, 41, 583, 0, 1),
(5, 41, 584, 0, 0),
(5, 41, 585, 0, 1),
(5, 41, 586, 0, 0),
(5, 42, 587, 0, 0),
(5, 42, 588, 0, 0),
(5, 42, 589, 0, 0),
(5, 42, 590, 0, 0),
(5, 42, 591, 0, 0),
(5, 42, 592, 0, 0),
(5, 42, 593, 0, 1),
(5, 42, 594, 0, 1),
(5, 42, 595, 0, 0),
(5, 42, 596, 0, 0),
(5, 43, 597, 0, 0),
(5, 43, 598, 0, 0),
(5, 43, 599, 0, 0),
(5, 43, 600, 0, 0),
(5, 43, 601, 0, 0),
(5, 43, 602, 0, 0),
(5, 43, 603, 0, 0),
(5, 43, 604, 0, 0),
(5, 43, 605, 0, 0),
(5, 43, 606, 0, 0),
(5, 43, 607, 0, 0),
(5, 43, 608, 0, 1),
(5, 43, 609, 0, 1),
(5, 43, 610, 0, 0),
(5, 43, 611, 0, 0),
(5, 44, 612, 0, 0),
(5, 44, 613, 0, 0),
(5, 44, 614, 0, 0),
(5, 44, 615, 0, 0),
(5, 44, 616, 0, 0),
(5, 44, 617, 0, 0),
(5, 44, 618, 0, 0),
(5, 44, 619, 0, 0),
(5, 44, 620, 0, 0),
(5, 44, 621, 0, 0),
(5, 44, 622, 0, 0),
(5, 44, 623, 0, 0),
(5, 44, 624, 0, 0),
(5, 44, 625, 0, 1),
(5, 44, 626, 0, 1),
(5, 44, 627, 0, 0),
(5, 44, 628, 0, 0),
(5, 46, 629, 0, 0),
(5, 46, 630, 0, 1),
(5, 46, 631, 0, 1),
(5, 46, 632, 0, 0),
(5, 46, 633, 0, 0),
(5, 2, 634, 0, 0),
(5, 23, 636, 0, 1),
(5, 23, 637, 0, 1),
(5, 23, 638, 0, 1),
(5, 23, 639, 0, 1),
(5, 23, 640, 0, 1),
(5, 23, 641, 0, 1),
(5, 23, 642, 0, 1),
(5, 23, 643, 0, 1),
(5, 23, 644, 0, 1),
(5, 22, 645, 0, 1),
(5, 22, 646, 0, 1),
(5, 22, 647, 0, 1),
(5, 22, 648, 0, 1),
(5, 22, 649, 0, 1),
(5, 22, 650, 0, 1),
(5, 22, 651, 0, 1),
(5, 22, 652, 0, 1),
(5, 22, 653, 0, 1),
(5, 21, 654, 0, 1),
(5, 21, 655, 0, 1),
(5, 21, 656, 0, 1),
(5, 21, 657, 0, 1),
(5, 21, 658, 0, 1),
(5, 21, 659, 0, 1),
(5, 21, 660, 0, 1),
(5, 21, 661, 0, 1),
(5, 21, 662, 0, 1),
(5, 20, 663, 0, 1),
(5, 20, 664, 0, 1),
(5, 20, 665, 0, 1),
(5, 20, 666, 0, 1),
(5, 20, 667, 0, 1),
(5, 20, 668, 0, 1),
(5, 20, 669, 0, 1),
(5, 20, 670, 0, 1),
(5, 20, 671, 0, 1),
(5, 43, 673, 0, 0),
(5, 41, 674, 0, 0),
(5, 23, 678, 0, 0),
(5, 22, 679, 0, 0),
(5, 21, 680, 0, 0),
(5, 20, 681, 0, 0),
(5, 6, 683, 0, 1),
(5, 4, 684, 0, 1),
(5, 2, 685, 0, 1),
(5, 23, 687, 0, 0),
(5, 23, 688, 0, 0),
(5, 21, 689, 0, 0),
(5, 21, 690, 0, 0),
(5, 18, 691, 0, 0),
(5, 7, 692, 0, 0),
(5, 41, 693, 0, 0),
(5, 41, 694, 0, 0),
(5, 23, 695, 0, 1),
(5, 20, 696, 0, 1),
(5, 21, 697, 0, 1),
(5, 22, 698, 0, 1),
(5, 2, 700, 0, 0),
(5, 13, 701, 0, 0),
(5, 13, 703, 0, 0),
(5, 2, 707, 0, 1),
(5, 4, 708, 0, 1),
(5, 6, 709, 0, 1),
(5, 7, 710, 0, 1),
(5, 9, 712, 0, 1),
(5, 13, 713, 0, 1),
(5, 18, 717, 0, 1),
(5, 21, 720, 0, 1),
(5, 23, 722, 0, 1),
(5, 41, 727, 0, 1),
(5, 42, 728, 0, 1),
(5, 43, 729, 0, 1),
(5, 44, 730, 0, 1),
(5, 29, 732, 0, 0),
(5, 2, 734, 0, 0),
(6, 6, 1, 0, 0),
(6, 6, 2, 0, 0),
(6, 6, 3, 0, 0),
(6, 6, 4, 0, 0),
(6, 6, 5, 0, 0),
(6, 6, 9, 0, 0),
(6, 6, 13, 0, 0),
(6, 6, 14, 0, 0),
(6, 6, 19, 0, 0),
(6, 6, 20, 0, 0),
(6, 6, 21, 0, 1),
(6, 6, 22, 0, 1),
(6, 6, 23, 0, 0),
(6, 6, 25, 0, 0),
(6, 6, 27, 0, 0),
(6, 6, 29, 0, 0),
(6, 6, 30, 0, 0),
(6, 6, 32, 0, 0),
(6, 6, 35, 0, 0),
(6, 6, 36, 0, 0),
(6, 4, 66, 0, 0),
(6, 4, 67, 0, 0),
(6, 4, 68, 0, 0),
(6, 4, 69, 0, 0),
(6, 4, 70, 0, 0),
(6, 4, 71, 0, 0),
(6, 4, 72, 0, 0),
(6, 4, 73, 0, 0),
(6, 4, 74, 0, 0),
(6, 4, 75, 0, 0),
(6, 4, 76, 0, 0),
(6, 4, 77, 0, 0),
(6, 4, 78, 0, 0),
(6, 4, 79, 0, 0),
(6, 4, 80, 0, 0),
(6, 4, 81, 0, 0),
(6, 4, 82, 0, 0),
(6, 4, 83, 0, 0),
(6, 4, 84, 0, 0),
(6, 4, 85, 0, 0),
(6, 4, 86, 0, 0),
(6, 4, 87, 0, 0),
(6, 4, 88, 0, 0),
(6, 4, 89, 0, 0),
(6, 4, 90, 0, 1),
(6, 4, 91, 0, 1),
(6, 4, 92, 0, 0),
(6, 4, 93, 0, 0),
(6, 4, 94, 0, 0),
(6, 4, 95, 0, 0),
(6, 4, 96, 0, 0),
(6, 4, 97, 0, 0),
(6, 4, 98, 0, 0),
(6, 4, 99, 0, 0),
(6, 4, 100, 0, 0),
(6, 4, 101, 0, 0),
(6, 4, 102, 0, 0),
(6, 4, 103, 0, 0),
(6, 4, 104, 0, 0),
(6, 4, 105, 0, 0),
(6, 4, 106, 0, 0),
(6, 4, 107, 0, 0),
(6, 4, 108, 0, 0),
(6, 4, 109, 0, 0),
(6, 13, 155, 0, 0),
(6, 13, 156, 0, 0),
(6, 13, 157, 0, 0),
(6, 13, 158, 0, 0),
(6, 13, 159, 0, 0),
(6, 13, 160, 0, 0),
(6, 13, 161, 0, 0),
(6, 13, 162, 0, 0),
(6, 13, 163, 0, 0),
(6, 13, 164, 0, 0),
(6, 13, 165, 0, 0),
(6, 13, 166, 0, 1),
(6, 13, 167, 0, 1),
(6, 13, 168, 0, 0),
(6, 13, 169, 0, 0),
(6, 13, 170, 0, 0),
(6, 13, 171, 0, 0),
(6, 14, 173, 0, 0),
(6, 14, 174, 0, 0),
(6, 14, 175, 0, 0),
(6, 14, 176, 0, 0),
(6, 14, 177, 0, 0),
(6, 14, 178, 0, 0),
(6, 14, 179, 0, 0),
(6, 14, 180, 0, 0),
(6, 14, 181, 0, 0),
(6, 14, 182, 0, 0),
(6, 14, 183, 0, 0),
(6, 14, 184, 0, 0),
(6, 14, 185, 0, 0),
(6, 14, 186, 0, 0),
(6, 14, 187, 0, 0),
(6, 14, 188, 0, 0),
(6, 14, 189, 0, 0),
(6, 14, 190, 0, 1),
(6, 14, 191, 0, 1),
(6, 14, 192, 0, 0),
(6, 14, 193, 0, 0),
(6, 14, 194, 0, 0),
(6, 14, 195, 0, 0),
(6, 14, 196, 0, 0),
(6, 14, 197, 0, 0),
(6, 14, 198, 0, 0),
(6, 14, 199, 0, 0),
(6, 14, 200, 0, 0),
(6, 14, 201, 0, 0),
(6, 14, 202, 0, 0),
(6, 14, 203, 0, 0),
(6, 8, 204, 0, 0),
(6, 8, 205, 0, 1),
(6, 8, 206, 0, 1),
(6, 8, 207, 0, 0),
(6, 8, 208, 0, 0),
(6, 8, 209, 0, 0),
(6, 8, 210, 0, 1),
(6, 8, 211, 0, 1),
(6, 8, 212, 0, 0),
(6, 8, 213, 0, 0),
(6, 8, 214, 0, 0),
(6, 8, 215, 0, 1),
(6, 8, 216, 0, 0),
(6, 8, 217, 0, 0),
(6, 8, 218, 0, 0),
(6, 10, 219, 0, 0),
(6, 10, 220, 0, 0),
(6, 10, 221, 0, 0),
(6, 10, 222, 0, 0),
(6, 10, 223, 0, 0),
(6, 10, 224, 0, 0),
(6, 10, 225, 0, 0),
(6, 10, 226, 0, 0),
(6, 10, 227, 0, 0),
(6, 10, 228, 0, 1),
(6, 10, 229, 0, 0),
(6, 10, 230, 0, 0),
(6, 9, 231, 0, 0),
(6, 9, 232, 0, 0),
(6, 9, 233, 0, 0),
(6, 9, 234, 0, 0),
(6, 9, 235, 0, 0),
(6, 9, 236, 0, 0),
(6, 9, 237, 0, 0),
(6, 9, 238, 0, 0),
(6, 9, 239, 0, 0),
(6, 9, 240, 0, 0),
(6, 9, 241, 0, 0),
(6, 9, 242, 0, 0),
(6, 9, 243, 0, 1),
(6, 9, 244, 0, 1),
(6, 9, 245, 0, 0),
(6, 9, 246, 0, 0),
(6, 9, 247, 0, 0),
(6, 9, 248, 0, 0),
(6, 9, 249, 0, 0),
(6, 9, 250, 0, 0),
(6, 9, 251, 0, 0),
(6, 9, 252, 0, 0),
(6, 9, 253, 0, 0),
(6, 9, 254, 0, 0),
(6, 16, 255, 0, 0),
(6, 16, 256, 0, 0),
(6, 16, 257, 0, 0),
(6, 16, 258, 0, 0),
(6, 16, 259, 0, 0),
(6, 16, 260, 0, 0),
(6, 16, 261, 0, 0),
(6, 16, 262, 0, 0),
(6, 16, 263, 0, 0),
(6, 16, 264, 0, 0),
(6, 16, 265, 0, 0),
(6, 16, 266, 0, 0),
(6, 16, 267, 0, 0),
(6, 16, 268, 0, 0),
(6, 16, 269, 0, 1),
(6, 16, 270, 0, 1),
(6, 16, 271, 0, 0),
(6, 16, 272, 0, 0),
(6, 16, 273, 0, 0),
(6, 16, 274, 0, 0),
(6, 16, 275, 0, 0),
(6, 16, 276, 0, 0),
(6, 16, 277, 0, 0),
(6, 15, 278, 0, 0),
(6, 15, 279, 0, 0),
(6, 15, 280, 0, 0),
(6, 15, 281, 0, 0),
(6, 15, 282, 0, 0),
(6, 15, 283, 0, 0),
(6, 15, 285, 0, 1),
(6, 15, 286, 0, 1),
(6, 15, 287, 0, 0),
(6, 18, 288, 0, 0),
(6, 18, 289, 0, 0),
(6, 18, 290, 0, 0),
(6, 18, 291, 0, 0),
(6, 18, 292, 0, 0),
(6, 18, 293, 0, 0),
(6, 18, 294, 0, 0),
(6, 18, 295, 0, 1),
(6, 18, 296, 0, 1),
(6, 18, 297, 0, 0),
(6, 18, 298, 0, 0),
(6, 18, 299, 0, 0),
(6, 18, 300, 0, 0),
(6, 18, 301, 0, 0),
(6, 18, 302, 0, 0),
(6, 18, 303, 0, 0),
(6, 18, 304, 0, 0),
(6, 21, 350, 0, 0),
(6, 21, 351, 0, 0),
(6, 21, 352, 0, 0),
(6, 21, 353, 0, 0),
(6, 21, 354, 0, 0),
(6, 21, 355, 0, 0),
(6, 21, 356, 0, 0),
(6, 21, 357, 0, 0),
(6, 21, 358, 0, 0),
(6, 21, 359, 0, 0),
(6, 21, 360, 0, 0),
(6, 21, 361, 0, 0),
(6, 21, 362, 0, 0),
(6, 21, 363, 0, 0),
(6, 21, 364, 0, 0),
(6, 21, 365, 0, 0),
(6, 21, 366, 0, 0),
(6, 21, 367, 0, 0),
(6, 21, 368, 0, 0),
(6, 21, 369, 0, 1),
(6, 21, 370, 0, 1),
(6, 21, 371, 0, 0),
(6, 21, 372, 0, 0),
(6, 21, 373, 0, 0),
(6, 21, 374, 0, 0),
(6, 21, 375, 0, 0),
(6, 21, 376, 0, 0),
(6, 21, 377, 0, 0),
(6, 21, 378, 0, 0),
(6, 21, 379, 0, 0),
(6, 21, 380, 0, 0),
(6, 21, 381, 0, 0),
(6, 21, 382, 0, 0),
(6, 21, 383, 0, 0),
(6, 21, 384, 0, 0),
(6, 21, 385, 0, 0),
(6, 21, 386, 0, 0),
(6, 21, 387, 0, 0),
(6, 22, 388, 0, 0),
(6, 22, 389, 0, 0),
(6, 22, 390, 0, 0),
(6, 22, 391, 0, 0),
(6, 22, 392, 0, 0),
(6, 22, 393, 0, 0),
(6, 22, 394, 0, 0),
(6, 22, 395, 0, 0),
(6, 22, 396, 0, 0),
(6, 22, 397, 0, 0),
(6, 22, 398, 0, 0),
(6, 22, 399, 0, 0),
(6, 22, 400, 0, 0),
(6, 22, 401, 0, 0),
(6, 22, 402, 0, 0),
(6, 22, 403, 0, 0),
(6, 22, 404, 0, 0),
(6, 22, 405, 0, 0),
(6, 22, 406, 0, 0),
(6, 22, 407, 0, 0),
(6, 22, 408, 0, 0),
(6, 22, 409, 0, 0),
(6, 22, 410, 0, 1),
(6, 22, 411, 0, 1),
(6, 22, 412, 0, 0),
(6, 22, 413, 0, 0),
(6, 22, 414, 0, 0),
(6, 22, 415, 0, 0),
(6, 22, 416, 0, 0),
(6, 22, 417, 0, 0),
(6, 22, 418, 0, 0),
(6, 22, 419, 0, 0),
(6, 22, 420, 0, 0),
(6, 22, 421, 0, 0),
(6, 22, 422, 0, 0),
(6, 22, 423, 0, 0),
(6, 22, 424, 0, 0),
(6, 22, 425, 0, 0),
(6, 22, 426, 0, 0),
(6, 22, 427, 0, 0),
(6, 22, 428, 0, 0),
(6, 22, 429, 0, 0),
(6, 22, 430, 0, 0),
(6, 22, 431, 0, 0),
(6, 22, 432, 0, 0),
(6, 22, 433, 0, 0),
(6, 22, 434, 0, 0),
(6, 23, 435, 0, 0),
(6, 23, 436, 0, 0),
(6, 23, 437, 0, 0),
(6, 23, 438, 0, 0),
(6, 23, 439, 0, 0),
(6, 23, 440, 0, 0),
(6, 23, 441, 0, 0),
(6, 23, 442, 0, 0),
(6, 23, 443, 0, 0),
(6, 23, 444, 0, 0),
(6, 23, 445, 0, 0),
(6, 23, 446, 0, 0),
(6, 23, 447, 0, 0),
(6, 23, 448, 0, 0),
(6, 23, 449, 0, 0),
(6, 23, 450, 0, 0),
(6, 23, 451, 0, 0),
(6, 23, 452, 0, 0),
(6, 23, 453, 0, 0),
(6, 23, 454, 0, 1),
(6, 23, 455, 0, 1),
(6, 23, 456, 0, 0),
(6, 23, 457, 0, 0),
(6, 23, 458, 0, 0),
(6, 23, 459, 0, 0),
(6, 23, 460, 0, 0),
(6, 23, 461, 0, 0),
(6, 23, 462, 0, 0),
(6, 23, 463, 0, 0),
(6, 23, 464, 0, 0),
(6, 23, 465, 0, 0),
(6, 23, 466, 0, 0),
(6, 23, 467, 0, 0),
(6, 23, 468, 0, 0),
(6, 23, 469, 0, 0),
(6, 23, 470, 0, 0),
(6, 23, 471, 0, 0),
(6, 23, 472, 0, 0),
(6, 23, 473, 0, 0),
(6, 29, 474, 0, 0),
(6, 29, 478, 0, 0),
(6, 29, 479, 0, 0),
(6, 29, 481, 0, 0),
(6, 29, 488, 0, 0),
(6, 29, 489, 0, 0),
(6, 29, 490, 0, 0),
(6, 29, 491, 0, 0),
(6, 29, 493, 0, 0),
(6, 29, 494, 0, 0),
(6, 29, 495, 0, 0),
(6, 29, 496, 0, 0),
(6, 29, 497, 0, 0),
(6, 29, 502, 0, 0),
(6, 29, 503, 0, 0),
(6, 29, 504, 0, 0),
(6, 29, 505, 0, 0),
(6, 10, 518, 0, 0),
(6, 10, 519, 0, 0),
(6, 10, 520, 0, 0),
(6, 10, 521, 0, 0),
(6, 10, 522, 0, 0),
(6, 10, 523, 0, 0),
(6, 34, 524, 0, 0),
(6, 34, 525, 0, 1),
(6, 34, 526, 0, 1),
(6, 34, 527, 0, 0),
(6, 34, 528, 0, 1),
(6, 34, 529, 0, 0),
(6, 34, 530, 0, 0),
(6, 34, 531, 0, 0),
(6, 34, 532, 0, 0),
(6, 34, 533, 0, 0),
(6, 34, 534, 0, 0),
(6, 34, 535, 0, 1),
(6, 34, 536, 0, 1),
(6, 34, 537, 0, 0),
(6, 34, 538, 0, 0),
(6, 34, 539, 0, 0),
(6, 34, 540, 0, 1),
(6, 34, 541, 0, 0),
(6, 34, 542, 0, 0),
(6, 35, 543, 0, 0),
(6, 35, 544, 0, 0),
(6, 35, 545, 0, 0),
(6, 35, 546, 0, 0),
(6, 35, 547, 0, 0),
(6, 35, 548, 0, 0),
(6, 35, 549, 0, 0),
(6, 35, 550, 0, 0),
(6, 35, 551, 0, 1),
(6, 35, 552, 0, 1),
(6, 35, 553, 0, 0),
(6, 35, 554, 0, 0),
(6, 35, 555, 0, 0),
(6, 35, 556, 0, 0),
(6, 35, 557, 0, 0),
(6, 35, 558, 0, 0),
(6, 35, 559, 0, 0),
(6, 35, 560, 0, 0),
(6, 35, 561, 0, 0),
(6, 37, 562, 0, 0),
(6, 37, 563, 0, 0),
(6, 37, 564, 0, 0),
(6, 37, 565, 0, 0),
(6, 37, 566, 0, 0),
(6, 37, 567, 0, 0),
(6, 37, 568, 0, 0),
(6, 37, 569, 0, 0),
(6, 37, 570, 0, 0),
(6, 37, 571, 0, 0),
(6, 37, 572, 0, 0),
(6, 37, 573, 0, 0),
(6, 37, 574, 0, 0),
(6, 37, 575, 0, 0),
(6, 37, 576, 0, 1),
(6, 37, 577, 0, 1),
(6, 37, 578, 0, 0),
(6, 37, 579, 0, 0),
(6, 41, 580, 0, 0),
(6, 41, 581, 0, 0),
(6, 41, 582, 0, 1),
(6, 41, 583, 0, 1),
(6, 41, 584, 0, 0),
(6, 41, 585, 0, 1),
(6, 41, 586, 0, 0),
(6, 42, 587, 0, 0),
(6, 42, 588, 0, 0),
(6, 42, 589, 0, 0),
(6, 42, 590, 0, 0),
(6, 42, 591, 0, 0),
(6, 42, 592, 0, 0),
(6, 42, 593, 0, 1),
(6, 42, 594, 0, 1),
(6, 42, 595, 0, 0),
(6, 42, 596, 0, 0),
(6, 43, 597, 0, 0),
(6, 43, 598, 0, 0),
(6, 43, 599, 0, 0),
(6, 43, 600, 0, 0),
(6, 43, 601, 0, 0),
(6, 43, 602, 0, 0),
(6, 43, 603, 0, 0),
(6, 43, 604, 0, 0),
(6, 43, 605, 0, 0),
(6, 43, 606, 0, 0),
(6, 43, 607, 0, 0),
(6, 43, 608, 0, 1),
(6, 43, 609, 0, 1),
(6, 43, 610, 0, 0),
(6, 43, 611, 0, 0),
(6, 44, 612, 0, 0),
(6, 44, 613, 0, 0),
(6, 44, 614, 0, 0),
(6, 44, 615, 0, 0),
(6, 44, 616, 0, 0),
(6, 44, 617, 0, 0),
(6, 44, 618, 0, 0),
(6, 44, 619, 0, 0),
(6, 44, 620, 0, 0),
(6, 44, 621, 0, 0),
(6, 44, 622, 0, 0),
(6, 44, 623, 0, 0),
(6, 44, 624, 0, 0),
(6, 44, 625, 0, 1),
(6, 44, 626, 0, 1),
(6, 44, 627, 0, 0),
(6, 44, 628, 0, 0),
(6, 46, 629, 0, 0),
(6, 46, 630, 0, 1),
(6, 46, 631, 0, 1),
(6, 46, 632, 0, 0),
(6, 46, 633, 0, 0),
(6, 23, 636, 0, 1),
(6, 23, 637, 0, 1),
(6, 23, 638, 0, 1),
(6, 23, 639, 0, 1),
(6, 23, 640, 0, 1),
(6, 23, 641, 0, 1),
(6, 23, 642, 0, 1),
(6, 23, 643, 0, 1),
(6, 23, 644, 0, 1),
(6, 22, 645, 0, 1),
(6, 22, 646, 0, 1),
(6, 22, 647, 0, 1),
(6, 22, 648, 0, 1),
(6, 22, 649, 0, 1),
(6, 22, 650, 0, 1),
(6, 22, 651, 0, 1),
(6, 22, 652, 0, 1),
(6, 22, 653, 0, 1),
(6, 21, 654, 0, 1),
(6, 21, 655, 0, 1),
(6, 21, 656, 0, 1),
(6, 21, 657, 0, 1),
(6, 21, 658, 0, 1),
(6, 21, 659, 0, 1),
(6, 21, 660, 0, 1),
(6, 21, 661, 0, 1),
(6, 21, 662, 0, 1),
(6, 43, 673, 0, 0),
(6, 41, 674, 0, 0),
(6, 23, 678, 0, 0),
(6, 22, 679, 0, 0),
(6, 21, 680, 0, 0),
(6, 6, 683, 0, 1),
(6, 4, 684, 0, 1),
(6, 23, 687, 0, 0),
(6, 23, 688, 0, 0),
(6, 21, 689, 0, 0),
(6, 21, 690, 0, 0),
(6, 18, 691, 0, 0),
(6, 41, 693, 0, 0),
(6, 41, 694, 0, 0),
(6, 23, 695, 0, 1),
(6, 21, 697, 0, 1),
(6, 22, 698, 0, 1),
(6, 13, 701, 0, 0),
(6, 13, 703, 0, 0),
(6, 4, 708, 0, 1),
(6, 6, 709, 0, 1),
(6, 9, 712, 0, 1),
(6, 13, 713, 0, 1),
(6, 18, 717, 0, 1),
(6, 21, 720, 0, 1),
(6, 23, 722, 0, 1),
(6, 41, 727, 0, 1),
(6, 42, 728, 0, 1),
(6, 43, 729, 0, 1),
(6, 44, 730, 0, 1),
(6, 29, 732, 0, 0),
(7, 6, 1, 0, 0),
(7, 6, 2, 0, 0),
(7, 6, 3, 0, 0),
(7, 6, 4, 0, 0),
(7, 6, 5, 0, 0),
(7, 6, 9, 0, 0),
(7, 6, 13, 0, 0),
(7, 6, 14, 0, 0),
(7, 6, 19, 0, 0),
(7, 6, 20, 0, 0),
(7, 6, 21, 0, 1),
(7, 6, 22, 0, 1),
(7, 6, 23, 0, 0),
(7, 6, 25, 0, 0),
(7, 6, 27, 0, 0),
(7, 6, 29, 0, 0),
(7, 6, 30, 0, 0),
(7, 6, 32, 0, 0),
(7, 6, 35, 0, 0),
(7, 6, 36, 0, 0),
(7, 4, 66, 0, 0),
(7, 4, 67, 0, 0),
(7, 4, 68, 0, 0),
(7, 4, 69, 0, 0),
(7, 4, 70, 0, 0),
(7, 4, 71, 0, 0),
(7, 4, 72, 0, 0),
(7, 4, 73, 0, 0),
(7, 4, 74, 0, 0),
(7, 4, 75, 0, 0),
(7, 4, 76, 0, 0),
(7, 4, 77, 0, 0),
(7, 4, 78, 0, 0),
(7, 4, 79, 0, 0),
(7, 4, 80, 0, 0),
(7, 4, 81, 0, 0),
(7, 4, 82, 0, 0),
(7, 4, 83, 0, 0),
(7, 4, 84, 0, 0),
(7, 4, 85, 0, 0),
(7, 4, 86, 0, 0),
(7, 4, 87, 0, 0),
(7, 4, 88, 0, 0),
(7, 4, 89, 0, 0),
(7, 4, 90, 0, 1),
(7, 4, 91, 0, 1),
(7, 4, 92, 0, 0),
(7, 4, 93, 0, 0),
(7, 4, 94, 0, 0),
(7, 4, 95, 0, 0),
(7, 4, 96, 0, 0),
(7, 4, 97, 0, 0),
(7, 4, 98, 0, 0),
(7, 4, 99, 0, 0),
(7, 4, 100, 0, 0),
(7, 4, 101, 0, 0),
(7, 4, 102, 0, 0),
(7, 4, 103, 0, 0),
(7, 4, 104, 0, 0),
(7, 4, 105, 0, 0),
(7, 4, 106, 0, 0),
(7, 4, 107, 0, 0),
(7, 4, 108, 0, 0),
(7, 4, 109, 0, 0),
(7, 13, 155, 0, 0),
(7, 13, 156, 0, 0),
(7, 13, 157, 0, 0),
(7, 13, 158, 0, 0),
(7, 13, 159, 0, 0),
(7, 13, 160, 0, 0),
(7, 13, 161, 0, 0),
(7, 13, 162, 0, 0),
(7, 13, 163, 0, 0),
(7, 13, 164, 0, 0),
(7, 13, 165, 0, 0),
(7, 13, 166, 0, 1),
(7, 13, 167, 0, 1),
(7, 13, 168, 0, 0),
(7, 13, 169, 0, 0),
(7, 13, 170, 0, 0),
(7, 13, 171, 0, 0),
(7, 14, 173, 0, 0),
(7, 14, 174, 0, 0),
(7, 14, 175, 0, 0),
(7, 14, 176, 0, 0),
(7, 14, 177, 0, 0),
(7, 14, 178, 0, 0),
(7, 14, 179, 0, 0),
(7, 14, 180, 0, 0),
(7, 14, 181, 0, 0),
(7, 14, 182, 0, 0),
(7, 14, 183, 0, 0),
(7, 14, 184, 0, 0),
(7, 14, 185, 0, 0),
(7, 14, 186, 0, 0),
(7, 14, 187, 0, 0),
(7, 14, 188, 0, 0),
(7, 14, 189, 0, 0),
(7, 14, 190, 0, 1),
(7, 14, 191, 0, 1),
(7, 14, 192, 0, 0),
(7, 14, 193, 0, 0),
(7, 14, 194, 0, 0),
(7, 14, 195, 0, 0),
(7, 14, 196, 0, 0),
(7, 14, 197, 0, 0),
(7, 14, 198, 0, 0),
(7, 14, 199, 0, 0),
(7, 14, 200, 0, 0),
(7, 14, 201, 0, 0),
(7, 14, 202, 0, 0),
(7, 14, 203, 0, 0),
(7, 8, 204, 0, 0),
(7, 8, 205, 0, 1),
(7, 8, 206, 0, 1),
(7, 8, 207, 0, 0),
(7, 8, 208, 0, 0),
(7, 8, 209, 0, 0),
(7, 8, 210, 0, 1),
(7, 8, 211, 0, 1),
(7, 8, 212, 0, 0),
(7, 8, 213, 0, 0),
(7, 8, 214, 0, 0),
(7, 8, 215, 0, 1),
(7, 8, 216, 0, 0),
(7, 8, 217, 0, 0),
(7, 8, 218, 0, 0),
(7, 10, 219, 0, 0),
(7, 10, 220, 0, 0),
(7, 10, 221, 0, 0),
(7, 10, 222, 0, 0),
(7, 10, 223, 0, 0),
(7, 10, 224, 0, 0),
(7, 10, 225, 0, 0),
(7, 10, 226, 0, 0),
(7, 10, 227, 0, 0),
(7, 10, 228, 0, 1),
(7, 10, 229, 0, 0),
(7, 10, 230, 0, 0),
(7, 9, 231, 0, 0),
(7, 9, 232, 0, 0),
(7, 9, 233, 0, 0),
(7, 9, 234, 0, 0),
(7, 9, 235, 0, 0),
(7, 9, 236, 0, 0),
(7, 9, 237, 0, 0),
(7, 9, 238, 0, 0),
(7, 9, 239, 0, 0),
(7, 9, 240, 0, 0),
(7, 9, 241, 0, 0),
(7, 9, 242, 0, 0),
(7, 9, 243, 0, 1),
(7, 9, 244, 0, 1),
(7, 9, 245, 0, 0),
(7, 9, 246, 0, 0),
(7, 9, 247, 0, 0),
(7, 9, 248, 0, 0),
(7, 9, 249, 0, 0),
(7, 9, 250, 0, 0),
(7, 9, 251, 0, 0),
(7, 9, 252, 0, 0),
(7, 9, 253, 0, 0),
(7, 9, 254, 0, 0),
(7, 16, 255, 0, 0),
(7, 16, 256, 0, 0),
(7, 16, 257, 0, 0),
(7, 16, 258, 0, 0),
(7, 16, 259, 0, 0),
(7, 16, 260, 0, 0),
(7, 16, 261, 0, 0),
(7, 16, 262, 0, 0),
(7, 16, 263, 0, 0),
(7, 16, 264, 0, 0),
(7, 16, 265, 0, 0),
(7, 16, 266, 0, 0),
(7, 16, 267, 0, 0),
(7, 16, 268, 0, 0),
(7, 16, 269, 0, 1),
(7, 16, 270, 0, 1),
(7, 16, 271, 0, 0),
(7, 16, 272, 0, 0),
(7, 16, 273, 0, 0),
(7, 16, 274, 0, 0),
(7, 16, 275, 0, 0),
(7, 16, 276, 0, 0),
(7, 16, 277, 0, 0),
(7, 15, 278, 0, 0),
(7, 15, 279, 0, 0),
(7, 15, 280, 0, 0),
(7, 15, 281, 0, 0),
(7, 15, 282, 0, 0),
(7, 15, 283, 0, 0),
(7, 15, 285, 0, 1),
(7, 15, 286, 0, 1),
(7, 15, 287, 0, 0),
(7, 18, 288, 0, 0),
(7, 18, 289, 0, 0),
(7, 18, 290, 0, 0),
(7, 18, 291, 0, 0),
(7, 18, 292, 0, 0),
(7, 18, 293, 0, 0),
(7, 18, 294, 0, 0),
(7, 18, 295, 0, 1),
(7, 18, 296, 0, 1),
(7, 18, 297, 0, 0),
(7, 18, 298, 0, 0),
(7, 18, 299, 0, 0),
(7, 18, 300, 0, 0),
(7, 18, 301, 0, 0),
(7, 18, 302, 0, 0),
(7, 18, 303, 0, 0),
(7, 18, 304, 0, 0),
(7, 21, 350, 0, 0),
(7, 21, 351, 0, 0),
(7, 21, 352, 0, 0),
(7, 21, 353, 0, 0),
(7, 21, 354, 0, 0),
(7, 21, 355, 0, 0),
(7, 21, 356, 0, 0),
(7, 21, 357, 0, 0),
(7, 21, 358, 0, 0),
(7, 21, 359, 0, 0),
(7, 21, 360, 0, 0),
(7, 21, 361, 0, 0),
(7, 21, 362, 0, 0),
(7, 21, 363, 0, 0),
(7, 21, 364, 0, 0),
(7, 21, 365, 0, 0),
(7, 21, 366, 0, 0),
(7, 21, 367, 0, 0),
(7, 21, 368, 0, 0),
(7, 21, 369, 0, 1),
(7, 21, 370, 0, 1),
(7, 21, 371, 0, 0),
(7, 21, 372, 0, 0),
(7, 21, 373, 0, 0),
(7, 21, 374, 0, 0),
(7, 21, 375, 0, 0),
(7, 21, 376, 0, 0),
(7, 21, 377, 0, 0),
(7, 21, 378, 0, 0),
(7, 21, 379, 0, 0),
(7, 21, 380, 0, 0),
(7, 21, 381, 0, 0),
(7, 21, 382, 0, 0),
(7, 21, 383, 0, 0),
(7, 21, 384, 0, 0),
(7, 21, 385, 0, 0),
(7, 21, 386, 0, 0),
(7, 21, 387, 0, 0),
(7, 22, 388, 0, 0),
(7, 22, 389, 0, 0),
(7, 22, 390, 0, 0),
(7, 22, 391, 0, 0),
(7, 22, 392, 0, 0),
(7, 22, 393, 0, 0),
(7, 22, 394, 0, 0),
(7, 22, 395, 0, 0),
(7, 22, 396, 0, 0),
(7, 22, 397, 0, 0),
(7, 22, 398, 0, 0),
(7, 22, 399, 0, 0),
(7, 22, 400, 0, 0),
(7, 22, 401, 0, 0),
(7, 22, 402, 0, 0),
(7, 22, 403, 0, 0),
(7, 22, 404, 0, 0),
(7, 22, 405, 0, 0),
(7, 22, 406, 0, 0),
(7, 22, 407, 0, 0),
(7, 22, 408, 0, 0),
(7, 22, 409, 0, 0),
(7, 22, 410, 0, 1),
(7, 22, 411, 0, 1),
(7, 22, 412, 0, 0),
(7, 22, 413, 0, 0),
(7, 22, 414, 0, 0),
(7, 22, 415, 0, 0),
(7, 22, 416, 0, 0),
(7, 22, 417, 0, 0),
(7, 22, 418, 0, 0),
(7, 22, 419, 0, 0),
(7, 22, 420, 0, 0),
(7, 22, 421, 0, 0),
(7, 22, 422, 0, 0),
(7, 22, 423, 0, 0),
(7, 22, 424, 0, 0),
(7, 22, 425, 0, 0),
(7, 22, 426, 0, 0),
(7, 22, 427, 0, 0),
(7, 22, 428, 0, 0),
(7, 22, 429, 0, 0),
(7, 22, 430, 0, 0),
(7, 22, 431, 0, 0),
(7, 22, 432, 0, 0),
(7, 22, 433, 0, 0),
(7, 22, 434, 0, 0),
(7, 23, 435, 0, 0),
(7, 23, 436, 0, 0),
(7, 23, 437, 0, 0),
(7, 23, 438, 0, 0),
(7, 23, 439, 0, 0),
(7, 23, 440, 0, 0),
(7, 23, 441, 0, 0),
(7, 23, 442, 0, 0),
(7, 23, 443, 0, 0),
(7, 23, 444, 0, 0),
(7, 23, 445, 0, 0),
(7, 23, 446, 0, 0),
(7, 23, 447, 0, 0),
(7, 23, 448, 0, 0),
(7, 23, 449, 0, 0),
(7, 23, 450, 0, 0),
(7, 23, 451, 0, 0),
(7, 23, 452, 0, 0),
(7, 23, 453, 0, 0),
(7, 23, 454, 0, 1),
(7, 23, 455, 0, 1),
(7, 23, 456, 0, 0),
(7, 23, 457, 0, 0),
(7, 23, 458, 0, 0),
(7, 23, 459, 0, 0),
(7, 23, 460, 0, 0),
(7, 23, 461, 0, 0),
(7, 23, 462, 0, 0),
(7, 23, 463, 0, 0),
(7, 23, 464, 0, 0),
(7, 23, 465, 0, 0),
(7, 23, 466, 0, 0),
(7, 23, 467, 0, 0),
(7, 23, 468, 0, 0),
(7, 23, 469, 0, 0),
(7, 23, 470, 0, 0),
(7, 23, 471, 0, 0),
(7, 23, 472, 0, 0),
(7, 23, 473, 0, 0),
(7, 29, 474, 0, 0),
(7, 29, 478, 0, 0),
(7, 29, 479, 0, 0),
(7, 29, 481, 0, 0),
(7, 29, 488, 0, 0),
(7, 29, 489, 0, 0),
(7, 29, 490, 0, 0),
(7, 29, 491, 0, 0),
(7, 29, 493, 0, 0),
(7, 29, 494, 0, 0),
(7, 29, 495, 0, 0),
(7, 29, 496, 0, 0),
(7, 29, 497, 0, 0),
(7, 29, 502, 0, 0),
(7, 29, 503, 0, 0),
(7, 29, 504, 0, 0),
(7, 29, 505, 0, 0),
(7, 10, 518, 0, 0),
(7, 10, 519, 0, 0),
(7, 10, 520, 0, 0),
(7, 10, 521, 0, 0),
(7, 10, 522, 0, 0),
(7, 10, 523, 0, 0),
(7, 34, 524, 0, 0),
(7, 34, 525, 0, 1),
(7, 34, 526, 0, 1),
(7, 34, 527, 0, 0),
(7, 34, 528, 0, 1),
(7, 34, 529, 0, 0),
(7, 34, 530, 0, 0),
(7, 34, 531, 0, 0),
(7, 34, 532, 0, 0),
(7, 34, 533, 0, 0),
(7, 34, 534, 0, 0),
(7, 34, 535, 0, 1),
(7, 34, 536, 0, 1),
(7, 34, 537, 0, 0),
(7, 34, 538, 0, 0),
(7, 34, 539, 0, 0),
(7, 34, 540, 0, 1),
(7, 34, 541, 0, 0),
(7, 34, 542, 0, 0),
(7, 35, 543, 0, 0),
(7, 35, 544, 0, 0),
(7, 35, 545, 0, 0),
(7, 35, 546, 0, 0),
(7, 35, 547, 0, 0),
(7, 35, 548, 0, 0),
(7, 35, 549, 0, 0),
(7, 35, 550, 0, 0),
(7, 35, 551, 0, 1),
(7, 35, 552, 0, 1),
(7, 35, 553, 0, 0),
(7, 35, 554, 0, 0),
(7, 35, 555, 0, 0),
(7, 35, 556, 0, 0),
(7, 35, 557, 0, 0),
(7, 35, 558, 0, 0),
(7, 35, 559, 0, 0),
(7, 35, 560, 0, 0),
(7, 35, 561, 0, 0),
(7, 37, 562, 0, 0),
(7, 37, 563, 0, 0),
(7, 37, 564, 0, 0),
(7, 37, 565, 0, 0),
(7, 37, 566, 0, 0),
(7, 37, 567, 0, 0),
(7, 37, 568, 0, 0),
(7, 37, 569, 0, 0),
(7, 37, 570, 0, 0),
(7, 37, 571, 0, 0),
(7, 37, 572, 0, 0),
(7, 37, 573, 0, 0),
(7, 37, 574, 0, 0),
(7, 37, 575, 0, 0),
(7, 37, 576, 0, 1),
(7, 37, 577, 0, 1),
(7, 37, 578, 0, 0),
(7, 37, 579, 0, 0),
(7, 41, 580, 0, 0),
(7, 41, 581, 0, 0),
(7, 41, 582, 0, 1),
(7, 41, 583, 0, 1),
(7, 41, 584, 0, 0),
(7, 41, 585, 0, 1),
(7, 41, 586, 0, 0),
(7, 42, 587, 0, 0),
(7, 42, 588, 0, 0),
(7, 42, 589, 0, 0),
(7, 42, 590, 0, 0),
(7, 42, 591, 0, 0),
(7, 42, 592, 0, 0),
(7, 42, 593, 0, 1),
(7, 42, 594, 0, 1),
(7, 42, 595, 0, 0),
(7, 42, 596, 0, 0),
(7, 43, 597, 0, 0),
(7, 43, 598, 0, 0),
(7, 43, 599, 0, 0),
(7, 43, 600, 0, 0),
(7, 43, 601, 0, 0),
(7, 43, 602, 0, 0),
(7, 43, 603, 0, 0),
(7, 43, 604, 0, 0),
(7, 43, 605, 0, 0),
(7, 43, 606, 0, 0),
(7, 43, 607, 0, 0),
(7, 43, 608, 0, 1),
(7, 43, 609, 0, 1),
(7, 43, 610, 0, 0),
(7, 43, 611, 0, 0),
(7, 44, 612, 0, 0),
(7, 44, 613, 0, 0),
(7, 44, 614, 0, 0),
(7, 44, 615, 0, 0),
(7, 44, 616, 0, 0),
(7, 44, 617, 0, 0),
(7, 44, 618, 0, 0),
(7, 44, 619, 0, 0),
(7, 44, 620, 0, 0),
(7, 44, 621, 0, 0),
(7, 44, 622, 0, 0),
(7, 44, 623, 0, 0),
(7, 44, 624, 0, 0),
(7, 44, 625, 0, 1),
(7, 44, 626, 0, 1),
(7, 44, 627, 0, 0),
(7, 44, 628, 0, 0),
(7, 46, 629, 0, 0),
(7, 46, 630, 0, 1),
(7, 46, 631, 0, 1),
(7, 46, 632, 0, 0),
(7, 46, 633, 0, 0),
(7, 23, 636, 0, 1),
(7, 23, 637, 0, 1),
(7, 23, 638, 0, 1),
(7, 23, 639, 0, 1),
(7, 23, 640, 0, 1),
(7, 23, 641, 0, 1),
(7, 23, 642, 0, 1),
(7, 23, 643, 0, 1),
(7, 23, 644, 0, 1),
(7, 22, 645, 0, 1),
(7, 22, 646, 0, 1),
(7, 22, 647, 0, 1),
(7, 22, 648, 0, 1),
(7, 22, 649, 0, 1),
(7, 22, 650, 0, 1),
(7, 22, 651, 0, 1),
(7, 22, 652, 0, 1),
(7, 22, 653, 0, 1),
(7, 21, 654, 0, 1),
(7, 21, 655, 0, 1),
(7, 21, 656, 0, 1),
(7, 21, 657, 0, 1),
(7, 21, 658, 0, 1),
(7, 21, 659, 0, 1),
(7, 21, 660, 0, 1),
(7, 21, 661, 0, 1),
(7, 21, 662, 0, 1),
(7, 43, 673, 0, 0),
(7, 41, 674, 0, 0),
(7, 23, 678, 0, 0),
(7, 22, 679, 0, 0),
(7, 21, 680, 0, 0),
(7, 6, 683, 0, 1),
(7, 4, 684, 0, 1),
(7, 23, 687, 0, 0),
(7, 23, 688, 0, 0),
(7, 21, 689, 0, 0),
(7, 21, 690, 0, 0),
(7, 18, 691, 0, 0),
(7, 41, 693, 0, 0),
(7, 41, 694, 0, 0),
(7, 23, 695, 0, 1),
(7, 21, 697, 0, 1),
(7, 22, 698, 0, 1),
(7, 13, 701, 0, 0),
(7, 13, 703, 0, 0),
(7, 4, 708, 0, 1),
(7, 6, 709, 0, 1),
(7, 9, 712, 0, 1),
(7, 13, 713, 0, 1),
(7, 18, 717, 0, 1),
(7, 21, 720, 0, 1),
(7, 23, 722, 0, 1),
(7, 41, 727, 0, 1),
(7, 42, 728, 0, 1),
(7, 43, 729, 0, 1),
(7, 44, 730, 0, 1),
(7, 29, 732, 0, 0),
(8, 6, 1, 0, 0),
(8, 6, 2, 0, 0),
(8, 6, 3, 0, 0),
(8, 6, 4, 0, 0),
(8, 6, 5, 0, 0),
(8, 6, 9, 0, 0),
(8, 6, 13, 0, 0),
(8, 6, 14, 0, 0),
(8, 6, 19, 0, 0),
(8, 6, 20, 0, 0),
(8, 6, 21, 0, 1),
(8, 6, 22, 0, 1),
(8, 6, 23, 0, 0),
(8, 6, 25, 0, 0),
(8, 6, 27, 0, 0),
(8, 6, 29, 0, 0),
(8, 6, 30, 0, 0),
(8, 6, 32, 0, 0),
(8, 6, 35, 0, 0),
(8, 6, 36, 0, 0),
(8, 4, 66, 0, 0),
(8, 4, 67, 0, 0),
(8, 4, 68, 0, 0),
(8, 4, 69, 0, 0),
(8, 4, 70, 0, 0),
(8, 4, 71, 0, 0),
(8, 4, 72, 0, 0),
(8, 4, 73, 0, 0),
(8, 4, 74, 0, 0),
(8, 4, 75, 0, 0),
(8, 4, 76, 0, 0),
(8, 4, 77, 0, 0),
(8, 4, 78, 0, 0),
(8, 4, 79, 0, 0),
(8, 4, 80, 0, 0),
(8, 4, 81, 0, 0),
(8, 4, 82, 0, 0),
(8, 4, 83, 0, 0),
(8, 4, 84, 0, 0),
(8, 4, 85, 0, 0),
(8, 4, 86, 0, 0),
(8, 4, 87, 0, 0),
(8, 4, 88, 0, 0),
(8, 4, 89, 0, 0),
(8, 4, 90, 0, 1),
(8, 4, 91, 0, 1),
(8, 4, 92, 0, 0),
(8, 4, 93, 0, 0),
(8, 4, 94, 0, 0),
(8, 4, 95, 0, 0),
(8, 4, 96, 0, 0),
(8, 4, 97, 0, 0),
(8, 4, 98, 0, 0),
(8, 4, 99, 0, 0),
(8, 4, 100, 0, 0),
(8, 4, 101, 0, 0),
(8, 4, 102, 0, 0),
(8, 4, 103, 0, 0),
(8, 4, 104, 0, 0),
(8, 4, 105, 0, 0),
(8, 4, 106, 0, 0),
(8, 4, 107, 0, 0),
(8, 4, 108, 0, 0),
(8, 4, 109, 0, 0),
(8, 13, 155, 0, 0),
(8, 13, 156, 0, 0),
(8, 13, 157, 0, 0),
(8, 13, 158, 0, 0),
(8, 13, 159, 0, 0),
(8, 13, 160, 0, 0),
(8, 13, 161, 0, 0),
(8, 13, 162, 0, 0),
(8, 13, 163, 0, 0),
(8, 13, 164, 0, 0),
(8, 13, 165, 0, 0),
(8, 13, 166, 0, 1),
(8, 13, 167, 0, 1),
(8, 13, 168, 0, 0),
(8, 13, 169, 0, 0),
(8, 13, 170, 0, 0),
(8, 13, 171, 0, 0),
(8, 14, 173, 0, 0),
(8, 14, 174, 0, 0),
(8, 14, 175, 0, 0),
(8, 14, 176, 0, 0),
(8, 14, 177, 0, 0),
(8, 14, 178, 0, 0),
(8, 14, 179, 0, 0),
(8, 14, 180, 0, 0),
(8, 14, 181, 0, 0),
(8, 14, 182, 0, 0),
(8, 14, 183, 0, 0),
(8, 14, 184, 0, 0),
(8, 14, 185, 0, 0),
(8, 14, 186, 0, 0),
(8, 14, 187, 0, 0),
(8, 14, 188, 0, 0),
(8, 14, 189, 0, 0),
(8, 14, 190, 0, 1),
(8, 14, 191, 0, 1),
(8, 14, 192, 0, 0),
(8, 14, 193, 0, 0),
(8, 14, 194, 0, 0),
(8, 14, 195, 0, 0),
(8, 14, 196, 0, 0),
(8, 14, 197, 0, 0),
(8, 14, 198, 0, 0),
(8, 14, 199, 0, 0),
(8, 14, 200, 0, 0),
(8, 14, 201, 0, 0),
(8, 14, 202, 0, 0),
(8, 14, 203, 0, 0),
(8, 8, 204, 0, 0),
(8, 8, 205, 0, 1),
(8, 8, 206, 0, 1),
(8, 8, 207, 0, 0),
(8, 8, 208, 0, 0),
(8, 8, 209, 0, 0),
(8, 8, 210, 0, 1),
(8, 8, 211, 0, 1),
(8, 8, 212, 0, 0),
(8, 8, 213, 0, 0),
(8, 8, 214, 0, 0),
(8, 8, 215, 0, 1),
(8, 8, 216, 0, 0),
(8, 8, 217, 0, 0),
(8, 8, 218, 0, 0),
(8, 10, 219, 0, 0),
(8, 10, 220, 0, 0),
(8, 10, 221, 0, 0),
(8, 10, 222, 0, 0),
(8, 10, 223, 0, 0),
(8, 10, 224, 0, 0),
(8, 10, 225, 0, 0),
(8, 10, 226, 0, 0),
(8, 10, 227, 0, 0),
(8, 10, 228, 0, 1),
(8, 10, 229, 0, 0),
(8, 10, 230, 0, 0),
(8, 9, 231, 0, 0),
(8, 9, 232, 0, 0),
(8, 9, 233, 0, 0),
(8, 9, 234, 0, 0),
(8, 9, 235, 0, 0),
(8, 9, 236, 0, 0),
(8, 9, 237, 0, 0),
(8, 9, 238, 0, 0),
(8, 9, 239, 0, 0),
(8, 9, 240, 0, 0),
(8, 9, 241, 0, 0),
(8, 9, 242, 0, 0),
(8, 9, 243, 0, 1),
(8, 9, 244, 0, 1),
(8, 9, 245, 0, 0),
(8, 9, 246, 0, 0),
(8, 9, 247, 0, 0),
(8, 9, 248, 0, 0),
(8, 9, 249, 0, 0),
(8, 9, 250, 0, 0),
(8, 9, 251, 0, 0),
(8, 9, 252, 0, 0),
(8, 9, 253, 0, 0),
(8, 9, 254, 0, 0),
(8, 16, 255, 0, 0),
(8, 16, 256, 0, 0),
(8, 16, 257, 0, 0),
(8, 16, 258, 0, 0),
(8, 16, 259, 0, 0),
(8, 16, 260, 0, 0),
(8, 16, 261, 0, 0),
(8, 16, 262, 0, 0),
(8, 16, 263, 0, 0),
(8, 16, 264, 0, 0),
(8, 16, 265, 0, 0),
(8, 16, 266, 0, 0),
(8, 16, 267, 0, 0),
(8, 16, 268, 0, 0),
(8, 16, 269, 0, 1),
(8, 16, 270, 0, 1),
(8, 16, 271, 0, 0),
(8, 16, 272, 0, 0),
(8, 16, 273, 0, 0),
(8, 16, 274, 0, 0),
(8, 16, 275, 0, 0),
(8, 16, 276, 0, 0),
(8, 16, 277, 0, 0),
(8, 15, 278, 0, 0),
(8, 15, 279, 0, 0),
(8, 15, 280, 0, 0),
(8, 15, 281, 0, 0),
(8, 15, 282, 0, 0),
(8, 15, 283, 0, 0),
(8, 15, 285, 0, 1),
(8, 15, 286, 0, 1),
(8, 15, 287, 0, 0),
(8, 18, 288, 0, 0),
(8, 18, 289, 0, 0),
(8, 18, 290, 0, 0),
(8, 18, 291, 0, 0),
(8, 18, 292, 0, 0),
(8, 18, 293, 0, 0),
(8, 18, 294, 0, 0),
(8, 18, 295, 0, 1),
(8, 18, 296, 0, 1),
(8, 18, 297, 0, 0),
(8, 18, 298, 0, 0),
(8, 18, 299, 0, 0),
(8, 18, 300, 0, 0),
(8, 18, 301, 0, 0),
(8, 18, 302, 0, 0),
(8, 18, 303, 0, 0),
(8, 18, 304, 0, 0),
(8, 21, 350, 0, 0),
(8, 21, 351, 0, 0),
(8, 21, 352, 0, 0),
(8, 21, 353, 0, 0),
(8, 21, 354, 0, 0),
(8, 21, 355, 0, 0),
(8, 21, 356, 0, 0),
(8, 21, 357, 0, 0),
(8, 21, 358, 0, 0),
(8, 21, 359, 0, 0),
(8, 21, 360, 0, 0),
(8, 21, 361, 0, 0),
(8, 21, 362, 0, 0),
(8, 21, 363, 0, 0),
(8, 21, 364, 0, 0),
(8, 21, 365, 0, 0),
(8, 21, 366, 0, 0),
(8, 21, 367, 0, 0),
(8, 21, 368, 0, 0),
(8, 21, 369, 0, 1),
(8, 21, 370, 0, 1),
(8, 21, 371, 0, 0),
(8, 21, 372, 0, 0),
(8, 21, 373, 0, 0),
(8, 21, 374, 0, 0),
(8, 21, 375, 0, 0),
(8, 21, 376, 0, 0),
(8, 21, 377, 0, 0),
(8, 21, 378, 0, 0),
(8, 21, 379, 0, 0),
(8, 21, 380, 0, 0),
(8, 21, 381, 0, 0),
(8, 21, 382, 0, 0),
(8, 21, 383, 0, 0),
(8, 21, 384, 0, 0),
(8, 21, 385, 0, 0),
(8, 21, 386, 0, 0),
(8, 21, 387, 0, 0),
(8, 22, 388, 0, 0),
(8, 22, 389, 0, 0),
(8, 22, 390, 0, 0),
(8, 22, 391, 0, 0),
(8, 22, 392, 0, 0),
(8, 22, 393, 0, 0),
(8, 22, 394, 0, 0),
(8, 22, 395, 0, 0),
(8, 22, 396, 0, 0),
(8, 22, 397, 0, 0),
(8, 22, 398, 0, 0),
(8, 22, 399, 0, 0),
(8, 22, 400, 0, 0),
(8, 22, 401, 0, 0),
(8, 22, 402, 0, 0),
(8, 22, 403, 0, 0),
(8, 22, 404, 0, 0),
(8, 22, 405, 0, 0),
(8, 22, 406, 0, 0),
(8, 22, 407, 0, 0),
(8, 22, 408, 0, 0),
(8, 22, 409, 0, 0),
(8, 22, 410, 0, 1),
(8, 22, 411, 0, 1),
(8, 22, 412, 0, 0),
(8, 22, 413, 0, 0),
(8, 22, 414, 0, 0),
(8, 22, 415, 0, 0),
(8, 22, 416, 0, 0),
(8, 22, 417, 0, 0),
(8, 22, 418, 0, 0),
(8, 22, 419, 0, 0),
(8, 22, 420, 0, 0),
(8, 22, 421, 0, 0),
(8, 22, 422, 0, 0),
(8, 22, 423, 0, 0),
(8, 22, 424, 0, 0),
(8, 22, 425, 0, 0),
(8, 22, 426, 0, 0),
(8, 22, 427, 0, 0),
(8, 22, 428, 0, 0),
(8, 22, 429, 0, 0),
(8, 22, 430, 0, 0),
(8, 22, 431, 0, 0),
(8, 22, 432, 0, 0),
(8, 22, 433, 0, 0),
(8, 22, 434, 0, 0),
(8, 23, 435, 0, 0),
(8, 23, 436, 0, 0),
(8, 23, 437, 0, 0),
(8, 23, 438, 0, 0),
(8, 23, 439, 0, 0),
(8, 23, 440, 0, 0),
(8, 23, 441, 0, 0),
(8, 23, 442, 0, 0),
(8, 23, 443, 0, 0),
(8, 23, 444, 0, 0),
(8, 23, 445, 0, 0),
(8, 23, 446, 0, 0),
(8, 23, 447, 0, 0),
(8, 23, 448, 0, 0),
(8, 23, 449, 0, 0),
(8, 23, 450, 0, 0),
(8, 23, 451, 0, 0),
(8, 23, 452, 0, 0),
(8, 23, 453, 0, 0),
(8, 23, 454, 0, 1),
(8, 23, 455, 0, 1),
(8, 23, 456, 0, 0),
(8, 23, 457, 0, 0),
(8, 23, 458, 0, 0),
(8, 23, 459, 0, 0),
(8, 23, 460, 0, 0),
(8, 23, 461, 0, 0),
(8, 23, 462, 0, 0),
(8, 23, 463, 0, 0),
(8, 23, 464, 0, 0),
(8, 23, 465, 0, 0),
(8, 23, 466, 0, 0),
(8, 23, 467, 0, 0),
(8, 23, 468, 0, 0),
(8, 23, 469, 0, 0),
(8, 23, 470, 0, 0),
(8, 23, 471, 0, 0),
(8, 23, 472, 0, 0),
(8, 23, 473, 0, 0),
(8, 29, 474, 0, 0),
(8, 29, 478, 0, 0),
(8, 29, 479, 0, 0),
(8, 29, 481, 0, 0),
(8, 29, 488, 0, 0),
(8, 29, 489, 0, 0),
(8, 29, 490, 0, 0),
(8, 29, 491, 0, 0),
(8, 29, 493, 0, 0),
(8, 29, 494, 0, 0),
(8, 29, 495, 0, 0),
(8, 29, 496, 0, 0),
(8, 29, 497, 0, 0),
(8, 29, 502, 0, 0),
(8, 29, 503, 0, 0),
(8, 29, 504, 0, 0),
(8, 29, 505, 0, 0),
(8, 10, 518, 0, 0),
(8, 10, 519, 0, 0),
(8, 10, 520, 0, 0),
(8, 10, 521, 0, 0),
(8, 10, 522, 0, 0),
(8, 10, 523, 0, 0),
(8, 34, 524, 0, 0),
(8, 34, 525, 0, 1),
(8, 34, 526, 0, 1),
(8, 34, 527, 0, 0),
(8, 34, 528, 0, 1),
(8, 34, 529, 0, 0),
(8, 34, 530, 0, 0),
(8, 34, 531, 0, 0),
(8, 34, 532, 0, 0),
(8, 34, 533, 0, 0),
(8, 34, 534, 0, 0),
(8, 34, 535, 0, 1),
(8, 34, 536, 0, 1),
(8, 34, 537, 0, 0),
(8, 34, 538, 0, 0),
(8, 34, 539, 0, 0),
(8, 34, 540, 0, 1),
(8, 34, 541, 0, 0),
(8, 34, 542, 0, 0),
(8, 35, 543, 0, 0),
(8, 35, 544, 0, 0),
(8, 35, 545, 0, 0),
(8, 35, 546, 0, 0),
(8, 35, 547, 0, 0),
(8, 35, 548, 0, 0),
(8, 35, 549, 0, 0),
(8, 35, 550, 0, 0),
(8, 35, 551, 0, 1),
(8, 35, 552, 0, 1),
(8, 35, 553, 0, 0),
(8, 35, 554, 0, 0),
(8, 35, 555, 0, 0),
(8, 35, 556, 0, 0),
(8, 35, 557, 0, 0),
(8, 35, 558, 0, 0),
(8, 35, 559, 0, 0),
(8, 35, 560, 0, 0),
(8, 35, 561, 0, 0),
(8, 37, 562, 0, 0),
(8, 37, 563, 0, 0),
(8, 37, 564, 0, 0),
(8, 37, 565, 0, 0),
(8, 37, 566, 0, 0),
(8, 37, 567, 0, 0),
(8, 37, 568, 0, 0),
(8, 37, 569, 0, 0),
(8, 37, 570, 0, 0),
(8, 37, 571, 0, 0),
(8, 37, 572, 0, 0),
(8, 37, 573, 0, 0),
(8, 37, 574, 0, 0),
(8, 37, 575, 0, 0),
(8, 37, 576, 0, 1),
(8, 37, 577, 0, 1),
(8, 37, 578, 0, 0),
(8, 37, 579, 0, 0),
(8, 41, 580, 0, 0),
(8, 41, 581, 0, 0),
(8, 41, 582, 0, 1),
(8, 41, 583, 0, 1),
(8, 41, 584, 0, 0),
(8, 41, 585, 0, 1),
(8, 41, 586, 0, 0),
(8, 42, 587, 0, 0),
(8, 42, 588, 0, 0),
(8, 42, 589, 0, 0),
(8, 42, 590, 0, 0),
(8, 42, 591, 0, 0),
(8, 42, 592, 0, 0),
(8, 42, 593, 0, 1),
(8, 42, 594, 0, 1),
(8, 42, 595, 0, 0),
(8, 42, 596, 0, 0),
(8, 43, 597, 0, 0),
(8, 43, 598, 0, 0),
(8, 43, 599, 0, 0),
(8, 43, 600, 0, 0),
(8, 43, 601, 0, 0),
(8, 43, 602, 0, 0),
(8, 43, 603, 0, 0),
(8, 43, 604, 0, 0),
(8, 43, 605, 0, 0),
(8, 43, 606, 0, 0),
(8, 43, 607, 0, 0),
(8, 43, 608, 0, 1),
(8, 43, 609, 0, 1),
(8, 43, 610, 0, 0),
(8, 43, 611, 0, 0),
(8, 44, 612, 0, 0),
(8, 44, 613, 0, 0),
(8, 44, 614, 0, 0),
(8, 44, 615, 0, 0),
(8, 44, 616, 0, 0),
(8, 44, 617, 0, 0),
(8, 44, 618, 0, 0),
(8, 44, 619, 0, 0),
(8, 44, 620, 0, 0),
(8, 44, 621, 0, 0),
(8, 44, 622, 0, 0),
(8, 44, 623, 0, 0),
(8, 44, 624, 0, 0),
(8, 44, 625, 0, 1),
(8, 44, 626, 0, 1),
(8, 44, 627, 0, 0),
(8, 44, 628, 0, 0),
(8, 46, 629, 0, 0),
(8, 46, 630, 0, 1),
(8, 46, 631, 0, 1),
(8, 46, 632, 0, 0),
(8, 46, 633, 0, 0),
(8, 23, 636, 0, 1),
(8, 23, 637, 0, 1),
(8, 23, 638, 0, 1),
(8, 23, 639, 0, 1),
(8, 23, 640, 0, 1),
(8, 23, 641, 0, 1),
(8, 23, 642, 0, 1),
(8, 23, 643, 0, 1),
(8, 23, 644, 0, 1),
(8, 22, 645, 0, 1),
(8, 22, 646, 0, 1),
(8, 22, 647, 0, 1),
(8, 22, 648, 0, 1),
(8, 22, 649, 0, 1),
(8, 22, 650, 0, 1),
(8, 22, 651, 0, 1),
(8, 22, 652, 0, 1),
(8, 22, 653, 0, 1),
(8, 21, 654, 0, 1),
(8, 21, 655, 0, 1),
(8, 21, 656, 0, 1),
(8, 21, 657, 0, 1),
(8, 21, 658, 0, 1),
(8, 21, 659, 0, 1),
(8, 21, 660, 0, 1),
(8, 21, 661, 0, 1),
(8, 21, 662, 0, 1),
(8, 43, 673, 0, 0),
(8, 41, 674, 0, 0),
(8, 23, 678, 0, 0),
(8, 22, 679, 0, 0),
(8, 21, 680, 0, 0),
(8, 6, 683, 0, 1),
(8, 4, 684, 0, 1),
(8, 23, 687, 0, 0),
(8, 23, 688, 0, 0),
(8, 21, 689, 0, 0),
(8, 21, 690, 0, 0),
(8, 18, 691, 0, 0),
(8, 41, 693, 0, 0),
(8, 41, 694, 0, 0),
(8, 23, 695, 0, 1),
(8, 21, 697, 0, 1),
(8, 22, 698, 0, 1),
(8, 13, 701, 0, 0),
(8, 13, 703, 0, 0),
(8, 4, 708, 0, 1),
(8, 6, 709, 0, 1),
(8, 9, 712, 0, 1),
(8, 13, 713, 0, 1),
(8, 18, 717, 0, 1),
(8, 21, 720, 0, 1),
(8, 23, 722, 0, 1),
(8, 41, 727, 0, 1),
(8, 42, 728, 0, 1),
(8, 43, 729, 0, 1),
(8, 44, 730, 0, 1),
(8, 29, 732, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile2globalpermissions`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2globalpermissions` (
  `profileid` int(19) NOT NULL,
  `globalactionid` int(19) NOT NULL,
  `globalactionpermission` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile2globalpermissions`
--

INSERT INTO `vtiger_profile2globalpermissions` (`profileid`, `globalactionid`, `globalactionpermission`) VALUES
(5, 1, 1),
(5, 2, 1),
(6, 1, 1),
(6, 2, 1),
(7, 1, 1),
(7, 2, 1),
(8, 1, 1),
(8, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile2standardpermissions`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2standardpermissions` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) NOT NULL,
  `operation` int(10) NOT NULL,
  `permissions` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile2standardpermissions`
--

INSERT INTO `vtiger_profile2standardpermissions` (`profileid`, `tabid`, `operation`, `permissions`) VALUES
(5, 2, 0, 1),
(5, 2, 1, 1),
(5, 2, 2, 1),
(5, 2, 4, 0),
(5, 4, 0, 0),
(5, 4, 1, 0),
(5, 4, 2, 0),
(5, 4, 4, 0),
(5, 6, 0, 0),
(5, 6, 1, 0),
(5, 6, 2, 0),
(5, 6, 4, 0),
(5, 7, 0, 1),
(5, 7, 1, 1),
(5, 7, 2, 1),
(5, 7, 4, 0),
(5, 8, 0, 0),
(5, 8, 1, 0),
(5, 8, 2, 0),
(5, 8, 4, 0),
(5, 9, 0, 0),
(5, 9, 1, 0),
(5, 9, 2, 0),
(5, 9, 4, 0),
(5, 13, 0, 0),
(5, 13, 1, 0),
(5, 13, 2, 0),
(5, 13, 4, 0),
(5, 14, 0, 0),
(5, 14, 1, 0),
(5, 14, 2, 0),
(5, 14, 4, 0),
(5, 15, 0, 0),
(5, 15, 1, 0),
(5, 15, 2, 0),
(5, 15, 4, 0),
(5, 16, 0, 0),
(5, 16, 1, 0),
(5, 16, 2, 0),
(5, 16, 4, 0),
(5, 18, 0, 0),
(5, 18, 1, 0),
(5, 18, 2, 0),
(5, 18, 4, 0),
(5, 19, 0, 1),
(5, 19, 1, 1),
(5, 19, 2, 1),
(5, 19, 4, 0),
(5, 20, 0, 1),
(5, 20, 1, 1),
(5, 20, 2, 1),
(5, 20, 4, 0),
(5, 21, 0, 0),
(5, 21, 1, 0),
(5, 21, 2, 0),
(5, 21, 4, 0),
(5, 22, 0, 0),
(5, 22, 1, 0),
(5, 22, 2, 0),
(5, 22, 4, 0),
(5, 23, 0, 0),
(5, 23, 1, 0),
(5, 23, 2, 0),
(5, 23, 4, 0),
(5, 25, 0, 1),
(5, 25, 1, 1),
(5, 25, 2, 1),
(5, 25, 4, 1),
(5, 26, 0, 1),
(5, 26, 1, 1),
(5, 26, 2, 1),
(5, 26, 4, 0),
(5, 34, 0, 0),
(5, 34, 1, 0),
(5, 34, 2, 0),
(5, 34, 4, 0),
(5, 35, 0, 0),
(5, 35, 1, 0),
(5, 35, 2, 0),
(5, 35, 4, 0),
(5, 37, 0, 0),
(5, 37, 1, 0),
(5, 37, 2, 0),
(5, 37, 4, 0),
(5, 41, 0, 0),
(5, 41, 1, 0),
(5, 41, 2, 0),
(5, 41, 4, 0),
(5, 42, 0, 0),
(5, 42, 1, 0),
(5, 42, 2, 0),
(5, 42, 4, 0),
(5, 43, 0, 0),
(5, 43, 1, 0),
(5, 43, 2, 0),
(5, 43, 4, 0),
(5, 44, 0, 0),
(5, 44, 1, 0),
(5, 44, 2, 0),
(5, 44, 4, 0),
(5, 46, 0, 0),
(5, 46, 1, 0),
(5, 46, 2, 0),
(5, 46, 4, 0),
(6, 4, 0, 0),
(6, 4, 1, 0),
(6, 4, 2, 0),
(6, 4, 4, 0),
(6, 6, 0, 0),
(6, 6, 1, 0),
(6, 6, 2, 0),
(6, 6, 4, 0),
(6, 8, 0, 0),
(6, 8, 1, 0),
(6, 8, 2, 0),
(6, 8, 4, 0),
(6, 9, 0, 0),
(6, 9, 1, 0),
(6, 9, 2, 0),
(6, 9, 4, 0),
(6, 13, 0, 0),
(6, 13, 1, 0),
(6, 13, 2, 0),
(6, 13, 4, 0),
(6, 14, 0, 0),
(6, 14, 1, 0),
(6, 14, 2, 0),
(6, 14, 4, 0),
(6, 15, 0, 0),
(6, 15, 1, 0),
(6, 15, 2, 0),
(6, 15, 4, 0),
(6, 16, 0, 0),
(6, 16, 1, 0),
(6, 16, 2, 0),
(6, 16, 4, 0),
(6, 18, 0, 0),
(6, 18, 1, 0),
(6, 18, 2, 0),
(6, 18, 4, 0),
(6, 21, 0, 0),
(6, 21, 1, 0),
(6, 21, 2, 0),
(6, 21, 4, 0),
(6, 22, 0, 0),
(6, 22, 1, 0),
(6, 22, 2, 0),
(6, 22, 4, 0),
(6, 23, 0, 0),
(6, 23, 1, 0),
(6, 23, 2, 0),
(6, 23, 4, 0),
(6, 25, 0, 1),
(6, 25, 1, 1),
(6, 25, 2, 1),
(6, 25, 4, 1),
(6, 34, 0, 0),
(6, 34, 1, 0),
(6, 34, 2, 0),
(6, 34, 4, 0),
(6, 35, 0, 0),
(6, 35, 1, 0),
(6, 35, 2, 0),
(6, 35, 4, 0),
(6, 37, 0, 0),
(6, 37, 1, 0),
(6, 37, 2, 0),
(6, 37, 4, 0),
(6, 41, 0, 0),
(6, 41, 1, 0),
(6, 41, 2, 0),
(6, 41, 4, 0),
(6, 42, 0, 0),
(6, 42, 1, 0),
(6, 42, 2, 0),
(6, 42, 4, 0),
(6, 43, 0, 0),
(6, 43, 1, 0),
(6, 43, 2, 0),
(6, 43, 4, 0),
(6, 44, 0, 0),
(6, 44, 1, 0),
(6, 44, 2, 0),
(6, 44, 4, 0),
(6, 46, 0, 0),
(6, 46, 1, 0),
(6, 46, 2, 0),
(6, 46, 4, 0),
(7, 4, 0, 0),
(7, 4, 1, 0),
(7, 4, 2, 0),
(7, 4, 4, 0),
(7, 6, 0, 0),
(7, 6, 1, 0),
(7, 6, 2, 0),
(7, 6, 4, 0),
(7, 8, 0, 0),
(7, 8, 1, 0),
(7, 8, 2, 0),
(7, 8, 4, 0),
(7, 9, 0, 0),
(7, 9, 1, 0),
(7, 9, 2, 0),
(7, 9, 4, 0),
(7, 13, 0, 0),
(7, 13, 1, 0),
(7, 13, 2, 0),
(7, 13, 4, 0),
(7, 14, 0, 0),
(7, 14, 1, 0),
(7, 14, 2, 0),
(7, 14, 4, 0),
(7, 15, 0, 0),
(7, 15, 1, 0),
(7, 15, 2, 0),
(7, 15, 4, 0),
(7, 16, 0, 0),
(7, 16, 1, 0),
(7, 16, 2, 0),
(7, 16, 4, 0),
(7, 18, 0, 0),
(7, 18, 1, 0),
(7, 18, 2, 0),
(7, 18, 4, 0),
(7, 21, 0, 0),
(7, 21, 1, 0),
(7, 21, 2, 0),
(7, 21, 4, 0),
(7, 22, 0, 0),
(7, 22, 1, 0),
(7, 22, 2, 0),
(7, 22, 4, 0),
(7, 23, 0, 0),
(7, 23, 1, 0),
(7, 23, 2, 0),
(7, 23, 4, 0),
(7, 25, 0, 1),
(7, 25, 1, 1),
(7, 25, 2, 1),
(7, 25, 4, 1),
(7, 34, 0, 0),
(7, 34, 1, 0),
(7, 34, 2, 0),
(7, 34, 4, 0),
(7, 35, 0, 0),
(7, 35, 1, 0),
(7, 35, 2, 0),
(7, 35, 4, 0),
(7, 37, 0, 0),
(7, 37, 1, 0),
(7, 37, 2, 0),
(7, 37, 4, 0),
(7, 41, 0, 0),
(7, 41, 1, 0),
(7, 41, 2, 0),
(7, 41, 4, 0),
(7, 42, 0, 0),
(7, 42, 1, 0),
(7, 42, 2, 0),
(7, 42, 4, 0),
(7, 43, 0, 0),
(7, 43, 1, 0),
(7, 43, 2, 0),
(7, 43, 4, 0),
(7, 44, 0, 0),
(7, 44, 1, 0),
(7, 44, 2, 0),
(7, 44, 4, 0),
(7, 46, 0, 0),
(7, 46, 1, 0),
(7, 46, 2, 0),
(7, 46, 4, 0),
(8, 4, 0, 0),
(8, 4, 1, 0),
(8, 4, 2, 0),
(8, 4, 4, 0),
(8, 6, 0, 0),
(8, 6, 1, 0),
(8, 6, 2, 1),
(8, 6, 4, 0),
(8, 8, 0, 0),
(8, 8, 1, 0),
(8, 8, 2, 0),
(8, 8, 4, 0),
(8, 9, 0, 0),
(8, 9, 1, 0),
(8, 9, 2, 0),
(8, 9, 4, 0),
(8, 13, 0, 0),
(8, 13, 1, 0),
(8, 13, 2, 0),
(8, 13, 4, 0),
(8, 14, 0, 1),
(8, 14, 1, 1),
(8, 14, 2, 1),
(8, 14, 4, 0),
(8, 15, 0, 0),
(8, 15, 1, 0),
(8, 15, 2, 1),
(8, 15, 4, 0),
(8, 16, 0, 0),
(8, 16, 1, 0),
(8, 16, 2, 0),
(8, 16, 4, 0),
(8, 18, 0, 1),
(8, 18, 1, 1),
(8, 18, 2, 1),
(8, 18, 4, 1),
(8, 21, 0, 1),
(8, 21, 1, 1),
(8, 21, 2, 1),
(8, 21, 4, 1),
(8, 22, 0, 1),
(8, 22, 1, 1),
(8, 22, 2, 1),
(8, 22, 4, 1),
(8, 23, 0, 1),
(8, 23, 1, 1),
(8, 23, 2, 1),
(8, 23, 4, 1),
(8, 25, 0, 1),
(8, 25, 1, 1),
(8, 25, 2, 1),
(8, 25, 4, 1),
(8, 34, 0, 0),
(8, 34, 1, 0),
(8, 34, 2, 0),
(8, 34, 4, 0),
(8, 35, 0, 0),
(8, 35, 1, 0),
(8, 35, 2, 0),
(8, 35, 4, 0),
(8, 41, 0, 0),
(8, 41, 1, 0),
(8, 41, 2, 0),
(8, 41, 4, 0),
(8, 42, 0, 0),
(8, 42, 1, 0),
(8, 42, 2, 0),
(8, 42, 4, 0),
(8, 43, 0, 0),
(8, 43, 1, 0),
(8, 43, 2, 0),
(8, 43, 4, 0),
(8, 44, 0, 0),
(8, 44, 1, 0),
(8, 44, 2, 0),
(8, 44, 4, 0),
(8, 46, 0, 0),
(8, 46, 1, 0),
(8, 46, 2, 0),
(8, 46, 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2tab` (
  `profileid` int(11) DEFAULT NULL,
  `tabid` int(10) DEFAULT NULL,
  `permissions` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile2tab`
--

INSERT INTO `vtiger_profile2tab` (`profileid`, `tabid`, `permissions`) VALUES
(5, 2, 0),
(5, 7, 0),
(5, 19, 0),
(5, 20, 0),
(5, 26, 0),
(5, 40, 0),
(6, 1, 0),
(6, 4, 0),
(6, 6, 0),
(6, 8, 0),
(6, 9, 0),
(6, 10, 0),
(6, 13, 0),
(6, 14, 0),
(6, 15, 0),
(6, 18, 0),
(6, 21, 0),
(6, 22, 0),
(6, 23, 0),
(6, 24, 0),
(6, 25, 0),
(6, 31, 0),
(6, 34, 0),
(6, 35, 0),
(6, 37, 0),
(6, 39, 0),
(6, 41, 0),
(6, 42, 0),
(6, 43, 0),
(6, 44, 0),
(6, 45, 0),
(6, 46, 0),
(6, 47, 0),
(6, 16, 0),
(7, 1, 0),
(7, 4, 0),
(7, 6, 0),
(7, 8, 0),
(7, 9, 0),
(7, 10, 0),
(7, 13, 0),
(7, 14, 0),
(7, 15, 0),
(7, 18, 0),
(7, 21, 0),
(7, 22, 0),
(7, 23, 0),
(7, 24, 0),
(7, 25, 0),
(7, 31, 0),
(7, 34, 0),
(7, 35, 0),
(7, 37, 0),
(7, 39, 0),
(7, 41, 0),
(7, 42, 0),
(7, 43, 0),
(7, 44, 0),
(7, 45, 0),
(7, 46, 0),
(7, 47, 0),
(7, 16, 0),
(5, 1, 0),
(5, 4, 0),
(5, 6, 0),
(5, 8, 0),
(5, 9, 0),
(5, 10, 0),
(5, 13, 0),
(5, 14, 0),
(5, 15, 0),
(5, 18, 0),
(5, 21, 0),
(5, 22, 0),
(5, 23, 0),
(5, 24, 0),
(5, 25, 0),
(5, 31, 0),
(5, 34, 0),
(5, 35, 0),
(5, 37, 0),
(5, 39, 0),
(5, 41, 0),
(5, 42, 0),
(5, 43, 0),
(5, 44, 0),
(5, 45, 0),
(5, 46, 0),
(5, 47, 0),
(5, 16, 0),
(8, 1, 0),
(8, 4, 0),
(8, 6, 0),
(8, 8, 0),
(8, 9, 0),
(8, 10, 0),
(8, 13, 0),
(8, 14, 0),
(8, 15, 0),
(8, 18, 1),
(8, 21, 1),
(8, 22, 1),
(8, 23, 1),
(8, 24, 0),
(8, 25, 0),
(8, 31, 0),
(8, 34, 0),
(8, 35, 0),
(8, 37, 1),
(8, 39, 0),
(8, 41, 0),
(8, 42, 0),
(8, 43, 0),
(8, 44, 0),
(8, 45, 0),
(8, 46, 0),
(8, 47, 0),
(8, 16, 0),
(5, 48, 0),
(6, 48, 0),
(7, 48, 0),
(8, 48, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile2utility`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2utility` (
  `profileid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `permission` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile2utility`
--

INSERT INTO `vtiger_profile2utility` (`profileid`, `tabid`, `activityid`, `permission`) VALUES
(5, 2, 10, 0),
(5, 4, 10, 0),
(5, 6, 10, 0),
(5, 7, 9, 0),
(5, 7, 10, 0),
(5, 9, 5, 0),
(5, 9, 6, 0),
(5, 13, 10, 0),
(5, 14, 10, 0),
(5, 16, 5, 0),
(5, 16, 6, 0),
(5, 18, 10, 0),
(5, 20, 5, 0),
(5, 20, 6, 0),
(5, 21, 5, 0),
(5, 21, 6, 0),
(5, 22, 5, 0),
(5, 22, 6, 0),
(5, 23, 5, 0),
(5, 23, 6, 0),
(5, 25, 6, 0),
(5, 25, 11, 0),
(5, 34, 5, 0),
(5, 34, 6, 0),
(5, 34, 10, 0),
(5, 35, 5, 0),
(5, 35, 6, 0),
(5, 35, 10, 0),
(5, 42, 5, 0),
(5, 42, 6, 0),
(5, 42, 10, 0),
(5, 43, 5, 0),
(5, 43, 6, 0),
(5, 43, 10, 0),
(5, 44, 5, 0),
(5, 44, 6, 0),
(5, 44, 10, 0),
(6, 4, 10, 0),
(6, 6, 10, 0),
(6, 9, 5, 0),
(6, 9, 6, 0),
(6, 13, 10, 0),
(6, 14, 10, 0),
(6, 16, 5, 0),
(6, 16, 6, 0),
(6, 18, 10, 0),
(6, 21, 5, 0),
(6, 21, 6, 0),
(6, 22, 5, 0),
(6, 22, 6, 0),
(6, 23, 5, 0),
(6, 23, 6, 0),
(6, 25, 6, 0),
(6, 25, 11, 0),
(6, 34, 5, 0),
(6, 34, 6, 0),
(6, 34, 10, 0),
(6, 35, 5, 0),
(6, 35, 6, 0),
(6, 35, 10, 0),
(6, 42, 5, 0),
(6, 42, 6, 0),
(6, 42, 10, 0),
(6, 43, 5, 0),
(6, 43, 6, 0),
(6, 43, 10, 0),
(6, 44, 5, 0),
(6, 44, 6, 0),
(6, 44, 10, 0),
(7, 4, 10, 0),
(7, 6, 10, 0),
(7, 9, 5, 0),
(7, 9, 6, 0),
(7, 13, 10, 0),
(7, 14, 10, 0),
(7, 16, 5, 0),
(7, 16, 6, 0),
(7, 18, 10, 0),
(7, 21, 5, 0),
(7, 21, 6, 0),
(7, 22, 5, 0),
(7, 22, 6, 0),
(7, 23, 5, 0),
(7, 23, 6, 0),
(7, 25, 6, 0),
(7, 25, 11, 0),
(7, 34, 5, 0),
(7, 34, 6, 0),
(7, 34, 10, 0),
(7, 35, 5, 0),
(7, 35, 6, 0),
(7, 35, 10, 0),
(7, 42, 5, 0),
(7, 42, 6, 0),
(7, 42, 10, 0),
(7, 43, 5, 0),
(7, 43, 6, 0),
(7, 43, 10, 0),
(7, 44, 5, 0),
(7, 44, 6, 0),
(7, 44, 10, 0),
(8, 4, 10, 0),
(8, 6, 10, 0),
(8, 9, 5, 0),
(8, 9, 6, 0),
(8, 13, 10, 0),
(8, 14, 10, 0),
(8, 16, 5, 0),
(8, 16, 6, 0),
(8, 18, 10, 0),
(8, 21, 5, 0),
(8, 21, 6, 0),
(8, 22, 5, 0),
(8, 22, 6, 0),
(8, 23, 5, 0),
(8, 23, 6, 0),
(8, 25, 6, 0),
(8, 25, 11, 0),
(8, 34, 5, 0),
(8, 34, 6, 0),
(8, 34, 10, 0),
(8, 35, 5, 0),
(8, 35, 6, 0),
(8, 35, 10, 0),
(8, 42, 5, 0),
(8, 42, 6, 0),
(8, 42, 10, 0),
(8, 43, 5, 0),
(8, 43, 6, 0),
(8, 43, 10, 0),
(8, 44, 5, 0),
(8, 44, 6, 0),
(8, 44, 10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_profile_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_profile_seq`
--

INSERT INTO `vtiger_profile_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_progress`
--

CREATE TABLE IF NOT EXISTS `vtiger_progress` (
`progressid` int(11) NOT NULL,
  `progress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_progress`
--

INSERT INTO `vtiger_progress` (`progressid`, `progress`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, '10%', 1, 278, 2),
(3, '20%', 1, 279, 3),
(4, '30%', 1, 280, 4),
(5, '40%', 1, 281, 5),
(6, '50%', 1, 282, 6),
(7, '60%', 1, 283, 7),
(8, '70%', 1, 284, 8),
(9, '80%', 1, 285, 9),
(10, '90%', 1, 286, 10),
(11, '100%', 1, 287, 11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_progress_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_progress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_progress_seq`
--

INSERT INTO `vtiger_progress_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_project`
--

CREATE TABLE IF NOT EXISTS `vtiger_project` (
  `projectid` int(11) DEFAULT NULL,
  `projectname` varchar(255) DEFAULT NULL,
  `project_no` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `targetenddate` date DEFAULT NULL,
  `actualenddate` date DEFAULT NULL,
  `targetbudget` varchar(255) DEFAULT NULL,
  `projecturl` varchar(255) DEFAULT NULL,
  `projectstatus` varchar(100) DEFAULT NULL,
  `projectpriority` varchar(100) DEFAULT NULL,
  `projecttype` varchar(100) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  `linktoaccountscontacts` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_project`
--

INSERT INTO `vtiger_project` (`projectid`, `projectname`, `project_no`, `startdate`, `targetenddate`, `actualenddate`, `targetbudget`, `projecturl`, `projectstatus`, `projectpriority`, `projecttype`, `progress`, `linktoaccountscontacts`) VALUES
(12, '项目1', 'PROJ1', NULL, NULL, NULL, '', '', 'completed', '', '', '', '25'),
(30, '项目1', 'PROJ2', NULL, NULL, NULL, '', '', 'initiated', '', '', '', ''),
(31, 'test', 'PROJ3', NULL, NULL, NULL, '', '', 'archived', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectcf` (
  `projectid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectcf`
--

INSERT INTO `vtiger_projectcf` (`projectid`) VALUES
(12),
(30),
(31);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectmilestone`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestone` (
  `projectmilestoneid` int(11) NOT NULL,
  `projectmilestonename` varchar(255) DEFAULT NULL,
  `projectmilestone_no` varchar(100) DEFAULT NULL,
  `projectmilestonedate` varchar(255) DEFAULT NULL,
  `projectid` varchar(100) DEFAULT NULL,
  `projectmilestonetype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectmilestone`
--

INSERT INTO `vtiger_projectmilestone` (`projectmilestoneid`, `projectmilestonename`, `projectmilestone_no`, `projectmilestonedate`, `projectid`, `projectmilestonetype`) VALUES
(13, 'sadf', 'PM1', NULL, '12', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectmilestonecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonecf` (
  `projectmilestoneid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectmilestonecf`
--

INSERT INTO `vtiger_projectmilestonecf` (`projectmilestoneid`) VALUES
(13);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectmilestonetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonetype` (
`projectmilestonetypeid` int(11) NOT NULL,
  `projectmilestonetype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectmilestonetype`
--

INSERT INTO `vtiger_projectmilestonetype` (`projectmilestonetypeid`, `projectmilestonetype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'administrative', 1, 238, 2),
(3, 'operative', 1, 239, 3),
(4, 'other', 1, 240, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectmilestonetype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonetype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectmilestonetype_seq`
--

INSERT INTO `vtiger_projectmilestonetype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectpriority` (
`projectpriorityid` int(11) NOT NULL,
  `projectpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectpriority`
--

INSERT INTO `vtiger_projectpriority` (`projectpriorityid`, `projectpriority`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'low', 1, 274, 2),
(3, 'normal', 1, 275, 3),
(4, 'high', 1, 276, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectpriority_seq`
--

INSERT INTO `vtiger_projectpriority_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectstatus` (
`projectstatusid` int(11) NOT NULL,
  `projectstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectstatus`
--

INSERT INTO `vtiger_projectstatus` (`projectstatusid`, `projectstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'prospecting', 1, 261, 2),
(3, 'initiated', 1, 262, 3),
(4, 'in progress', 1, 263, 4),
(5, 'waiting for feedback', 1, 264, 5),
(6, 'on hold', 1, 265, 6),
(7, 'completed', 1, 266, 7),
(8, 'delivered', 1, 267, 8),
(9, 'archived', 1, 268, 9);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projectstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projectstatus_seq`
--

INSERT INTO `vtiger_projectstatus_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttask`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttask` (
  `projecttaskid` int(11) NOT NULL,
  `projecttaskname` varchar(255) DEFAULT NULL,
  `projecttask_no` varchar(100) DEFAULT NULL,
  `projecttasktype` varchar(100) DEFAULT NULL,
  `projecttaskpriority` varchar(100) DEFAULT NULL,
  `projecttaskprogress` varchar(100) DEFAULT NULL,
  `projecttaskhours` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `projectid` varchar(100) DEFAULT NULL,
  `projecttasknumber` int(11) DEFAULT NULL,
  `projecttaskstatus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskcf` (
  `projecttaskid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskpriority` (
`projecttaskpriorityid` int(11) NOT NULL,
  `projecttaskpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttaskpriority`
--

INSERT INTO `vtiger_projecttaskpriority` (`projecttaskpriorityid`, `projecttaskpriority`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'low', 1, 246, 2),
(3, 'normal', 1, 247, 3),
(4, 'high', 1, 248, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttaskpriority_seq`
--

INSERT INTO `vtiger_projecttaskpriority_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskprogress`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskprogress` (
`projecttaskprogressid` int(11) NOT NULL,
  `projecttaskprogress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttaskprogress`
--

INSERT INTO `vtiger_projecttaskprogress` (`projecttaskprogressid`, `projecttaskprogress`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, '10%', 1, 250, 2),
(3, '20%', 1, 251, 3),
(4, '30%', 1, 252, 4),
(5, '40%', 1, 253, 5),
(6, '50%', 1, 254, 6),
(7, '60%', 1, 255, 7),
(8, '70%', 1, 256, 8),
(9, '80%', 1, 257, 9),
(10, '90%', 1, 258, 10),
(11, '100%', 1, 259, 11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskprogress_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskprogress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttaskprogress_seq`
--

INSERT INTO `vtiger_projecttaskprogress_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskstatus` (
`projecttaskstatusid` int(11) NOT NULL,
  `projecttaskstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttaskstatus`
--

INSERT INTO `vtiger_projecttaskstatus` (`projecttaskstatusid`, `projecttaskstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Open', 0, 290, 2),
(3, 'In Progress', 0, 291, 3),
(4, 'Completed', 0, 292, 4),
(5, 'Deferred', 0, 293, 5),
(6, 'Canceled ', 0, 294, 6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttaskstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttaskstatus_seq`
--

INSERT INTO `vtiger_projecttaskstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttasktype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttasktype` (
`projecttasktypeid` int(11) NOT NULL,
  `projecttasktype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttasktype`
--

INSERT INTO `vtiger_projecttasktype` (`projecttasktypeid`, `projecttasktype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'administrative', 1, 242, 2),
(3, 'operative', 1, 243, 3),
(4, 'other', 1, 244, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttasktype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttasktype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttasktype_seq`
--

INSERT INTO `vtiger_projecttasktype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttype` (
`projecttypeid` int(11) NOT NULL,
  `projecttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttype`
--

INSERT INTO `vtiger_projecttype` (`projecttypeid`, `projecttype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'administrative', 1, 270, 2),
(3, 'operative', 1, 271, 3),
(4, 'other', 1, 272, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_projecttype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_projecttype_seq`
--

INSERT INTO `vtiger_projecttype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_purchaseorder`
--

CREATE TABLE IF NOT EXISTS `vtiger_purchaseorder` (
  `purchaseorderid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `quoteid` int(19) DEFAULT NULL,
  `vendorid` int(19) DEFAULT NULL,
  `requisition_no` varchar(100) DEFAULT NULL,
  `purchaseorder_no` varchar(100) DEFAULT NULL,
  `tracking_no` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `terms_conditions` text,
  `postatus` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `paid` decimal(25,8) DEFAULT NULL,
  `balance` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_purchaseordercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_purchaseordercf` (
  `purchaseorderid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotes`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotes` (
  `quoteid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `potentialid` int(19) DEFAULT NULL,
  `quotestage` varchar(200) DEFAULT NULL,
  `validtill` date DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `quote_no` varchar(100) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `inventorymanager` int(19) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotesbillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotesbillads` (
  `quotebilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotescf`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotescf` (
  `quoteid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotesshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotesshipads` (
  `quoteshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotestage`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestage` (
`quotestageid` int(19) NOT NULL,
  `quotestage` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_quotestage`
--

INSERT INTO `vtiger_quotestage` (`quotestageid`, `quotestage`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Created', 0, 139, 0),
(2, 'Delivered', 0, 140, 1),
(3, 'Reviewed', 0, 141, 2),
(4, 'Accepted', 0, 142, 3),
(5, 'Rejected', 0, 143, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotestage_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_quotestage_seq`
--

INSERT INTO `vtiger_quotestage_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_quotestagehistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestagehistory` (
`historyid` int(19) NOT NULL,
  `quoteid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `quotestage` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_rating`
--

CREATE TABLE IF NOT EXISTS `vtiger_rating` (
`rating_id` int(19) NOT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_rating`
--

INSERT INTO `vtiger_rating` (`rating_id`, `rating`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Acquired', 1, 145, 1),
(3, 'Active', 1, 146, 2),
(4, 'Market Failed', 1, 147, 3),
(5, 'Project Cancelled', 1, 148, 4),
(6, 'Shutdown', 1, 149, 5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_rating_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_rating_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_rating_seq`
--

INSERT INTO `vtiger_rating_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_recurring_frequency`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurring_frequency` (
  `recurring_frequency_id` int(11) DEFAULT NULL,
  `recurring_frequency` varchar(200) DEFAULT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_recurring_frequency`
--

INSERT INTO `vtiger_recurring_frequency` (`recurring_frequency_id`, `recurring_frequency`, `sortorderid`, `presence`) VALUES
(2, 'Daily', 1, 1),
(3, 'Weekly', 2, 1),
(4, 'Monthly', 3, 1),
(5, 'Quarterly', 4, 1),
(6, 'Yearly', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_recurring_frequency_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurring_frequency_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_recurring_frequency_seq`
--

INSERT INTO `vtiger_recurring_frequency_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_recurringevents`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringevents` (
`recurringid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL,
  `recurringdate` date DEFAULT NULL,
  `recurringtype` varchar(30) DEFAULT NULL,
  `recurringfreq` int(19) DEFAULT NULL,
  `recurringinfo` varchar(50) DEFAULT NULL,
  `recurringenddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_recurringtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringtype` (
`recurringeventid` int(19) NOT NULL,
  `recurringtype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_recurringtype`
--

INSERT INTO `vtiger_recurringtype` (`recurringeventid`, `recurringtype`, `sortorderid`, `presence`) VALUES
(2, 'Daily', 1, 1),
(3, 'Weekly', 2, 1),
(4, 'Monthly', 3, 1),
(5, 'Yearly', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_recurringtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_recurringtype_seq`
--

INSERT INTO `vtiger_recurringtype_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_relatedlists`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists` (
  `relation_id` int(19) NOT NULL,
  `tabid` int(10) DEFAULT NULL,
  `related_tabid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `presence` int(10) NOT NULL DEFAULT '0',
  `actions` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_relatedlists`
--

INSERT INTO `vtiger_relatedlists` (`relation_id`, `tabid`, `related_tabid`, `name`, `sequence`, `label`, `presence`, `actions`) VALUES
(1, 6, 4, 'get_contacts', 1, 'Contacts', 0, 'add'),
(2, 6, 2, 'get_opportunities', 2, 'Potentials', 0, 'add'),
(3, 6, 20, 'get_quotes', 3, 'Quotes', 0, 'add'),
(4, 6, 22, 'get_salesorder', 4, 'Sales Order', 0, 'add'),
(5, 6, 23, 'get_invoices', 5, 'Invoice', 0, 'add'),
(6, 6, 9, 'get_activities', 6, 'Activities', 0, 'add'),
(7, 6, 10, 'get_emails', 7, 'Emails', 0, 'add'),
(8, 6, 9, 'get_history', 8, 'Activity History', 0, 'add'),
(9, 6, 8, 'get_attachments', 9, 'Documents', 0, 'add,select'),
(10, 6, 13, 'get_tickets', 10, 'HelpDesk', 0, 'add'),
(11, 6, 14, 'get_products', 11, 'Products', 0, 'select'),
(12, 7, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(13, 7, 10, 'get_emails', 2, 'Emails', 0, 'add'),
(14, 7, 9, 'get_history', 3, 'Activity History', 0, 'add'),
(15, 7, 8, 'get_attachments', 4, 'Documents', 0, 'add,select'),
(16, 7, 14, 'get_products', 5, 'Products', 0, 'select'),
(17, 7, 26, 'get_campaigns', 6, 'Campaigns', 0, 'select'),
(18, 4, 2, 'get_opportunities', 1, 'Potentials', 0, 'add'),
(19, 4, 9, 'get_activities', 2, 'Activities', 0, 'add'),
(20, 4, 10, 'get_emails', 3, 'Emails', 0, 'add'),
(21, 4, 13, 'get_tickets', 4, 'HelpDesk', 0, 'add'),
(22, 4, 20, 'get_quotes', 5, 'Quotes', 0, 'add'),
(23, 4, 21, 'get_purchase_orders', 6, 'Purchase Order', 0, 'add'),
(24, 4, 22, 'get_salesorder', 7, 'Sales Order', 0, 'add'),
(25, 4, 14, 'get_products', 8, 'Products', 0, 'select'),
(26, 4, 9, 'get_history', 9, 'Activity History', 0, 'add'),
(27, 4, 8, 'get_attachments', 10, 'Documents', 0, 'add,select'),
(28, 4, 26, 'get_campaigns', 11, 'Campaigns', 0, 'select'),
(29, 4, 23, 'get_invoices', 12, 'Invoice', 0, 'add'),
(30, 2, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(31, 2, 4, 'get_contacts', 2, 'Contacts', 0, 'select'),
(32, 2, 14, 'get_products', 3, 'Products', 0, 'select'),
(33, 2, 0, 'get_stage_history', 4, 'Sales Stage History', 0, ''),
(34, 2, 8, 'get_attachments', 5, 'Documents', 0, 'add,select'),
(35, 2, 20, 'get_Quotes', 6, 'Quotes', 0, 'add'),
(36, 2, 22, 'get_salesorder', 7, 'Sales Order', 0, 'add'),
(37, 2, 9, 'get_history', 8, 'Activity History', 0, ''),
(38, 14, 13, 'get_tickets', 1, 'HelpDesk', 0, 'add'),
(39, 14, 8, 'get_attachments', 3, 'Documents', 0, 'add,select'),
(40, 14, 20, 'get_quotes', 4, 'Quotes', 0, 'add'),
(41, 14, 21, 'get_purchase_orders', 5, 'Purchase Order', 0, 'add'),
(42, 14, 22, 'get_salesorder', 6, 'Sales Order', 0, 'add'),
(43, 14, 23, 'get_invoices', 7, 'Invoice', 0, 'add'),
(44, 14, 19, 'get_product_pricebooks', 8, 'PriceBooks', 0, 'ADD,SELECT'),
(45, 14, 7, 'get_leads', 9, 'Leads', 0, 'select'),
(46, 14, 6, 'get_accounts', 10, 'Accounts', 0, 'select'),
(47, 14, 4, 'get_contacts', 11, 'Contacts', 0, 'select'),
(48, 14, 2, 'get_opportunities', 12, 'Potentials', 0, 'select'),
(49, 14, 14, 'get_products', 13, 'Product Bundles', 0, 'add,select'),
(50, 14, 14, 'get_parent_products', 14, 'Parent Product', 0, ''),
(51, 10, 4, 'get_contacts', 1, 'Contacts', 0, 'select,bulkmail'),
(52, 10, 0, 'get_users', 2, 'Users', 0, ''),
(53, 10, 8, 'get_attachments', 3, 'Documents', 0, 'add,select'),
(54, 13, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(55, 13, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(56, 13, 0, 'get_ticket_history', 3, 'Ticket History', 0, ''),
(57, 13, 9, 'get_history', 4, 'Activity History', 0, 'add'),
(58, 19, 14, 'get_pricebook_products', 2, 'Products', 0, 'select'),
(59, 18, 14, 'get_products', 1, 'Products', 0, 'add,select'),
(60, 18, 21, 'get_purchase_orders', 2, 'Purchase Order', 0, 'add'),
(61, 18, 4, 'get_contacts', 3, 'Contacts', 0, 'select'),
(62, 18, 10, 'get_emails', 4, 'Emails', 0, 'add'),
(63, 20, 22, 'get_salesorder', 1, 'Sales Order', 0, ''),
(64, 20, 9, 'get_activities', 2, 'Activities', 0, 'add'),
(65, 20, 8, 'get_attachments', 3, 'Documents', 0, 'add,select'),
(66, 20, 9, 'get_history', 4, 'Activity History', 0, ''),
(67, 20, 0, 'get_quotestagehistory', 5, 'Quote Stage History', 0, ''),
(68, 21, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(69, 21, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(70, 21, 9, 'get_history', 3, 'Activity History', 0, ''),
(71, 21, 0, 'get_postatushistory', 4, 'PurchaseOrder Status History', 0, ''),
(72, 22, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(73, 22, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(74, 22, 23, 'get_invoices', 3, 'Invoice', 0, ''),
(75, 22, 9, 'get_history', 4, 'Activity History', 0, ''),
(76, 22, 0, 'get_sostatushistory', 5, 'SalesOrder Status History', 0, ''),
(77, 23, 9, 'get_activities', 1, 'Activities', 0, 'add'),
(78, 23, 8, 'get_attachments', 2, 'Documents', 0, 'add,select'),
(79, 23, 9, 'get_history', 3, 'Activity History', 0, ''),
(80, 23, 0, 'get_invoicestatushistory', 4, 'Invoice Status History', 0, ''),
(81, 9, 0, 'get_users', 1, 'Users', 0, ''),
(82, 9, 4, 'get_contacts', 2, 'Contacts', 0, ''),
(83, 26, 4, 'get_contacts', 1, 'Contacts', 0, 'add,select'),
(84, 26, 7, 'get_leads', 2, 'Leads', 0, 'add,select'),
(85, 26, 2, 'get_opportunities', 3, 'Potentials', 0, 'add'),
(86, 26, 9, 'get_activities', 4, 'Activities', 0, 'add'),
(87, 6, 26, 'get_campaigns', 13, 'Campaigns', 0, 'select'),
(88, 26, 6, 'get_accounts', 5, 'Accounts', 0, 'add,select'),
(89, 15, 8, 'get_attachments', 1, 'Documents', 0, 'add,select'),
(90, 34, 13, 'get_related_list', 1, 'Service Requests', 0, 'ADD,SELECT'),
(91, 34, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT'),
(92, 6, 34, 'get_dependents_list', 14, 'Service Contracts', 0, 'ADD'),
(93, 4, 34, 'get_dependents_list', 13, 'Service Contracts', 0, 'ADD'),
(94, 13, 34, 'get_related_list', 5, 'Service Contracts', 0, 'ADD,SELECT'),
(95, 35, 13, 'get_related_list', 1, 'HelpDesk', 0, 'ADD,SELECT'),
(96, 35, 20, 'get_quotes', 2, 'Quotes', 0, 'ADD'),
(97, 35, 21, 'get_purchase_orders', 3, 'Purchase Order', 0, 'ADD'),
(98, 35, 22, 'get_salesorder', 4, 'Sales Order', 0, 'ADD'),
(99, 35, 23, 'get_invoices', 5, 'Invoice', 0, 'ADD'),
(100, 35, 19, 'get_service_pricebooks', 6, 'PriceBooks', 0, 'ADD'),
(101, 35, 7, 'get_related_list', 7, 'Leads', 0, 'SELECT'),
(102, 35, 6, 'get_related_list', 8, 'Accounts', 0, 'SELECT'),
(103, 35, 4, 'get_related_list', 9, 'Contacts', 0, 'SELECT'),
(104, 35, 2, 'get_related_list', 10, 'Potentials', 0, 'SELECT'),
(105, 35, 8, 'get_attachments', 11, 'Documents', 0, 'ADD,SELECT'),
(106, 13, 35, 'get_related_list', 6, 'Services', 0, 'SELECT'),
(107, 7, 35, 'get_related_list', 7, 'Services', 0, 'SELECT'),
(108, 6, 35, 'get_related_list', 15, 'Services', 0, 'SELECT'),
(109, 4, 35, 'get_related_list', 14, 'Services', 0, 'SELECT'),
(110, 2, 35, 'get_related_list', 9, 'Services', 0, 'SELECT'),
(111, 19, 35, 'get_pricebook_services', 3, 'Services', 0, 'SELECT'),
(112, 37, 13, 'get_related_list', 1, 'HelpDesk', 0, 'ADD,SELECT'),
(113, 37, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT'),
(114, 6, 37, 'get_dependents_list', 16, 'Assets', 0, 'ADD'),
(115, 14, 37, 'get_dependents_list', 15, 'Assets', 0, 'ADD'),
(116, 23, 37, 'get_dependents_list', 5, 'Assets', 0, 'ADD'),
(123, 6, 44, 'get_dependents_list', 17, 'Projects', 0, 'add'),
(124, 4, 44, 'get_dependents_list', 15, 'Projects', 0, 'add'),
(125, 13, 44, 'get_related_list', 7, 'Projects', 0, 'SELECT'),
(126, 46, 6, 'get_related_list', 1, 'Accounts', 0, ' '),
(127, 46, 4, 'get_related_list', 2, 'Contacts', 0, ' '),
(128, 46, 7, 'get_related_list', 3, 'Leads', 0, ' '),
(129, 43, 8, 'get_attachments', 1, 'Documents', 0, 'ADD,SELECT'),
(130, 44, 43, 'get_dependents_list', 1, 'Project Tasks', 0, 'ADD'),
(131, 44, 42, 'get_dependents_list', 2, 'Project Milestones', 0, 'ADD'),
(132, 44, 8, 'get_attachments', 3, 'Documents', 0, 'ADD,SELECT'),
(133, 44, 13, 'get_related_list', 4, 'HelpDesk', 0, 'ADD,SELECT'),
(134, 44, 0, 'get_gantt_chart', 5, 'Charts', 0, ''),
(135, 4, 37, 'get_dependents_list', 16, 'Assets', 0, 'ADD'),
(136, 4, 18, 'get_vendors', 17, 'Vendors', 0, 'SELECT');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_relatedlists_rb`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists_rb` (
  `entityid` int(19) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `rel_table` varchar(200) DEFAULT NULL,
  `rel_column` varchar(200) DEFAULT NULL,
  `ref_column` varchar(200) DEFAULT NULL,
  `related_crm_ids` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_relatedlists_rb`
--

INSERT INTO `vtiger_relatedlists_rb` (`entityid`, `action`, `rel_table`, `rel_column`, `ref_column`, `related_crm_ids`) VALUES
(9, 'update', 'vtiger_crmentity', 'deleted', 'crmid', ''),
(9, 'update', 'vtiger_crmentity', 'deleted', 'crmid', ''),
(25, 'update', 'vtiger_crmentity', 'deleted', 'crmid', ''),
(25, 'update', 'vtiger_crmentity', 'deleted', 'crmid', ''),
(25, 'update', 'vtiger_project', 'linktoaccountscontacts', 'projectid', '12'),
(12, 'update', 'vtiger_projectmilestone', 'projectid', 'projectmilestoneid', '13'),
(28, 'update', 'vtiger_inventoryproductrel', 'productid', 'invoiceid', ''),
(28, 'update', 'vtiger_inventoryproductrel', 'productid', 'salesorderid', ''),
(28, 'update', 'vtiger_inventoryproductrel', 'productid', 'purchaseorderid', ''),
(28, 'update', 'vtiger_inventoryproductrel', 'productid', 'quoteid', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_relatedlists_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_relatedlists_seq`
--

INSERT INTO `vtiger_relatedlists_seq` (`id`) VALUES
(136);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_relcriteria`
--

CREATE TABLE IF NOT EXISTS `vtiger_relcriteria` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `comparator` varchar(20) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL,
  `groupid` int(11) DEFAULT '1',
  `column_condition` varchar(256) DEFAULT 'and'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_relcriteria`
--

INSERT INTO `vtiger_relcriteria` (`queryid`, `columnindex`, `columnname`, `comparator`, `value`, `groupid`, `column_condition`) VALUES
(1, 0, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V', 'n', '', 1, ''),
(2, 0, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V', 'e', '', 1, 'and'),
(3, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V', 'n', '', 1, 'and'),
(7, 0, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V', 'e', 'Closed Won', 1, 'and'),
(12, 0, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V', 'n', 'Closed', 1, 'and'),
(15, 0, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V', 'n', 'Accepted', 1, 'and'),
(15, 1, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V', 'n', 'Rejected', 1, 'and'),
(22, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(23, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(24, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(25, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(26, 0, 'vtiger_usersServiceContracts:user_name:ServiceContracts_Assigned_To:assigned_user_id:V', 'e', 'DINNER CHEN', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_relcriteria_grouping`
--

CREATE TABLE IF NOT EXISTS `vtiger_relcriteria_grouping` (
  `groupid` int(11) NOT NULL,
  `queryid` int(19) NOT NULL,
  `group_condition` varchar(256) DEFAULT NULL,
  `condition_expression` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_relcriteria_grouping`
--

INSERT INTO `vtiger_relcriteria_grouping` (`groupid`, `queryid`, `group_condition`, `condition_expression`) VALUES
(1, 1, 'and', ' 0 '),
(1, 2, '', '0'),
(1, 3, '', '0'),
(1, 7, '', '0'),
(1, 12, '', '0'),
(1, 15, '', '0 and 1'),
(1, 22, '', '0'),
(1, 23, '', '0'),
(1, 24, '', '0'),
(1, 25, '', '0'),
(1, 26, 'and', ' 0 ');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reminder_interval`
--

CREATE TABLE IF NOT EXISTS `vtiger_reminder_interval` (
`reminder_intervalid` int(19) NOT NULL,
  `reminder_interval` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL,
  `presence` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reminder_interval`
--

INSERT INTO `vtiger_reminder_interval` (`reminder_intervalid`, `reminder_interval`, `sortorderid`, `presence`) VALUES
(2, '1 Minute', 1, 1),
(3, '5 Minutes', 2, 1),
(4, '15 Minutes', 3, 1),
(5, '30 Minutes', 4, 1),
(6, '45 Minutes', 5, 1),
(7, '1 Hour', 6, 1),
(8, '1 Day', 7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reminder_interval_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_reminder_interval_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reminder_interval_seq`
--

INSERT INTO `vtiger_reminder_interval_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_report`
--

CREATE TABLE IF NOT EXISTS `vtiger_report` (
  `reportid` int(19) NOT NULL,
  `folderid` int(19) NOT NULL,
  `reportname` varchar(100) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `reporttype` varchar(50) DEFAULT '',
  `queryid` int(19) NOT NULL DEFAULT '0',
  `state` varchar(50) DEFAULT 'SAVED',
  `customizable` int(1) DEFAULT '1',
  `category` int(11) DEFAULT '1',
  `owner` int(11) DEFAULT '1',
  `sharingtype` varchar(200) DEFAULT 'Private'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_report`
--

INSERT INTO `vtiger_report` (`reportid`, `folderid`, `reportname`, `description`, `reporttype`, `queryid`, `state`, `customizable`, `category`, `owner`, `sharingtype`) VALUES
(1, 1, 'Contacts by Accounts', 'Contacts related to Accounts', 'tabular', 1, 'CUSTOM', 1, 1, 1, 'Public'),
(2, 1, 'Contacts without Accounts', 'Contacts not related to Accounts', 'tabular', 2, 'CUSTOM', 1, 1, 1, 'Public'),
(3, 1, 'Contacts by Potentials', 'Contacts related to Potentials', 'tabular', 3, 'CUSTOM', 1, 1, 1, 'Public'),
(4, 2, 'Lead by Source', 'Lead by Source', 'summary', 4, 'CUSTOM', 1, 1, 1, 'Public'),
(5, 2, 'Lead Status Report', 'Lead Status Report', 'summary', 5, 'CUSTOM', 1, 1, 1, 'Public'),
(6, 3, 'Potential Pipeline', 'Potential Pipeline', 'summary', 6, 'CUSTOM', 1, 1, 1, 'Public'),
(7, 3, 'Closed Potentials', 'Potential that have Won', 'tabular', 7, 'CUSTOM', 1, 1, 1, 'Public'),
(8, 4, 'Last Month Activities', 'Last Month Activities', 'tabular', 8, 'CUSTOM', 1, 1, 1, 'Public'),
(9, 4, 'This Month Activities', 'This Month Activities', 'tabular', 9, 'CUSTOM', 1, 1, 1, 'Public'),
(10, 5, 'Tickets by Products', 'Tickets related to Products', 'tabular', 10, 'CUSTOM', 1, 1, 1, 'Public'),
(11, 5, 'Tickets by Priority', 'Tickets by Priority', 'summary', 11, 'CUSTOM', 1, 1, 1, 'Public'),
(12, 5, 'Open Tickets', 'Tickets that are Open', 'tabular', 12, 'CUSTOM', 1, 1, 1, 'Public'),
(13, 6, 'Product Details', 'Product Detailed Report', 'tabular', 13, 'CUSTOM', 1, 1, 1, 'Public'),
(14, 6, 'Products by Contacts', 'Products related to Contacts', 'tabular', 14, 'CUSTOM', 1, 1, 1, 'Public'),
(15, 7, 'Open Quotes', 'Quotes that are Open', 'tabular', 15, 'CUSTOM', 1, 1, 1, 'Public'),
(16, 7, 'Quotes Detailed Report', 'Quotes Detailed Report', 'tabular', 16, 'CUSTOM', 1, 1, 1, 'Public'),
(17, 8, 'PurchaseOrder by Contacts', 'PurchaseOrder related to Contacts', 'tabular', 17, 'CUSTOM', 1, 1, 1, 'Public'),
(18, 8, 'PurchaseOrder Detailed Report', 'PurchaseOrder Detailed Report', 'tabular', 18, 'CUSTOM', 1, 1, 1, 'Public'),
(19, 9, 'Invoice Detailed Report', 'Invoice Detailed Report', 'tabular', 19, 'CUSTOM', 1, 1, 1, 'Public'),
(20, 10, 'SalesOrder Detailed Report', 'SalesOrder Detailed Report', 'tabular', 20, 'CUSTOM', 1, 1, 1, 'Public'),
(21, 11, 'Campaign Expectations and Actuals', 'Campaign Expectations and Actuals', 'tabular', 21, 'CUSTOM', 1, 1, 1, 'Public'),
(22, 12, 'Contacts Email Report', 'Emails sent to Contacts', 'tabular', 22, 'CUSTOM', 1, 1, 1, 'Public'),
(23, 12, 'Accounts Email Report', 'Emails sent to Organizations', 'tabular', 23, 'CUSTOM', 1, 1, 1, 'Public'),
(24, 12, 'Leads Email Report', 'Emails sent to Leads', 'tabular', 24, 'CUSTOM', 1, 1, 1, 'Public'),
(25, 12, 'Vendors Email Report', 'Emails sent to Vendors', 'tabular', 25, 'CUSTOM', 1, 1, 1, 'Public'),
(26, 1, 'test', '', 'chart', 26, 'CUSTOM', 1, 1, 1, 'Public'),
(27, 1, 'asfasfw23', '', 'tabular', 27, 'CUSTOM', 1, 1, 1, 'Public'),
(28, 1, 'asfasfw23', '', 'tabular', 28, 'CUSTOM', 1, 1, 1, 'Public'),
(29, 1, 'sdfwef', '', 'chart', 29, 'CUSTOM', 1, 1, 1, 'Public');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportdatefilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportdatefilter` (
  `datefilterid` int(19) NOT NULL,
  `datecolumnname` varchar(250) DEFAULT '',
  `datefilter` varchar(250) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reportdatefilter`
--

INSERT INTO `vtiger_reportdatefilter` (`datefilterid`, `datecolumnname`, `datefilter`, `startdate`, `enddate`) VALUES
(8, 'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time', 'lastmonth', '2005-05-01', '2005-05-31'),
(9, 'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time', 'thismonth', '2005-06-01', '2005-06-30');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportfilters`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportfilters` (
  `filterid` int(19) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reportfilters`
--

INSERT INTO `vtiger_reportfilters` (`filterid`, `name`) VALUES
(1, 'Private'),
(2, 'Public'),
(3, 'Shared');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportfolder`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportfolder` (
`folderid` int(19) NOT NULL,
  `foldername` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `state` varchar(50) DEFAULT 'SAVED'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reportfolder`
--

INSERT INTO `vtiger_reportfolder` (`folderid`, `foldername`, `description`, `state`) VALUES
(1, 'Account and Contact Reports', 'Account and Contact Reports', 'SAVED'),
(2, 'Lead Reports', 'Lead Reports', 'SAVED'),
(3, 'Potential Reports', 'Potential Reports', 'SAVED'),
(4, 'Activity Reports', 'Activity Reports', 'SAVED'),
(5, 'HelpDesk Reports', 'HelpDesk Reports', 'SAVED'),
(6, 'Product Reports', 'Product Reports', 'SAVED'),
(7, 'Quote Reports', 'Quote Reports', 'SAVED'),
(8, 'PurchaseOrder Reports', 'PurchaseOrder Reports', 'SAVED'),
(9, 'Invoice Reports', 'Invoice Reports', 'SAVED'),
(10, 'SalesOrder Reports', 'SalesOrder Reports', 'SAVED'),
(11, 'Campaign Reports', 'Campaign Reports', 'SAVED'),
(12, 'Email Reports', 'Email Reports', 'SAVED');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportgroupbycolumn`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportgroupbycolumn` (
  `reportid` int(19) DEFAULT NULL,
  `sortid` int(19) DEFAULT NULL,
  `sortcolname` varchar(250) DEFAULT NULL,
  `dategroupbycriteria` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportmodules`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportmodules` (
  `reportmodulesid` int(19) NOT NULL,
  `primarymodule` varchar(50) NOT NULL DEFAULT '',
  `secondarymodules` varchar(250) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reportmodules`
--

INSERT INTO `vtiger_reportmodules` (`reportmodulesid`, `primarymodule`, `secondarymodules`) VALUES
(1, 'Contacts', 'Accounts'),
(2, 'Contacts', 'Accounts'),
(3, 'Contacts', 'Potentials'),
(4, 'Leads', ''),
(5, 'Leads', ''),
(6, 'Potentials', ''),
(7, 'Potentials', ''),
(8, 'Calendar', ''),
(9, 'Calendar', ''),
(10, 'HelpDesk', 'Products'),
(11, 'HelpDesk', ''),
(12, 'HelpDesk', ''),
(13, 'Products', ''),
(14, 'Products', 'Contacts'),
(15, 'Quotes', ''),
(16, 'Quotes', ''),
(17, 'PurchaseOrder', 'Contacts'),
(18, 'PurchaseOrder', ''),
(19, 'Invoice', ''),
(20, 'SalesOrder', ''),
(21, 'Campaigns', ''),
(22, 'Contacts', 'Emails'),
(23, 'Accounts', 'Emails'),
(24, 'Leads', 'Emails'),
(25, 'Vendors', 'Emails'),
(26, 'ServiceContracts', 'HelpDesk'),
(27, 'Products', 'HelpDesk:Accounts'),
(28, 'Products', 'HelpDesk:Accounts'),
(29, 'Products', 'Accounts:Contacts');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportsharing`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsharing` (
  `reportid` int(19) NOT NULL,
  `shareid` int(19) NOT NULL,
  `setype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportsortcol`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsortcol` (
  `sortcolid` int(19) NOT NULL,
  `reportid` int(19) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `sortorder` varchar(250) DEFAULT 'Asc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reportsortcol`
--

INSERT INTO `vtiger_reportsortcol` (`sortcolid`, `reportid`, `columnname`, `sortorder`) VALUES
(0, 27, 'none', ''),
(0, 28, 'none', ''),
(1, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V', 'Ascending'),
(1, 5, 'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V', 'Ascending'),
(1, 6, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V', 'Ascending'),
(1, 11, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V', 'Ascending'),
(1, 27, 'none', ''),
(1, 28, 'none', ''),
(2, 27, 'none', ''),
(2, 28, 'none', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reportsummary`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsummary` (
  `reportsummaryid` int(19) NOT NULL,
  `summarytype` int(19) NOT NULL,
  `columnname` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_reporttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_reporttype` (
  `reportid` int(10) NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_reporttype`
--

INSERT INTO `vtiger_reporttype` (`reportid`, `data`) VALUES
(26, '{"type":"pieChart","groupbyfield":"vtiger_servicecontracts:actual_duration:ServiceContracts_Actual_Duration:actual_duration:V","datafields":["vtiger_troubletickets:days:HelpDesk_Days:days:N:AVG"]}'),
(29, '{"type":"pieChart","groupbyfield":"vtiger_products:productname:Products_Product_Name:productname:V","datafields":["count(*)"]}');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_role`
--

CREATE TABLE IF NOT EXISTS `vtiger_role` (
  `roleid` varchar(255) NOT NULL,
  `rolename` varchar(200) DEFAULT NULL,
  `parentrole` varchar(255) DEFAULT NULL,
  `depth` int(19) DEFAULT NULL,
  `allowassignedrecordsto` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_role`
--

INSERT INTO `vtiger_role` (`roleid`, `rolename`, `parentrole`, `depth`, `allowassignedrecordsto`) VALUES
('H1', 'Organization', 'H1', 0, 1),
('H2', 'CEO', 'H1::H2', 1, 1),
('H7', '项目经理', 'H1::H2::H7', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_role2picklist`
--

CREATE TABLE IF NOT EXISTS `vtiger_role2picklist` (
  `roleid` varchar(255) NOT NULL,
  `picklistvalueid` int(11) NOT NULL,
  `picklistid` int(11) NOT NULL,
  `sortid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_role2picklist`
--

INSERT INTO `vtiger_role2picklist` (`roleid`, `picklistvalueid`, `picklistid`, `sortid`) VALUES
('H1', 1, 1, 0),
('H1', 2, 1, 1),
('H1', 3, 1, 2),
('H1', 4, 1, 3),
('H1', 5, 1, 4),
('H1', 6, 1, 5),
('H1', 7, 1, 6),
('H1', 8, 1, 7),
('H1', 9, 1, 8),
('H1', 10, 1, 9),
('H1', 11, 1, 10),
('H1', 12, 2, 0),
('H1', 13, 2, 1),
('H1', 14, 3, 0),
('H1', 15, 3, 1),
('H1', 16, 3, 2),
('H1', 17, 3, 3),
('H1', 18, 3, 4),
('H1', 19, 3, 5),
('H1', 20, 4, 0),
('H1', 21, 4, 1),
('H1', 22, 4, 2),
('H1', 23, 4, 3),
('H1', 24, 4, 4),
('H1', 25, 4, 5),
('H1', 26, 4, 6),
('H1', 27, 4, 7),
('H1', 28, 4, 8),
('H1', 29, 4, 9),
('H1', 30, 4, 10),
('H1', 31, 4, 11),
('H1', 32, 4, 12),
('H1', 33, 5, 0),
('H1', 34, 5, 1),
('H1', 35, 5, 2),
('H1', 36, 5, 3),
('H1', 37, 5, 4),
('H1', 38, 6, 0),
('H1', 39, 6, 1),
('H1', 40, 6, 2),
('H1', 41, 7, 0),
('H1', 42, 7, 1),
('H1', 43, 7, 2),
('H1', 44, 7, 3),
('H1', 45, 7, 4),
('H1', 46, 8, 0),
('H1', 47, 9, 0),
('H1', 48, 9, 1),
('H1', 49, 9, 2),
('H1', 50, 9, 3),
('H1', 51, 10, 0),
('H1', 52, 10, 1),
('H1', 53, 10, 2),
('H1', 54, 10, 3),
('H1', 55, 10, 4),
('H1', 56, 10, 5),
('H1', 57, 10, 6),
('H1', 58, 10, 7),
('H1', 59, 10, 8),
('H1', 60, 11, 0),
('H1', 61, 11, 1),
('H1', 62, 11, 2),
('H1', 63, 11, 3),
('H1', 64, 11, 4),
('H1', 65, 11, 5),
('H1', 66, 11, 6),
('H1', 67, 11, 7),
('H1', 68, 11, 8),
('H1', 69, 11, 9),
('H1', 70, 11, 10),
('H1', 71, 11, 11),
('H1', 72, 11, 12),
('H1', 73, 11, 13),
('H1', 74, 11, 14),
('H1', 75, 11, 15),
('H1', 76, 11, 16),
('H1', 77, 11, 17),
('H1', 78, 11, 18),
('H1', 79, 11, 19),
('H1', 80, 11, 20),
('H1', 81, 11, 21),
('H1', 82, 11, 22),
('H1', 83, 11, 23),
('H1', 84, 11, 24),
('H1', 85, 11, 25),
('H1', 86, 11, 26),
('H1', 87, 11, 27),
('H1', 88, 11, 28),
('H1', 89, 11, 29),
('H1', 90, 11, 30),
('H1', 91, 11, 31),
('H1', 92, 12, 0),
('H1', 93, 12, 1),
('H1', 94, 12, 2),
('H1', 95, 12, 3),
('H1', 96, 12, 4),
('H1', 97, 12, 5),
('H1', 98, 13, 0),
('H1', 99, 13, 1),
('H1', 100, 13, 2),
('H1', 101, 13, 3),
('H1', 102, 13, 4),
('H1', 103, 13, 5),
('H1', 104, 13, 6),
('H1', 105, 13, 7),
('H1', 106, 13, 8),
('H1', 107, 13, 9),
('H1', 108, 13, 10),
('H1', 109, 13, 11),
('H1', 110, 13, 12),
('H1', 111, 14, 0),
('H1', 112, 14, 1),
('H1', 113, 14, 2),
('H1', 114, 14, 3),
('H1', 115, 14, 4),
('H1', 116, 14, 5),
('H1', 117, 14, 6),
('H1', 118, 14, 7),
('H1', 119, 14, 8),
('H1', 120, 14, 9),
('H1', 121, 14, 10),
('H1', 122, 14, 11),
('H1', 123, 15, 0),
('H1', 124, 15, 1),
('H1', 125, 15, 2),
('H1', 126, 15, 3),
('H1', 127, 16, 0),
('H1', 128, 16, 1),
('H1', 129, 16, 2),
('H1', 130, 17, 0),
('H1', 131, 17, 1),
('H1', 132, 17, 2),
('H1', 133, 17, 3),
('H1', 134, 17, 4),
('H1', 135, 18, 0),
('H1', 136, 18, 1),
('H1', 137, 18, 2),
('H1', 138, 18, 3),
('H1', 139, 19, 0),
('H1', 140, 19, 1),
('H1', 141, 19, 2),
('H1', 142, 19, 3),
('H1', 143, 19, 4),
('H1', 144, 20, 0),
('H1', 145, 20, 1),
('H1', 146, 20, 2),
('H1', 147, 20, 3),
('H1', 148, 20, 4),
('H1', 149, 20, 5),
('H1', 150, 21, 0),
('H1', 151, 21, 1),
('H1', 152, 21, 2),
('H1', 153, 21, 3),
('H1', 154, 21, 4),
('H1', 155, 21, 5),
('H1', 156, 21, 6),
('H1', 157, 21, 7),
('H1', 158, 21, 8),
('H1', 159, 21, 9),
('H1', 160, 22, 0),
('H1', 161, 22, 1),
('H1', 162, 22, 2),
('H1', 163, 22, 3),
('H1', 164, 22, 4),
('H1', 165, 22, 5),
('H1', 166, 23, 0),
('H1', 167, 23, 1),
('H1', 168, 23, 2),
('H1', 169, 23, 3),
('H1', 170, 24, 0),
('H1', 171, 24, 1),
('H1', 172, 24, 2),
('H1', 173, 25, 0),
('H1', 174, 25, 1),
('H1', 175, 25, 2),
('H1', 176, 25, 3),
('H1', 177, 25, 4),
('H1', 178, 25, 5),
('H1', 179, 26, 0),
('H1', 180, 26, 1),
('H1', 181, 26, 2),
('H1', 182, 27, 0),
('H1', 183, 27, 1),
('H1', 184, 27, 2),
('H1', 185, 27, 3),
('H1', 186, 28, 0),
('H1', 187, 28, 1),
('H1', 188, 28, 2),
('H1', 189, 28, 3),
('H1', 190, 29, 0),
('H1', 191, 29, 1),
('H1', 192, 29, 2),
('H1', 193, 29, 3),
('H1', 194, 30, 0),
('H1', 195, 30, 1),
('H1', 196, 30, 2),
('H1', 197, 30, 3),
('H1', 198, 30, 4),
('H1', 199, 30, 5),
('H1', 200, 30, 6),
('H1', 201, 30, 7),
('H1', 202, 30, 8),
('H1', 203, 30, 9),
('H1', 204, 30, 10),
('H1', 205, 30, 11),
('H1', 206, 30, 12),
('H1', 207, 30, 13),
('H1', 208, 30, 14),
('H1', 209, 30, 15),
('H1', 210, 31, 1),
('H1', 211, 31, 2),
('H1', 212, 31, 3),
('H1', 213, 31, 4),
('H1', 214, 32, 1),
('H1', 215, 32, 2),
('H1', 216, 32, 3),
('H1', 217, 32, 4),
('H1', 218, 32, 5),
('H1', 219, 32, 6),
('H1', 220, 33, 1),
('H1', 221, 33, 2),
('H1', 222, 33, 3),
('H1', 223, 34, 1),
('H1', 224, 34, 2),
('H1', 225, 34, 3),
('H1', 226, 35, 1),
('H1', 227, 35, 2),
('H1', 228, 35, 3),
('H1', 229, 36, 1),
('H1', 230, 36, 2),
('H1', 231, 36, 3),
('H1', 232, 36, 4),
('H1', 233, 36, 5),
('H1', 234, 36, 6),
('H1', 235, 37, 1),
('H1', 236, 37, 2),
('H1', 237, 38, 1),
('H1', 238, 38, 2),
('H1', 239, 38, 3),
('H1', 240, 38, 4),
('H1', 241, 39, 1),
('H1', 242, 39, 2),
('H1', 243, 39, 3),
('H1', 244, 39, 4),
('H1', 245, 40, 1),
('H1', 246, 40, 2),
('H1', 247, 40, 3),
('H1', 248, 40, 4),
('H1', 249, 41, 1),
('H1', 250, 41, 2),
('H1', 251, 41, 3),
('H1', 252, 41, 4),
('H1', 253, 41, 5),
('H1', 254, 41, 6),
('H1', 255, 41, 7),
('H1', 256, 41, 8),
('H1', 257, 41, 9),
('H1', 258, 41, 10),
('H1', 259, 41, 11),
('H1', 260, 42, 1),
('H1', 261, 42, 2),
('H1', 262, 42, 3),
('H1', 263, 42, 4),
('H1', 264, 42, 5),
('H1', 265, 42, 6),
('H1', 266, 42, 7),
('H1', 267, 42, 8),
('H1', 268, 42, 9),
('H1', 269, 43, 1),
('H1', 270, 43, 2),
('H1', 271, 43, 3),
('H1', 272, 43, 4),
('H1', 273, 44, 1),
('H1', 274, 44, 2),
('H1', 275, 44, 3),
('H1', 276, 44, 4),
('H1', 277, 45, 1),
('H1', 278, 45, 2),
('H1', 279, 45, 3),
('H1', 280, 45, 4),
('H1', 281, 45, 5),
('H1', 282, 45, 6),
('H1', 283, 45, 7),
('H1', 284, 45, 8),
('H1', 285, 45, 9),
('H1', 286, 45, 10),
('H1', 287, 45, 11),
('H1', 288, 12, 1),
('H1', 289, 46, 1),
('H1', 290, 46, 2),
('H1', 291, 46, 3),
('H1', 292, 46, 4),
('H1', 293, 46, 5),
('H1', 294, 46, 6),
('H1', 295, 47, 1),
('H1', 296, 47, 2),
('H1', 297, 48, 1),
('H1', 298, 48, 2),
('H1', 299, 48, 3),
('H1', 300, 48, 4),
('H1', 301, 48, 5),
('H1', 302, 48, 6),
('H1', 303, 48, 7),
('H1', 304, 48, 8),
('H1', 305, 48, 9),
('H1', 306, 48, 10),
('H1', 307, 48, 11),
('H1', 308, 48, 12),
('H1', 309, 48, 13),
('H1', 310, 48, 14),
('H1', 311, 48, 15),
('H1', 312, 48, 16),
('H1', 313, 48, 17),
('H1', 314, 48, 18),
('H1', 315, 48, 19),
('H1', 316, 48, 20),
('H1', 317, 48, 21),
('H1', 318, 48, 22),
('H1', 319, 48, 23),
('H1', 320, 48, 24),
('H1', 321, 2, 1),
('H1', 322, 49, 1),
('H1', 323, 49, 2),
('H1', 324, 49, 3),
('H1', 325, 50, 1),
('H1', 326, 50, 2),
('H1', 327, 51, 1),
('H1', 328, 51, 2),
('H2', 1, 1, 0),
('H2', 2, 1, 1),
('H2', 3, 1, 2),
('H2', 4, 1, 3),
('H2', 5, 1, 4),
('H2', 6, 1, 5),
('H2', 7, 1, 6),
('H2', 8, 1, 7),
('H2', 9, 1, 8),
('H2', 10, 1, 9),
('H2', 11, 1, 10),
('H2', 12, 2, 0),
('H2', 13, 2, 1),
('H2', 14, 3, 0),
('H2', 15, 3, 1),
('H2', 16, 3, 2),
('H2', 17, 3, 3),
('H2', 18, 3, 4),
('H2', 19, 3, 5),
('H2', 20, 4, 0),
('H2', 21, 4, 1),
('H2', 22, 4, 2),
('H2', 23, 4, 3),
('H2', 24, 4, 4),
('H2', 25, 4, 5),
('H2', 26, 4, 6),
('H2', 27, 4, 7),
('H2', 28, 4, 8),
('H2', 29, 4, 9),
('H2', 30, 4, 10),
('H2', 31, 4, 11),
('H2', 32, 4, 12),
('H2', 33, 5, 0),
('H2', 34, 5, 1),
('H2', 35, 5, 2),
('H2', 36, 5, 3),
('H2', 37, 5, 4),
('H2', 38, 6, 0),
('H2', 39, 6, 1),
('H2', 40, 6, 2),
('H2', 41, 7, 0),
('H2', 42, 7, 1),
('H2', 43, 7, 2),
('H2', 44, 7, 3),
('H2', 45, 7, 4),
('H2', 46, 8, 0),
('H2', 47, 9, 0),
('H2', 48, 9, 1),
('H2', 49, 9, 2),
('H2', 50, 9, 3),
('H2', 51, 10, 0),
('H2', 52, 10, 1),
('H2', 53, 10, 2),
('H2', 54, 10, 3),
('H2', 55, 10, 4),
('H2', 56, 10, 5),
('H2', 57, 10, 6),
('H2', 58, 10, 7),
('H2', 59, 10, 8),
('H2', 60, 11, 0),
('H2', 61, 11, 1),
('H2', 62, 11, 2),
('H2', 63, 11, 3),
('H2', 64, 11, 4),
('H2', 65, 11, 5),
('H2', 66, 11, 6),
('H2', 67, 11, 7),
('H2', 68, 11, 8),
('H2', 69, 11, 9),
('H2', 70, 11, 10),
('H2', 71, 11, 11),
('H2', 72, 11, 12),
('H2', 73, 11, 13),
('H2', 74, 11, 14),
('H2', 75, 11, 15),
('H2', 76, 11, 16),
('H2', 77, 11, 17),
('H2', 78, 11, 18),
('H2', 79, 11, 19),
('H2', 80, 11, 20),
('H2', 81, 11, 21),
('H2', 82, 11, 22),
('H2', 83, 11, 23),
('H2', 84, 11, 24),
('H2', 85, 11, 25),
('H2', 86, 11, 26),
('H2', 87, 11, 27),
('H2', 88, 11, 28),
('H2', 89, 11, 29),
('H2', 90, 11, 30),
('H2', 91, 11, 31),
('H2', 92, 12, 0),
('H2', 93, 12, 1),
('H2', 94, 12, 2),
('H2', 95, 12, 3),
('H2', 96, 12, 4),
('H2', 97, 12, 5),
('H2', 98, 13, 0),
('H2', 99, 13, 1),
('H2', 100, 13, 2),
('H2', 101, 13, 3),
('H2', 102, 13, 4),
('H2', 103, 13, 5),
('H2', 104, 13, 6),
('H2', 105, 13, 7),
('H2', 106, 13, 8),
('H2', 107, 13, 9),
('H2', 108, 13, 10),
('H2', 109, 13, 11),
('H2', 110, 13, 12),
('H2', 111, 14, 0),
('H2', 112, 14, 1),
('H2', 113, 14, 2),
('H2', 114, 14, 3),
('H2', 115, 14, 4),
('H2', 116, 14, 5),
('H2', 117, 14, 6),
('H2', 118, 14, 7),
('H2', 119, 14, 8),
('H2', 120, 14, 9),
('H2', 121, 14, 10),
('H2', 122, 14, 11),
('H2', 123, 15, 0),
('H2', 124, 15, 1),
('H2', 125, 15, 2),
('H2', 126, 15, 3),
('H2', 127, 16, 0),
('H2', 128, 16, 1),
('H2', 129, 16, 2),
('H2', 130, 17, 0),
('H2', 131, 17, 1),
('H2', 132, 17, 2),
('H2', 133, 17, 3),
('H2', 134, 17, 4),
('H2', 135, 18, 0),
('H2', 136, 18, 1),
('H2', 137, 18, 2),
('H2', 138, 18, 3),
('H2', 139, 19, 0),
('H2', 140, 19, 1),
('H2', 141, 19, 2),
('H2', 142, 19, 3),
('H2', 143, 19, 4),
('H2', 144, 20, 0),
('H2', 145, 20, 1),
('H2', 146, 20, 2),
('H2', 147, 20, 3),
('H2', 148, 20, 4),
('H2', 149, 20, 5),
('H2', 150, 21, 0),
('H2', 151, 21, 1),
('H2', 152, 21, 2),
('H2', 153, 21, 3),
('H2', 154, 21, 4),
('H2', 155, 21, 5),
('H2', 156, 21, 6),
('H2', 157, 21, 7),
('H2', 158, 21, 8),
('H2', 159, 21, 9),
('H2', 160, 22, 0),
('H2', 161, 22, 1),
('H2', 162, 22, 2),
('H2', 163, 22, 3),
('H2', 164, 22, 4),
('H2', 165, 22, 5),
('H2', 166, 23, 0),
('H2', 167, 23, 1),
('H2', 168, 23, 2),
('H2', 169, 23, 3),
('H2', 170, 24, 0),
('H2', 171, 24, 1),
('H2', 172, 24, 2),
('H2', 173, 25, 0),
('H2', 174, 25, 1),
('H2', 175, 25, 2),
('H2', 176, 25, 3),
('H2', 177, 25, 4),
('H2', 178, 25, 5),
('H2', 179, 26, 0),
('H2', 180, 26, 1),
('H2', 181, 26, 2),
('H2', 182, 27, 0),
('H2', 183, 27, 1),
('H2', 184, 27, 2),
('H2', 185, 27, 3),
('H2', 186, 28, 0),
('H2', 187, 28, 1),
('H2', 188, 28, 2),
('H2', 189, 28, 3),
('H2', 190, 29, 0),
('H2', 191, 29, 1),
('H2', 192, 29, 2),
('H2', 193, 29, 3),
('H2', 194, 30, 0),
('H2', 195, 30, 1),
('H2', 196, 30, 2),
('H2', 197, 30, 3),
('H2', 198, 30, 4),
('H2', 199, 30, 5),
('H2', 200, 30, 6),
('H2', 201, 30, 7),
('H2', 202, 30, 8),
('H2', 203, 30, 9),
('H2', 204, 30, 10),
('H2', 205, 30, 11),
('H2', 206, 30, 12),
('H2', 207, 30, 13),
('H2', 208, 30, 14),
('H2', 209, 30, 15),
('H2', 210, 31, 1),
('H2', 211, 31, 2),
('H2', 212, 31, 3),
('H2', 213, 31, 4),
('H2', 214, 32, 1),
('H2', 215, 32, 2),
('H2', 216, 32, 3),
('H2', 217, 32, 4),
('H2', 218, 32, 5),
('H2', 219, 32, 6),
('H2', 220, 33, 1),
('H2', 221, 33, 2),
('H2', 222, 33, 3),
('H2', 223, 34, 1),
('H2', 224, 34, 2),
('H2', 225, 34, 3),
('H2', 226, 35, 1),
('H2', 227, 35, 2),
('H2', 228, 35, 3),
('H2', 229, 36, 1),
('H2', 230, 36, 2),
('H2', 231, 36, 3),
('H2', 232, 36, 4),
('H2', 233, 36, 5),
('H2', 234, 36, 6),
('H2', 235, 37, 1),
('H2', 236, 37, 2),
('H2', 237, 38, 1),
('H2', 238, 38, 2),
('H2', 239, 38, 3),
('H2', 240, 38, 4),
('H2', 241, 39, 1),
('H2', 242, 39, 2),
('H2', 243, 39, 3),
('H2', 244, 39, 4),
('H2', 245, 40, 1),
('H2', 246, 40, 2),
('H2', 247, 40, 3),
('H2', 248, 40, 4),
('H2', 249, 41, 1),
('H2', 250, 41, 2),
('H2', 251, 41, 3),
('H2', 252, 41, 4),
('H2', 253, 41, 5),
('H2', 254, 41, 6),
('H2', 255, 41, 7),
('H2', 256, 41, 8),
('H2', 257, 41, 9),
('H2', 258, 41, 10),
('H2', 259, 41, 11),
('H2', 260, 42, 1),
('H2', 261, 42, 2),
('H2', 262, 42, 3),
('H2', 263, 42, 4),
('H2', 264, 42, 5),
('H2', 265, 42, 6),
('H2', 266, 42, 7),
('H2', 267, 42, 8),
('H2', 268, 42, 9),
('H2', 269, 43, 1),
('H2', 270, 43, 2),
('H2', 271, 43, 3),
('H2', 272, 43, 4),
('H2', 273, 44, 1),
('H2', 274, 44, 2),
('H2', 275, 44, 3),
('H2', 276, 44, 4),
('H2', 277, 45, 1),
('H2', 278, 45, 2),
('H2', 279, 45, 3),
('H2', 280, 45, 4),
('H2', 281, 45, 5),
('H2', 282, 45, 6),
('H2', 283, 45, 7),
('H2', 284, 45, 8),
('H2', 285, 45, 9),
('H2', 286, 45, 10),
('H2', 287, 45, 11),
('H2', 288, 12, 1),
('H2', 289, 46, 1),
('H2', 290, 46, 2),
('H2', 291, 46, 3),
('H2', 292, 46, 4),
('H2', 293, 46, 5),
('H2', 294, 46, 6),
('H2', 295, 47, 1),
('H2', 296, 47, 2),
('H2', 297, 48, 1),
('H2', 298, 48, 2),
('H2', 299, 48, 3),
('H2', 300, 48, 4),
('H2', 301, 48, 5),
('H2', 302, 48, 6),
('H2', 303, 48, 7),
('H2', 304, 48, 8),
('H2', 305, 48, 9),
('H2', 306, 48, 10),
('H2', 307, 48, 11),
('H2', 308, 48, 12),
('H2', 309, 48, 13),
('H2', 310, 48, 14),
('H2', 311, 48, 15),
('H2', 312, 48, 16),
('H2', 313, 48, 17),
('H2', 314, 48, 18),
('H2', 315, 48, 19),
('H2', 316, 48, 20),
('H2', 317, 48, 21),
('H2', 318, 48, 22),
('H2', 319, 48, 23),
('H2', 320, 48, 24),
('H2', 321, 2, 1),
('H2', 322, 49, 1),
('H2', 323, 49, 2),
('H2', 324, 49, 3),
('H2', 325, 50, 1),
('H2', 326, 50, 2),
('H2', 327, 51, 1),
('H2', 328, 51, 2),
('H3', 1, 1, 0),
('H3', 2, 1, 1),
('H3', 3, 1, 2),
('H3', 4, 1, 3),
('H3', 5, 1, 4),
('H3', 6, 1, 5),
('H3', 7, 1, 6),
('H3', 8, 1, 7),
('H3', 9, 1, 8),
('H3', 10, 1, 9),
('H3', 11, 1, 10),
('H3', 12, 2, 0),
('H3', 13, 2, 1),
('H3', 14, 3, 0),
('H3', 15, 3, 1),
('H3', 16, 3, 2),
('H3', 17, 3, 3),
('H3', 18, 3, 4),
('H3', 19, 3, 5),
('H3', 20, 4, 0),
('H3', 21, 4, 1),
('H3', 22, 4, 2),
('H3', 23, 4, 3),
('H3', 24, 4, 4),
('H3', 25, 4, 5),
('H3', 26, 4, 6),
('H3', 27, 4, 7),
('H3', 28, 4, 8),
('H3', 29, 4, 9),
('H3', 30, 4, 10),
('H3', 31, 4, 11),
('H3', 32, 4, 12),
('H3', 33, 5, 0),
('H3', 34, 5, 1),
('H3', 35, 5, 2),
('H3', 36, 5, 3),
('H3', 37, 5, 4),
('H3', 38, 6, 0),
('H3', 39, 6, 1),
('H3', 40, 6, 2),
('H3', 41, 7, 0),
('H3', 42, 7, 1),
('H3', 43, 7, 2),
('H3', 44, 7, 3),
('H3', 45, 7, 4),
('H3', 46, 8, 0),
('H3', 47, 9, 0),
('H3', 48, 9, 1),
('H3', 49, 9, 2),
('H3', 50, 9, 3),
('H3', 51, 10, 0),
('H3', 52, 10, 1),
('H3', 53, 10, 2),
('H3', 54, 10, 3),
('H3', 55, 10, 4),
('H3', 56, 10, 5),
('H3', 57, 10, 6),
('H3', 58, 10, 7),
('H3', 59, 10, 8),
('H3', 60, 11, 0),
('H3', 61, 11, 1),
('H3', 62, 11, 2),
('H3', 63, 11, 3),
('H3', 64, 11, 4),
('H3', 65, 11, 5),
('H3', 66, 11, 6),
('H3', 67, 11, 7),
('H3', 68, 11, 8),
('H3', 69, 11, 9),
('H3', 70, 11, 10),
('H3', 71, 11, 11),
('H3', 72, 11, 12),
('H3', 73, 11, 13),
('H3', 74, 11, 14),
('H3', 75, 11, 15),
('H3', 76, 11, 16),
('H3', 77, 11, 17),
('H3', 78, 11, 18),
('H3', 79, 11, 19),
('H3', 80, 11, 20),
('H3', 81, 11, 21),
('H3', 82, 11, 22),
('H3', 83, 11, 23),
('H3', 84, 11, 24),
('H3', 85, 11, 25),
('H3', 86, 11, 26),
('H3', 87, 11, 27),
('H3', 88, 11, 28),
('H3', 89, 11, 29),
('H3', 90, 11, 30),
('H3', 91, 11, 31),
('H3', 92, 12, 0),
('H3', 93, 12, 1),
('H3', 94, 12, 2),
('H3', 95, 12, 3),
('H3', 96, 12, 4),
('H3', 97, 12, 5),
('H3', 98, 13, 0),
('H3', 99, 13, 1),
('H3', 100, 13, 2),
('H3', 101, 13, 3),
('H3', 102, 13, 4),
('H3', 103, 13, 5),
('H3', 104, 13, 6),
('H3', 105, 13, 7),
('H3', 106, 13, 8),
('H3', 107, 13, 9),
('H3', 108, 13, 10),
('H3', 109, 13, 11),
('H3', 110, 13, 12),
('H3', 111, 14, 0),
('H3', 112, 14, 1),
('H3', 113, 14, 2),
('H3', 114, 14, 3),
('H3', 115, 14, 4),
('H3', 116, 14, 5),
('H3', 117, 14, 6),
('H3', 118, 14, 7),
('H3', 119, 14, 8),
('H3', 120, 14, 9),
('H3', 121, 14, 10),
('H3', 122, 14, 11),
('H3', 123, 15, 0),
('H3', 124, 15, 1),
('H3', 125, 15, 2),
('H3', 126, 15, 3),
('H3', 127, 16, 0),
('H3', 128, 16, 1),
('H3', 129, 16, 2),
('H3', 130, 17, 0),
('H3', 131, 17, 1),
('H3', 132, 17, 2),
('H3', 133, 17, 3),
('H3', 134, 17, 4),
('H3', 135, 18, 0),
('H3', 136, 18, 1),
('H3', 137, 18, 2),
('H3', 138, 18, 3),
('H3', 139, 19, 0),
('H3', 140, 19, 1),
('H3', 141, 19, 2),
('H3', 142, 19, 3),
('H3', 143, 19, 4),
('H3', 144, 20, 0),
('H3', 145, 20, 1),
('H3', 146, 20, 2),
('H3', 147, 20, 3),
('H3', 148, 20, 4),
('H3', 149, 20, 5),
('H3', 150, 21, 0),
('H3', 151, 21, 1),
('H3', 152, 21, 2),
('H3', 153, 21, 3),
('H3', 154, 21, 4),
('H3', 155, 21, 5),
('H3', 156, 21, 6),
('H3', 157, 21, 7),
('H3', 158, 21, 8),
('H3', 159, 21, 9),
('H3', 160, 22, 0),
('H3', 161, 22, 1),
('H3', 162, 22, 2),
('H3', 163, 22, 3),
('H3', 164, 22, 4),
('H3', 165, 22, 5),
('H3', 166, 23, 0),
('H3', 167, 23, 1),
('H3', 168, 23, 2),
('H3', 169, 23, 3),
('H3', 170, 24, 0),
('H3', 171, 24, 1),
('H3', 172, 24, 2),
('H3', 173, 25, 0),
('H3', 174, 25, 1),
('H3', 175, 25, 2),
('H3', 176, 25, 3),
('H3', 177, 25, 4),
('H3', 178, 25, 5),
('H3', 179, 26, 0),
('H3', 180, 26, 1),
('H3', 181, 26, 2),
('H3', 182, 27, 0),
('H3', 183, 27, 1),
('H3', 184, 27, 2),
('H3', 185, 27, 3),
('H3', 186, 28, 0),
('H3', 187, 28, 1),
('H3', 188, 28, 2),
('H3', 189, 28, 3),
('H3', 190, 29, 0),
('H3', 191, 29, 1),
('H3', 192, 29, 2),
('H3', 193, 29, 3),
('H3', 194, 30, 0),
('H3', 195, 30, 1),
('H3', 196, 30, 2),
('H3', 197, 30, 3),
('H3', 198, 30, 4),
('H3', 199, 30, 5),
('H3', 200, 30, 6),
('H3', 201, 30, 7),
('H3', 202, 30, 8),
('H3', 203, 30, 9),
('H3', 204, 30, 10),
('H3', 205, 30, 11),
('H3', 206, 30, 12),
('H3', 207, 30, 13),
('H3', 208, 30, 14),
('H3', 209, 30, 15),
('H3', 210, 31, 1),
('H3', 211, 31, 2),
('H3', 212, 31, 3),
('H3', 213, 31, 4),
('H3', 214, 32, 1),
('H3', 215, 32, 2),
('H3', 216, 32, 3),
('H3', 217, 32, 4),
('H3', 218, 32, 5),
('H3', 219, 32, 6),
('H3', 220, 33, 1),
('H3', 221, 33, 2),
('H3', 222, 33, 3),
('H3', 223, 34, 1),
('H3', 224, 34, 2),
('H3', 225, 34, 3),
('H3', 226, 35, 1),
('H3', 227, 35, 2),
('H3', 228, 35, 3),
('H3', 229, 36, 1),
('H3', 230, 36, 2),
('H3', 231, 36, 3),
('H3', 232, 36, 4),
('H3', 233, 36, 5),
('H3', 234, 36, 6),
('H3', 235, 37, 1),
('H3', 236, 37, 2),
('H3', 237, 38, 1),
('H3', 238, 38, 2),
('H3', 239, 38, 3),
('H3', 240, 38, 4),
('H3', 241, 39, 1),
('H3', 242, 39, 2),
('H3', 243, 39, 3),
('H3', 244, 39, 4),
('H3', 245, 40, 1),
('H3', 246, 40, 2),
('H3', 247, 40, 3),
('H3', 248, 40, 4),
('H3', 249, 41, 1),
('H3', 250, 41, 2),
('H3', 251, 41, 3),
('H3', 252, 41, 4),
('H3', 253, 41, 5),
('H3', 254, 41, 6),
('H3', 255, 41, 7),
('H3', 256, 41, 8),
('H3', 257, 41, 9),
('H3', 258, 41, 10),
('H3', 259, 41, 11),
('H3', 260, 42, 1),
('H3', 261, 42, 2),
('H3', 262, 42, 3),
('H3', 263, 42, 4),
('H3', 264, 42, 5),
('H3', 265, 42, 6),
('H3', 266, 42, 7),
('H3', 267, 42, 8),
('H3', 268, 42, 9),
('H3', 269, 43, 1),
('H3', 270, 43, 2),
('H3', 271, 43, 3),
('H3', 272, 43, 4),
('H3', 273, 44, 1),
('H3', 274, 44, 2),
('H3', 275, 44, 3),
('H3', 276, 44, 4),
('H3', 277, 45, 1),
('H3', 278, 45, 2),
('H3', 279, 45, 3),
('H3', 280, 45, 4),
('H3', 281, 45, 5),
('H3', 282, 45, 6),
('H3', 283, 45, 7),
('H3', 284, 45, 8),
('H3', 285, 45, 9),
('H3', 286, 45, 10),
('H3', 287, 45, 11),
('H3', 288, 12, 1),
('H3', 289, 46, 1),
('H3', 290, 46, 2),
('H3', 291, 46, 3),
('H3', 292, 46, 4),
('H3', 293, 46, 5),
('H3', 294, 46, 6),
('H3', 295, 47, 1),
('H3', 296, 47, 2),
('H3', 297, 48, 1),
('H3', 298, 48, 2),
('H3', 299, 48, 3),
('H3', 300, 48, 4),
('H3', 301, 48, 5),
('H3', 302, 48, 6),
('H3', 303, 48, 7),
('H3', 304, 48, 8),
('H3', 305, 48, 9),
('H3', 306, 48, 10),
('H3', 307, 48, 11),
('H3', 308, 48, 12),
('H3', 309, 48, 13),
('H3', 310, 48, 14),
('H3', 311, 48, 15),
('H3', 312, 48, 16),
('H3', 313, 48, 17),
('H3', 314, 48, 18),
('H3', 315, 48, 19),
('H3', 316, 48, 20),
('H3', 317, 48, 21),
('H3', 318, 48, 22),
('H3', 319, 48, 23),
('H3', 320, 48, 24),
('H3', 321, 2, 1),
('H3', 322, 49, 1),
('H3', 323, 49, 2),
('H3', 324, 49, 3),
('H3', 325, 50, 1),
('H3', 326, 50, 2),
('H4', 1, 1, 0),
('H4', 2, 1, 1),
('H4', 3, 1, 2),
('H4', 4, 1, 3),
('H4', 5, 1, 4),
('H4', 6, 1, 5),
('H4', 7, 1, 6),
('H4', 8, 1, 7),
('H4', 9, 1, 8),
('H4', 10, 1, 9),
('H4', 11, 1, 10),
('H4', 12, 2, 0),
('H4', 13, 2, 1),
('H4', 14, 3, 0),
('H4', 15, 3, 1),
('H4', 16, 3, 2),
('H4', 17, 3, 3),
('H4', 18, 3, 4),
('H4', 19, 3, 5),
('H4', 20, 4, 0),
('H4', 21, 4, 1),
('H4', 22, 4, 2),
('H4', 23, 4, 3),
('H4', 24, 4, 4),
('H4', 25, 4, 5),
('H4', 26, 4, 6),
('H4', 27, 4, 7),
('H4', 28, 4, 8),
('H4', 29, 4, 9),
('H4', 30, 4, 10),
('H4', 31, 4, 11),
('H4', 32, 4, 12),
('H4', 33, 5, 0),
('H4', 34, 5, 1),
('H4', 35, 5, 2),
('H4', 36, 5, 3),
('H4', 37, 5, 4),
('H4', 38, 6, 0),
('H4', 39, 6, 1),
('H4', 40, 6, 2),
('H4', 41, 7, 0),
('H4', 42, 7, 1),
('H4', 43, 7, 2),
('H4', 44, 7, 3),
('H4', 45, 7, 4),
('H4', 46, 8, 0),
('H4', 47, 9, 0),
('H4', 48, 9, 1),
('H4', 49, 9, 2),
('H4', 50, 9, 3),
('H4', 51, 10, 0),
('H4', 52, 10, 1),
('H4', 53, 10, 2),
('H4', 54, 10, 3),
('H4', 55, 10, 4),
('H4', 56, 10, 5),
('H4', 57, 10, 6),
('H4', 58, 10, 7),
('H4', 59, 10, 8),
('H4', 60, 11, 0),
('H4', 61, 11, 1),
('H4', 62, 11, 2),
('H4', 63, 11, 3),
('H4', 64, 11, 4),
('H4', 65, 11, 5),
('H4', 66, 11, 6),
('H4', 67, 11, 7),
('H4', 68, 11, 8),
('H4', 69, 11, 9),
('H4', 70, 11, 10),
('H4', 71, 11, 11),
('H4', 72, 11, 12),
('H4', 73, 11, 13),
('H4', 74, 11, 14),
('H4', 75, 11, 15),
('H4', 76, 11, 16),
('H4', 77, 11, 17),
('H4', 78, 11, 18),
('H4', 79, 11, 19),
('H4', 80, 11, 20),
('H4', 81, 11, 21),
('H4', 82, 11, 22),
('H4', 83, 11, 23),
('H4', 84, 11, 24),
('H4', 85, 11, 25),
('H4', 86, 11, 26),
('H4', 87, 11, 27),
('H4', 88, 11, 28),
('H4', 89, 11, 29),
('H4', 90, 11, 30),
('H4', 91, 11, 31),
('H4', 92, 12, 0),
('H4', 93, 12, 1),
('H4', 94, 12, 2),
('H4', 95, 12, 3),
('H4', 96, 12, 4),
('H4', 97, 12, 5),
('H4', 98, 13, 0),
('H4', 99, 13, 1),
('H4', 100, 13, 2),
('H4', 101, 13, 3),
('H4', 102, 13, 4),
('H4', 103, 13, 5),
('H4', 104, 13, 6),
('H4', 105, 13, 7),
('H4', 106, 13, 8),
('H4', 107, 13, 9),
('H4', 108, 13, 10),
('H4', 109, 13, 11),
('H4', 110, 13, 12),
('H4', 111, 14, 0),
('H4', 112, 14, 1),
('H4', 113, 14, 2),
('H4', 114, 14, 3),
('H4', 115, 14, 4),
('H4', 116, 14, 5),
('H4', 117, 14, 6),
('H4', 118, 14, 7),
('H4', 119, 14, 8),
('H4', 120, 14, 9),
('H4', 121, 14, 10),
('H4', 122, 14, 11),
('H4', 123, 15, 0),
('H4', 124, 15, 1),
('H4', 125, 15, 2),
('H4', 126, 15, 3),
('H4', 127, 16, 0),
('H4', 128, 16, 1),
('H4', 129, 16, 2),
('H4', 130, 17, 0),
('H4', 131, 17, 1),
('H4', 132, 17, 2),
('H4', 133, 17, 3),
('H4', 134, 17, 4),
('H4', 135, 18, 0),
('H4', 136, 18, 1),
('H4', 137, 18, 2),
('H4', 138, 18, 3),
('H4', 139, 19, 0),
('H4', 140, 19, 1),
('H4', 141, 19, 2),
('H4', 142, 19, 3),
('H4', 143, 19, 4),
('H4', 144, 20, 0),
('H4', 145, 20, 1),
('H4', 146, 20, 2),
('H4', 147, 20, 3),
('H4', 148, 20, 4),
('H4', 149, 20, 5),
('H4', 150, 21, 0),
('H4', 151, 21, 1),
('H4', 152, 21, 2),
('H4', 153, 21, 3),
('H4', 154, 21, 4),
('H4', 155, 21, 5),
('H4', 156, 21, 6),
('H4', 157, 21, 7),
('H4', 158, 21, 8),
('H4', 159, 21, 9),
('H4', 160, 22, 0),
('H4', 161, 22, 1),
('H4', 162, 22, 2),
('H4', 163, 22, 3),
('H4', 164, 22, 4),
('H4', 165, 22, 5),
('H4', 166, 23, 0),
('H4', 167, 23, 1),
('H4', 168, 23, 2),
('H4', 169, 23, 3),
('H4', 170, 24, 0),
('H4', 171, 24, 1),
('H4', 172, 24, 2),
('H4', 173, 25, 0),
('H4', 174, 25, 1),
('H4', 175, 25, 2),
('H4', 176, 25, 3),
('H4', 177, 25, 4),
('H4', 178, 25, 5),
('H4', 179, 26, 0),
('H4', 180, 26, 1),
('H4', 181, 26, 2),
('H4', 182, 27, 0),
('H4', 183, 27, 1),
('H4', 184, 27, 2),
('H4', 185, 27, 3),
('H4', 186, 28, 0),
('H4', 187, 28, 1),
('H4', 188, 28, 2),
('H4', 189, 28, 3),
('H4', 190, 29, 0),
('H4', 191, 29, 1),
('H4', 192, 29, 2),
('H4', 193, 29, 3),
('H4', 194, 30, 0),
('H4', 195, 30, 1),
('H4', 196, 30, 2),
('H4', 197, 30, 3),
('H4', 198, 30, 4),
('H4', 199, 30, 5),
('H4', 200, 30, 6),
('H4', 201, 30, 7),
('H4', 202, 30, 8),
('H4', 203, 30, 9),
('H4', 204, 30, 10),
('H4', 205, 30, 11),
('H4', 206, 30, 12),
('H4', 207, 30, 13),
('H4', 208, 30, 14),
('H4', 209, 30, 15),
('H4', 210, 31, 1),
('H4', 211, 31, 2),
('H4', 212, 31, 3),
('H4', 213, 31, 4),
('H4', 214, 32, 1),
('H4', 215, 32, 2),
('H4', 216, 32, 3),
('H4', 217, 32, 4),
('H4', 218, 32, 5),
('H4', 219, 32, 6),
('H4', 220, 33, 1),
('H4', 221, 33, 2),
('H4', 222, 33, 3),
('H4', 223, 34, 1),
('H4', 224, 34, 2),
('H4', 225, 34, 3),
('H4', 226, 35, 1),
('H4', 227, 35, 2),
('H4', 228, 35, 3),
('H4', 229, 36, 1),
('H4', 230, 36, 2),
('H4', 231, 36, 3),
('H4', 232, 36, 4),
('H4', 233, 36, 5),
('H4', 234, 36, 6),
('H4', 235, 37, 1),
('H4', 236, 37, 2),
('H4', 237, 38, 1),
('H4', 238, 38, 2),
('H4', 239, 38, 3),
('H4', 240, 38, 4),
('H4', 241, 39, 1),
('H4', 242, 39, 2),
('H4', 243, 39, 3),
('H4', 244, 39, 4),
('H4', 245, 40, 1),
('H4', 246, 40, 2),
('H4', 247, 40, 3),
('H4', 248, 40, 4),
('H4', 249, 41, 1),
('H4', 250, 41, 2),
('H4', 251, 41, 3),
('H4', 252, 41, 4),
('H4', 253, 41, 5),
('H4', 254, 41, 6),
('H4', 255, 41, 7),
('H4', 256, 41, 8),
('H4', 257, 41, 9),
('H4', 258, 41, 10),
('H4', 259, 41, 11),
('H4', 260, 42, 1),
('H4', 261, 42, 2),
('H4', 262, 42, 3),
('H4', 263, 42, 4),
('H4', 264, 42, 5),
('H4', 265, 42, 6),
('H4', 266, 42, 7),
('H4', 267, 42, 8),
('H4', 268, 42, 9),
('H4', 269, 43, 1),
('H4', 270, 43, 2),
('H4', 271, 43, 3),
('H4', 272, 43, 4),
('H4', 273, 44, 1),
('H4', 274, 44, 2),
('H4', 275, 44, 3),
('H4', 276, 44, 4),
('H4', 277, 45, 1),
('H4', 278, 45, 2),
('H4', 279, 45, 3),
('H4', 280, 45, 4),
('H4', 281, 45, 5),
('H4', 282, 45, 6),
('H4', 283, 45, 7),
('H4', 284, 45, 8),
('H4', 285, 45, 9),
('H4', 286, 45, 10),
('H4', 287, 45, 11),
('H4', 288, 12, 1),
('H4', 289, 46, 1),
('H4', 290, 46, 2),
('H4', 291, 46, 3),
('H4', 292, 46, 4),
('H4', 293, 46, 5),
('H4', 294, 46, 6),
('H4', 295, 47, 1),
('H4', 296, 47, 2),
('H4', 297, 48, 1),
('H4', 298, 48, 2),
('H4', 299, 48, 3),
('H4', 300, 48, 4),
('H4', 301, 48, 5),
('H4', 302, 48, 6),
('H4', 303, 48, 7),
('H4', 304, 48, 8),
('H4', 305, 48, 9),
('H4', 306, 48, 10),
('H4', 307, 48, 11),
('H4', 308, 48, 12),
('H4', 309, 48, 13),
('H4', 310, 48, 14),
('H4', 311, 48, 15),
('H4', 312, 48, 16),
('H4', 313, 48, 17),
('H4', 314, 48, 18),
('H4', 315, 48, 19),
('H4', 316, 48, 20),
('H4', 317, 48, 21),
('H4', 318, 48, 22),
('H4', 319, 48, 23),
('H4', 320, 48, 24),
('H4', 321, 2, 1),
('H4', 322, 49, 1),
('H4', 323, 49, 2),
('H4', 324, 49, 3),
('H4', 325, 50, 1),
('H4', 326, 50, 2),
('H5', 1, 1, 0),
('H5', 2, 1, 1),
('H5', 3, 1, 2),
('H5', 4, 1, 3),
('H5', 5, 1, 4),
('H5', 6, 1, 5),
('H5', 7, 1, 6),
('H5', 8, 1, 7),
('H5', 9, 1, 8),
('H5', 10, 1, 9),
('H5', 11, 1, 10),
('H5', 12, 2, 0),
('H5', 13, 2, 1),
('H5', 14, 3, 0),
('H5', 15, 3, 1),
('H5', 16, 3, 2),
('H5', 17, 3, 3),
('H5', 18, 3, 4),
('H5', 19, 3, 5),
('H5', 20, 4, 0),
('H5', 21, 4, 1),
('H5', 22, 4, 2),
('H5', 23, 4, 3),
('H5', 24, 4, 4),
('H5', 25, 4, 5),
('H5', 26, 4, 6),
('H5', 27, 4, 7),
('H5', 28, 4, 8),
('H5', 29, 4, 9),
('H5', 30, 4, 10),
('H5', 31, 4, 11),
('H5', 32, 4, 12),
('H5', 33, 5, 0),
('H5', 34, 5, 1),
('H5', 35, 5, 2),
('H5', 36, 5, 3),
('H5', 37, 5, 4),
('H5', 38, 6, 0),
('H5', 39, 6, 1),
('H5', 40, 6, 2),
('H5', 41, 7, 0),
('H5', 42, 7, 1),
('H5', 43, 7, 2),
('H5', 44, 7, 3),
('H5', 45, 7, 4),
('H5', 46, 8, 0),
('H5', 47, 9, 0),
('H5', 48, 9, 1),
('H5', 49, 9, 2),
('H5', 50, 9, 3),
('H5', 51, 10, 0),
('H5', 52, 10, 1),
('H5', 53, 10, 2),
('H5', 54, 10, 3),
('H5', 55, 10, 4),
('H5', 56, 10, 5),
('H5', 57, 10, 6),
('H5', 58, 10, 7),
('H5', 59, 10, 8),
('H5', 60, 11, 0),
('H5', 61, 11, 1),
('H5', 62, 11, 2),
('H5', 63, 11, 3),
('H5', 64, 11, 4),
('H5', 65, 11, 5),
('H5', 66, 11, 6),
('H5', 67, 11, 7),
('H5', 68, 11, 8),
('H5', 69, 11, 9),
('H5', 70, 11, 10),
('H5', 71, 11, 11),
('H5', 72, 11, 12),
('H5', 73, 11, 13),
('H5', 74, 11, 14),
('H5', 75, 11, 15),
('H5', 76, 11, 16),
('H5', 77, 11, 17),
('H5', 78, 11, 18),
('H5', 79, 11, 19),
('H5', 80, 11, 20),
('H5', 81, 11, 21),
('H5', 82, 11, 22),
('H5', 83, 11, 23),
('H5', 84, 11, 24),
('H5', 85, 11, 25),
('H5', 86, 11, 26),
('H5', 87, 11, 27),
('H5', 88, 11, 28),
('H5', 89, 11, 29),
('H5', 90, 11, 30),
('H5', 91, 11, 31),
('H5', 92, 12, 0),
('H5', 93, 12, 1),
('H5', 94, 12, 2),
('H5', 95, 12, 3),
('H5', 96, 12, 4),
('H5', 97, 12, 5),
('H5', 98, 13, 0),
('H5', 99, 13, 1),
('H5', 100, 13, 2),
('H5', 101, 13, 3),
('H5', 102, 13, 4),
('H5', 103, 13, 5),
('H5', 104, 13, 6),
('H5', 105, 13, 7),
('H5', 106, 13, 8),
('H5', 107, 13, 9),
('H5', 108, 13, 10),
('H5', 109, 13, 11),
('H5', 110, 13, 12),
('H5', 111, 14, 0),
('H5', 112, 14, 1),
('H5', 113, 14, 2),
('H5', 114, 14, 3),
('H5', 115, 14, 4),
('H5', 116, 14, 5),
('H5', 117, 14, 6),
('H5', 118, 14, 7),
('H5', 119, 14, 8),
('H5', 120, 14, 9),
('H5', 121, 14, 10),
('H5', 122, 14, 11),
('H5', 123, 15, 0),
('H5', 124, 15, 1),
('H5', 125, 15, 2),
('H5', 126, 15, 3),
('H5', 127, 16, 0),
('H5', 128, 16, 1),
('H5', 129, 16, 2),
('H5', 130, 17, 0),
('H5', 131, 17, 1),
('H5', 132, 17, 2),
('H5', 133, 17, 3),
('H5', 134, 17, 4),
('H5', 135, 18, 0),
('H5', 136, 18, 1),
('H5', 137, 18, 2),
('H5', 138, 18, 3),
('H5', 139, 19, 0),
('H5', 140, 19, 1),
('H5', 141, 19, 2),
('H5', 142, 19, 3),
('H5', 143, 19, 4),
('H5', 144, 20, 0),
('H5', 145, 20, 1),
('H5', 146, 20, 2),
('H5', 147, 20, 3),
('H5', 148, 20, 4),
('H5', 149, 20, 5),
('H5', 150, 21, 0),
('H5', 151, 21, 1),
('H5', 152, 21, 2),
('H5', 153, 21, 3),
('H5', 154, 21, 4),
('H5', 155, 21, 5),
('H5', 156, 21, 6),
('H5', 157, 21, 7),
('H5', 158, 21, 8),
('H5', 159, 21, 9),
('H5', 160, 22, 0),
('H5', 161, 22, 1),
('H5', 162, 22, 2),
('H5', 163, 22, 3),
('H5', 164, 22, 4),
('H5', 165, 22, 5),
('H5', 166, 23, 0),
('H5', 167, 23, 1),
('H5', 168, 23, 2),
('H5', 169, 23, 3),
('H5', 170, 24, 0),
('H5', 171, 24, 1),
('H5', 172, 24, 2),
('H5', 173, 25, 0),
('H5', 174, 25, 1),
('H5', 175, 25, 2),
('H5', 176, 25, 3),
('H5', 177, 25, 4),
('H5', 178, 25, 5),
('H5', 179, 26, 0),
('H5', 180, 26, 1),
('H5', 181, 26, 2),
('H5', 182, 27, 0),
('H5', 183, 27, 1),
('H5', 184, 27, 2),
('H5', 185, 27, 3),
('H5', 186, 28, 0),
('H5', 187, 28, 1),
('H5', 188, 28, 2),
('H5', 189, 28, 3),
('H5', 190, 29, 0),
('H5', 191, 29, 1),
('H5', 192, 29, 2),
('H5', 193, 29, 3),
('H5', 194, 30, 0),
('H5', 195, 30, 1),
('H5', 196, 30, 2),
('H5', 197, 30, 3),
('H5', 198, 30, 4),
('H5', 199, 30, 5),
('H5', 200, 30, 6),
('H5', 201, 30, 7),
('H5', 202, 30, 8),
('H5', 203, 30, 9),
('H5', 204, 30, 10),
('H5', 205, 30, 11),
('H5', 206, 30, 12),
('H5', 207, 30, 13),
('H5', 208, 30, 14),
('H5', 209, 30, 15),
('H5', 210, 31, 1),
('H5', 211, 31, 2),
('H5', 212, 31, 3),
('H5', 213, 31, 4),
('H5', 214, 32, 1),
('H5', 215, 32, 2),
('H5', 216, 32, 3),
('H5', 217, 32, 4),
('H5', 218, 32, 5),
('H5', 219, 32, 6),
('H5', 220, 33, 1),
('H5', 221, 33, 2),
('H5', 222, 33, 3),
('H5', 223, 34, 1),
('H5', 224, 34, 2),
('H5', 225, 34, 3),
('H5', 226, 35, 1),
('H5', 227, 35, 2),
('H5', 228, 35, 3),
('H5', 229, 36, 1),
('H5', 230, 36, 2),
('H5', 231, 36, 3),
('H5', 232, 36, 4),
('H5', 233, 36, 5),
('H5', 234, 36, 6),
('H5', 235, 37, 1),
('H5', 236, 37, 2),
('H5', 237, 38, 1),
('H5', 238, 38, 2),
('H5', 239, 38, 3),
('H5', 240, 38, 4),
('H5', 241, 39, 1),
('H5', 242, 39, 2),
('H5', 243, 39, 3),
('H5', 244, 39, 4),
('H5', 245, 40, 1),
('H5', 246, 40, 2),
('H5', 247, 40, 3),
('H5', 248, 40, 4),
('H5', 249, 41, 1),
('H5', 250, 41, 2),
('H5', 251, 41, 3),
('H5', 252, 41, 4),
('H5', 253, 41, 5),
('H5', 254, 41, 6),
('H5', 255, 41, 7),
('H5', 256, 41, 8),
('H5', 257, 41, 9),
('H5', 258, 41, 10),
('H5', 259, 41, 11),
('H5', 260, 42, 1),
('H5', 261, 42, 2),
('H5', 262, 42, 3),
('H5', 263, 42, 4),
('H5', 264, 42, 5),
('H5', 265, 42, 6),
('H5', 266, 42, 7),
('H5', 267, 42, 8),
('H5', 268, 42, 9),
('H5', 269, 43, 1),
('H5', 270, 43, 2),
('H5', 271, 43, 3),
('H5', 272, 43, 4),
('H5', 273, 44, 1),
('H5', 274, 44, 2),
('H5', 275, 44, 3),
('H5', 276, 44, 4),
('H5', 277, 45, 1),
('H5', 278, 45, 2),
('H5', 279, 45, 3),
('H5', 280, 45, 4),
('H5', 281, 45, 5),
('H5', 282, 45, 6),
('H5', 283, 45, 7),
('H5', 284, 45, 8),
('H5', 285, 45, 9),
('H5', 286, 45, 10),
('H5', 287, 45, 11),
('H5', 288, 12, 1),
('H5', 289, 46, 1),
('H5', 290, 46, 2),
('H5', 291, 46, 3),
('H5', 292, 46, 4),
('H5', 293, 46, 5),
('H5', 294, 46, 6),
('H5', 295, 47, 1),
('H5', 296, 47, 2),
('H5', 297, 48, 1),
('H5', 298, 48, 2),
('H5', 299, 48, 3),
('H5', 300, 48, 4),
('H5', 301, 48, 5),
('H5', 302, 48, 6),
('H5', 303, 48, 7),
('H5', 304, 48, 8),
('H5', 305, 48, 9),
('H5', 306, 48, 10),
('H5', 307, 48, 11),
('H5', 308, 48, 12),
('H5', 309, 48, 13),
('H5', 310, 48, 14),
('H5', 311, 48, 15),
('H5', 312, 48, 16),
('H5', 313, 48, 17),
('H5', 314, 48, 18),
('H5', 315, 48, 19),
('H5', 316, 48, 20),
('H5', 317, 48, 21),
('H5', 318, 48, 22),
('H5', 319, 48, 23),
('H5', 320, 48, 24),
('H5', 321, 2, 1),
('H5', 322, 49, 1),
('H5', 323, 49, 2),
('H5', 324, 49, 3),
('H5', 325, 50, 1),
('H5', 326, 50, 2),
('H6', 1, 1, 0),
('H6', 2, 1, 1),
('H6', 3, 1, 2),
('H6', 4, 1, 3),
('H6', 5, 1, 4),
('H6', 6, 1, 5),
('H6', 7, 1, 6),
('H6', 8, 1, 7),
('H6', 9, 1, 8),
('H6', 10, 1, 9),
('H6', 11, 1, 10),
('H6', 12, 2, 0),
('H6', 13, 2, 1),
('H6', 14, 3, 0),
('H6', 15, 3, 1),
('H6', 16, 3, 2),
('H6', 17, 3, 3),
('H6', 18, 3, 4),
('H6', 19, 3, 5),
('H6', 20, 4, 0),
('H6', 21, 4, 1),
('H6', 22, 4, 2),
('H6', 23, 4, 3),
('H6', 24, 4, 4),
('H6', 25, 4, 5),
('H6', 26, 4, 6),
('H6', 27, 4, 7),
('H6', 28, 4, 8),
('H6', 29, 4, 9),
('H6', 30, 4, 10),
('H6', 31, 4, 11),
('H6', 32, 4, 12),
('H6', 33, 5, 0),
('H6', 34, 5, 1),
('H6', 35, 5, 2),
('H6', 36, 5, 3),
('H6', 37, 5, 4),
('H6', 38, 6, 0),
('H6', 39, 6, 1),
('H6', 40, 6, 2),
('H6', 41, 7, 0),
('H6', 42, 7, 1),
('H6', 43, 7, 2),
('H6', 44, 7, 3),
('H6', 45, 7, 4),
('H6', 46, 8, 0),
('H6', 47, 9, 0),
('H6', 48, 9, 1),
('H6', 49, 9, 2),
('H6', 50, 9, 3),
('H6', 51, 10, 0),
('H6', 52, 10, 1),
('H6', 53, 10, 2),
('H6', 54, 10, 3),
('H6', 55, 10, 4),
('H6', 56, 10, 5),
('H6', 57, 10, 6),
('H6', 58, 10, 7),
('H6', 59, 10, 8),
('H6', 60, 11, 0),
('H6', 61, 11, 1),
('H6', 62, 11, 2),
('H6', 63, 11, 3),
('H6', 64, 11, 4),
('H6', 65, 11, 5),
('H6', 66, 11, 6),
('H6', 67, 11, 7),
('H6', 68, 11, 8),
('H6', 69, 11, 9),
('H6', 70, 11, 10),
('H6', 71, 11, 11),
('H6', 72, 11, 12),
('H6', 73, 11, 13),
('H6', 74, 11, 14),
('H6', 75, 11, 15),
('H6', 76, 11, 16),
('H6', 77, 11, 17),
('H6', 78, 11, 18),
('H6', 79, 11, 19),
('H6', 80, 11, 20),
('H6', 81, 11, 21),
('H6', 82, 11, 22),
('H6', 83, 11, 23),
('H6', 84, 11, 24),
('H6', 85, 11, 25),
('H6', 86, 11, 26),
('H6', 87, 11, 27),
('H6', 88, 11, 28),
('H6', 89, 11, 29),
('H6', 90, 11, 30),
('H6', 91, 11, 31),
('H6', 92, 12, 0),
('H6', 93, 12, 1),
('H6', 94, 12, 2),
('H6', 95, 12, 3),
('H6', 96, 12, 4),
('H6', 97, 12, 5),
('H6', 98, 13, 0),
('H6', 99, 13, 1),
('H6', 100, 13, 2),
('H6', 101, 13, 3),
('H6', 102, 13, 4),
('H6', 103, 13, 5),
('H6', 104, 13, 6),
('H6', 105, 13, 7),
('H6', 106, 13, 8),
('H6', 107, 13, 9),
('H6', 108, 13, 10),
('H6', 109, 13, 11),
('H6', 110, 13, 12),
('H6', 111, 14, 0),
('H6', 112, 14, 1),
('H6', 113, 14, 2),
('H6', 114, 14, 3),
('H6', 115, 14, 4),
('H6', 116, 14, 5),
('H6', 117, 14, 6),
('H6', 118, 14, 7),
('H6', 119, 14, 8),
('H6', 120, 14, 9),
('H6', 121, 14, 10),
('H6', 122, 14, 11),
('H6', 123, 15, 0),
('H6', 124, 15, 1),
('H6', 125, 15, 2),
('H6', 126, 15, 3),
('H6', 127, 16, 0),
('H6', 128, 16, 1),
('H6', 129, 16, 2),
('H6', 130, 17, 0),
('H6', 131, 17, 1),
('H6', 132, 17, 2),
('H6', 133, 17, 3),
('H6', 134, 17, 4),
('H6', 135, 18, 0),
('H6', 136, 18, 1),
('H6', 137, 18, 2),
('H6', 138, 18, 3),
('H6', 139, 19, 0),
('H6', 140, 19, 1),
('H6', 141, 19, 2),
('H6', 142, 19, 3),
('H6', 143, 19, 4),
('H6', 144, 20, 0),
('H6', 145, 20, 1),
('H6', 146, 20, 2),
('H6', 147, 20, 3),
('H6', 148, 20, 4),
('H6', 149, 20, 5),
('H6', 150, 21, 0),
('H6', 151, 21, 1),
('H6', 152, 21, 2),
('H6', 153, 21, 3),
('H6', 154, 21, 4),
('H6', 155, 21, 5),
('H6', 156, 21, 6),
('H6', 157, 21, 7),
('H6', 158, 21, 8),
('H6', 159, 21, 9),
('H6', 160, 22, 0),
('H6', 161, 22, 1),
('H6', 162, 22, 2),
('H6', 163, 22, 3),
('H6', 164, 22, 4),
('H6', 165, 22, 5),
('H6', 166, 23, 0),
('H6', 167, 23, 1),
('H6', 168, 23, 2),
('H6', 169, 23, 3),
('H6', 170, 24, 0),
('H6', 171, 24, 1),
('H6', 172, 24, 2),
('H6', 173, 25, 0),
('H6', 174, 25, 1),
('H6', 175, 25, 2),
('H6', 176, 25, 3),
('H6', 177, 25, 4),
('H6', 178, 25, 5),
('H6', 179, 26, 0),
('H6', 180, 26, 1),
('H6', 181, 26, 2),
('H6', 182, 27, 0),
('H6', 183, 27, 1),
('H6', 184, 27, 2),
('H6', 185, 27, 3),
('H6', 186, 28, 0),
('H6', 187, 28, 1),
('H6', 188, 28, 2),
('H6', 189, 28, 3),
('H6', 190, 29, 0),
('H6', 191, 29, 1),
('H6', 192, 29, 2),
('H6', 193, 29, 3),
('H6', 194, 30, 0),
('H6', 195, 30, 1),
('H6', 196, 30, 2),
('H6', 197, 30, 3),
('H6', 198, 30, 4),
('H6', 199, 30, 5),
('H6', 200, 30, 6),
('H6', 201, 30, 7),
('H6', 202, 30, 8),
('H6', 203, 30, 9),
('H6', 204, 30, 10),
('H6', 205, 30, 11),
('H6', 206, 30, 12),
('H6', 207, 30, 13),
('H6', 208, 30, 14),
('H6', 209, 30, 15),
('H6', 210, 31, 1),
('H6', 211, 31, 2),
('H6', 212, 31, 3),
('H6', 213, 31, 4),
('H6', 214, 32, 1),
('H6', 215, 32, 2),
('H6', 216, 32, 3),
('H6', 217, 32, 4),
('H6', 218, 32, 5),
('H6', 219, 32, 6),
('H6', 220, 33, 1),
('H6', 221, 33, 2),
('H6', 222, 33, 3),
('H6', 223, 34, 1),
('H6', 224, 34, 2),
('H6', 225, 34, 3),
('H6', 226, 35, 1),
('H6', 227, 35, 2),
('H6', 228, 35, 3),
('H6', 229, 36, 1),
('H6', 230, 36, 2),
('H6', 231, 36, 3),
('H6', 232, 36, 4),
('H6', 233, 36, 5),
('H6', 234, 36, 6),
('H6', 235, 37, 1),
('H6', 236, 37, 2),
('H6', 237, 38, 1),
('H6', 238, 38, 2),
('H6', 239, 38, 3),
('H6', 240, 38, 4),
('H6', 241, 39, 1),
('H6', 242, 39, 2),
('H6', 243, 39, 3),
('H6', 244, 39, 4),
('H6', 245, 40, 1),
('H6', 246, 40, 2),
('H6', 247, 40, 3),
('H6', 248, 40, 4),
('H6', 249, 41, 1),
('H6', 250, 41, 2),
('H6', 251, 41, 3),
('H6', 252, 41, 4),
('H6', 253, 41, 5),
('H6', 254, 41, 6),
('H6', 255, 41, 7),
('H6', 256, 41, 8),
('H6', 257, 41, 9),
('H6', 258, 41, 10),
('H6', 259, 41, 11),
('H6', 260, 42, 1),
('H6', 261, 42, 2),
('H6', 262, 42, 3),
('H6', 263, 42, 4),
('H6', 264, 42, 5),
('H6', 265, 42, 6),
('H6', 266, 42, 7),
('H6', 267, 42, 8),
('H6', 268, 42, 9),
('H6', 269, 43, 1),
('H6', 270, 43, 2),
('H6', 271, 43, 3),
('H6', 272, 43, 4),
('H6', 273, 44, 1),
('H6', 274, 44, 2),
('H6', 275, 44, 3),
('H6', 276, 44, 4),
('H6', 277, 45, 1),
('H6', 278, 45, 2),
('H6', 279, 45, 3),
('H6', 280, 45, 4),
('H6', 281, 45, 5),
('H6', 282, 45, 6),
('H6', 283, 45, 7),
('H6', 284, 45, 8),
('H6', 285, 45, 9),
('H6', 286, 45, 10),
('H6', 287, 45, 11),
('H6', 288, 12, 1),
('H6', 289, 46, 1),
('H6', 290, 46, 2),
('H6', 291, 46, 3),
('H6', 292, 46, 4),
('H6', 293, 46, 5),
('H6', 294, 46, 6),
('H6', 295, 47, 1),
('H6', 296, 47, 2),
('H6', 297, 48, 1),
('H6', 298, 48, 2),
('H6', 299, 48, 3),
('H6', 300, 48, 4),
('H6', 301, 48, 5),
('H6', 302, 48, 6),
('H6', 303, 48, 7),
('H6', 304, 48, 8),
('H6', 305, 48, 9),
('H6', 306, 48, 10),
('H6', 307, 48, 11),
('H6', 308, 48, 12),
('H6', 309, 48, 13),
('H6', 310, 48, 14),
('H6', 311, 48, 15),
('H6', 312, 48, 16),
('H6', 313, 48, 17),
('H6', 314, 48, 18),
('H6', 315, 48, 19),
('H6', 316, 48, 20),
('H6', 317, 48, 21),
('H6', 318, 48, 22),
('H6', 319, 48, 23),
('H6', 320, 48, 24),
('H6', 321, 2, 1),
('H6', 322, 49, 1),
('H6', 323, 49, 2),
('H6', 324, 49, 3),
('H6', 325, 50, 1),
('H6', 326, 50, 2),
('H7', 1, 1, 0),
('H7', 2, 1, 1),
('H7', 3, 1, 2),
('H7', 4, 1, 3),
('H7', 5, 1, 4),
('H7', 6, 1, 5),
('H7', 7, 1, 6),
('H7', 8, 1, 7),
('H7', 9, 1, 8),
('H7', 10, 1, 9),
('H7', 11, 1, 10),
('H7', 12, 2, 0),
('H7', 13, 2, 1),
('H7', 14, 3, 0),
('H7', 15, 3, 1),
('H7', 16, 3, 2),
('H7', 17, 3, 3),
('H7', 18, 3, 4),
('H7', 19, 3, 5),
('H7', 20, 4, 0),
('H7', 21, 4, 1),
('H7', 22, 4, 2),
('H7', 23, 4, 3),
('H7', 24, 4, 4),
('H7', 25, 4, 5),
('H7', 26, 4, 6),
('H7', 27, 4, 7),
('H7', 28, 4, 8),
('H7', 29, 4, 9),
('H7', 30, 4, 10),
('H7', 31, 4, 11),
('H7', 32, 4, 12),
('H7', 33, 5, 0),
('H7', 34, 5, 1),
('H7', 35, 5, 2),
('H7', 36, 5, 3),
('H7', 37, 5, 4),
('H7', 38, 6, 0),
('H7', 39, 6, 1),
('H7', 40, 6, 2),
('H7', 41, 7, 0),
('H7', 42, 7, 1),
('H7', 43, 7, 2),
('H7', 44, 7, 3),
('H7', 45, 7, 4),
('H7', 46, 8, 0),
('H7', 47, 9, 0),
('H7', 48, 9, 1),
('H7', 49, 9, 2),
('H7', 50, 9, 3),
('H7', 51, 10, 0),
('H7', 52, 10, 1),
('H7', 53, 10, 2),
('H7', 54, 10, 3),
('H7', 55, 10, 4),
('H7', 56, 10, 5),
('H7', 57, 10, 6),
('H7', 58, 10, 7),
('H7', 59, 10, 8),
('H7', 60, 11, 0),
('H7', 61, 11, 1),
('H7', 62, 11, 2),
('H7', 63, 11, 3),
('H7', 64, 11, 4),
('H7', 65, 11, 5),
('H7', 66, 11, 6),
('H7', 67, 11, 7),
('H7', 68, 11, 8),
('H7', 69, 11, 9),
('H7', 70, 11, 10),
('H7', 71, 11, 11),
('H7', 72, 11, 12),
('H7', 73, 11, 13),
('H7', 74, 11, 14),
('H7', 75, 11, 15),
('H7', 76, 11, 16),
('H7', 77, 11, 17),
('H7', 78, 11, 18),
('H7', 79, 11, 19),
('H7', 80, 11, 20),
('H7', 81, 11, 21),
('H7', 82, 11, 22),
('H7', 83, 11, 23),
('H7', 84, 11, 24),
('H7', 85, 11, 25),
('H7', 86, 11, 26),
('H7', 87, 11, 27),
('H7', 88, 11, 28),
('H7', 89, 11, 29),
('H7', 90, 11, 30),
('H7', 91, 11, 31),
('H7', 92, 12, 0),
('H7', 93, 12, 1),
('H7', 94, 12, 2),
('H7', 95, 12, 3),
('H7', 96, 12, 4),
('H7', 97, 12, 5),
('H7', 98, 13, 0),
('H7', 99, 13, 1),
('H7', 100, 13, 2),
('H7', 101, 13, 3),
('H7', 102, 13, 4),
('H7', 103, 13, 5),
('H7', 104, 13, 6),
('H7', 105, 13, 7),
('H7', 106, 13, 8),
('H7', 107, 13, 9),
('H7', 108, 13, 10),
('H7', 109, 13, 11),
('H7', 110, 13, 12),
('H7', 111, 14, 0),
('H7', 112, 14, 1),
('H7', 113, 14, 2),
('H7', 114, 14, 3),
('H7', 115, 14, 4),
('H7', 116, 14, 5),
('H7', 117, 14, 6),
('H7', 118, 14, 7),
('H7', 119, 14, 8),
('H7', 120, 14, 9),
('H7', 121, 14, 10),
('H7', 122, 14, 11),
('H7', 123, 15, 0),
('H7', 124, 15, 1),
('H7', 125, 15, 2),
('H7', 126, 15, 3),
('H7', 127, 16, 0),
('H7', 128, 16, 1),
('H7', 129, 16, 2),
('H7', 130, 17, 0),
('H7', 131, 17, 1),
('H7', 132, 17, 2),
('H7', 133, 17, 3),
('H7', 134, 17, 4),
('H7', 135, 18, 0),
('H7', 136, 18, 1),
('H7', 137, 18, 2),
('H7', 138, 18, 3),
('H7', 139, 19, 0),
('H7', 140, 19, 1),
('H7', 141, 19, 2),
('H7', 142, 19, 3),
('H7', 143, 19, 4),
('H7', 144, 20, 0),
('H7', 145, 20, 1),
('H7', 146, 20, 2),
('H7', 147, 20, 3),
('H7', 148, 20, 4),
('H7', 149, 20, 5),
('H7', 150, 21, 0),
('H7', 151, 21, 1),
('H7', 152, 21, 2),
('H7', 153, 21, 3),
('H7', 154, 21, 4),
('H7', 155, 21, 5),
('H7', 156, 21, 6),
('H7', 157, 21, 7),
('H7', 158, 21, 8),
('H7', 159, 21, 9),
('H7', 160, 22, 0),
('H7', 161, 22, 1),
('H7', 162, 22, 2),
('H7', 163, 22, 3),
('H7', 164, 22, 4),
('H7', 165, 22, 5),
('H7', 166, 23, 0),
('H7', 167, 23, 1),
('H7', 168, 23, 2),
('H7', 169, 23, 3),
('H7', 170, 24, 0),
('H7', 171, 24, 1),
('H7', 172, 24, 2),
('H7', 173, 25, 0),
('H7', 174, 25, 1),
('H7', 175, 25, 2),
('H7', 176, 25, 3),
('H7', 177, 25, 4),
('H7', 178, 25, 5),
('H7', 179, 26, 0),
('H7', 180, 26, 1),
('H7', 181, 26, 2),
('H7', 182, 27, 0),
('H7', 183, 27, 1),
('H7', 184, 27, 2),
('H7', 185, 27, 3),
('H7', 186, 28, 0),
('H7', 187, 28, 1),
('H7', 188, 28, 2),
('H7', 189, 28, 3),
('H7', 190, 29, 0),
('H7', 191, 29, 1),
('H7', 192, 29, 2),
('H7', 193, 29, 3),
('H7', 194, 30, 0),
('H7', 195, 30, 1),
('H7', 196, 30, 2),
('H7', 197, 30, 3),
('H7', 198, 30, 4),
('H7', 199, 30, 5),
('H7', 200, 30, 6),
('H7', 201, 30, 7),
('H7', 202, 30, 8),
('H7', 203, 30, 9),
('H7', 204, 30, 10),
('H7', 205, 30, 11),
('H7', 206, 30, 12),
('H7', 207, 30, 13),
('H7', 208, 30, 14),
('H7', 209, 30, 15),
('H7', 210, 31, 1),
('H7', 211, 31, 2),
('H7', 212, 31, 3),
('H7', 213, 31, 4),
('H7', 214, 32, 1),
('H7', 215, 32, 2),
('H7', 216, 32, 3),
('H7', 217, 32, 4),
('H7', 218, 32, 5),
('H7', 219, 32, 6),
('H7', 220, 33, 1),
('H7', 221, 33, 2),
('H7', 222, 33, 3),
('H7', 223, 34, 1),
('H7', 224, 34, 2),
('H7', 225, 34, 3),
('H7', 226, 35, 1),
('H7', 227, 35, 2),
('H7', 228, 35, 3),
('H7', 229, 36, 1),
('H7', 230, 36, 2),
('H7', 231, 36, 3),
('H7', 232, 36, 4),
('H7', 233, 36, 5),
('H7', 234, 36, 6),
('H7', 235, 37, 1),
('H7', 236, 37, 2),
('H7', 237, 38, 1),
('H7', 238, 38, 2),
('H7', 239, 38, 3),
('H7', 240, 38, 4),
('H7', 241, 39, 1),
('H7', 242, 39, 2),
('H7', 243, 39, 3),
('H7', 244, 39, 4),
('H7', 245, 40, 1),
('H7', 246, 40, 2),
('H7', 247, 40, 3),
('H7', 248, 40, 4),
('H7', 249, 41, 1),
('H7', 250, 41, 2),
('H7', 251, 41, 3),
('H7', 252, 41, 4),
('H7', 253, 41, 5),
('H7', 254, 41, 6),
('H7', 255, 41, 7),
('H7', 256, 41, 8),
('H7', 257, 41, 9),
('H7', 258, 41, 10),
('H7', 259, 41, 11),
('H7', 260, 42, 1),
('H7', 261, 42, 2),
('H7', 262, 42, 3),
('H7', 263, 42, 4),
('H7', 264, 42, 5),
('H7', 265, 42, 6),
('H7', 266, 42, 7),
('H7', 267, 42, 8),
('H7', 268, 42, 9),
('H7', 269, 43, 1),
('H7', 270, 43, 2),
('H7', 271, 43, 3),
('H7', 272, 43, 4),
('H7', 273, 44, 1),
('H7', 274, 44, 2),
('H7', 275, 44, 3),
('H7', 276, 44, 4),
('H7', 277, 45, 1),
('H7', 278, 45, 2),
('H7', 279, 45, 3),
('H7', 280, 45, 4),
('H7', 281, 45, 5),
('H7', 282, 45, 6),
('H7', 283, 45, 7),
('H7', 284, 45, 8),
('H7', 285, 45, 9),
('H7', 286, 45, 10),
('H7', 287, 45, 11),
('H7', 288, 12, 1),
('H7', 289, 46, 1),
('H7', 290, 46, 2),
('H7', 291, 46, 3),
('H7', 292, 46, 4),
('H7', 293, 46, 5),
('H7', 294, 46, 6),
('H7', 295, 47, 1),
('H7', 296, 47, 2),
('H7', 297, 48, 1),
('H7', 298, 48, 2),
('H7', 299, 48, 3),
('H7', 300, 48, 4),
('H7', 301, 48, 5),
('H7', 302, 48, 6),
('H7', 303, 48, 7),
('H7', 304, 48, 8),
('H7', 305, 48, 9),
('H7', 306, 48, 10),
('H7', 307, 48, 11),
('H7', 308, 48, 12),
('H7', 309, 48, 13),
('H7', 310, 48, 14),
('H7', 311, 48, 15),
('H7', 312, 48, 16),
('H7', 313, 48, 17),
('H7', 314, 48, 18),
('H7', 315, 48, 19),
('H7', 316, 48, 20),
('H7', 317, 48, 21),
('H7', 318, 48, 22),
('H7', 319, 48, 23),
('H7', 320, 48, 24),
('H7', 321, 2, 1),
('H7', 322, 49, 1),
('H7', 323, 49, 2),
('H7', 324, 49, 3),
('H7', 325, 50, 1),
('H7', 326, 50, 2),
('H7', 327, 51, 1),
('H7', 328, 51, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_role2profile`
--

CREATE TABLE IF NOT EXISTS `vtiger_role2profile` (
  `roleid` varchar(255) NOT NULL,
  `profileid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_role2profile`
--

INSERT INTO `vtiger_role2profile` (`roleid`, `profileid`) VALUES
('H2', 5),
('H7', 8);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_role_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_role_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_role_seq`
--

INSERT INTO `vtiger_role_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_rowheight`
--

CREATE TABLE IF NOT EXISTS `vtiger_rowheight` (
`rowheightid` int(11) NOT NULL,
  `rowheight` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_rowheight`
--

INSERT INTO `vtiger_rowheight` (`rowheightid`, `rowheight`, `sortorderid`, `presence`) VALUES
(1, 'wide', 1, 1),
(2, 'medium', 2, 1),
(3, 'narrow', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_rowheight_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_rowheight_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_rowheight_seq`
--

INSERT INTO `vtiger_rowheight_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_rss`
--

CREATE TABLE IF NOT EXISTS `vtiger_rss` (
  `rssid` int(19) NOT NULL,
  `rssurl` varchar(200) NOT NULL DEFAULT '',
  `rsstitle` varchar(200) DEFAULT NULL,
  `rsstype` int(10) DEFAULT '0',
  `starred` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sales_stage`
--

CREATE TABLE IF NOT EXISTS `vtiger_sales_stage` (
`sales_stage_id` int(19) NOT NULL,
  `sales_stage` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_sales_stage`
--

INSERT INTO `vtiger_sales_stage` (`sales_stage_id`, `sales_stage`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Prospecting', 1, 150, 0),
(2, 'Qualification', 1, 151, 1),
(3, 'Needs Analysis', 1, 152, 2),
(4, 'Value Proposition', 1, 153, 3),
(5, 'Id. Decision Makers', 1, 154, 4),
(6, 'Perception Analysis', 1, 155, 5),
(7, 'Proposal or Price Quote', 1, 156, 6),
(8, 'Negotiation or Review', 1, 157, 7),
(9, 'Closed Won', 0, 158, 8),
(10, 'Closed Lost', 0, 159, 9);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sales_stage_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_sales_stage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_sales_stage_seq`
--

INSERT INTO `vtiger_sales_stage_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salesmanactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanactivityrel` (
  `smid` int(19) NOT NULL DEFAULT '0',
  `activityid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_salesmanactivityrel`
--

INSERT INTO `vtiger_salesmanactivityrel` (`smid`, `activityid`) VALUES
(1, 2),
(1, 6),
(1, 18),
(1, 19),
(1, 22),
(1, 39);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salesmanattachmentsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanattachmentsrel` (
  `smid` int(19) NOT NULL DEFAULT '0',
  `attachmentsid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salesmanticketrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanticketrel` (
  `smid` int(19) NOT NULL DEFAULT '0',
  `id` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salesorder`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesorder` (
  `salesorderid` int(19) NOT NULL DEFAULT '0',
  `subject` varchar(100) DEFAULT NULL,
  `potentialid` int(19) DEFAULT NULL,
  `customerno` varchar(100) DEFAULT NULL,
  `salesorder_no` varchar(100) DEFAULT NULL,
  `quoteid` int(19) DEFAULT NULL,
  `vendorterms` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `vendorid` int(19) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `pending` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text,
  `purchaseorder` varchar(200) DEFAULT NULL,
  `sostatus` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT '1.000',
  `enable_recurring` int(11) DEFAULT '0',
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_salesorder`
--

INSERT INTO `vtiger_salesorder` (`salesorderid`, `subject`, `potentialid`, `customerno`, `salesorder_no`, `quoteid`, `vendorterms`, `contactid`, `vendorid`, `duedate`, `carrier`, `pending`, `type`, `adjustment`, `salescommission`, `exciseduty`, `total`, `subtotal`, `taxtype`, `discount_percent`, `discount_amount`, `s_h_amount`, `accountid`, `terms_conditions`, `purchaseorder`, `sostatus`, `currency_id`, `conversion_rate`, `enable_recurring`, `pre_tax_total`, `s_h_percent`) VALUES
(29, 'safwef', 0, '', 'SO1', 0, NULL, 0, NULL, NULL, '', '', NULL, 0.00000000, 0.000, 0.000, 0.00000000, 0.00000000, 'group', NULL, NULL, 0.00000000, 16, '- Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.', '', 'Created', 1, 1.000, 0, 0.00000000, 27);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salesordercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesordercf` (
  `salesorderid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_salesordercf`
--

INSERT INTO `vtiger_salesordercf` (`salesorderid`) VALUES
(29);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salutationtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_salutationtype` (
`salutationid` int(19) NOT NULL,
  `salutationtype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_salutationtype`
--

INSERT INTO `vtiger_salutationtype` (`salutationid`, `salutationtype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Mr.', 1, 161, 1),
(3, 'Ms.', 1, 162, 2),
(4, 'Mrs.', 1, 163, 3),
(5, 'Dr.', 1, 164, 4),
(6, 'Prof.', 1, 165, 5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_salutationtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_salutationtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_salutationtype_seq`
--

INSERT INTO `vtiger_salutationtype_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_scheduled_reports`
--

CREATE TABLE IF NOT EXISTS `vtiger_scheduled_reports` (
  `reportid` int(11) NOT NULL,
  `recipients` text,
  `schedule` text,
  `format` varchar(10) DEFAULT NULL,
  `next_trigger_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_schedulereports`
--

CREATE TABLE IF NOT EXISTS `vtiger_schedulereports` (
  `reportid` int(10) DEFAULT NULL,
  `scheduleid` int(3) DEFAULT NULL,
  `recipients` text,
  `schdate` varchar(20) DEFAULT NULL,
  `schtime` time DEFAULT NULL,
  `schdayoftheweek` varchar(100) DEFAULT NULL,
  `schdayofthemonth` varchar(100) DEFAULT NULL,
  `schannualdates` varchar(500) DEFAULT NULL,
  `specificemails` varchar(500) DEFAULT NULL,
  `next_trigger_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_seactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seactivityrel` (
  `crmid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_seactivityrel`
--

INSERT INTO `vtiger_seactivityrel` (`crmid`, `activityid`) VALUES
(16, 18),
(16, 22);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_seactivityrel_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_seactivityrel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_seactivityrel_seq`
--

INSERT INTO `vtiger_seactivityrel_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_seattachmentsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seattachmentsrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `attachmentsid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_selectcolumn`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectcolumn` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL DEFAULT '0',
  `columnname` varchar(250) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_selectcolumn`
--

INSERT INTO `vtiger_selectcolumn` (`queryid`, `columnindex`, `columnname`) VALUES
(1, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(1, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(1, 2, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(1, 3, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(1, 4, 'vtiger_account:industry:Accounts_industry:industry:V'),
(1, 5, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(2, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(2, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(2, 2, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(2, 3, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(2, 4, 'vtiger_account:industry:Accounts_industry:industry:V'),
(2, 5, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(3, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(3, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(3, 2, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(3, 3, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(3, 4, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(3, 5, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(4, 0, 'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),
(4, 1, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(4, 2, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(4, 3, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(4, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),
(5, 0, 'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),
(5, 1, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(5, 2, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(5, 3, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(5, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),
(5, 5, 'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V'),
(6, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(6, 1, 'vtiger_potential:amount:Potentials_Amount:amount:N'),
(6, 2, 'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),
(6, 3, 'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),
(6, 4, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(7, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(7, 1, 'vtiger_potential:amount:Potentials_Amount:amount:N'),
(7, 2, 'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),
(7, 3, 'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),
(7, 4, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(8, 0, 'vtiger_activity:subject:Calendar_Subject:subject:V'),
(8, 1, 'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),
(8, 2, 'vtiger_activity:status:Calendar_Status:taskstatus:V'),
(8, 3, 'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),
(8, 4, 'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),
(9, 0, 'vtiger_activity:subject:Calendar_Subject:subject:V'),
(9, 1, 'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),
(9, 2, 'vtiger_activity:status:Calendar_Status:taskstatus:V'),
(9, 3, 'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),
(9, 4, 'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),
(10, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(10, 1, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(10, 2, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(10, 3, 'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),
(10, 4, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(10, 5, 'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),
(11, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(11, 1, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),
(11, 2, 'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),
(11, 3, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(11, 4, 'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),
(11, 5, 'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),
(12, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(12, 1, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),
(12, 2, 'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),
(12, 3, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(12, 4, 'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),
(12, 5, 'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),
(13, 0, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(13, 1, 'vtiger_products:productcode:Products_Product_Code:productcode:V'),
(13, 2, 'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),
(13, 3, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(13, 4, 'vtiger_products:website:Products_Website:website:V'),
(13, 5, 'vtiger_vendorRelProducts:vendorname:Products_Vendor_Name:vendor_id:I'),
(13, 6, 'vtiger_products:mfr_part_no:Products_Mfr_PartNo:mfr_part_no:V'),
(14, 0, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(14, 1, 'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),
(14, 2, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(14, 3, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(14, 4, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(14, 5, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(15, 0, 'vtiger_quotes:subject:Quotes_Subject:subject:V'),
(15, 1, 'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),
(15, 2, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),
(15, 3, 'vtiger_quotes:contactid:Quotes_Contact_Name:contact_id:V'),
(15, 4, 'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),
(15, 5, 'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),
(16, 0, 'vtiger_quotes:subject:Quotes_Subject:subject:V'),
(16, 1, 'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),
(16, 2, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),
(16, 3, 'vtiger_quotes:contactid:Quotes_Contact_Name:contact_id:V'),
(16, 4, 'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),
(16, 5, 'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),
(16, 6, 'vtiger_quotes:carrier:Quotes_Carrier:carrier:V'),
(16, 7, 'vtiger_quotes:shipping:Quotes_Shipping:shipping:V'),
(17, 0, 'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),
(17, 1, 'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),
(17, 2, 'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),
(17, 3, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(17, 4, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(17, 5, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(17, 6, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(18, 0, 'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),
(18, 1, 'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),
(18, 2, 'vtiger_purchaseorder:requisition_no:PurchaseOrder_Requisition_No:requisition_no:V'),
(18, 3, 'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),
(18, 4, 'vtiger_contactdetailsPurchaseOrder:lastname:PurchaseOrder_Contact_Name:contact_id:I'),
(18, 5, 'vtiger_purchaseorder:carrier:PurchaseOrder_Carrier:carrier:V'),
(18, 6, 'vtiger_purchaseorder:salescommission:PurchaseOrder_Sales_Commission:salescommission:N'),
(18, 7, 'vtiger_purchaseorder:exciseduty:PurchaseOrder_Excise_Duty:exciseduty:N'),
(18, 8, 'vtiger_usersPurchaseOrder:user_name:PurchaseOrder_Assigned_To:assigned_user_id:V'),
(19, 0, 'vtiger_invoice:subject:Invoice_Subject:subject:V'),
(19, 1, 'vtiger_invoice:salesorderid:Invoice_Sales_Order:salesorder_id:I'),
(19, 2, 'vtiger_invoice:customerno:Invoice_Customer_No:customerno:V'),
(19, 3, 'vtiger_invoice:exciseduty:Invoice_Excise_Duty:exciseduty:N'),
(19, 4, 'vtiger_invoice:salescommission:Invoice_Sales_Commission:salescommission:N'),
(19, 5, 'vtiger_accountInvoice:accountname:Invoice_Account_Name:account_id:I'),
(20, 0, 'vtiger_salesorder:subject:SalesOrder_Subject:subject:V'),
(20, 1, 'vtiger_quotesSalesOrder:subject:SalesOrder_Quote_Name:quote_id:I'),
(20, 2, 'vtiger_contactdetailsSalesOrder:lastname:SalesOrder_Contact_Name:contact_id:I'),
(20, 3, 'vtiger_salesorder:duedate:SalesOrder_Due_Date:duedate:D'),
(20, 4, 'vtiger_salesorder:carrier:SalesOrder_Carrier:carrier:V'),
(20, 5, 'vtiger_salesorder:sostatus:SalesOrder_Status:sostatus:V'),
(20, 6, 'vtiger_accountSalesOrder:accountname:SalesOrder_Account_Name:account_id:I'),
(20, 7, 'vtiger_salesorder:salescommission:SalesOrder_Sales_Commission:salescommission:N'),
(20, 8, 'vtiger_salesorder:exciseduty:SalesOrder_Excise_Duty:exciseduty:N'),
(20, 9, 'vtiger_usersSalesOrder:user_name:SalesOrder_Assigned_To:assigned_user_id:V'),
(21, 0, 'vtiger_campaign:campaignname:Campaigns_Campaign_Name:campaignname:V'),
(21, 1, 'vtiger_campaign:campaigntype:Campaigns_Campaign_Type:campaigntype:V'),
(21, 2, 'vtiger_campaign:targetaudience:Campaigns_Target_Audience:targetaudience:V'),
(21, 3, 'vtiger_campaign:budgetcost:Campaigns_Budget_Cost:budgetcost:I'),
(21, 4, 'vtiger_campaign:actualcost:Campaigns_Actual_Cost:actualcost:I'),
(21, 5, 'vtiger_campaign:expectedrevenue:Campaigns_Expected_Revenue:expectedrevenue:I'),
(21, 6, 'vtiger_campaign:expectedsalescount:Campaigns_Expected_Sales_Count:expectedsalescount:N'),
(21, 7, 'vtiger_campaign:actualsalescount:Campaigns_Actual_Sales_Count:actualsalescount:N'),
(21, 8, 'vtiger_usersCampaigns:user_name:Campaigns_Assigned_To:assigned_user_id:V'),
(22, 0, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(22, 1, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(22, 2, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(22, 3, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(23, 0, 'vtiger_account:accountname:Accounts_Account_Name:accountname:V'),
(23, 1, 'vtiger_account:phone:Accounts_Phone:phone:V'),
(23, 2, 'vtiger_account:email1:Accounts_Email:email1:E'),
(23, 3, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(23, 4, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(24, 0, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(24, 1, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(24, 2, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(24, 3, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(24, 4, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(25, 0, 'vtiger_vendor:vendorname:Vendors_Vendor_Name:vendorname:V'),
(25, 1, 'vtiger_vendor:glacct:Vendors_GL_Account:glacct:V'),
(25, 2, 'vtiger_vendor:email:Vendors_Email:email:E'),
(25, 3, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(25, 4, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(27, 0, 'vtiger_products:productcode:Products_Part_Number:productcode:V'),
(27, 1, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(28, 0, 'vtiger_products:productcode:Products_Part_Number:productcode:V'),
(28, 1, 'vtiger_products:productname:Products_Product_Name:productname:V');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_selectquery`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectquery` (
  `queryid` int(19) NOT NULL,
  `startindex` int(19) DEFAULT '0',
  `numofobjects` int(19) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_selectquery`
--

INSERT INTO `vtiger_selectquery` (`queryid`, `startindex`, `numofobjects`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(21, 0, 0),
(22, 0, 0),
(23, 0, 0),
(24, 0, 0),
(25, 0, 0),
(26, 0, 0),
(27, 0, 0),
(28, 0, 0),
(29, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_selectquery_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectquery_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_selectquery_seq`
--

INSERT INTO `vtiger_selectquery_seq` (`id`) VALUES
(29);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_senotesrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_senotesrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `notesid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_senotesrel`
--

INSERT INTO `vtiger_senotesrel` (`crmid`, `notesid`) VALUES
(12, 14),
(11, 21);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_seproductsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seproductsrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `productid` int(19) NOT NULL DEFAULT '0',
  `setype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_service`
--

CREATE TABLE IF NOT EXISTS `vtiger_service` (
  `serviceid` int(11) NOT NULL,
  `service_no` varchar(100) NOT NULL,
  `servicename` varchar(50) NOT NULL,
  `servicecategory` varchar(200) DEFAULT NULL,
  `qty_per_unit` decimal(11,2) DEFAULT '0.00',
  `unit_price` decimal(25,8) DEFAULT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT '0',
  `service_usageunit` varchar(200) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `taxclass` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `commissionrate` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_service_usageunit`
--

CREATE TABLE IF NOT EXISTS `vtiger_service_usageunit` (
`service_usageunitid` int(11) NOT NULL,
  `service_usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_service_usageunit`
--

INSERT INTO `vtiger_service_usageunit` (`service_usageunitid`, `service_usageunit`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Hours', 1, 226, 1),
(2, 'Days', 1, 227, 2),
(3, 'Incidents', 1, 228, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_service_usageunit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_service_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_service_usageunit_seq`
--

INSERT INTO `vtiger_service_usageunit_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_servicecategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecategory` (
`servicecategoryid` int(11) NOT NULL,
  `servicecategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_servicecategory`
--

INSERT INTO `vtiger_servicecategory` (`servicecategoryid`, `servicecategory`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Support', 1, 230, 2),
(3, 'Installation', 1, 231, 3),
(4, 'Migration', 1, 232, 4),
(5, 'Customization', 1, 233, 5),
(6, 'Training', 1, 234, 6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_servicecategory_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_servicecategory_seq`
--

INSERT INTO `vtiger_servicecategory_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_servicecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecf` (
  `serviceid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_servicecontracts`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecontracts` (
  `servicecontractsid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sc_related_to` int(11) DEFAULT NULL,
  `tracking_unit` varchar(100) DEFAULT NULL,
  `total_units` decimal(5,2) DEFAULT NULL,
  `used_units` decimal(5,2) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `planned_duration` varchar(256) DEFAULT NULL,
  `actual_duration` varchar(256) DEFAULT NULL,
  `contract_status` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `contract_type` varchar(200) DEFAULT NULL,
  `progress` decimal(5,2) DEFAULT NULL,
  `contract_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_servicecontracts`
--

INSERT INTO `vtiger_servicecontracts` (`servicecontractsid`, `start_date`, `end_date`, `sc_related_to`, `tracking_unit`, `total_units`, `used_units`, `subject`, `due_date`, `planned_duration`, `actual_duration`, `contract_status`, `priority`, `contract_type`, `progress`, `contract_no`) VALUES
(15, NULL, NULL, 0, '', 0.00, 0.00, 'tstst3', NULL, '', '', '', '', '', NULL, 'SERCON1'),
(23, NULL, NULL, 16, 'Days', 0.00, 0.00, 'test', NULL, '', '', '', '', '', NULL, 'SERCON2');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_servicecontractscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecontractscf` (
  `servicecontractsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_servicecontractscf`
--

INSERT INTO `vtiger_servicecontractscf` (`servicecontractsid`) VALUES
(15),
(23);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_seticketsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seticketsrel` (
  `crmid` int(19) NOT NULL DEFAULT '0',
  `ticketid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_settings_blocks`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_blocks` (
  `blockid` int(19) NOT NULL,
  `label` varchar(250) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_settings_blocks`
--

INSERT INTO `vtiger_settings_blocks` (`blockid`, `label`, `sequence`) VALUES
(1, 'LBL_USER_MANAGEMENT', 1),
(2, 'LBL_STUDIO', 2),
(3, 'LBL_COMMUNICATION_TEMPLATES', 3),
(4, 'LBL_OTHER_SETTINGS', 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_settings_blocks_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_settings_blocks_seq`
--

INSERT INTO `vtiger_settings_blocks_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_settings_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_field` (
  `fieldid` int(19) NOT NULL,
  `blockid` int(19) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `iconpath` varchar(300) DEFAULT NULL,
  `description` text,
  `linkto` text,
  `sequence` int(19) DEFAULT NULL,
  `active` int(19) DEFAULT '0',
  `pinned` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_settings_field`
--

INSERT INTO `vtiger_settings_field` (`fieldid`, `blockid`, `name`, `iconpath`, `description`, `linkto`, `sequence`, `active`, `pinned`) VALUES
(1, 1, 'LBL_USERS', 'ico-users.gif', 'LBL_USER_DESCRIPTION', 'index.php?module=Users&parent=Settings&view=List', 1, 0, 1),
(2, 1, 'LBL_ROLES', 'ico-roles.gif', 'LBL_ROLE_DESCRIPTION', 'index.php?module=Roles&parent=Settings&view=Index', 2, 0, 0),
(3, 1, 'LBL_PROFILES', 'ico-profile.gif', 'LBL_PROFILE_DESCRIPTION', 'index.php?module=Profiles&parent=Settings&view=List', 3, 0, 0),
(4, 1, 'USERGROUPLIST', 'ico-groups.gif', 'LBL_GROUP_DESCRIPTION', 'index.php?module=Groups&parent=Settings&view=List', 4, 0, 0),
(5, 1, 'LBL_SHARING_ACCESS', 'shareaccess.gif', 'LBL_SHARING_ACCESS_DESCRIPTION', 'index.php?module=SharingAccess&parent=Settings&view=Index', 5, 0, 0),
(6, 1, 'LBL_FIELDS_ACCESS', 'orgshar.gif', 'LBL_SHARING_FIELDS_DESCRIPTION', 'index.php?module=FieldAccess&parent=Settings&view=Index', 6, 0, 0),
(7, 1, 'LBL_LOGIN_HISTORY_DETAILS', 'set-IcoLoginHistory.gif', 'LBL_LOGIN_HISTORY_DESCRIPTION', 'index.php?module=LoginHistory&parent=Settings&view=List', 7, 0, 0),
(8, 2, 'VTLIB_LBL_MODULE_MANAGER', 'vtlib_modmng.gif', 'VTLIB_LBL_MODULE_MANAGER_DESCRIPTION', 'index.php?module=ModuleManager&parent=Settings&view=List', 8, 0, 1),
(9, 2, 'LBL_PICKLIST_EDITOR', 'picklist.gif', 'LBL_PICKLIST_DESCRIPTION', 'index.php?parent=Settings&module=Picklist&view=Index', 1, 0, 1),
(10, 2, 'LBL_PICKLIST_DEPENDENCY_SETUP', 'picklistdependency.gif', 'LBL_PICKLIST_DEPENDENCY_DESCRIPTION', 'index.php?parent=Settings&module=PickListDependency&view=List', 2, 0, 0),
(11, 2, 'LBL_MENU_EDITOR', 'menueditor.png', 'LBL_MENU_DESC', 'index.php?module=MenuEditor&parent=Settings&view=Index', 3, 0, 0),
(12, 3, 'NOTIFICATIONSCHEDULERS', 'notification.gif', 'LBL_NOTIF_SCHED_DESCRIPTION', 'index.php?module=Settings&view=listnotificationschedulers&parenttab=Settings', 4, 0, 0),
(13, 3, 'INVENTORYNOTIFICATION', 'inventory.gif', 'LBL_INV_NOTIF_DESCRIPTION', 'index.php?module=Settings&view=listinventorynotifications&parenttab=Settings', 1, 0, 0),
(14, 3, 'LBL_COMPANY_DETAILS', 'company.gif', 'LBL_COMPANY_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=CompanyDetails', 2, 0, 0),
(15, 4, 'LBL_MAIL_SERVER_SETTINGS', 'ogmailserver.gif', 'LBL_MAIL_SERVER_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=OutgoingServerDetail', 3, 0, 0),
(16, 4, 'LBL_CURRENCY_SETTINGS', 'currency.gif', 'LBL_CURRENCY_DESCRIPTION', 'index.php?parent=Settings&module=Currency&view=List', 4, 0, 0),
(17, 4, 'LBL_TAX_SETTINGS', 'taxConfiguration.gif', 'LBL_TAX_DESCRIPTION', 'index.php?module=Vtiger&parent=Settings&view=TaxIndex', 5, 0, 0),
(18, 4, 'LBL_SYSTEM_INFO', 'system.gif', 'LBL_SYSTEM_DESCRIPTION', 'index.php?module=Settings&submodule=Server&view=ProxyConfig', 6, 1, 0),
(19, 4, 'LBL_ANNOUNCEMENT', 'announ.gif', 'LBL_ANNOUNCEMENT_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=AnnouncementEdit', 1, 0, 0),
(20, 4, 'LBL_DEFAULT_MODULE_VIEW', 'set-IcoTwoTabConfig.gif', 'LBL_DEFAULT_MODULE_VIEW_DESC', 'index.php?module=Settings&action=DefModuleView&parenttab=Settings', 2, 0, 0),
(21, 4, 'INVENTORYTERMSANDCONDITIONS', 'terms.gif', 'LBL_INV_TANDC_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=TermsAndConditionsEdit', 3, 0, 0),
(22, 4, 'LBL_CUSTOMIZE_MODENT_NUMBER', 'settingsInvNumber.gif', 'LBL_CUSTOMIZE_MODENT_NUMBER_DESCRIPTION', 'index.php?module=Vtiger&parent=Settings&view=CustomRecordNumbering', 4, 0, 0),
(23, 4, 'LBL_MAIL_SCANNER', 'mailScanner.gif', 'LBL_MAIL_SCANNER_DESCRIPTION', 'index.php?parent=Settings&module=MailConverter&view=List', 5, 0, 0),
(24, 4, 'LBL_LIST_WORKFLOWS', 'settingsWorkflow.png', 'LBL_LIST_WORKFLOWS_DESCRIPTION', 'index.php?module=Workflows&parent=Settings&view=List', 6, 0, 1),
(25, 4, 'LBL_CONFIG_EDITOR', 'migrate.gif', 'LBL_CONFIG_EDITOR_DESCRIPTION', 'index.php?module=Vtiger&parent=Settings&view=ConfigEditorDetail', 7, 0, 0),
(26, 4, 'Scheduler', 'Cron.png', 'Allows you to Configure Cron Task', 'index.php?module=CronTasks&parent=Settings&view=List', 8, 0, 0),
(27, 4, 'LBL_WORKFLOW_LIST', 'settingsWorkflow.png', 'LBL_AVAILABLE_WORKLIST_LIST', 'index.php?module=com_vtiger_workflow&action=workflowlist', 8, 0, 0),
(28, 4, 'ModTracker', 'set-IcoLoginHistory.gif', 'LBL_MODTRACKER_DESCRIPTION', 'index.php?module=ModTracker&action=BasicSettings&parenttab=Settings&formodule=ModTracker', 9, 0, 0),
(29, 4, 'LBL_CUSTOMER_PORTAL', 'portal_icon.png', 'PORTAL_EXTENSION_DESCRIPTION', 'index.php?module=CustomerPortal&action=index&parenttab=Settings', 10, 0, 0),
(30, 4, 'Webforms', 'modules/Webforms/img/Webform.png', 'LBL_WEBFORMS_DESCRIPTION', 'index.php?module=Webforms&action=index&parenttab=Settings', 11, 0, 0),
(31, 2, 'LBL_EDIT_FIELDS', '', 'LBL_LAYOUT_EDITOR_DESCRIPTION', 'index.php?module=LayoutEditor&parent=Settings&view=Index', NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_settings_field_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_settings_field_seq`
--

INSERT INTO `vtiger_settings_field_seq` (`id`) VALUES
(31);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sharedcalendar`
--

CREATE TABLE IF NOT EXISTS `vtiger_sharedcalendar` (
  `userid` int(19) NOT NULL,
  `sharedid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_shareduserinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_shareduserinfo` (
  `userid` int(19) NOT NULL DEFAULT '0',
  `shareduserid` int(19) NOT NULL DEFAULT '0',
  `color` varchar(50) DEFAULT NULL,
  `visible` int(19) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_shippingtaxinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_shippingtaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) DEFAULT NULL,
  `taxlabel` varchar(50) DEFAULT NULL,
  `percentage` decimal(7,3) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_shippingtaxinfo`
--

INSERT INTO `vtiger_shippingtaxinfo` (`taxid`, `taxname`, `taxlabel`, `percentage`, `deleted`) VALUES
(1, 'shtax1', 'VAT', 4.500, 0),
(2, 'shtax2', 'Sales', 10.000, 0),
(3, 'shtax3', 'Service', 12.500, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_shippingtaxinfo_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_shippingtaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_shippingtaxinfo_seq`
--

INSERT INTO `vtiger_shippingtaxinfo_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_shorturls`
--

CREATE TABLE IF NOT EXISTS `vtiger_shorturls` (
`id` int(11) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `handler_path` varchar(400) DEFAULT NULL,
  `handler_class` varchar(100) DEFAULT NULL,
  `handler_function` varchar(100) DEFAULT NULL,
  `handler_data` varchar(255) DEFAULT NULL,
  `onetime` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_smsnotifier`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier` (
  `smsnotifierid` int(11) DEFAULT NULL,
  `message` text,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_smsnotifier_servers`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier_servers` (
`id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  `providertype` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `parameters` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_smsnotifier_servers`
--

INSERT INTO `vtiger_smsnotifier_servers` (`id`, `password`, `isactive`, `providertype`, `username`, `parameters`) VALUES
(1, 'admin', 0, 'ClickATell', 'admin', '{"api_id":"","from":"","mo":""}');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_smsnotifier_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier_status` (
  `smsnotifierid` int(11) DEFAULT NULL,
  `tonumber` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `smsmessageid` varchar(50) DEFAULT NULL,
  `needlookup` int(1) DEFAULT '1',
`statusid` int(11) NOT NULL,
  `statusmessage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_smsnotifiercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifiercf` (
  `smsnotifierid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_soapservice`
--

CREATE TABLE IF NOT EXISTS `vtiger_soapservice` (
  `id` int(19) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `sessionid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sobillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_sobillads` (
  `sobilladdressid` int(19) NOT NULL DEFAULT '0',
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_sobillads`
--

INSERT INTO `vtiger_sobillads` (`sobilladdressid`, `bill_city`, `bill_code`, `bill_country`, `bill_state`, `bill_street`, `bill_pobox`) VALUES
(29, '', '', '', '', 'asf', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_soshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_soshipads` (
  `soshipaddressid` int(19) NOT NULL DEFAULT '0',
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_soshipads`
--

INSERT INTO `vtiger_soshipads` (`soshipaddressid`, `ship_city`, `ship_code`, `ship_country`, `ship_state`, `ship_street`, `ship_pobox`) VALUES
(29, '', '', '', '', 'sadf', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sostatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatus` (
`sostatusid` int(19) NOT NULL,
  `sostatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_sostatus`
--

INSERT INTO `vtiger_sostatus` (`sostatusid`, `sostatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Created', 0, 166, 0),
(2, 'Approved', 0, 167, 1),
(3, 'Delivered', 0, 168, 2),
(4, 'Cancelled', 0, 169, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sostatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_sostatus_seq`
--

INSERT INTO `vtiger_sostatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sostatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatushistory` (
`historyid` int(19) NOT NULL,
  `salesorderid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `sostatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_sqltimelog`
--

CREATE TABLE IF NOT EXISTS `vtiger_sqltimelog` (
  `id` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `data` text,
  `started` decimal(20,6) DEFAULT NULL,
  `ended` decimal(20,6) DEFAULT NULL,
  `loggedon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_start_hour`
--

CREATE TABLE IF NOT EXISTS `vtiger_start_hour` (
`start_hourid` int(11) NOT NULL,
  `start_hour` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_start_hour`
--

INSERT INTO `vtiger_start_hour` (`start_hourid`, `start_hour`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, '00:00', 1, 297, 1),
(2, '01:00', 1, 298, 2),
(3, '02:00', 1, 299, 3),
(4, '03:00', 1, 300, 4),
(5, '04:00', 1, 301, 5),
(6, '05:00', 1, 302, 6),
(7, '06:00', 1, 303, 7),
(8, '07:00', 1, 304, 8),
(9, '08:00', 1, 305, 9),
(10, '09:00', 1, 306, 10),
(11, '10:00', 1, 307, 11),
(12, '11:00', 1, 308, 12),
(13, '12:00', 1, 309, 13),
(14, '13:00', 1, 310, 14),
(15, '14:00', 1, 311, 15),
(16, '15:00', 1, 312, 16),
(17, '16:00', 1, 313, 17),
(18, '17:00', 1, 314, 18),
(19, '18:00', 1, 315, 19),
(20, '19:00', 1, 316, 20),
(21, '20:00', 1, 317, 21),
(22, '21:00', 1, 318, 22),
(23, '22:00', 1, 319, 23),
(24, '23:00', 1, 320, 24);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_start_hour_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_start_hour_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_start_hour_seq`
--

INSERT INTO `vtiger_start_hour_seq` (`id`) VALUES
(24);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_status` (
`statusid` int(19) NOT NULL,
  `status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_status`
--

INSERT INTO `vtiger_status` (`statusid`, `status`, `presence`, `picklist_valueid`) VALUES
(1, 'Active', 0, 1),
(2, 'Inactive', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_status_seq`
--

INSERT INTO `vtiger_status_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_systems`
--

CREATE TABLE IF NOT EXISTS `vtiger_systems` (
  `id` int(19) NOT NULL,
  `server` varchar(100) DEFAULT NULL,
  `server_port` int(19) DEFAULT NULL,
  `server_username` varchar(100) DEFAULT NULL,
  `server_password` varchar(100) DEFAULT NULL,
  `server_type` varchar(20) DEFAULT NULL,
  `smtp_auth` varchar(5) DEFAULT NULL,
  `server_path` varchar(256) DEFAULT NULL,
  `from_email_field` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_systems`
--

INSERT INTO `vtiger_systems` (`id`, `server`, `server_port`, `server_username`, `server_password`, `server_type`, `smtp_auth`, `server_path`, `from_email_field`) VALUES
(1, 'smtp.ym.163.com', 0, 'chenhs@doitchina.com', '123456', 'email', '1', NULL, 'chenhs@doitchina.com');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_systems_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_systems_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_systems_seq`
--

INSERT INTO `vtiger_systems_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_tab` (
  `tabid` int(19) NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT '1',
  `tabsequence` int(10) DEFAULT NULL,
  `tablabel` varchar(25) NOT NULL,
  `modifiedby` int(19) DEFAULT NULL,
  `modifiedtime` int(19) DEFAULT NULL,
  `customized` int(19) DEFAULT NULL,
  `ownedby` int(19) DEFAULT NULL,
  `isentitytype` int(11) NOT NULL DEFAULT '1',
  `trial` int(1) NOT NULL DEFAULT '0',
  `version` varchar(10) DEFAULT NULL,
  `parent` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_tab`
--

INSERT INTO `vtiger_tab` (`tabid`, `name`, `presence`, `tabsequence`, `tablabel`, `modifiedby`, `modifiedtime`, `customized`, `ownedby`, `isentitytype`, `trial`, `version`, `parent`) VALUES
(1, 'Dashboard', 0, -1, 'Dashboards', NULL, NULL, 0, 1, 0, 0, NULL, 'Analytics'),
(2, 'Potentials', 1, 5, 'Potentials', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(3, 'Home', 0, -1, 'Home', NULL, NULL, 0, 1, 0, 0, NULL, NULL),
(4, 'Contacts', 0, 4, 'Contacts', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(6, 'Accounts', 0, 3, 'Accounts', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(7, 'Leads', 1, 2, 'Leads', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(8, 'Documents', 0, 7, 'Documents', NULL, NULL, 0, 0, 1, 0, NULL, 'Tools'),
(9, 'Calendar', 0, 1, 'Calendar', NULL, NULL, 0, 0, 1, 0, NULL, 'Tools'),
(10, 'Emails', 0, -1, 'Emails', NULL, NULL, 0, 1, 1, 0, NULL, 'Tools'),
(13, 'HelpDesk', 0, 8, 'HelpDesk', NULL, NULL, 0, 0, 1, 0, NULL, 'Support'),
(14, 'Products', 0, 6, 'Products', NULL, NULL, 0, 0, 1, 0, NULL, 'Inventory'),
(15, 'Faq', 0, 9, 'Faq', NULL, NULL, 0, 1, 1, 0, NULL, 'Support'),
(16, 'Events', 2, -1, 'Events', NULL, NULL, 0, 0, 1, 0, NULL, NULL),
(18, 'Vendors', 0, -1, 'Vendors', NULL, NULL, 0, 0, 1, 0, NULL, 'Inventory'),
(19, 'PriceBooks', 1, -1, 'PriceBooks', NULL, NULL, 0, 1, 1, 0, NULL, 'Inventory'),
(20, 'Quotes', 1, -1, 'Quotes', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(21, 'PurchaseOrder', 0, -1, 'PurchaseOrder', NULL, NULL, 0, 0, 1, 0, NULL, 'Inventory'),
(22, 'SalesOrder', 0, -1, 'SalesOrder', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(23, 'Invoice', 0, -1, 'Invoice', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales'),
(24, 'Rss', 0, -1, 'Rss', NULL, NULL, 0, 1, 0, 0, NULL, 'Tools'),
(25, 'Reports', 0, 12, 'Reports', NULL, NULL, 0, 1, 0, 0, NULL, 'Analytics'),
(26, 'Campaigns', 1, -1, 'Campaigns', NULL, NULL, 0, 0, 1, 0, NULL, 'Marketing'),
(27, 'Portal', 0, -1, 'Portal', NULL, NULL, 0, 1, 0, 0, NULL, 'Tools'),
(28, 'Webmails', 0, -1, 'Webmails', NULL, NULL, 0, 1, 1, 0, NULL, NULL),
(29, 'Users', 0, -1, 'Users', NULL, NULL, 0, 1, 0, 0, NULL, NULL),
(30, 'Import', 0, -1, 'Import', NULL, NULL, 1, 0, 0, 0, '1.7', ''),
(31, 'MailManager', 0, -1, 'MailManager', NULL, NULL, 1, 0, 0, 0, '1.9', 'Tools'),
(32, 'Mobile', 0, -1, 'Mobile', NULL, NULL, 1, 0, 0, 0, '2.0', ''),
(33, 'ModTracker', 0, -1, 'ModTracker', NULL, NULL, 0, 0, 0, 0, '1.2', ''),
(34, 'ServiceContracts', 0, 11, 'Service Contracts', NULL, NULL, 0, 0, 1, 0, '2.4', 'Support'),
(35, 'Services', 0, -1, 'Services', NULL, NULL, 0, 0, 1, 0, '2.6', 'Inventory'),
(36, 'WSAPP', 0, -1, 'WSAPP', NULL, NULL, 1, 0, 0, 0, '3.4.4', ''),
(37, 'Assets', 0, -1, 'Assets', NULL, NULL, 0, 0, 1, 0, '2.0', 'Inventory'),
(38, 'CustomerPortal', 0, -1, 'CustomerPortal', NULL, NULL, 0, 0, 0, 0, '1.4', ''),
(39, 'EmailTemplates', 0, -1, 'Email Templates', NULL, NULL, 1, 0, 0, 0, '1.0', 'Tools'),
(40, 'Google', 1, -1, 'Google', NULL, NULL, 0, 0, 0, 0, '1.5', ''),
(41, 'ModComments', 0, -1, 'Comments', NULL, NULL, 0, 0, 1, 0, '2.1', 'Tools'),
(42, 'ProjectMilestone', 0, -1, 'ProjectMilestone', NULL, NULL, 0, 0, 1, 0, '3.0', 'Support'),
(43, 'ProjectTask', 0, -1, 'ProjectTask', NULL, NULL, 0, 0, 1, 0, '3.1', 'Support'),
(44, 'Project', 0, 10, 'Project', NULL, NULL, 0, 0, 1, 0, '3.3', 'Support'),
(45, 'RecycleBin', 0, -1, 'Recycle Bin', NULL, NULL, 0, 0, 0, 0, '1.5', 'Tools'),
(46, 'SMSNotifier', 0, -1, 'SMSNotifier', NULL, NULL, 0, 0, 1, 0, '1.9', 'Tools'),
(47, 'Webforms', 0, -1, 'Webforms', NULL, NULL, 0, 0, 0, 0, '1.5', ''),
(48, 'HelloWorld', 0, -1, 'Hello World', NULL, NULL, 1, 0, 0, 0, '1.0', '');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tab_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_tab_info` (
  `tabid` int(19) DEFAULT NULL,
  `prefname` varchar(256) DEFAULT NULL,
  `prefvalue` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_tab_info`
--

INSERT INTO `vtiger_tab_info` (`tabid`, `prefname`, `prefvalue`) VALUES
(30, 'vtiger_min_version', '6.0.0rc'),
(30, 'vtiger_max_version', '6.*'),
(31, 'vtiger_min_version', '6.0.0RC'),
(32, 'vtiger_min_version', '6.0.0rc'),
(33, 'vtiger_min_version', '6.0.0rc'),
(34, 'vtiger_min_version', '6.0.0rc'),
(35, 'vtiger_min_version', '6.0.0rc'),
(35, 'vtiger_max_version', '6.*'),
(36, 'vtiger_min_version', '6.0.0rc'),
(37, 'vtiger_min_version', '6.0.0rc'),
(37, 'vtiger_max_version', '6.*'),
(38, 'vtiger_min_version', '6.0.0rc'),
(38, 'vtiger_max_version', '6.*'),
(39, 'vtiger_min_version', '6.0.0rc'),
(39, 'vtiger_max_version', '6.*'),
(40, 'vtiger_min_version', '6.0.0rc'),
(40, 'vtiger_max_version', '6.*'),
(41, 'vtiger_min_version', '6.0.0rc'),
(41, 'vtiger_max_version', '6.*'),
(42, 'vtiger_min_version', '6.0.0rc'),
(42, 'vtiger_max_version', '6.*'),
(43, 'vtiger_min_version', '6.0.0rc'),
(44, 'vtiger_min_version', '6.0.0rc'),
(45, 'vtiger_min_version', '6.0.0rc'),
(45, 'vtiger_max_version', '6.*'),
(46, 'vtiger_min_version', '6.0.0rc'),
(46, 'vtiger_max_version', '6.*'),
(47, 'vtiger_min_version', '6.0.0rc'),
(47, 'vtiger_max_version', '6.*'),
(48, 'vtiger_min_version', '6.0.0'),
(48, 'vtiger_max_version', '6.*');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_taskpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskpriority` (
`taskpriorityid` int(19) NOT NULL,
  `taskpriority` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_taskpriority`
--

INSERT INTO `vtiger_taskpriority` (`taskpriorityid`, `taskpriority`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'High', 1, 170, 0),
(2, 'Medium', 1, 171, 1),
(3, 'Low', 1, 172, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_taskpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_taskpriority_seq`
--

INSERT INTO `vtiger_taskpriority_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_taskstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskstatus` (
`taskstatusid` int(19) NOT NULL,
  `taskstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_taskstatus`
--

INSERT INTO `vtiger_taskstatus` (`taskstatusid`, `taskstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Not Started', 0, 173, 0),
(2, 'In Progress', 0, 174, 1),
(3, 'Completed', 0, 175, 2),
(4, 'Pending Input', 0, 176, 3),
(5, 'Deferred', 0, 177, 4),
(6, 'Planned', 0, 178, 5);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_taskstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_taskstatus_seq`
--

INSERT INTO `vtiger_taskstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_taxclass`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxclass` (
`taxclassid` int(19) NOT NULL,
  `taxclass` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_taxclass`
--

INSERT INTO `vtiger_taxclass` (`taxclassid`, `taxclass`, `sortorderid`, `presence`) VALUES
(1, 'SalesTax', 0, 1),
(2, 'Vat', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_taxclass_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxclass_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_taxclass_seq`
--

INSERT INTO `vtiger_taxclass_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketcategories`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcategories` (
`ticketcategories_id` int(19) NOT NULL,
  `ticketcategories` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketcategories`
--

INSERT INTO `vtiger_ticketcategories` (`ticketcategories_id`, `ticketcategories`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Big Problem', 1, 179, 0),
(2, 'Small Problem', 1, 180, 1),
(3, 'Other Problem', 1, 181, 2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketcategories_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketcategories_seq`
--

INSERT INTO `vtiger_ticketcategories_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcf` (
  `ticketid` int(19) NOT NULL DEFAULT '0',
  `from_portal` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketcf`
--

INSERT INTO `vtiger_ticketcf` (`ticketid`, `from_portal`) VALUES
(4, '0'),
(32, '0'),
(34, '0');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcomments` (
`commentid` int(19) NOT NULL,
  `ticketid` int(19) DEFAULT NULL,
  `comments` text,
  `ownerid` int(19) NOT NULL DEFAULT '0',
  `ownertype` varchar(10) DEFAULT NULL,
  `createdtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketpriorities`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketpriorities` (
`ticketpriorities_id` int(19) NOT NULL,
  `ticketpriorities` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketpriorities`
--

INSERT INTO `vtiger_ticketpriorities` (`ticketpriorities_id`, `ticketpriorities`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Low', 1, 182, 0),
(2, 'Normal', 1, 183, 1),
(3, 'High', 1, 184, 2),
(4, 'Urgent', 1, 185, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketpriorities_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketpriorities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketpriorities_seq`
--

INSERT INTO `vtiger_ticketpriorities_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketseverities`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketseverities` (
`ticketseverities_id` int(19) NOT NULL,
  `ticketseverities` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketseverities`
--

INSERT INTO `vtiger_ticketseverities` (`ticketseverities_id`, `ticketseverities`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Minor', 1, 186, 0),
(2, 'Major', 1, 187, 1),
(3, 'Feature', 1, 188, 2),
(4, 'Critical', 1, 189, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketseverities_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketseverities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketseverities_seq`
--

INSERT INTO `vtiger_ticketseverities_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstatus` (
`ticketstatus_id` int(19) NOT NULL,
  `ticketstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT '0',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketstatus`
--

INSERT INTO `vtiger_ticketstatus` (`ticketstatus_id`, `ticketstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Open', 0, 190, 0),
(2, 'In Progress', 0, 191, 1),
(3, 'Wait For Response', 0, 192, 2),
(4, 'Closed', 0, 193, 3);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ticketstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ticketstatus_seq`
--

INSERT INTO `vtiger_ticketstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_time_zone`
--

CREATE TABLE IF NOT EXISTS `vtiger_time_zone` (
`time_zoneid` int(19) NOT NULL,
  `time_zone` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_time_zone`
--

INSERT INTO `vtiger_time_zone` (`time_zoneid`, `time_zone`, `sortorderid`, `presence`) VALUES
(1, 'Pacific/Midway', 0, 1),
(2, 'Pacific/Samoa', 1, 1),
(3, 'Pacific/Honolulu', 2, 1),
(4, 'America/Anchorage', 3, 1),
(5, 'America/Los_Angeles', 4, 1),
(6, 'America/Tijuana', 5, 1),
(7, 'America/Denver', 6, 1),
(8, 'America/Chihuahua', 7, 1),
(9, 'America/Mazatlan', 8, 1),
(10, 'America/Phoenix', 9, 1),
(11, 'America/Regina', 10, 1),
(12, 'America/Tegucigalpa', 11, 1),
(13, 'America/Chicago', 12, 1),
(14, 'America/Mexico_City', 13, 1),
(15, 'America/Monterrey', 14, 1),
(16, 'America/New_York', 15, 1),
(17, 'America/Bogota', 16, 1),
(18, 'America/Lima', 17, 1),
(19, 'America/Rio_Branco', 18, 1),
(20, 'America/Indiana/Indianapolis', 19, 1),
(21, 'America/Caracas', 20, 1),
(22, 'America/Halifax', 21, 1),
(23, 'America/Manaus', 22, 1),
(24, 'America/Santiago', 23, 1),
(25, 'America/La_Paz', 24, 1),
(26, 'America/Cuiaba', 25, 1),
(27, 'America/Asuncion', 26, 1),
(28, 'America/St_Johns', 27, 1),
(29, 'America/Argentina/Buenos_Aires', 28, 1),
(30, 'America/Sao_Paulo', 29, 1),
(31, 'America/Godthab', 30, 1),
(32, 'America/Montevideo', 31, 1),
(33, 'Atlantic/South_Georgia', 32, 1),
(34, 'Atlantic/Azores', 33, 1),
(35, 'Atlantic/Cape_Verde', 34, 1),
(36, 'Europe/London', 35, 1),
(37, 'UTC', 36, 1),
(38, 'Africa/Monrovia', 37, 1),
(39, 'Africa/Casablanca', 38, 1),
(40, 'Europe/Belgrade', 39, 1),
(41, 'Europe/Sarajevo', 40, 1),
(42, 'Europe/Brussels', 41, 1),
(43, 'Africa/Algiers', 42, 1),
(44, 'Europe/Amsterdam', 43, 1),
(45, 'Europe/Minsk', 44, 1),
(46, 'Africa/Cairo', 45, 1),
(47, 'Europe/Helsinki', 46, 1),
(48, 'Europe/Athens', 47, 1),
(49, 'Europe/Istanbul', 48, 1),
(50, 'Asia/Jerusalem', 49, 1),
(51, 'Asia/Amman', 50, 1),
(52, 'Asia/Beirut', 51, 1),
(53, 'Africa/Windhoek', 52, 1),
(54, 'Africa/Harare', 53, 1),
(55, 'Asia/Kuwait', 54, 1),
(56, 'Asia/Baghdad', 55, 1),
(57, 'Africa/Nairobi', 56, 1),
(58, 'Asia/Tehran', 57, 1),
(59, 'Asia/Tbilisi', 58, 1),
(60, 'Europe/Moscow', 59, 1),
(61, 'Asia/Muscat', 60, 1),
(62, 'Asia/Baku', 61, 1),
(63, 'Asia/Yerevan', 62, 1),
(64, 'Asia/Karachi', 63, 1),
(65, 'Asia/Tashkent', 64, 1),
(66, 'Asia/Kolkata', 65, 1),
(67, 'Asia/Colombo', 66, 1),
(68, 'Asia/Katmandu', 67, 1),
(69, 'Asia/Dhaka', 68, 1),
(70, 'Asia/Almaty', 69, 1),
(71, 'Asia/Yekaterinburg', 70, 1),
(72, 'Asia/Rangoon', 71, 1),
(73, 'Asia/Novosibirsk', 72, 1),
(74, 'Asia/Bangkok', 73, 1),
(75, 'Asia/Brunei', 74, 1),
(76, 'Asia/Krasnoyarsk', 75, 1),
(77, 'Asia/Ulaanbaatar', 76, 1),
(78, 'Asia/Kuala_Lumpur', 77, 1),
(79, 'Asia/Taipei', 78, 1),
(80, 'Australia/Perth', 79, 1),
(81, 'Asia/Irkutsk', 80, 1),
(82, 'Asia/Seoul', 81, 1),
(83, 'Asia/Tokyo', 82, 1),
(84, 'Australia/Darwin', 83, 1),
(85, 'Australia/Adelaide', 84, 1),
(86, 'Australia/Canberra', 85, 1),
(87, 'Australia/Brisbane', 86, 1),
(88, 'Australia/Hobart', 87, 1),
(89, 'Asia/Vladivostok', 88, 1),
(90, 'Pacific/Guam', 89, 1),
(91, 'Asia/Yakutsk', 90, 1),
(92, 'Pacific/Fiji', 91, 1),
(93, 'Asia/Kamchatka', 92, 1),
(94, 'Pacific/Auckland', 93, 1),
(95, 'Asia/Magadan', 94, 1),
(96, 'Pacific/Tongatapu', 95, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_time_zone_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_time_zone_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_time_zone_seq`
--

INSERT INTO `vtiger_time_zone_seq` (`id`) VALUES
(96);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_read_group_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_read_group_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_tmp_read_group_sharing_per`
--

INSERT INTO `vtiger_tmp_read_group_sharing_per` (`userid`, `tabid`, `sharedgroupid`) VALUES
(7, 8, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_read_user_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_read_user_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_tmp_read_user_sharing_per`
--

INSERT INTO `vtiger_tmp_read_user_sharing_per` (`userid`, `tabid`, `shareduserid`) VALUES
(7, 8, 7);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_write_group_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_write_group_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_write_user_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tmp_write_user_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tracker`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracker` (
`id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(25) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tracking_unit`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracking_unit` (
`tracking_unitid` int(11) NOT NULL,
  `tracking_unit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(11) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_tracking_unit`
--

INSERT INTO `vtiger_tracking_unit` (`tracking_unitid`, `tracking_unit`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(2, 'Hours', 1, 211, 2),
(3, 'Days', 1, 212, 3),
(4, 'Incidents', 1, 213, 4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_tracking_unit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracking_unit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_tracking_unit_seq`
--

INSERT INTO `vtiger_tracking_unit_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_troubletickets`
--

CREATE TABLE IF NOT EXISTS `vtiger_troubletickets` (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `severity` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `solution` text,
  `update_log` text,
  `version_id` int(11) DEFAULT NULL,
  `hours` decimal(25,8) DEFAULT NULL,
  `days` decimal(25,8) DEFAULT NULL,
  `contact_id` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_troubletickets`
--

INSERT INTO `vtiger_troubletickets` (`ticketid`, `ticket_no`, `groupname`, `parent_id`, `product_id`, `priority`, `severity`, `status`, `category`, `title`, `solution`, `update_log`, `version_id`, `hours`, `days`, `contact_id`) VALUES
(4, 'TT1', NULL, '0', '0', 'Normal', 'Major', 'Open', 'Small Problem', 'testi09', '', '', NULL, 0.00000000, 0.00000000, 0),
(32, 'TT2', NULL, '0', '0', '', '', 'Open', '', 'asdf', '', '', NULL, 0.00000000, 0.00000000, 0),
(34, 'TT3', NULL, '0', '28', '', '', 'Open', '', 'asdf', '', '', NULL, 0.00000000, 0.00000000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_usageunit`
--

CREATE TABLE IF NOT EXISTS `vtiger_usageunit` (
`usageunitid` int(19) NOT NULL,
  `usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT '1',
  `picklist_valueid` int(19) NOT NULL DEFAULT '0',
  `sortorderid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_usageunit`
--

INSERT INTO `vtiger_usageunit` (`usageunitid`, `usageunit`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Box', 1, 194, 0),
(2, 'Carton', 1, 195, 1),
(3, 'Dozen', 1, 196, 2),
(4, 'Each', 1, 197, 3),
(5, 'Hours', 1, 198, 4),
(6, 'Impressions', 1, 199, 5),
(7, 'Lb', 1, 200, 6),
(8, 'M', 1, 201, 7),
(9, 'Pack', 1, 202, 8),
(10, 'Pages', 1, 203, 9),
(11, 'Pieces', 1, 204, 10),
(12, 'Quantity', 1, 205, 11),
(13, 'Reams', 1, 206, 12),
(14, 'Sheet', 1, 207, 13),
(15, 'Spiral Binder', 1, 208, 14),
(16, 'Sq Ft', 1, 209, 15);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_usageunit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_usageunit_seq`
--

INSERT INTO `vtiger_usageunit_seq` (`id`) VALUES
(16);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_user2mergefields`
--

CREATE TABLE IF NOT EXISTS `vtiger_user2mergefields` (
  `userid` int(11) DEFAULT NULL,
  `tabid` int(19) DEFAULT NULL,
  `fieldid` int(19) DEFAULT NULL,
  `visible` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_user2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_user2role` (
  `userid` int(11) NOT NULL,
  `roleid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_user2role`
--

INSERT INTO `vtiger_user2role` (`userid`, `roleid`) VALUES
(1, 'H2'),
(5, 'H2'),
(6, 'H2'),
(7, 'H2');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_user_module_preferences`
--

CREATE TABLE IF NOT EXISTS `vtiger_user_module_preferences` (
  `userid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `default_cvid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_users`
--

CREATE TABLE IF NOT EXISTS `vtiger_users` (
`id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_hash` varchar(32) DEFAULT NULL,
  `cal_color` varchar(25) DEFAULT '#E6FAD8',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `reports_to_id` varchar(36) DEFAULT NULL,
  `is_admin` varchar(3) DEFAULT '0',
  `currency_id` int(19) NOT NULL DEFAULT '1',
  `description` text,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `signature` text,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(25) DEFAULT NULL,
  `address_postalcode` varchar(9) DEFAULT NULL,
  `user_preferences` text,
  `tz` varchar(30) DEFAULT NULL,
  `holidays` varchar(60) DEFAULT NULL,
  `namedays` varchar(60) DEFAULT NULL,
  `workdays` varchar(30) DEFAULT NULL,
  `weekstart` int(11) DEFAULT NULL,
  `date_format` varchar(200) DEFAULT NULL,
  `hour_format` varchar(30) DEFAULT 'am/pm',
  `start_hour` varchar(30) DEFAULT '10:00',
  `end_hour` varchar(30) DEFAULT '23:00',
  `activity_view` varchar(200) DEFAULT 'Today',
  `lead_view` varchar(200) DEFAULT 'Today',
  `imagename` varchar(250) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `confirm_password` varchar(300) DEFAULT NULL,
  `internal_mailer` varchar(3) NOT NULL DEFAULT '1',
  `reminder_interval` varchar(100) DEFAULT NULL,
  `reminder_next_time` varchar(100) DEFAULT NULL,
  `crypt_type` varchar(20) NOT NULL DEFAULT 'MD5',
  `accesskey` varchar(36) DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `language` varchar(36) DEFAULT NULL,
  `time_zone` varchar(200) DEFAULT NULL,
  `currency_grouping_pattern` varchar(100) DEFAULT NULL,
  `currency_decimal_separator` varchar(2) DEFAULT NULL,
  `currency_grouping_separator` varchar(2) DEFAULT NULL,
  `currency_symbol_placement` varchar(20) DEFAULT NULL,
  `no_of_currency_decimals` varchar(2) DEFAULT NULL,
  `truncate_trailing_zeros` varchar(3) DEFAULT NULL,
  `dayoftheweek` varchar(100) DEFAULT NULL,
  `callduration` varchar(100) DEFAULT NULL,
  `othereventduration` varchar(100) DEFAULT NULL,
  `calendarsharedtype` varchar(100) DEFAULT NULL,
  `default_record_view` varchar(10) DEFAULT NULL,
  `leftpanelhide` varchar(3) DEFAULT NULL,
  `rowheight` varchar(10) DEFAULT NULL,
  `defaulteventstatus` varchar(50) DEFAULT NULL,
  `defaultactivitytype` varchar(50) DEFAULT NULL,
  `hidecompletedevents` int(11) DEFAULT NULL,
  `is_owner` varchar(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_users`
--

INSERT INTO `vtiger_users` (`id`, `user_name`, `user_password`, `user_hash`, `cal_color`, `first_name`, `last_name`, `reports_to_id`, `is_admin`, `currency_id`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `email1`, `email2`, `secondaryemail`, `status`, `signature`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `user_preferences`, `tz`, `holidays`, `namedays`, `workdays`, `weekstart`, `date_format`, `hour_format`, `start_hour`, `end_hour`, `activity_view`, `lead_view`, `imagename`, `deleted`, `confirm_password`, `internal_mailer`, `reminder_interval`, `reminder_next_time`, `crypt_type`, `accesskey`, `theme`, `language`, `time_zone`, `currency_grouping_pattern`, `currency_decimal_separator`, `currency_grouping_separator`, `currency_symbol_placement`, `no_of_currency_decimals`, `truncate_trailing_zeros`, `dayoftheweek`, `callduration`, `othereventduration`, `calendarsharedtype`, `default_record_view`, `leftpanelhide`, `rowheight`, `defaulteventstatus`, `defaultactivitytype`, `hidecompletedevents`, `is_owner`) VALUES
(1, 'admin', '$1$ad000000$hzXFXvL3XVlnUE/X.1n9t/', 'd41d8cd98f00b204e9800998ecf8427e', '#E6FAD8', '', 'admin', '', 'on', 1, '', '2015-01-31 14:55:32', '0000-00-00 00:00:00', NULL, '', '', '', '', '', '', '', 'cyj91516@aliyun.com', '', '', 'Active', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'yyyy-mm-dd', '24', '08:00', '23:00', 'This Week', 'Today', '', 0, '$1$ad000000$nYTnfhTZRmUP.wQT9y1AE.', '1', '1 Minute', NULL, 'PHP5.3MD5', 'cA1KCYZBnS77Gr5V', 'alphagrey', 'en_us', 'Asia/Brunei', '123,456,789', '.', ',', '$1.0', '2', '1', 'Monday', '5', '5', 'public', 'Summary', '0', 'medium', NULL, '请选择', 0, '1'),
(7, 'test', '$1$te000000$NxMCb7p8Ey2zEPIQohrFO/', '098f6bcd4621d373cade4e832627b4f6', '#E6FAD8', '', 'test', '', 'off', 1, '', '2015-01-07 15:57:48', '0000-00-00 00:00:00', NULL, '', '', '', '', '', '', '', 'abc@d.e', '', '', 'Active', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'yyyy-mm-dd', '12', '00:00', '', 'Today', 'Today', '', 0, '$1$te000000$NxMCb7p8Ey2zEPIQohrFO/', '0', '', NULL, 'PHP5.3MD5', 'WizelY6YeyHAIO2F', 'softed', 'zh_cn', 'Asia/Brunei', '123,456,789', '.', ',', '$1.0', '2', '0', 'Monday', '5', '5', 'public', 'Summary', '1', 'medium', '请选择', '请选择', 0, '0');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_users2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_users2group` (
  `groupid` int(19) NOT NULL,
  `userid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_users_last_import`
--

CREATE TABLE IF NOT EXISTS `vtiger_users_last_import` (
`id` int(36) NOT NULL,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_users_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_users_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_users_seq`
--

INSERT INTO `vtiger_users_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_vendor`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendor` (
  `vendorid` int(19) NOT NULL DEFAULT '0',
  `vendor_no` varchar(100) NOT NULL,
  `vendorname` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `glacct` varchar(200) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `street` text,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pobox` varchar(30) DEFAULT NULL,
  `postalcode` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_vendor`
--

INSERT INTO `vtiger_vendor` (`vendorid`, `vendor_no`, `vendorname`, `phone`, `email`, `website`, `glacct`, `category`, `street`, `city`, `state`, `pobox`, `postalcode`, `country`, `description`) VALUES
(10, 'VEN1', '供应商1', '', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_vendorcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendorcf` (
  `vendorid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_vendorcf`
--

INSERT INTO `vtiger_vendorcf` (`vendorid`) VALUES
(10);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_vendorcontactrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendorcontactrel` (
  `vendorid` int(19) NOT NULL DEFAULT '0',
  `contactid` int(19) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_vendorcontactrel`
--

INSERT INTO `vtiger_vendorcontactrel` (`vendorid`, `contactid`) VALUES
(10, 11);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_version`
--

CREATE TABLE IF NOT EXISTS `vtiger_version` (
`id` int(11) NOT NULL,
  `old_version` varchar(30) DEFAULT NULL,
  `current_version` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_version`
--

INSERT INTO `vtiger_version` (`id`, `old_version`, `current_version`) VALUES
(1, '6.1.0', '6.1.0');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_version_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_version_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_version_seq`
--

INSERT INTO `vtiger_version_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_visibility`
--

CREATE TABLE IF NOT EXISTS `vtiger_visibility` (
`visibilityid` int(19) NOT NULL,
  `visibility` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT '0',
  `presence` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_visibility`
--

INSERT INTO `vtiger_visibility` (`visibilityid`, `visibility`, `sortorderid`, `presence`) VALUES
(1, 'Private', 0, 1),
(2, 'Public', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_visibility_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_visibility_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_visibility_seq`
--

INSERT INTO `vtiger_visibility_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_webforms`
--

CREATE TABLE IF NOT EXISTS `vtiger_webforms` (
`id` int(19) NOT NULL,
  `name` varchar(100) NOT NULL,
  `publicid` varchar(100) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `targetmodule` varchar(50) NOT NULL,
  `description` text,
  `ownerid` int(19) NOT NULL,
  `returnurl` varchar(250) DEFAULT NULL,
  `captcha` int(1) NOT NULL DEFAULT '0',
  `roundrobin` int(1) NOT NULL DEFAULT '0',
  `roundrobin_userid` varchar(256) DEFAULT NULL,
  `roundrobin_logic` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_webforms`
--

INSERT INTO `vtiger_webforms` (`id`, `name`, `publicid`, `enabled`, `targetmodule`, `description`, `ownerid`, `returnurl`, `captcha`, `roundrobin`, `roundrobin_userid`, `roundrobin_logic`) VALUES
(1, 'test', '81057e2f5880c39e6c8003f5f06e7e9f', 1, 'Accounts', '', 1, '', 0, 1, '{"0":"1"}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_webforms_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_webforms_field` (
`id` int(19) NOT NULL,
  `webformid` int(19) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `neutralizedfield` varchar(50) NOT NULL,
  `defaultvalue` varchar(200) DEFAULT NULL,
  `required` int(10) NOT NULL DEFAULT '0',
  `sequence` int(10) DEFAULT NULL,
  `hidden` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_webforms_field`
--

INSERT INTO `vtiger_webforms_field` (`id`, `webformid`, `fieldname`, `neutralizedfield`, `defaultvalue`, `required`, `sequence`, `hidden`) VALUES
(1, 1, 'accountname', 'accountname', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_wordtemplates`
--

CREATE TABLE IF NOT EXISTS `vtiger_wordtemplates` (
  `templateid` int(19) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `module` varchar(30) NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_type` varchar(50) NOT NULL,
  `data` longblob,
  `description` text,
  `filesize` varchar(50) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity` (
`id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_class` varchar(64) NOT NULL,
  `ismodule` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity`
--

INSERT INTO `vtiger_ws_entity` (`id`, `name`, `handler_path`, `handler_class`, `ismodule`) VALUES
(1, 'Campaigns', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(2, 'Vendors', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(3, 'Faq', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(4, 'Quotes', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(5, 'PurchaseOrder', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(6, 'SalesOrder', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(7, 'Invoice', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(8, 'PriceBooks', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(9, 'Calendar', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(10, 'Leads', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(11, 'Accounts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(12, 'Contacts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(13, 'Potentials', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(14, 'Products', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(15, 'Documents', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(16, 'Emails', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(17, 'HelpDesk', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(18, 'Events', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(19, 'Users', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(20, 'Groups', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(21, 'Currency', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(22, 'DocumentFolders', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(23, 'CompanyDetails', 'include/Webservices/VtigerCompanyDetails.php', 'VtigerCompanyDetails', 0),
(24, 'ServiceContracts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(25, 'Services', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(26, 'Assets', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(27, 'ModComments', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(28, 'ProjectMilestone', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(29, 'ProjectTask', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(30, 'Project', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(31, 'SMSNotifier', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(32, 'LineItem', 'include/Webservices/LineItem/VtigerLineItemOperation.php', 'VtigerLineItemOperation', 0),
(33, 'Tax', 'include/Webservices/LineItem/VtigerTaxOperation.php', 'VtigerTaxOperation', 0),
(34, 'ProductTaxes', 'include/Webservices/LineItem/VtigerProductTaxesOperation.php', 'VtigerProductTaxesOperation', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity_fieldtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_fieldtype` (
`fieldtypeid` int(19) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `fieldtype` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity_fieldtype`
--

INSERT INTO `vtiger_ws_entity_fieldtype` (`fieldtypeid`, `table_name`, `field_name`, `fieldtype`) VALUES
(1, 'vtiger_attachmentsfolder', 'createdby', 'reference'),
(2, 'vtiger_organizationdetails', 'logoname', 'file'),
(3, 'vtiger_organizationdetails', 'phone', 'phone'),
(4, 'vtiger_organizationdetails', 'fax', 'phone'),
(5, 'vtiger_organizationdetails', 'website', 'url'),
(6, 'vtiger_inventoryproductrel', 'productid', 'reference'),
(7, 'vtiger_inventoryproductrel', 'id', 'reference'),
(8, 'vtiger_inventoryproductrel', 'incrementondel', 'autogenerated'),
(9, 'vtiger_producttaxrel', 'productid', 'reference'),
(10, 'vtiger_producttaxrel', 'taxid', 'reference');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity_fieldtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_fieldtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity_fieldtype_seq`
--

INSERT INTO `vtiger_ws_entity_fieldtype_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity_name`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_name` (
  `entity_id` int(11) NOT NULL,
  `name_fields` varchar(50) NOT NULL,
  `index_field` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity_name`
--

INSERT INTO `vtiger_ws_entity_name` (`entity_id`, `name_fields`, `index_field`, `table_name`) VALUES
(20, 'groupname', 'groupid', 'vtiger_groups'),
(21, 'currency_name', 'id', 'vtiger_currency_info'),
(22, 'foldername', 'folderid', 'vtiger_attachmentsfolder'),
(23, 'organizationname', 'groupid', 'vtiger_organizationdetails'),
(33, 'taxlabel', 'taxid', 'vtiger_inventorytaxinfo');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity_referencetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity_referencetype`
--

INSERT INTO `vtiger_ws_entity_referencetype` (`fieldtypeid`, `type`) VALUES
(5, 'Users'),
(6, 'Products'),
(7, 'Invoice'),
(7, 'PurchaseOrder'),
(7, 'Quotes'),
(7, 'SalesOrder'),
(9, 'Products'),
(10, 'Tax');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity_seq`
--

INSERT INTO `vtiger_ws_entity_seq` (`id`) VALUES
(34);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_entity_tables`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_tables` (
  `webservice_entity_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_entity_tables`
--

INSERT INTO `vtiger_ws_entity_tables` (`webservice_entity_id`, `table_name`) VALUES
(20, 'vtiger_groups'),
(21, 'vtiger_currency_info'),
(22, 'vtiger_attachmentsfolder'),
(23, 'vtiger_organizationdetails'),
(32, 'vtiger_inventoryproductrel'),
(33, 'vtiger_inventorytaxinfo'),
(34, 'vtiger_producttaxrel');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_fieldinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_fieldinfo` (
  `id` varchar(64) NOT NULL,
  `property_name` varchar(32) DEFAULT NULL,
  `property_value` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_fieldinfo`
--

INSERT INTO `vtiger_ws_fieldinfo` (`id`, `property_name`, `property_value`) VALUES
('vtiger_organizationdetails.organization_id', 'upload.path', '1');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_fieldtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_fieldtype` (
`fieldtypeid` int(19) NOT NULL,
  `uitype` varchar(30) NOT NULL,
  `fieldtype` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_fieldtype`
--

INSERT INTO `vtiger_ws_fieldtype` (`fieldtypeid`, `uitype`, `fieldtype`) VALUES
(1, '15', 'picklist'),
(2, '16', 'picklist'),
(3, '19', 'text'),
(4, '20', 'text'),
(5, '21', 'text'),
(6, '24', 'text'),
(7, '3', 'autogenerated'),
(8, '11', 'phone'),
(9, '33', 'multipicklist'),
(10, '17', 'url'),
(11, '85', 'skype'),
(12, '56', 'boolean'),
(13, '156', 'boolean'),
(14, '53', 'owner'),
(15, '61', 'file'),
(16, '28', 'file'),
(17, '13', 'email'),
(18, '71', 'currency'),
(19, '72', 'currency'),
(20, '50', 'reference'),
(21, '51', 'reference'),
(22, '57', 'reference'),
(23, '58', 'reference'),
(24, '73', 'reference'),
(25, '75', 'reference'),
(26, '76', 'reference'),
(27, '78', 'reference'),
(28, '80', 'reference'),
(29, '81', 'reference'),
(30, '101', 'reference'),
(31, '52', 'reference'),
(32, '357', 'reference'),
(33, '59', 'reference'),
(34, '66', 'reference'),
(35, '77', 'reference'),
(36, '68', 'reference'),
(37, '117', 'reference'),
(38, '26', 'reference'),
(39, '10', 'reference');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_operation`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation` (
`operationid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_method` varchar(64) NOT NULL,
  `type` varchar(8) NOT NULL,
  `prelogin` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_operation`
--

INSERT INTO `vtiger_ws_operation` (`operationid`, `name`, `handler_path`, `handler_method`, `type`, `prelogin`) VALUES
(1, 'login', 'include/Webservices/Login.php', 'vtws_login', 'POST', 1),
(2, 'retrieve', 'include/Webservices/Retrieve.php', 'vtws_retrieve', 'GET', 0),
(3, 'create', 'include/Webservices/Create.php', 'vtws_create', 'POST', 0),
(4, 'update', 'include/Webservices/Update.php', 'vtws_update', 'POST', 0),
(5, 'delete', 'include/Webservices/Delete.php', 'vtws_delete', 'POST', 0),
(6, 'sync', 'include/Webservices/GetUpdates.php', 'vtws_sync', 'GET', 0),
(7, 'query', 'include/Webservices/Query.php', 'vtws_query', 'GET', 0),
(8, 'logout', 'include/Webservices/Logout.php', 'vtws_logout', 'POST', 0),
(9, 'listtypes', 'include/Webservices/ModuleTypes.php', 'vtws_listtypes', 'GET', 0),
(10, 'getchallenge', 'include/Webservices/AuthToken.php', 'vtws_getchallenge', 'GET', 1),
(11, 'describe', 'include/Webservices/DescribeObject.php', 'vtws_describe', 'GET', 0),
(12, 'extendsession', 'include/Webservices/ExtendSession.php', 'vtws_extendSession', 'POST', 1),
(13, 'convertlead', 'include/Webservices/ConvertLead.php', 'vtws_convertlead', 'POST', 0),
(14, 'revise', 'include/Webservices/Revise.php', 'vtws_revise', 'POST', 0),
(15, 'changePassword', 'include/Webservices/ChangePassword.php', 'vtws_changePassword', 'POST', 0),
(16, 'deleteUser', 'include/Webservices/DeleteUser.php', 'vtws_deleteUser', 'POST', 0),
(17, 'mobile.fetchallalerts', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchAllAlerts', 'POST', 0),
(18, 'mobile.alertdetailswithmessage', 'modules/Mobile/api/wsapi.php', 'mobile_ws_alertDetailsWithMessage', 'POST', 0),
(19, 'mobile.fetchmodulefilters', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchModuleFilters', 'POST', 0),
(20, 'mobile.fetchrecord', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchRecord', 'POST', 0),
(21, 'mobile.fetchrecordwithgrouping', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchRecordWithGrouping', 'POST', 0),
(22, 'mobile.filterdetailswithcount', 'modules/Mobile/api/wsapi.php', 'mobile_ws_filterDetailsWithCount', 'POST', 0),
(23, 'mobile.listmodulerecords', 'modules/Mobile/api/wsapi.php', 'mobile_ws_listModuleRecords', 'POST', 0),
(24, 'mobile.saverecord', 'modules/Mobile/api/wsapi.php', 'mobile_ws_saveRecord', 'POST', 0),
(25, 'mobile.syncModuleRecords', 'modules/Mobile/api/wsapi.php', 'mobile_ws_syncModuleRecords', 'POST', 0),
(26, 'mobile.query', 'modules/Mobile/api/wsapi.php', 'mobile_ws_query', 'POST', 0),
(27, 'mobile.querywithgrouping', 'modules/Mobile/api/wsapi.php', 'mobile_ws_queryWithGrouping', 'POST', 0),
(28, 'wsapp_register', 'modules/WSAPP/api/ws/Register.php', 'wsapp_register', 'POST', 0),
(29, 'wsapp_deregister', 'modules/WSAPP/api/ws/DeRegister.php', 'wsapp_deregister', 'POST', 0),
(30, 'wsapp_get', 'modules/WSAPP/api/ws/Get.php', 'wsapp_get', 'POST', 0),
(31, 'wsapp_put', 'modules/WSAPP/api/ws/Put.php', 'wsapp_put', 'POST', 0),
(32, 'wsapp_map', 'modules/WSAPP/api/ws/Map.php', 'wsapp_map', 'POST', 0),
(33, 'retrieve_inventory', 'include/Webservices/LineItem/RetrieveInventory.php', 'vtws_retrieve_inventory', 'GET', 0);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_operation_parameters`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation_parameters` (
`operationid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `sequence` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_operation_parameters`
--

INSERT INTO `vtiger_ws_operation_parameters` (`operationid`, `name`, `type`, `sequence`) VALUES
(1, 'accessKey', 'String', 2),
(1, 'username', 'String', 1),
(2, 'id', 'String', 1),
(3, 'element', 'encoded', 2),
(3, 'elementType', 'String', 1),
(4, 'element', 'encoded', 1),
(5, 'id', 'String', 1),
(6, 'elementType', 'String', 2),
(6, 'modifiedTime', 'DateTime', 1),
(7, 'query', 'String', 1),
(8, 'sessionName', 'String', 1),
(9, 'fieldTypeList', 'encoded', 1),
(10, 'username', 'String', 1),
(11, 'elementType', 'String', 1),
(13, 'accountName', 'String', 3),
(13, 'assignedTo', 'String', 2),
(13, 'avoidPotential', 'Boolean', 4),
(13, 'leadId', 'String', 1),
(13, 'potential', 'Encoded', 5),
(14, 'element', 'Encoded', 1),
(15, 'confirmPassword', 'String', 4),
(15, 'id', 'String', 1),
(15, 'newPassword', 'String', 3),
(15, 'oldPassword', 'String', 2),
(16, 'id', 'String', 1),
(16, 'newOwnerId', 'String', 2),
(18, 'alertid', 'string', 1),
(19, 'module', 'string', 1),
(20, 'record', 'string', 1),
(21, 'record', 'string', 1),
(22, 'filterid', 'string', 1),
(23, 'elements', 'encoded', 1),
(24, 'module', 'string', 1),
(24, 'record', 'string', 2),
(24, 'values', 'encoded', 3),
(25, 'module', 'string', 1),
(25, 'page', 'string', 3),
(25, 'syncToken', 'string', 2),
(26, 'module', 'string', 1),
(26, 'page', 'string', 3),
(26, 'query', 'string', 2),
(27, 'module', 'string', 1),
(27, 'page', 'string', 3),
(27, 'query', 'string', 2),
(28, 'synctype', 'string', 2),
(28, 'type', 'string', 1),
(29, 'key', 'string', 2),
(29, 'type', 'string', 1),
(30, 'key', 'string', 1),
(30, 'module', 'string', 2),
(30, 'token', 'string', 3),
(31, 'element', 'encoded', 2),
(31, 'key', 'string', 1),
(32, 'element', 'encoded', 2),
(32, 'key', 'string', 1),
(33, 'id', 'String', 1);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_operation_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_operation_seq`
--

INSERT INTO `vtiger_ws_operation_seq` (`id`) VALUES
(33);

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_referencetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_ws_referencetype`
--

INSERT INTO `vtiger_ws_referencetype` (`fieldtypeid`, `type`) VALUES
(20, 'Accounts'),
(21, 'Accounts'),
(22, 'Contacts'),
(23, 'Campaigns'),
(24, 'Accounts'),
(25, 'Vendors'),
(26, 'Potentials'),
(27, 'Quotes'),
(28, 'SalesOrder'),
(29, 'Vendors'),
(30, 'Users'),
(31, 'Campaigns'),
(31, 'Users'),
(32, 'Accounts'),
(32, 'Contacts'),
(32, 'Leads'),
(32, 'Users'),
(32, 'Vendors'),
(33, 'Products'),
(34, 'Accounts'),
(34, 'Campaigns'),
(34, 'HelpDesk'),
(34, 'Leads'),
(34, 'Potentials'),
(35, 'Users'),
(36, 'Accounts'),
(36, 'Contacts'),
(37, 'Currency'),
(38, 'DocumentFolders');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_ws_userauthtoken`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_userauthtoken` (
  `userid` int(19) NOT NULL,
  `token` varchar(36) NOT NULL,
  `expiretime` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_wsapp`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp` (
`appid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `appkey` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_wsapp`
--

INSERT INTO `vtiger_wsapp` (`appid`, `name`, `appkey`, `type`) VALUES
(1, 'vtigerCRM', '54a9e719b0654', 'user');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_wsapp_handlerdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_handlerdetails` (
  `type` varchar(200) NOT NULL,
  `handlerclass` varchar(100) DEFAULT NULL,
  `handlerpath` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vtiger_wsapp_handlerdetails`
--

INSERT INTO `vtiger_wsapp_handlerdetails` (`type`, `handlerclass`, `handlerpath`) VALUES
('Outlook', 'OutlookHandler', 'modules/WSAPP/Handlers/OutlookHandler.php'),
('vtigerCRM', 'vtigerCRMHandler', 'modules/WSAPP/Handlers/vtigerCRMHandler.php'),
('vtigerSyncLib', 'WSAPP_VtigerSyncEventHandler', 'modules/WSAPP/synclib/handlers/VtigerSyncEventHandler.php');

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_wsapp_queuerecords`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_queuerecords` (
  `syncserverid` int(19) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `appid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_wsapp_recordmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_recordmapping` (
`id` int(19) NOT NULL,
  `serverid` varchar(10) DEFAULT NULL,
  `clientid` varchar(255) DEFAULT NULL,
  `clientmodifiedtime` datetime DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  `servermodifiedtime` datetime DEFAULT NULL,
  `serverappid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vtiger_wsapp_sync_state`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_sync_state` (
`id` int(19) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `stateencodedvalues` varchar(300) NOT NULL,
  `userid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `com_vtiger_workflow_activatedonce`
--
ALTER TABLE `com_vtiger_workflow_activatedonce`
 ADD PRIMARY KEY (`workflow_id`,`entity_id`);

--
-- Indexes for table `com_vtiger_workflows`
--
ALTER TABLE `com_vtiger_workflows`
 ADD PRIMARY KEY (`workflow_id`), ADD UNIQUE KEY `com_vtiger_workflows_idx` (`workflow_id`);

--
-- Indexes for table `com_vtiger_workflowtasks`
--
ALTER TABLE `com_vtiger_workflowtasks`
 ADD PRIMARY KEY (`task_id`), ADD UNIQUE KEY `com_vtiger_workflowtasks_idx` (`task_id`);

--
-- Indexes for table `com_vtiger_workflowtasks_entitymethod`
--
ALTER TABLE `com_vtiger_workflowtasks_entitymethod`
 ADD PRIMARY KEY (`workflowtasks_entitymethod_id`), ADD UNIQUE KEY `com_vtiger_workflowtasks_entitymethod_idx` (`workflowtasks_entitymethod_id`);

--
-- Indexes for table `com_vtiger_workflowtemplates`
--
ALTER TABLE `com_vtiger_workflowtemplates`
 ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `vtiger_account`
--
ALTER TABLE `vtiger_account`
 ADD PRIMARY KEY (`accountid`), ADD KEY `account_account_type_idx` (`account_type`), ADD KEY `email_idx` (`email1`,`email2`);

--
-- Indexes for table `vtiger_accountbillads`
--
ALTER TABLE `vtiger_accountbillads`
 ADD PRIMARY KEY (`accountaddressid`);

--
-- Indexes for table `vtiger_accountrating`
--
ALTER TABLE `vtiger_accountrating`
 ADD PRIMARY KEY (`accountratingid`), ADD UNIQUE KEY `accountrating_rating_idx` (`rating`);

--
-- Indexes for table `vtiger_accountscf`
--
ALTER TABLE `vtiger_accountscf`
 ADD PRIMARY KEY (`accountid`);

--
-- Indexes for table `vtiger_accountshipads`
--
ALTER TABLE `vtiger_accountshipads`
 ADD PRIMARY KEY (`accountaddressid`);

--
-- Indexes for table `vtiger_accounttype`
--
ALTER TABLE `vtiger_accounttype`
 ADD PRIMARY KEY (`accounttypeid`), ADD UNIQUE KEY `accounttype_accounttype_idx` (`accounttype`);

--
-- Indexes for table `vtiger_actionmapping`
--
ALTER TABLE `vtiger_actionmapping`
 ADD PRIMARY KEY (`actionid`,`actionname`);

--
-- Indexes for table `vtiger_activity`
--
ALTER TABLE `vtiger_activity`
 ADD PRIMARY KEY (`activityid`), ADD KEY `activity_activityid_subject_idx` (`activityid`,`subject`), ADD KEY `activity_activitytype_date_start_idx` (`activitytype`,`date_start`), ADD KEY `activity_date_start_due_date_idx` (`date_start`,`due_date`), ADD KEY `activity_date_start_time_start_idx` (`date_start`,`time_start`), ADD KEY `activity_eventstatus_idx` (`eventstatus`), ADD KEY `activity_status_idx` (`status`);

--
-- Indexes for table `vtiger_activity_reminder`
--
ALTER TABLE `vtiger_activity_reminder`
 ADD PRIMARY KEY (`activity_id`,`recurringid`);

--
-- Indexes for table `vtiger_activity_reminder_popup`
--
ALTER TABLE `vtiger_activity_reminder_popup`
 ADD PRIMARY KEY (`reminderid`);

--
-- Indexes for table `vtiger_activity_view`
--
ALTER TABLE `vtiger_activity_view`
 ADD PRIMARY KEY (`activity_viewid`);

--
-- Indexes for table `vtiger_activitycf`
--
ALTER TABLE `vtiger_activitycf`
 ADD PRIMARY KEY (`activityid`);

--
-- Indexes for table `vtiger_activityproductrel`
--
ALTER TABLE `vtiger_activityproductrel`
 ADD PRIMARY KEY (`activityid`,`productid`), ADD KEY `activityproductrel_activityid_idx` (`activityid`), ADD KEY `activityproductrel_productid_idx` (`productid`);

--
-- Indexes for table `vtiger_activitytype`
--
ALTER TABLE `vtiger_activitytype`
 ADD PRIMARY KEY (`activitytypeid`), ADD UNIQUE KEY `activitytype_activitytype_idx` (`activitytype`);

--
-- Indexes for table `vtiger_announcement`
--
ALTER TABLE `vtiger_announcement`
 ADD PRIMARY KEY (`creatorid`), ADD KEY `announcement_creatorid_idx` (`creatorid`);

--
-- Indexes for table `vtiger_assets`
--
ALTER TABLE `vtiger_assets`
 ADD PRIMARY KEY (`assetsid`);

--
-- Indexes for table `vtiger_assetscf`
--
ALTER TABLE `vtiger_assetscf`
 ADD PRIMARY KEY (`assetsid`);

--
-- Indexes for table `vtiger_assetstatus`
--
ALTER TABLE `vtiger_assetstatus`
 ADD PRIMARY KEY (`assetstatusid`);

--
-- Indexes for table `vtiger_asteriskincomingevents`
--
ALTER TABLE `vtiger_asteriskincomingevents`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `vtiger_attachments`
--
ALTER TABLE `vtiger_attachments`
 ADD PRIMARY KEY (`attachmentsid`), ADD KEY `attachments_attachmentsid_idx` (`attachmentsid`);

--
-- Indexes for table `vtiger_attachmentsfolder`
--
ALTER TABLE `vtiger_attachmentsfolder`
 ADD PRIMARY KEY (`folderid`);

--
-- Indexes for table `vtiger_audit_trial`
--
ALTER TABLE `vtiger_audit_trial`
 ADD PRIMARY KEY (`auditid`);

--
-- Indexes for table `vtiger_blocks`
--
ALTER TABLE `vtiger_blocks`
 ADD PRIMARY KEY (`blockid`), ADD KEY `block_tabid_idx` (`tabid`);

--
-- Indexes for table `vtiger_calendar_default_activitytypes`
--
ALTER TABLE `vtiger_calendar_default_activitytypes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_calendar_user_activitytypes`
--
ALTER TABLE `vtiger_calendar_user_activitytypes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_calendarsharedtype`
--
ALTER TABLE `vtiger_calendarsharedtype`
 ADD PRIMARY KEY (`calendarsharedtypeid`);

--
-- Indexes for table `vtiger_callduration`
--
ALTER TABLE `vtiger_callduration`
 ADD PRIMARY KEY (`calldurationid`);

--
-- Indexes for table `vtiger_campaign`
--
ALTER TABLE `vtiger_campaign`
 ADD PRIMARY KEY (`campaignid`), ADD KEY `campaign_campaignstatus_idx` (`campaignstatus`), ADD KEY `campaign_campaignname_idx` (`campaignname`), ADD KEY `campaign_campaignid_idx` (`campaignid`);

--
-- Indexes for table `vtiger_campaigncontrel`
--
ALTER TABLE `vtiger_campaigncontrel`
 ADD PRIMARY KEY (`campaignid`,`contactid`,`campaignrelstatusid`), ADD KEY `campaigncontrel_contractid_idx` (`contactid`);

--
-- Indexes for table `vtiger_campaignleadrel`
--
ALTER TABLE `vtiger_campaignleadrel`
 ADD PRIMARY KEY (`campaignid`,`leadid`,`campaignrelstatusid`), ADD KEY `campaignleadrel_leadid_campaignid_idx` (`leadid`,`campaignid`);

--
-- Indexes for table `vtiger_campaignscf`
--
ALTER TABLE `vtiger_campaignscf`
 ADD PRIMARY KEY (`campaignid`);

--
-- Indexes for table `vtiger_campaignstatus`
--
ALTER TABLE `vtiger_campaignstatus`
 ADD PRIMARY KEY (`campaignstatusid`), ADD KEY `campaignstatus_campaignstatus_idx` (`campaignstatus`);

--
-- Indexes for table `vtiger_campaigntype`
--
ALTER TABLE `vtiger_campaigntype`
 ADD PRIMARY KEY (`campaigntypeid`), ADD UNIQUE KEY `campaigntype_campaigntype_idx` (`campaigntype`);

--
-- Indexes for table `vtiger_carrier`
--
ALTER TABLE `vtiger_carrier`
 ADD PRIMARY KEY (`carrierid`), ADD UNIQUE KEY `carrier_carrier_idx` (`carrier`);

--
-- Indexes for table `vtiger_cntactivityrel`
--
ALTER TABLE `vtiger_cntactivityrel`
 ADD PRIMARY KEY (`contactid`,`activityid`), ADD KEY `cntactivityrel_contactid_idx` (`contactid`), ADD KEY `cntactivityrel_activityid_idx` (`activityid`);

--
-- Indexes for table `vtiger_contactaddress`
--
ALTER TABLE `vtiger_contactaddress`
 ADD PRIMARY KEY (`contactaddressid`);

--
-- Indexes for table `vtiger_contactdetails`
--
ALTER TABLE `vtiger_contactdetails`
 ADD PRIMARY KEY (`contactid`), ADD KEY `contactdetails_accountid_idx` (`accountid`), ADD KEY `email_idx` (`email`);

--
-- Indexes for table `vtiger_contactscf`
--
ALTER TABLE `vtiger_contactscf`
 ADD PRIMARY KEY (`contactid`);

--
-- Indexes for table `vtiger_contactsubdetails`
--
ALTER TABLE `vtiger_contactsubdetails`
 ADD PRIMARY KEY (`contactsubscriptionid`);

--
-- Indexes for table `vtiger_contpotentialrel`
--
ALTER TABLE `vtiger_contpotentialrel`
 ADD PRIMARY KEY (`contactid`,`potentialid`), ADD KEY `contpotentialrel_potentialid_idx` (`potentialid`), ADD KEY `contpotentialrel_contactid_idx` (`contactid`);

--
-- Indexes for table `vtiger_contract_priority`
--
ALTER TABLE `vtiger_contract_priority`
 ADD PRIMARY KEY (`contract_priorityid`);

--
-- Indexes for table `vtiger_contract_status`
--
ALTER TABLE `vtiger_contract_status`
 ADD PRIMARY KEY (`contract_statusid`);

--
-- Indexes for table `vtiger_contract_type`
--
ALTER TABLE `vtiger_contract_type`
 ADD PRIMARY KEY (`contract_typeid`);

--
-- Indexes for table `vtiger_convertleadmapping`
--
ALTER TABLE `vtiger_convertleadmapping`
 ADD PRIMARY KEY (`cfmid`);

--
-- Indexes for table `vtiger_crmentity`
--
ALTER TABLE `vtiger_crmentity`
 ADD PRIMARY KEY (`crmid`), ADD KEY `crmentity_smcreatorid_idx` (`smcreatorid`), ADD KEY `crmentity_modifiedby_idx` (`modifiedby`), ADD KEY `crmentity_deleted_idx` (`deleted`), ADD KEY `crm_ownerid_del_setype_idx` (`smownerid`,`deleted`,`setype`), ADD KEY `vtiger_crmentity_labelidx` (`label`);

--
-- Indexes for table `vtiger_cron_task`
--
ALTER TABLE `vtiger_cron_task`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `handler_file` (`handler_file`);

--
-- Indexes for table `vtiger_currencies`
--
ALTER TABLE `vtiger_currencies`
 ADD PRIMARY KEY (`currencyid`);

--
-- Indexes for table `vtiger_currency`
--
ALTER TABLE `vtiger_currency`
 ADD PRIMARY KEY (`currencyid`), ADD UNIQUE KEY `currency_currency_idx` (`currency`);

--
-- Indexes for table `vtiger_currency_decimal_separator`
--
ALTER TABLE `vtiger_currency_decimal_separator`
 ADD PRIMARY KEY (`currency_decimal_separatorid`);

--
-- Indexes for table `vtiger_currency_grouping_pattern`
--
ALTER TABLE `vtiger_currency_grouping_pattern`
 ADD PRIMARY KEY (`currency_grouping_patternid`);

--
-- Indexes for table `vtiger_currency_grouping_separator`
--
ALTER TABLE `vtiger_currency_grouping_separator`
 ADD PRIMARY KEY (`currency_grouping_separatorid`);

--
-- Indexes for table `vtiger_currency_info`
--
ALTER TABLE `vtiger_currency_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_currency_symbol_placement`
--
ALTER TABLE `vtiger_currency_symbol_placement`
 ADD PRIMARY KEY (`currency_symbol_placementid`);

--
-- Indexes for table `vtiger_customaction`
--
ALTER TABLE `vtiger_customaction`
 ADD KEY `customaction_cvid_idx` (`cvid`);

--
-- Indexes for table `vtiger_customerdetails`
--
ALTER TABLE `vtiger_customerdetails`
 ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `vtiger_customerportal_prefs`
--
ALTER TABLE `vtiger_customerportal_prefs`
 ADD PRIMARY KEY (`tabid`,`prefkey`);

--
-- Indexes for table `vtiger_customerportal_tabs`
--
ALTER TABLE `vtiger_customerportal_tabs`
 ADD PRIMARY KEY (`tabid`);

--
-- Indexes for table `vtiger_customview`
--
ALTER TABLE `vtiger_customview`
 ADD PRIMARY KEY (`cvid`), ADD KEY `customview_entitytype_idx` (`entitytype`);

--
-- Indexes for table `vtiger_cvadvfilter`
--
ALTER TABLE `vtiger_cvadvfilter`
 ADD PRIMARY KEY (`cvid`,`columnindex`), ADD KEY `cvadvfilter_cvid_idx` (`cvid`);

--
-- Indexes for table `vtiger_cvadvfilter_grouping`
--
ALTER TABLE `vtiger_cvadvfilter_grouping`
 ADD PRIMARY KEY (`groupid`,`cvid`);

--
-- Indexes for table `vtiger_cvcolumnlist`
--
ALTER TABLE `vtiger_cvcolumnlist`
 ADD PRIMARY KEY (`cvid`,`columnindex`), ADD KEY `cvcolumnlist_columnindex_idx` (`columnindex`), ADD KEY `cvcolumnlist_cvid_idx` (`cvid`);

--
-- Indexes for table `vtiger_cvstdfilter`
--
ALTER TABLE `vtiger_cvstdfilter`
 ADD PRIMARY KEY (`cvid`), ADD KEY `cvstdfilter_cvid_idx` (`cvid`);

--
-- Indexes for table `vtiger_datashare_grp2grp`
--
ALTER TABLE `vtiger_datashare_grp2grp`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_grp2grp_share_groupid_idx` (`share_groupid`), ADD KEY `datashare_grp2grp_to_groupid_idx` (`to_groupid`);

--
-- Indexes for table `vtiger_datashare_grp2role`
--
ALTER TABLE `vtiger_datashare_grp2role`
 ADD PRIMARY KEY (`shareid`), ADD KEY `idx_datashare_grp2role_share_groupid` (`share_groupid`), ADD KEY `idx_datashare_grp2role_to_roleid` (`to_roleid`);

--
-- Indexes for table `vtiger_datashare_grp2rs`
--
ALTER TABLE `vtiger_datashare_grp2rs`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_grp2rs_share_groupid_idx` (`share_groupid`), ADD KEY `datashare_grp2rs_to_roleandsubid_idx` (`to_roleandsubid`);

--
-- Indexes for table `vtiger_datashare_module_rel`
--
ALTER TABLE `vtiger_datashare_module_rel`
 ADD PRIMARY KEY (`shareid`), ADD KEY `idx_datashare_module_rel_tabid` (`tabid`);

--
-- Indexes for table `vtiger_datashare_relatedmodule_permission`
--
ALTER TABLE `vtiger_datashare_relatedmodule_permission`
 ADD PRIMARY KEY (`shareid`,`datashare_relatedmodule_id`), ADD KEY `datashare_relatedmodule_permission_shareid_permissions_idx` (`shareid`,`permission`);

--
-- Indexes for table `vtiger_datashare_relatedmodules`
--
ALTER TABLE `vtiger_datashare_relatedmodules`
 ADD PRIMARY KEY (`datashare_relatedmodule_id`), ADD KEY `datashare_relatedmodules_tabid_idx` (`tabid`), ADD KEY `datashare_relatedmodules_relatedto_tabid_idx` (`relatedto_tabid`);

--
-- Indexes for table `vtiger_datashare_role2group`
--
ALTER TABLE `vtiger_datashare_role2group`
 ADD PRIMARY KEY (`shareid`), ADD KEY `idx_datashare_role2group_share_roleid` (`share_roleid`), ADD KEY `idx_datashare_role2group_to_groupid` (`to_groupid`);

--
-- Indexes for table `vtiger_datashare_role2role`
--
ALTER TABLE `vtiger_datashare_role2role`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_role2role_share_roleid_idx` (`share_roleid`), ADD KEY `datashare_role2role_to_roleid_idx` (`to_roleid`);

--
-- Indexes for table `vtiger_datashare_role2rs`
--
ALTER TABLE `vtiger_datashare_role2rs`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_role2s_share_roleid_idx` (`share_roleid`), ADD KEY `datashare_role2s_to_roleandsubid_idx` (`to_roleandsubid`);

--
-- Indexes for table `vtiger_datashare_rs2grp`
--
ALTER TABLE `vtiger_datashare_rs2grp`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_rs2grp_share_roleandsubid_idx` (`share_roleandsubid`), ADD KEY `datashare_rs2grp_to_groupid_idx` (`to_groupid`);

--
-- Indexes for table `vtiger_datashare_rs2role`
--
ALTER TABLE `vtiger_datashare_rs2role`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_rs2role_share_roleandsubid_idx` (`share_roleandsubid`), ADD KEY `datashare_rs2role_to_roleid_idx` (`to_roleid`);

--
-- Indexes for table `vtiger_datashare_rs2rs`
--
ALTER TABLE `vtiger_datashare_rs2rs`
 ADD PRIMARY KEY (`shareid`), ADD KEY `datashare_rs2rs_share_roleandsubid_idx` (`share_roleandsubid`), ADD KEY `idx_datashare_rs2rs_to_roleandsubid_idx` (`to_roleandsubid`);

--
-- Indexes for table `vtiger_date_format`
--
ALTER TABLE `vtiger_date_format`
 ADD PRIMARY KEY (`date_formatid`);

--
-- Indexes for table `vtiger_dayoftheweek`
--
ALTER TABLE `vtiger_dayoftheweek`
 ADD PRIMARY KEY (`dayoftheweekid`);

--
-- Indexes for table `vtiger_def_org_field`
--
ALTER TABLE `vtiger_def_org_field`
 ADD PRIMARY KEY (`fieldid`), ADD KEY `def_org_field_tabid_fieldid_idx` (`tabid`,`fieldid`), ADD KEY `def_org_field_tabid_idx` (`tabid`), ADD KEY `def_org_field_visible_fieldid_idx` (`visible`,`fieldid`);

--
-- Indexes for table `vtiger_def_org_share`
--
ALTER TABLE `vtiger_def_org_share`
 ADD PRIMARY KEY (`ruleid`);

--
-- Indexes for table `vtiger_default_record_view`
--
ALTER TABLE `vtiger_default_record_view`
 ADD PRIMARY KEY (`default_record_viewid`);

--
-- Indexes for table `vtiger_defaultactivitytype`
--
ALTER TABLE `vtiger_defaultactivitytype`
 ADD PRIMARY KEY (`defaultactivitytypeid`);

--
-- Indexes for table `vtiger_defaultcv`
--
ALTER TABLE `vtiger_defaultcv`
 ADD PRIMARY KEY (`tabid`);

--
-- Indexes for table `vtiger_defaulteventstatus`
--
ALTER TABLE `vtiger_defaulteventstatus`
 ADD PRIMARY KEY (`defaulteventstatusid`);

--
-- Indexes for table `vtiger_duration_minutes`
--
ALTER TABLE `vtiger_duration_minutes`
 ADD PRIMARY KEY (`minutesid`);

--
-- Indexes for table `vtiger_durationhrs`
--
ALTER TABLE `vtiger_durationhrs`
 ADD PRIMARY KEY (`hrsid`);

--
-- Indexes for table `vtiger_durationmins`
--
ALTER TABLE `vtiger_durationmins`
 ADD PRIMARY KEY (`minsid`);

--
-- Indexes for table `vtiger_email_track`
--
ALTER TABLE `vtiger_email_track`
 ADD UNIQUE KEY `link_tabidtype_idx` (`crmid`,`mailid`);

--
-- Indexes for table `vtiger_emaildetails`
--
ALTER TABLE `vtiger_emaildetails`
 ADD PRIMARY KEY (`emailid`);

--
-- Indexes for table `vtiger_emailtemplates`
--
ALTER TABLE `vtiger_emailtemplates`
 ADD PRIMARY KEY (`templateid`), ADD KEY `emailtemplates_foldernamd_templatename_subject_idx` (`foldername`,`templatename`,`subject`);

--
-- Indexes for table `vtiger_entityname`
--
ALTER TABLE `vtiger_entityname`
 ADD PRIMARY KEY (`tabid`), ADD KEY `entityname_tabid_idx` (`tabid`);

--
-- Indexes for table `vtiger_eventhandler_module`
--
ALTER TABLE `vtiger_eventhandler_module`
 ADD PRIMARY KEY (`eventhandler_module_id`);

--
-- Indexes for table `vtiger_eventhandlers`
--
ALTER TABLE `vtiger_eventhandlers`
 ADD PRIMARY KEY (`eventhandler_id`,`event_name`,`handler_class`), ADD UNIQUE KEY `eventhandler_idx` (`eventhandler_id`);

--
-- Indexes for table `vtiger_eventstatus`
--
ALTER TABLE `vtiger_eventstatus`
 ADD PRIMARY KEY (`eventstatusid`);

--
-- Indexes for table `vtiger_expectedresponse`
--
ALTER TABLE `vtiger_expectedresponse`
 ADD PRIMARY KEY (`expectedresponseid`), ADD UNIQUE KEY `CampaignExpRes_UK01` (`expectedresponse`);

--
-- Indexes for table `vtiger_faq`
--
ALTER TABLE `vtiger_faq`
 ADD PRIMARY KEY (`id`), ADD KEY `faq_id_idx` (`id`);

--
-- Indexes for table `vtiger_faqcategories`
--
ALTER TABLE `vtiger_faqcategories`
 ADD PRIMARY KEY (`faqcategories_id`);

--
-- Indexes for table `vtiger_faqcf`
--
ALTER TABLE `vtiger_faqcf`
 ADD PRIMARY KEY (`faqid`);

--
-- Indexes for table `vtiger_faqcomments`
--
ALTER TABLE `vtiger_faqcomments`
 ADD PRIMARY KEY (`commentid`), ADD KEY `faqcomments_faqid_idx` (`faqid`);

--
-- Indexes for table `vtiger_faqstatus`
--
ALTER TABLE `vtiger_faqstatus`
 ADD PRIMARY KEY (`faqstatus_id`);

--
-- Indexes for table `vtiger_field`
--
ALTER TABLE `vtiger_field`
 ADD PRIMARY KEY (`fieldid`), ADD KEY `field_tabid_idx` (`tabid`), ADD KEY `field_fieldname_idx` (`fieldname`), ADD KEY `field_block_idx` (`block`), ADD KEY `field_displaytype_idx` (`displaytype`);

--
-- Indexes for table `vtiger_freetagged_objects`
--
ALTER TABLE `vtiger_freetagged_objects`
 ADD PRIMARY KEY (`tag_id`,`tagger_id`,`object_id`), ADD KEY `freetagged_objects_tag_id_tagger_id_object_id_idx` (`tag_id`,`tagger_id`,`object_id`);

--
-- Indexes for table `vtiger_freetags`
--
ALTER TABLE `vtiger_freetags`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_glacct`
--
ALTER TABLE `vtiger_glacct`
 ADD PRIMARY KEY (`glacctid`), ADD UNIQUE KEY `glacct_glacct_idx` (`glacct`);

--
-- Indexes for table `vtiger_group2grouprel`
--
ALTER TABLE `vtiger_group2grouprel`
 ADD PRIMARY KEY (`groupid`,`containsgroupid`);

--
-- Indexes for table `vtiger_group2role`
--
ALTER TABLE `vtiger_group2role`
 ADD PRIMARY KEY (`groupid`,`roleid`);

--
-- Indexes for table `vtiger_group2rs`
--
ALTER TABLE `vtiger_group2rs`
 ADD PRIMARY KEY (`groupid`,`roleandsubid`);

--
-- Indexes for table `vtiger_groups`
--
ALTER TABLE `vtiger_groups`
 ADD PRIMARY KEY (`groupid`), ADD UNIQUE KEY `groups_groupname_idx` (`groupname`);

--
-- Indexes for table `vtiger_home_layout`
--
ALTER TABLE `vtiger_home_layout`
 ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `vtiger_homedashbd`
--
ALTER TABLE `vtiger_homedashbd`
 ADD PRIMARY KEY (`stuffid`), ADD KEY `stuff_stuffid_idx` (`stuffid`);

--
-- Indexes for table `vtiger_homedefault`
--
ALTER TABLE `vtiger_homedefault`
 ADD PRIMARY KEY (`stuffid`), ADD KEY `stuff_stuffid_idx` (`stuffid`);

--
-- Indexes for table `vtiger_homemodule`
--
ALTER TABLE `vtiger_homemodule`
 ADD PRIMARY KEY (`stuffid`), ADD KEY `stuff_stuffid_idx` (`stuffid`);

--
-- Indexes for table `vtiger_homemoduleflds`
--
ALTER TABLE `vtiger_homemoduleflds`
 ADD KEY `stuff_stuffid_idx` (`stuffid`);

--
-- Indexes for table `vtiger_homereportchart`
--
ALTER TABLE `vtiger_homereportchart`
 ADD PRIMARY KEY (`stuffid`);

--
-- Indexes for table `vtiger_homerss`
--
ALTER TABLE `vtiger_homerss`
 ADD PRIMARY KEY (`stuffid`), ADD KEY `stuff_stuffid_idx` (`stuffid`);

--
-- Indexes for table `vtiger_homestuff`
--
ALTER TABLE `vtiger_homestuff`
 ADD PRIMARY KEY (`stuffid`), ADD KEY `stuff_stuffid_idx` (`stuffid`);

--
-- Indexes for table `vtiger_hour_format`
--
ALTER TABLE `vtiger_hour_format`
 ADD PRIMARY KEY (`hour_formatid`);

--
-- Indexes for table `vtiger_import_locks`
--
ALTER TABLE `vtiger_import_locks`
 ADD PRIMARY KEY (`vtiger_import_lock_id`);

--
-- Indexes for table `vtiger_import_maps`
--
ALTER TABLE `vtiger_import_maps`
 ADD PRIMARY KEY (`id`), ADD KEY `import_maps_assigned_user_id_module_name_deleted_idx` (`assigned_user_id`,`module`,`name`,`deleted`);

--
-- Indexes for table `vtiger_import_queue`
--
ALTER TABLE `vtiger_import_queue`
 ADD PRIMARY KEY (`importid`);

--
-- Indexes for table `vtiger_industry`
--
ALTER TABLE `vtiger_industry`
 ADD PRIMARY KEY (`industryid`), ADD UNIQUE KEY `industry_industry_idx` (`industry`);

--
-- Indexes for table `vtiger_inventory_tandc`
--
ALTER TABLE `vtiger_inventory_tandc`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_inventorynotification`
--
ALTER TABLE `vtiger_inventorynotification`
 ADD PRIMARY KEY (`notificationid`);

--
-- Indexes for table `vtiger_inventoryproductrel`
--
ALTER TABLE `vtiger_inventoryproductrel`
 ADD PRIMARY KEY (`lineitem_id`), ADD KEY `inventoryproductrel_id_idx` (`id`), ADD KEY `inventoryproductrel_productid_idx` (`productid`);

--
-- Indexes for table `vtiger_inventoryshippingrel`
--
ALTER TABLE `vtiger_inventoryshippingrel`
 ADD KEY `inventoryishippingrel_id_idx` (`id`);

--
-- Indexes for table `vtiger_inventorytaxinfo`
--
ALTER TABLE `vtiger_inventorytaxinfo`
 ADD PRIMARY KEY (`taxid`), ADD KEY `inventorytaxinfo_taxname_idx` (`taxname`);

--
-- Indexes for table `vtiger_invitees`
--
ALTER TABLE `vtiger_invitees`
 ADD PRIMARY KEY (`activityid`,`inviteeid`);

--
-- Indexes for table `vtiger_invoice`
--
ALTER TABLE `vtiger_invoice`
 ADD PRIMARY KEY (`invoiceid`), ADD KEY `invoice_purchaseorderid_idx` (`invoiceid`);

--
-- Indexes for table `vtiger_invoice_recurring_info`
--
ALTER TABLE `vtiger_invoice_recurring_info`
 ADD PRIMARY KEY (`salesorderid`);

--
-- Indexes for table `vtiger_invoicebillads`
--
ALTER TABLE `vtiger_invoicebillads`
 ADD PRIMARY KEY (`invoicebilladdressid`);

--
-- Indexes for table `vtiger_invoicecf`
--
ALTER TABLE `vtiger_invoicecf`
 ADD PRIMARY KEY (`invoiceid`);

--
-- Indexes for table `vtiger_invoiceshipads`
--
ALTER TABLE `vtiger_invoiceshipads`
 ADD PRIMARY KEY (`invoiceshipaddressid`);

--
-- Indexes for table `vtiger_invoicestatus`
--
ALTER TABLE `vtiger_invoicestatus`
 ADD PRIMARY KEY (`invoicestatusid`), ADD UNIQUE KEY `invoicestatus_invoiestatus_idx` (`invoicestatus`);

--
-- Indexes for table `vtiger_invoicestatushistory`
--
ALTER TABLE `vtiger_invoicestatushistory`
 ADD PRIMARY KEY (`historyid`), ADD KEY `invoicestatushistory_invoiceid_idx` (`invoiceid`);

--
-- Indexes for table `vtiger_language`
--
ALTER TABLE `vtiger_language`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_lead_view`
--
ALTER TABLE `vtiger_lead_view`
 ADD PRIMARY KEY (`lead_viewid`);

--
-- Indexes for table `vtiger_leadaddress`
--
ALTER TABLE `vtiger_leadaddress`
 ADD PRIMARY KEY (`leadaddressid`);

--
-- Indexes for table `vtiger_leaddetails`
--
ALTER TABLE `vtiger_leaddetails`
 ADD PRIMARY KEY (`leadid`), ADD KEY `leaddetails_converted_leadstatus_idx` (`converted`,`leadstatus`), ADD KEY `email_idx` (`email`);

--
-- Indexes for table `vtiger_leadscf`
--
ALTER TABLE `vtiger_leadscf`
 ADD PRIMARY KEY (`leadid`);

--
-- Indexes for table `vtiger_leadsource`
--
ALTER TABLE `vtiger_leadsource`
 ADD PRIMARY KEY (`leadsourceid`);

--
-- Indexes for table `vtiger_leadstage`
--
ALTER TABLE `vtiger_leadstage`
 ADD PRIMARY KEY (`leadstageid`), ADD UNIQUE KEY `leadstage_stage_idx` (`stage`);

--
-- Indexes for table `vtiger_leadstatus`
--
ALTER TABLE `vtiger_leadstatus`
 ADD PRIMARY KEY (`leadstatusid`);

--
-- Indexes for table `vtiger_leadsubdetails`
--
ALTER TABLE `vtiger_leadsubdetails`
 ADD PRIMARY KEY (`leadsubscriptionid`);

--
-- Indexes for table `vtiger_links`
--
ALTER TABLE `vtiger_links`
 ADD PRIMARY KEY (`linkid`), ADD KEY `link_tabidtype_idx` (`tabid`,`linktype`);

--
-- Indexes for table `vtiger_loginhistory`
--
ALTER TABLE `vtiger_loginhistory`
 ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `vtiger_mail_accounts`
--
ALTER TABLE `vtiger_mail_accounts`
 ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `vtiger_mailmanager_mailattachments`
--
ALTER TABLE `vtiger_mailmanager_mailattachments`
 ADD KEY `userid_muid_idx` (`userid`,`muid`);

--
-- Indexes for table `vtiger_mailmanager_mailrecord`
--
ALTER TABLE `vtiger_mailmanager_mailrecord`
 ADD KEY `userid_lastsavedtime_idx` (`userid`,`lastsavedtime`), ADD KEY `userid_muid_idx` (`userid`,`muid`);

--
-- Indexes for table `vtiger_mailscanner`
--
ALTER TABLE `vtiger_mailscanner`
 ADD PRIMARY KEY (`scannerid`);

--
-- Indexes for table `vtiger_mailscanner_actions`
--
ALTER TABLE `vtiger_mailscanner_actions`
 ADD PRIMARY KEY (`actionid`);

--
-- Indexes for table `vtiger_mailscanner_folders`
--
ALTER TABLE `vtiger_mailscanner_folders`
 ADD PRIMARY KEY (`folderid`), ADD KEY `folderid_idx` (`folderid`);

--
-- Indexes for table `vtiger_mailscanner_ids`
--
ALTER TABLE `vtiger_mailscanner_ids`
 ADD KEY `scanner_message_ids_idx` (`scannerid`,`messageid`(255));

--
-- Indexes for table `vtiger_mailscanner_rules`
--
ALTER TABLE `vtiger_mailscanner_rules`
 ADD PRIMARY KEY (`ruleid`);

--
-- Indexes for table `vtiger_manufacturer`
--
ALTER TABLE `vtiger_manufacturer`
 ADD PRIMARY KEY (`manufacturerid`), ADD UNIQUE KEY `manufacturer_manufacturer_idx` (`manufacturer`);

--
-- Indexes for table `vtiger_mobile_alerts`
--
ALTER TABLE `vtiger_mobile_alerts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_modcomments`
--
ALTER TABLE `vtiger_modcomments`
 ADD KEY `relatedto_idx` (`related_to`);

--
-- Indexes for table `vtiger_modcommentscf`
--
ALTER TABLE `vtiger_modcommentscf`
 ADD PRIMARY KEY (`modcommentsid`);

--
-- Indexes for table `vtiger_modentity_num`
--
ALTER TABLE `vtiger_modentity_num`
 ADD PRIMARY KEY (`num_id`), ADD UNIQUE KEY `num_idx` (`num_id`), ADD KEY `semodule_active_idx` (`semodule`,`active`);

--
-- Indexes for table `vtiger_modtracker_basic`
--
ALTER TABLE `vtiger_modtracker_basic`
 ADD PRIMARY KEY (`id`), ADD KEY `crmidx` (`crmid`), ADD KEY `idx` (`id`);

--
-- Indexes for table `vtiger_modtracker_detail`
--
ALTER TABLE `vtiger_modtracker_detail`
 ADD KEY `idx` (`id`);

--
-- Indexes for table `vtiger_modtracker_relations`
--
ALTER TABLE `vtiger_modtracker_relations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_modtracker_tabs`
--
ALTER TABLE `vtiger_modtracker_tabs`
 ADD PRIMARY KEY (`tabid`);

--
-- Indexes for table `vtiger_module_dashboard_widgets`
--
ALTER TABLE `vtiger_module_dashboard_widgets`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_no_of_currency_decimals`
--
ALTER TABLE `vtiger_no_of_currency_decimals`
 ADD PRIMARY KEY (`no_of_currency_decimalsid`);

--
-- Indexes for table `vtiger_notes`
--
ALTER TABLE `vtiger_notes`
 ADD PRIMARY KEY (`notesid`), ADD KEY `notes_title_idx` (`title`), ADD KEY `notes_notesid_idx` (`notesid`);

--
-- Indexes for table `vtiger_notescf`
--
ALTER TABLE `vtiger_notescf`
 ADD PRIMARY KEY (`notesid`);

--
-- Indexes for table `vtiger_notificationscheduler`
--
ALTER TABLE `vtiger_notificationscheduler`
 ADD PRIMARY KEY (`schedulednotificationid`), ADD UNIQUE KEY `notificationscheduler_schedulednotificationname_idx` (`schedulednotificationname`);

--
-- Indexes for table `vtiger_opportunity_type`
--
ALTER TABLE `vtiger_opportunity_type`
 ADD PRIMARY KEY (`opptypeid`), ADD UNIQUE KEY `opportunity_type_opportunity_type_idx` (`opportunity_type`);

--
-- Indexes for table `vtiger_opportunitystage`
--
ALTER TABLE `vtiger_opportunitystage`
 ADD PRIMARY KEY (`potstageid`), ADD UNIQUE KEY `opportunitystage_stage_idx` (`stage`);

--
-- Indexes for table `vtiger_org_share_action2tab`
--
ALTER TABLE `vtiger_org_share_action2tab`
 ADD PRIMARY KEY (`share_action_id`,`tabid`);

--
-- Indexes for table `vtiger_org_share_action_mapping`
--
ALTER TABLE `vtiger_org_share_action_mapping`
 ADD PRIMARY KEY (`share_action_id`);

--
-- Indexes for table `vtiger_organizationdetails`
--
ALTER TABLE `vtiger_organizationdetails`
 ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `vtiger_othereventduration`
--
ALTER TABLE `vtiger_othereventduration`
 ADD PRIMARY KEY (`othereventdurationid`);

--
-- Indexes for table `vtiger_parenttab`
--
ALTER TABLE `vtiger_parenttab`
 ADD PRIMARY KEY (`parenttabid`), ADD KEY `parenttab_parenttabid_parenttabl_label_visible_idx` (`parenttabid`,`parenttab_label`,`visible`);

--
-- Indexes for table `vtiger_parenttabrel`
--
ALTER TABLE `vtiger_parenttabrel`
 ADD KEY `parenttabrel_tabid_parenttabid_idx` (`tabid`,`parenttabid`);

--
-- Indexes for table `vtiger_picklist`
--
ALTER TABLE `vtiger_picklist`
 ADD PRIMARY KEY (`picklistid`), ADD UNIQUE KEY `picklist_name_idx` (`name`);

--
-- Indexes for table `vtiger_picklist_dependency`
--
ALTER TABLE `vtiger_picklist_dependency`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_pobillads`
--
ALTER TABLE `vtiger_pobillads`
 ADD PRIMARY KEY (`pobilladdressid`);

--
-- Indexes for table `vtiger_portal`
--
ALTER TABLE `vtiger_portal`
 ADD PRIMARY KEY (`portalid`), ADD KEY `portal_portalname_idx` (`portalname`);

--
-- Indexes for table `vtiger_portalinfo`
--
ALTER TABLE `vtiger_portalinfo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_poshipads`
--
ALTER TABLE `vtiger_poshipads`
 ADD PRIMARY KEY (`poshipaddressid`);

--
-- Indexes for table `vtiger_postatus`
--
ALTER TABLE `vtiger_postatus`
 ADD PRIMARY KEY (`postatusid`), ADD UNIQUE KEY `postatus_postatus_idx` (`postatus`);

--
-- Indexes for table `vtiger_postatushistory`
--
ALTER TABLE `vtiger_postatushistory`
 ADD PRIMARY KEY (`historyid`), ADD KEY `postatushistory_purchaseorderid_idx` (`purchaseorderid`);

--
-- Indexes for table `vtiger_potential`
--
ALTER TABLE `vtiger_potential`
 ADD PRIMARY KEY (`potentialid`), ADD KEY `potential_relatedto_idx` (`related_to`), ADD KEY `potentail_sales_stage_idx` (`sales_stage`), ADD KEY `potentail_sales_stage_amount_idx` (`amount`,`sales_stage`);

--
-- Indexes for table `vtiger_potentialscf`
--
ALTER TABLE `vtiger_potentialscf`
 ADD PRIMARY KEY (`potentialid`);

--
-- Indexes for table `vtiger_potstagehistory`
--
ALTER TABLE `vtiger_potstagehistory`
 ADD PRIMARY KEY (`historyid`), ADD KEY `potstagehistory_potentialid_idx` (`potentialid`);

--
-- Indexes for table `vtiger_pricebook`
--
ALTER TABLE `vtiger_pricebook`
 ADD PRIMARY KEY (`pricebookid`);

--
-- Indexes for table `vtiger_pricebookcf`
--
ALTER TABLE `vtiger_pricebookcf`
 ADD PRIMARY KEY (`pricebookid`);

--
-- Indexes for table `vtiger_pricebookproductrel`
--
ALTER TABLE `vtiger_pricebookproductrel`
 ADD PRIMARY KEY (`pricebookid`,`productid`), ADD KEY `pricebookproductrel_pricebookid_idx` (`pricebookid`), ADD KEY `pricebookproductrel_productid_idx` (`productid`);

--
-- Indexes for table `vtiger_priority`
--
ALTER TABLE `vtiger_priority`
 ADD PRIMARY KEY (`priorityid`), ADD UNIQUE KEY `priority_priority_idx` (`priority`);

--
-- Indexes for table `vtiger_productcategory`
--
ALTER TABLE `vtiger_productcategory`
 ADD PRIMARY KEY (`productcategoryid`), ADD UNIQUE KEY `productcategory_productcategory_idx` (`productcategory`);

--
-- Indexes for table `vtiger_productcf`
--
ALTER TABLE `vtiger_productcf`
 ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `vtiger_products`
--
ALTER TABLE `vtiger_products`
 ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `vtiger_producttaxrel`
--
ALTER TABLE `vtiger_producttaxrel`
 ADD KEY `producttaxrel_productid_idx` (`productid`), ADD KEY `producttaxrel_taxid_idx` (`taxid`);

--
-- Indexes for table `vtiger_profile`
--
ALTER TABLE `vtiger_profile`
 ADD PRIMARY KEY (`profileid`);

--
-- Indexes for table `vtiger_profile2field`
--
ALTER TABLE `vtiger_profile2field`
 ADD PRIMARY KEY (`profileid`,`fieldid`), ADD KEY `profile2field_profileid_tabid_fieldname_idx` (`profileid`,`tabid`), ADD KEY `profile2field_tabid_profileid_idx` (`tabid`,`profileid`), ADD KEY `profile2field_visible_profileid_idx` (`visible`,`profileid`);

--
-- Indexes for table `vtiger_profile2globalpermissions`
--
ALTER TABLE `vtiger_profile2globalpermissions`
 ADD PRIMARY KEY (`profileid`,`globalactionid`), ADD KEY `idx_profile2globalpermissions` (`profileid`,`globalactionid`);

--
-- Indexes for table `vtiger_profile2standardpermissions`
--
ALTER TABLE `vtiger_profile2standardpermissions`
 ADD PRIMARY KEY (`profileid`,`tabid`,`operation`), ADD KEY `profile2standardpermissions_profileid_tabid_operation_idx` (`profileid`,`tabid`,`operation`);

--
-- Indexes for table `vtiger_profile2tab`
--
ALTER TABLE `vtiger_profile2tab`
 ADD KEY `profile2tab_profileid_tabid_idx` (`profileid`,`tabid`);

--
-- Indexes for table `vtiger_profile2utility`
--
ALTER TABLE `vtiger_profile2utility`
 ADD PRIMARY KEY (`profileid`,`tabid`,`activityid`), ADD KEY `profile2utility_profileid_tabid_activityid_idx` (`profileid`,`tabid`,`activityid`);

--
-- Indexes for table `vtiger_progress`
--
ALTER TABLE `vtiger_progress`
 ADD PRIMARY KEY (`progressid`);

--
-- Indexes for table `vtiger_projectcf`
--
ALTER TABLE `vtiger_projectcf`
 ADD PRIMARY KEY (`projectid`);

--
-- Indexes for table `vtiger_projectmilestone`
--
ALTER TABLE `vtiger_projectmilestone`
 ADD PRIMARY KEY (`projectmilestoneid`);

--
-- Indexes for table `vtiger_projectmilestonecf`
--
ALTER TABLE `vtiger_projectmilestonecf`
 ADD PRIMARY KEY (`projectmilestoneid`);

--
-- Indexes for table `vtiger_projectmilestonetype`
--
ALTER TABLE `vtiger_projectmilestonetype`
 ADD PRIMARY KEY (`projectmilestonetypeid`);

--
-- Indexes for table `vtiger_projectpriority`
--
ALTER TABLE `vtiger_projectpriority`
 ADD PRIMARY KEY (`projectpriorityid`);

--
-- Indexes for table `vtiger_projectstatus`
--
ALTER TABLE `vtiger_projectstatus`
 ADD PRIMARY KEY (`projectstatusid`);

--
-- Indexes for table `vtiger_projecttask`
--
ALTER TABLE `vtiger_projecttask`
 ADD PRIMARY KEY (`projecttaskid`);

--
-- Indexes for table `vtiger_projecttaskcf`
--
ALTER TABLE `vtiger_projecttaskcf`
 ADD PRIMARY KEY (`projecttaskid`);

--
-- Indexes for table `vtiger_projecttaskpriority`
--
ALTER TABLE `vtiger_projecttaskpriority`
 ADD PRIMARY KEY (`projecttaskpriorityid`);

--
-- Indexes for table `vtiger_projecttaskprogress`
--
ALTER TABLE `vtiger_projecttaskprogress`
 ADD PRIMARY KEY (`projecttaskprogressid`);

--
-- Indexes for table `vtiger_projecttaskstatus`
--
ALTER TABLE `vtiger_projecttaskstatus`
 ADD PRIMARY KEY (`projecttaskstatusid`);

--
-- Indexes for table `vtiger_projecttasktype`
--
ALTER TABLE `vtiger_projecttasktype`
 ADD PRIMARY KEY (`projecttasktypeid`);

--
-- Indexes for table `vtiger_projecttype`
--
ALTER TABLE `vtiger_projecttype`
 ADD PRIMARY KEY (`projecttypeid`);

--
-- Indexes for table `vtiger_purchaseorder`
--
ALTER TABLE `vtiger_purchaseorder`
 ADD PRIMARY KEY (`purchaseorderid`), ADD KEY `purchaseorder_vendorid_idx` (`vendorid`), ADD KEY `purchaseorder_quoteid_idx` (`quoteid`), ADD KEY `purchaseorder_contactid_idx` (`contactid`);

--
-- Indexes for table `vtiger_purchaseordercf`
--
ALTER TABLE `vtiger_purchaseordercf`
 ADD PRIMARY KEY (`purchaseorderid`);

--
-- Indexes for table `vtiger_quotes`
--
ALTER TABLE `vtiger_quotes`
 ADD PRIMARY KEY (`quoteid`), ADD KEY `quote_quotestage_idx` (`quotestage`), ADD KEY `quotes_potentialid_idx` (`potentialid`), ADD KEY `quotes_contactid_idx` (`contactid`);

--
-- Indexes for table `vtiger_quotesbillads`
--
ALTER TABLE `vtiger_quotesbillads`
 ADD PRIMARY KEY (`quotebilladdressid`);

--
-- Indexes for table `vtiger_quotescf`
--
ALTER TABLE `vtiger_quotescf`
 ADD PRIMARY KEY (`quoteid`);

--
-- Indexes for table `vtiger_quotesshipads`
--
ALTER TABLE `vtiger_quotesshipads`
 ADD PRIMARY KEY (`quoteshipaddressid`);

--
-- Indexes for table `vtiger_quotestage`
--
ALTER TABLE `vtiger_quotestage`
 ADD PRIMARY KEY (`quotestageid`), ADD UNIQUE KEY `quotestage_quotestage_idx` (`quotestage`);

--
-- Indexes for table `vtiger_quotestagehistory`
--
ALTER TABLE `vtiger_quotestagehistory`
 ADD PRIMARY KEY (`historyid`), ADD KEY `quotestagehistory_quoteid_idx` (`quoteid`);

--
-- Indexes for table `vtiger_rating`
--
ALTER TABLE `vtiger_rating`
 ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `vtiger_recurringevents`
--
ALTER TABLE `vtiger_recurringevents`
 ADD PRIMARY KEY (`recurringid`);

--
-- Indexes for table `vtiger_recurringtype`
--
ALTER TABLE `vtiger_recurringtype`
 ADD PRIMARY KEY (`recurringeventid`), ADD UNIQUE KEY `recurringtype_status_idx` (`recurringtype`);

--
-- Indexes for table `vtiger_relatedlists`
--
ALTER TABLE `vtiger_relatedlists`
 ADD PRIMARY KEY (`relation_id`), ADD KEY `relatedlists_relation_id_idx` (`relation_id`);

--
-- Indexes for table `vtiger_relcriteria`
--
ALTER TABLE `vtiger_relcriteria`
 ADD PRIMARY KEY (`queryid`,`columnindex`), ADD KEY `relcriteria_queryid_idx` (`queryid`);

--
-- Indexes for table `vtiger_relcriteria_grouping`
--
ALTER TABLE `vtiger_relcriteria_grouping`
 ADD PRIMARY KEY (`groupid`,`queryid`);

--
-- Indexes for table `vtiger_reminder_interval`
--
ALTER TABLE `vtiger_reminder_interval`
 ADD PRIMARY KEY (`reminder_intervalid`);

--
-- Indexes for table `vtiger_report`
--
ALTER TABLE `vtiger_report`
 ADD PRIMARY KEY (`reportid`), ADD KEY `report_queryid_idx` (`queryid`), ADD KEY `report_folderid_idx` (`folderid`);

--
-- Indexes for table `vtiger_reportdatefilter`
--
ALTER TABLE `vtiger_reportdatefilter`
 ADD PRIMARY KEY (`datefilterid`), ADD KEY `reportdatefilter_datefilterid_idx` (`datefilterid`);

--
-- Indexes for table `vtiger_reportfolder`
--
ALTER TABLE `vtiger_reportfolder`
 ADD PRIMARY KEY (`folderid`);

--
-- Indexes for table `vtiger_reportmodules`
--
ALTER TABLE `vtiger_reportmodules`
 ADD PRIMARY KEY (`reportmodulesid`);

--
-- Indexes for table `vtiger_reportsortcol`
--
ALTER TABLE `vtiger_reportsortcol`
 ADD PRIMARY KEY (`sortcolid`,`reportid`);

--
-- Indexes for table `vtiger_reportsummary`
--
ALTER TABLE `vtiger_reportsummary`
 ADD PRIMARY KEY (`reportsummaryid`,`summarytype`,`columnname`), ADD KEY `reportsummary_reportsummaryid_idx` (`reportsummaryid`);

--
-- Indexes for table `vtiger_reporttype`
--
ALTER TABLE `vtiger_reporttype`
 ADD PRIMARY KEY (`reportid`);

--
-- Indexes for table `vtiger_role`
--
ALTER TABLE `vtiger_role`
 ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `vtiger_role2picklist`
--
ALTER TABLE `vtiger_role2picklist`
 ADD PRIMARY KEY (`roleid`,`picklistvalueid`,`picklistid`), ADD KEY `role2picklist_roleid_picklistid_idx` (`roleid`,`picklistid`,`picklistvalueid`);

--
-- Indexes for table `vtiger_role2profile`
--
ALTER TABLE `vtiger_role2profile`
 ADD PRIMARY KEY (`roleid`,`profileid`), ADD KEY `role2profile_roleid_profileid_idx` (`roleid`,`profileid`);

--
-- Indexes for table `vtiger_rowheight`
--
ALTER TABLE `vtiger_rowheight`
 ADD PRIMARY KEY (`rowheightid`);

--
-- Indexes for table `vtiger_rss`
--
ALTER TABLE `vtiger_rss`
 ADD PRIMARY KEY (`rssid`);

--
-- Indexes for table `vtiger_sales_stage`
--
ALTER TABLE `vtiger_sales_stage`
 ADD PRIMARY KEY (`sales_stage_id`);

--
-- Indexes for table `vtiger_salesmanactivityrel`
--
ALTER TABLE `vtiger_salesmanactivityrel`
 ADD PRIMARY KEY (`smid`,`activityid`), ADD KEY `salesmanactivityrel_activityid_idx` (`activityid`), ADD KEY `salesmanactivityrel_smid_idx` (`smid`);

--
-- Indexes for table `vtiger_salesmanattachmentsrel`
--
ALTER TABLE `vtiger_salesmanattachmentsrel`
 ADD PRIMARY KEY (`smid`,`attachmentsid`), ADD KEY `salesmanattachmentsrel_smid_idx` (`smid`), ADD KEY `salesmanattachmentsrel_attachmentsid_idx` (`attachmentsid`);

--
-- Indexes for table `vtiger_salesmanticketrel`
--
ALTER TABLE `vtiger_salesmanticketrel`
 ADD PRIMARY KEY (`smid`,`id`), ADD KEY `salesmanticketrel_smid_idx` (`smid`), ADD KEY `salesmanticketrel_id_idx` (`id`);

--
-- Indexes for table `vtiger_salesorder`
--
ALTER TABLE `vtiger_salesorder`
 ADD PRIMARY KEY (`salesorderid`), ADD KEY `salesorder_vendorid_idx` (`vendorid`), ADD KEY `salesorder_contactid_idx` (`contactid`);

--
-- Indexes for table `vtiger_salesordercf`
--
ALTER TABLE `vtiger_salesordercf`
 ADD PRIMARY KEY (`salesorderid`);

--
-- Indexes for table `vtiger_salutationtype`
--
ALTER TABLE `vtiger_salutationtype`
 ADD PRIMARY KEY (`salutationid`);

--
-- Indexes for table `vtiger_scheduled_reports`
--
ALTER TABLE `vtiger_scheduled_reports`
 ADD PRIMARY KEY (`reportid`);

--
-- Indexes for table `vtiger_seactivityrel`
--
ALTER TABLE `vtiger_seactivityrel`
 ADD PRIMARY KEY (`crmid`,`activityid`), ADD KEY `seactivityrel_activityid_idx` (`activityid`), ADD KEY `seactivityrel_crmid_idx` (`crmid`);

--
-- Indexes for table `vtiger_seattachmentsrel`
--
ALTER TABLE `vtiger_seattachmentsrel`
 ADD PRIMARY KEY (`crmid`,`attachmentsid`), ADD KEY `seattachmentsrel_attachmentsid_idx` (`attachmentsid`), ADD KEY `seattachmentsrel_crmid_idx` (`crmid`), ADD KEY `seattachmentsrel_attachmentsid_crmid_idx` (`attachmentsid`,`crmid`);

--
-- Indexes for table `vtiger_selectcolumn`
--
ALTER TABLE `vtiger_selectcolumn`
 ADD PRIMARY KEY (`queryid`,`columnindex`), ADD KEY `selectcolumn_queryid_idx` (`queryid`);

--
-- Indexes for table `vtiger_selectquery`
--
ALTER TABLE `vtiger_selectquery`
 ADD PRIMARY KEY (`queryid`), ADD KEY `selectquery_queryid_idx` (`queryid`);

--
-- Indexes for table `vtiger_senotesrel`
--
ALTER TABLE `vtiger_senotesrel`
 ADD PRIMARY KEY (`crmid`,`notesid`), ADD KEY `senotesrel_notesid_idx` (`notesid`), ADD KEY `senotesrel_crmid_idx` (`crmid`);

--
-- Indexes for table `vtiger_seproductsrel`
--
ALTER TABLE `vtiger_seproductsrel`
 ADD PRIMARY KEY (`crmid`,`productid`), ADD KEY `seproductsrel_productid_idx` (`productid`), ADD KEY `seproductrel_crmid_idx` (`crmid`);

--
-- Indexes for table `vtiger_service`
--
ALTER TABLE `vtiger_service`
 ADD PRIMARY KEY (`serviceid`);

--
-- Indexes for table `vtiger_service_usageunit`
--
ALTER TABLE `vtiger_service_usageunit`
 ADD PRIMARY KEY (`service_usageunitid`);

--
-- Indexes for table `vtiger_servicecategory`
--
ALTER TABLE `vtiger_servicecategory`
 ADD PRIMARY KEY (`servicecategoryid`);

--
-- Indexes for table `vtiger_servicecf`
--
ALTER TABLE `vtiger_servicecf`
 ADD PRIMARY KEY (`serviceid`);

--
-- Indexes for table `vtiger_servicecontractscf`
--
ALTER TABLE `vtiger_servicecontractscf`
 ADD PRIMARY KEY (`servicecontractsid`);

--
-- Indexes for table `vtiger_seticketsrel`
--
ALTER TABLE `vtiger_seticketsrel`
 ADD PRIMARY KEY (`crmid`,`ticketid`), ADD KEY `seticketsrel_crmid_idx` (`crmid`), ADD KEY `seticketsrel_ticketid_idx` (`ticketid`);

--
-- Indexes for table `vtiger_settings_blocks`
--
ALTER TABLE `vtiger_settings_blocks`
 ADD PRIMARY KEY (`blockid`);

--
-- Indexes for table `vtiger_settings_field`
--
ALTER TABLE `vtiger_settings_field`
 ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `vtiger_sharedcalendar`
--
ALTER TABLE `vtiger_sharedcalendar`
 ADD PRIMARY KEY (`userid`,`sharedid`);

--
-- Indexes for table `vtiger_shippingtaxinfo`
--
ALTER TABLE `vtiger_shippingtaxinfo`
 ADD PRIMARY KEY (`taxid`), ADD KEY `shippingtaxinfo_taxname_idx` (`taxname`);

--
-- Indexes for table `vtiger_shorturls`
--
ALTER TABLE `vtiger_shorturls`
 ADD PRIMARY KEY (`id`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `vtiger_smsnotifier_servers`
--
ALTER TABLE `vtiger_smsnotifier_servers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_smsnotifier_status`
--
ALTER TABLE `vtiger_smsnotifier_status`
 ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `vtiger_smsnotifiercf`
--
ALTER TABLE `vtiger_smsnotifiercf`
 ADD PRIMARY KEY (`smsnotifierid`);

--
-- Indexes for table `vtiger_sobillads`
--
ALTER TABLE `vtiger_sobillads`
 ADD PRIMARY KEY (`sobilladdressid`);

--
-- Indexes for table `vtiger_soshipads`
--
ALTER TABLE `vtiger_soshipads`
 ADD PRIMARY KEY (`soshipaddressid`);

--
-- Indexes for table `vtiger_sostatus`
--
ALTER TABLE `vtiger_sostatus`
 ADD PRIMARY KEY (`sostatusid`), ADD UNIQUE KEY `sostatus_sostatus_idx` (`sostatus`);

--
-- Indexes for table `vtiger_sostatushistory`
--
ALTER TABLE `vtiger_sostatushistory`
 ADD PRIMARY KEY (`historyid`), ADD KEY `sostatushistory_salesorderid_idx` (`salesorderid`);

--
-- Indexes for table `vtiger_start_hour`
--
ALTER TABLE `vtiger_start_hour`
 ADD PRIMARY KEY (`start_hourid`);

--
-- Indexes for table `vtiger_status`
--
ALTER TABLE `vtiger_status`
 ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `vtiger_systems`
--
ALTER TABLE `vtiger_systems`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_tab`
--
ALTER TABLE `vtiger_tab`
 ADD PRIMARY KEY (`tabid`), ADD UNIQUE KEY `tab_name_idx` (`name`), ADD KEY `tab_modifiedby_idx` (`modifiedby`), ADD KEY `tab_tabid_idx` (`tabid`);

--
-- Indexes for table `vtiger_taskpriority`
--
ALTER TABLE `vtiger_taskpriority`
 ADD PRIMARY KEY (`taskpriorityid`);

--
-- Indexes for table `vtiger_taskstatus`
--
ALTER TABLE `vtiger_taskstatus`
 ADD PRIMARY KEY (`taskstatusid`);

--
-- Indexes for table `vtiger_taxclass`
--
ALTER TABLE `vtiger_taxclass`
 ADD PRIMARY KEY (`taxclassid`), ADD UNIQUE KEY `taxclass_carrier_idx` (`taxclass`);

--
-- Indexes for table `vtiger_ticketcategories`
--
ALTER TABLE `vtiger_ticketcategories`
 ADD PRIMARY KEY (`ticketcategories_id`);

--
-- Indexes for table `vtiger_ticketcf`
--
ALTER TABLE `vtiger_ticketcf`
 ADD PRIMARY KEY (`ticketid`);

--
-- Indexes for table `vtiger_ticketcomments`
--
ALTER TABLE `vtiger_ticketcomments`
 ADD PRIMARY KEY (`commentid`), ADD KEY `ticketcomments_ticketid_idx` (`ticketid`);

--
-- Indexes for table `vtiger_ticketpriorities`
--
ALTER TABLE `vtiger_ticketpriorities`
 ADD PRIMARY KEY (`ticketpriorities_id`);

--
-- Indexes for table `vtiger_ticketseverities`
--
ALTER TABLE `vtiger_ticketseverities`
 ADD PRIMARY KEY (`ticketseverities_id`);

--
-- Indexes for table `vtiger_ticketstatus`
--
ALTER TABLE `vtiger_ticketstatus`
 ADD PRIMARY KEY (`ticketstatus_id`);

--
-- Indexes for table `vtiger_time_zone`
--
ALTER TABLE `vtiger_time_zone`
 ADD PRIMARY KEY (`time_zoneid`);

--
-- Indexes for table `vtiger_tmp_read_group_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_group_rel_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`), ADD KEY `tmp_read_group_rel_sharing_per_userid_sharedgroupid_tabid` (`userid`,`sharedgroupid`,`tabid`);

--
-- Indexes for table `vtiger_tmp_read_group_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_group_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`sharedgroupid`), ADD KEY `tmp_read_group_sharing_per_userid_sharedgroupid_idx` (`userid`,`sharedgroupid`);

--
-- Indexes for table `vtiger_tmp_read_user_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_user_rel_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`shareduserid`), ADD KEY `tmp_read_user_rel_sharing_per_userid_shared_reltabid_idx` (`userid`,`shareduserid`,`relatedtabid`);

--
-- Indexes for table `vtiger_tmp_read_user_sharing_per`
--
ALTER TABLE `vtiger_tmp_read_user_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`shareduserid`), ADD KEY `tmp_read_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`);

--
-- Indexes for table `vtiger_tmp_write_group_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_group_rel_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`), ADD KEY `tmp_write_group_rel_sharing_per_userid_sharedgroupid_tabid_idx` (`userid`,`sharedgroupid`,`tabid`);

--
-- Indexes for table `vtiger_tmp_write_group_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_group_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`sharedgroupid`), ADD KEY `tmp_write_group_sharing_per_UK1` (`userid`,`sharedgroupid`);

--
-- Indexes for table `vtiger_tmp_write_user_rel_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_user_rel_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`shareduserid`), ADD KEY `tmp_write_user_rel_sharing_per_userid_sharduserid_tabid_idx` (`userid`,`shareduserid`,`tabid`);

--
-- Indexes for table `vtiger_tmp_write_user_sharing_per`
--
ALTER TABLE `vtiger_tmp_write_user_sharing_per`
 ADD PRIMARY KEY (`userid`,`tabid`,`shareduserid`), ADD KEY `tmp_write_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`);

--
-- Indexes for table `vtiger_tracker`
--
ALTER TABLE `vtiger_tracker`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_tracking_unit`
--
ALTER TABLE `vtiger_tracking_unit`
 ADD PRIMARY KEY (`tracking_unitid`);

--
-- Indexes for table `vtiger_troubletickets`
--
ALTER TABLE `vtiger_troubletickets`
 ADD PRIMARY KEY (`ticketid`), ADD KEY `troubletickets_ticketid_idx` (`ticketid`), ADD KEY `troubletickets_status_idx` (`status`);

--
-- Indexes for table `vtiger_usageunit`
--
ALTER TABLE `vtiger_usageunit`
 ADD PRIMARY KEY (`usageunitid`), ADD UNIQUE KEY `usageunit_usageunit_idx` (`usageunit`);

--
-- Indexes for table `vtiger_user2mergefields`
--
ALTER TABLE `vtiger_user2mergefields`
 ADD KEY `userid_tabid_idx` (`userid`,`tabid`);

--
-- Indexes for table `vtiger_user2role`
--
ALTER TABLE `vtiger_user2role`
 ADD PRIMARY KEY (`userid`), ADD KEY `user2role_roleid_idx` (`roleid`);

--
-- Indexes for table `vtiger_user_module_preferences`
--
ALTER TABLE `vtiger_user_module_preferences`
 ADD PRIMARY KEY (`userid`,`tabid`);

--
-- Indexes for table `vtiger_users`
--
ALTER TABLE `vtiger_users`
 ADD PRIMARY KEY (`id`), ADD KEY `user_user_name_idx` (`user_name`), ADD KEY `user_user_password_idx` (`user_password`);

--
-- Indexes for table `vtiger_users2group`
--
ALTER TABLE `vtiger_users2group`
 ADD PRIMARY KEY (`groupid`,`userid`), ADD KEY `users2group_groupname_uerid_idx` (`groupid`,`userid`);

--
-- Indexes for table `vtiger_users_last_import`
--
ALTER TABLE `vtiger_users_last_import`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_user_id` (`assigned_user_id`);

--
-- Indexes for table `vtiger_vendor`
--
ALTER TABLE `vtiger_vendor`
 ADD PRIMARY KEY (`vendorid`);

--
-- Indexes for table `vtiger_vendorcf`
--
ALTER TABLE `vtiger_vendorcf`
 ADD PRIMARY KEY (`vendorid`);

--
-- Indexes for table `vtiger_vendorcontactrel`
--
ALTER TABLE `vtiger_vendorcontactrel`
 ADD PRIMARY KEY (`vendorid`,`contactid`), ADD KEY `vendorcontactrel_vendorid_idx` (`vendorid`), ADD KEY `vendorcontactrel_contact_idx` (`contactid`);

--
-- Indexes for table `vtiger_version`
--
ALTER TABLE `vtiger_version`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_visibility`
--
ALTER TABLE `vtiger_visibility`
 ADD PRIMARY KEY (`visibilityid`), ADD UNIQUE KEY `visibility_visibility_idx` (`visibility`);

--
-- Indexes for table `vtiger_webforms`
--
ALTER TABLE `vtiger_webforms`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `webformname` (`name`), ADD UNIQUE KEY `publicid` (`id`), ADD KEY `webforms_webforms_id_idx` (`id`);

--
-- Indexes for table `vtiger_webforms_field`
--
ALTER TABLE `vtiger_webforms_field`
 ADD PRIMARY KEY (`id`), ADD KEY `webforms_webforms_field_idx` (`id`), ADD KEY `fk_1_vtiger_webforms_field` (`webformid`), ADD KEY `fk_2_vtiger_webforms_field` (`fieldname`);

--
-- Indexes for table `vtiger_wordtemplates`
--
ALTER TABLE `vtiger_wordtemplates`
 ADD PRIMARY KEY (`templateid`);

--
-- Indexes for table `vtiger_ws_entity`
--
ALTER TABLE `vtiger_ws_entity`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_ws_entity_fieldtype`
--
ALTER TABLE `vtiger_ws_entity_fieldtype`
 ADD PRIMARY KEY (`fieldtypeid`), ADD UNIQUE KEY `vtiger_idx_1_tablename_fieldname` (`table_name`,`field_name`);

--
-- Indexes for table `vtiger_ws_entity_name`
--
ALTER TABLE `vtiger_ws_entity_name`
 ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `vtiger_ws_entity_referencetype`
--
ALTER TABLE `vtiger_ws_entity_referencetype`
 ADD PRIMARY KEY (`fieldtypeid`,`type`);

--
-- Indexes for table `vtiger_ws_entity_tables`
--
ALTER TABLE `vtiger_ws_entity_tables`
 ADD PRIMARY KEY (`webservice_entity_id`,`table_name`);

--
-- Indexes for table `vtiger_ws_fieldinfo`
--
ALTER TABLE `vtiger_ws_fieldinfo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_ws_fieldtype`
--
ALTER TABLE `vtiger_ws_fieldtype`
 ADD PRIMARY KEY (`fieldtypeid`), ADD UNIQUE KEY `uitype_idx` (`uitype`);

--
-- Indexes for table `vtiger_ws_operation`
--
ALTER TABLE `vtiger_ws_operation`
 ADD PRIMARY KEY (`operationid`);

--
-- Indexes for table `vtiger_ws_operation_parameters`
--
ALTER TABLE `vtiger_ws_operation_parameters`
 ADD PRIMARY KEY (`operationid`,`name`);

--
-- Indexes for table `vtiger_ws_referencetype`
--
ALTER TABLE `vtiger_ws_referencetype`
 ADD PRIMARY KEY (`fieldtypeid`,`type`);

--
-- Indexes for table `vtiger_ws_userauthtoken`
--
ALTER TABLE `vtiger_ws_userauthtoken`
 ADD PRIMARY KEY (`userid`,`expiretime`), ADD UNIQUE KEY `userid_idx` (`userid`);

--
-- Indexes for table `vtiger_wsapp`
--
ALTER TABLE `vtiger_wsapp`
 ADD PRIMARY KEY (`appid`);

--
-- Indexes for table `vtiger_wsapp_recordmapping`
--
ALTER TABLE `vtiger_wsapp_recordmapping`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtiger_wsapp_sync_state`
--
ALTER TABLE `vtiger_wsapp_sync_state`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `com_vtiger_workflows`
--
ALTER TABLE `com_vtiger_workflows`
MODIFY `workflow_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `com_vtiger_workflowtasks`
--
ALTER TABLE `com_vtiger_workflowtasks`
MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `com_vtiger_workflowtemplates`
--
ALTER TABLE `com_vtiger_workflowtemplates`
MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_accountrating`
--
ALTER TABLE `vtiger_accountrating`
MODIFY `accountratingid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_accounttype`
--
ALTER TABLE `vtiger_accounttype`
MODIFY `accounttypeid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `vtiger_activity_reminder_popup`
--
ALTER TABLE `vtiger_activity_reminder_popup`
MODIFY `reminderid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_activity_view`
--
ALTER TABLE `vtiger_activity_view`
MODIFY `activity_viewid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_activitytype`
--
ALTER TABLE `vtiger_activitytype`
MODIFY `activitytypeid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_assetstatus`
--
ALTER TABLE `vtiger_assetstatus`
MODIFY `assetstatusid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_attachmentsfolder`
--
ALTER TABLE `vtiger_attachmentsfolder`
MODIFY `folderid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_calendarsharedtype`
--
ALTER TABLE `vtiger_calendarsharedtype`
MODIFY `calendarsharedtypeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_callduration`
--
ALTER TABLE `vtiger_callduration`
MODIFY `calldurationid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_campaignstatus`
--
ALTER TABLE `vtiger_campaignstatus`
MODIFY `campaignstatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_campaigntype`
--
ALTER TABLE `vtiger_campaigntype`
MODIFY `campaigntypeid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vtiger_carrier`
--
ALTER TABLE `vtiger_carrier`
MODIFY `carrierid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_contract_priority`
--
ALTER TABLE `vtiger_contract_priority`
MODIFY `contract_priorityid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_contract_status`
--
ALTER TABLE `vtiger_contract_status`
MODIFY `contract_statusid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_contract_type`
--
ALTER TABLE `vtiger_contract_type`
MODIFY `contract_typeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_convertleadmapping`
--
ALTER TABLE `vtiger_convertleadmapping`
MODIFY `cfmid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `vtiger_cron_task`
--
ALTER TABLE `vtiger_cron_task`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vtiger_currencies`
--
ALTER TABLE `vtiger_currencies`
MODIFY `currencyid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `vtiger_currency`
--
ALTER TABLE `vtiger_currency`
MODIFY `currencyid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_currency_decimal_separator`
--
ALTER TABLE `vtiger_currency_decimal_separator`
MODIFY `currency_decimal_separatorid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_currency_grouping_pattern`
--
ALTER TABLE `vtiger_currency_grouping_pattern`
MODIFY `currency_grouping_patternid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_currency_grouping_separator`
--
ALTER TABLE `vtiger_currency_grouping_separator`
MODIFY `currency_grouping_separatorid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_currency_info`
--
ALTER TABLE `vtiger_currency_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_currency_symbol_placement`
--
ALTER TABLE `vtiger_currency_symbol_placement`
MODIFY `currency_symbol_placementid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_date_format`
--
ALTER TABLE `vtiger_date_format`
MODIFY `date_formatid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_dayoftheweek`
--
ALTER TABLE `vtiger_dayoftheweek`
MODIFY `dayoftheweekid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vtiger_def_org_share`
--
ALTER TABLE `vtiger_def_org_share`
MODIFY `ruleid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `vtiger_default_record_view`
--
ALTER TABLE `vtiger_default_record_view`
MODIFY `default_record_viewid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_defaultactivitytype`
--
ALTER TABLE `vtiger_defaultactivitytype`
MODIFY `defaultactivitytypeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_defaulteventstatus`
--
ALTER TABLE `vtiger_defaulteventstatus`
MODIFY `defaulteventstatusid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_duration_minutes`
--
ALTER TABLE `vtiger_duration_minutes`
MODIFY `minutesid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_durationhrs`
--
ALTER TABLE `vtiger_durationhrs`
MODIFY `hrsid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_durationmins`
--
ALTER TABLE `vtiger_durationmins`
MODIFY `minsid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_emailtemplates`
--
ALTER TABLE `vtiger_emailtemplates`
MODIFY `templateid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vtiger_eventhandler_module`
--
ALTER TABLE `vtiger_eventhandler_module`
MODIFY `eventhandler_module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_eventhandlers`
--
ALTER TABLE `vtiger_eventhandlers`
MODIFY `eventhandler_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `vtiger_eventstatus`
--
ALTER TABLE `vtiger_eventstatus`
MODIFY `eventstatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_expectedresponse`
--
ALTER TABLE `vtiger_expectedresponse`
MODIFY `expectedresponseid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_faq`
--
ALTER TABLE `vtiger_faq`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `vtiger_faqcategories`
--
ALTER TABLE `vtiger_faqcategories`
MODIFY `faqcategories_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_faqcomments`
--
ALTER TABLE `vtiger_faqcomments`
MODIFY `commentid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_faqstatus`
--
ALTER TABLE `vtiger_faqstatus`
MODIFY `faqstatus_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_field`
--
ALTER TABLE `vtiger_field`
MODIFY `fieldid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=735;
--
-- AUTO_INCREMENT for table `vtiger_glacct`
--
ALTER TABLE `vtiger_glacct`
MODIFY `glacctid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `vtiger_hour_format`
--
ALTER TABLE `vtiger_hour_format`
MODIFY `hour_formatid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_import_maps`
--
ALTER TABLE `vtiger_import_maps`
MODIFY `id` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_industry`
--
ALTER TABLE `vtiger_industry`
MODIFY `industryid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `vtiger_inventorynotification`
--
ALTER TABLE `vtiger_inventorynotification`
MODIFY `notificationid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_inventoryproductrel`
--
ALTER TABLE `vtiger_inventoryproductrel`
MODIFY `lineitem_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_invoicestatus`
--
ALTER TABLE `vtiger_invoicestatus`
MODIFY `invoicestatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vtiger_invoicestatushistory`
--
ALTER TABLE `vtiger_invoicestatushistory`
MODIFY `historyid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_language`
--
ALTER TABLE `vtiger_language`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `vtiger_lead_view`
--
ALTER TABLE `vtiger_lead_view`
MODIFY `lead_viewid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_leadsource`
--
ALTER TABLE `vtiger_leadsource`
MODIFY `leadsourceid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vtiger_leadstage`
--
ALTER TABLE `vtiger_leadstage`
MODIFY `leadstageid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_leadstatus`
--
ALTER TABLE `vtiger_leadstatus`
MODIFY `leadstatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vtiger_loginhistory`
--
ALTER TABLE `vtiger_loginhistory`
MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `vtiger_mailscanner`
--
ALTER TABLE `vtiger_mailscanner`
MODIFY `scannerid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_mailscanner_actions`
--
ALTER TABLE `vtiger_mailscanner_actions`
MODIFY `actionid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_mailscanner_folders`
--
ALTER TABLE `vtiger_mailscanner_folders`
MODIFY `folderid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_mailscanner_rules`
--
ALTER TABLE `vtiger_mailscanner_rules`
MODIFY `ruleid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_manufacturer`
--
ALTER TABLE `vtiger_manufacturer`
MODIFY `manufacturerid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_mobile_alerts`
--
ALTER TABLE `vtiger_mobile_alerts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vtiger_module_dashboard_widgets`
--
ALTER TABLE `vtiger_module_dashboard_widgets`
MODIFY `id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `vtiger_no_of_currency_decimals`
--
ALTER TABLE `vtiger_no_of_currency_decimals`
MODIFY `no_of_currency_decimalsid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_notificationscheduler`
--
ALTER TABLE `vtiger_notificationscheduler`
MODIFY `schedulednotificationid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vtiger_opportunity_type`
--
ALTER TABLE `vtiger_opportunity_type`
MODIFY `opptypeid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_opportunitystage`
--
ALTER TABLE `vtiger_opportunitystage`
MODIFY `potstageid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_othereventduration`
--
ALTER TABLE `vtiger_othereventduration`
MODIFY `othereventdurationid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_picklist`
--
ALTER TABLE `vtiger_picklist`
MODIFY `picklistid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `vtiger_postatus`
--
ALTER TABLE `vtiger_postatus`
MODIFY `postatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_postatushistory`
--
ALTER TABLE `vtiger_postatushistory`
MODIFY `historyid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_potstagehistory`
--
ALTER TABLE `vtiger_potstagehistory`
MODIFY `historyid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_priority`
--
ALTER TABLE `vtiger_priority`
MODIFY `priorityid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_productcategory`
--
ALTER TABLE `vtiger_productcategory`
MODIFY `productcategoryid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_profile`
--
ALTER TABLE `vtiger_profile`
MODIFY `profileid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vtiger_progress`
--
ALTER TABLE `vtiger_progress`
MODIFY `progressid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `vtiger_projectmilestonetype`
--
ALTER TABLE `vtiger_projectmilestonetype`
MODIFY `projectmilestonetypeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_projectpriority`
--
ALTER TABLE `vtiger_projectpriority`
MODIFY `projectpriorityid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_projectstatus`
--
ALTER TABLE `vtiger_projectstatus`
MODIFY `projectstatusid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `vtiger_projecttaskpriority`
--
ALTER TABLE `vtiger_projecttaskpriority`
MODIFY `projecttaskpriorityid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_projecttaskprogress`
--
ALTER TABLE `vtiger_projecttaskprogress`
MODIFY `projecttaskprogressid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `vtiger_projecttaskstatus`
--
ALTER TABLE `vtiger_projecttaskstatus`
MODIFY `projecttaskstatusid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_projecttasktype`
--
ALTER TABLE `vtiger_projecttasktype`
MODIFY `projecttasktypeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_projecttype`
--
ALTER TABLE `vtiger_projecttype`
MODIFY `projecttypeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_quotestage`
--
ALTER TABLE `vtiger_quotestage`
MODIFY `quotestageid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_quotestagehistory`
--
ALTER TABLE `vtiger_quotestagehistory`
MODIFY `historyid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_rating`
--
ALTER TABLE `vtiger_rating`
MODIFY `rating_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_recurringevents`
--
ALTER TABLE `vtiger_recurringevents`
MODIFY `recurringid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_recurringtype`
--
ALTER TABLE `vtiger_recurringtype`
MODIFY `recurringeventid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vtiger_reminder_interval`
--
ALTER TABLE `vtiger_reminder_interval`
MODIFY `reminder_intervalid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vtiger_reportfolder`
--
ALTER TABLE `vtiger_reportfolder`
MODIFY `folderid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vtiger_rowheight`
--
ALTER TABLE `vtiger_rowheight`
MODIFY `rowheightid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_sales_stage`
--
ALTER TABLE `vtiger_sales_stage`
MODIFY `sales_stage_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `vtiger_salutationtype`
--
ALTER TABLE `vtiger_salutationtype`
MODIFY `salutationid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_service_usageunit`
--
ALTER TABLE `vtiger_service_usageunit`
MODIFY `service_usageunitid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_servicecategory`
--
ALTER TABLE `vtiger_servicecategory`
MODIFY `servicecategoryid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_shorturls`
--
ALTER TABLE `vtiger_shorturls`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_smsnotifier_servers`
--
ALTER TABLE `vtiger_smsnotifier_servers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_smsnotifier_status`
--
ALTER TABLE `vtiger_smsnotifier_status`
MODIFY `statusid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_sostatus`
--
ALTER TABLE `vtiger_sostatus`
MODIFY `sostatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_sostatushistory`
--
ALTER TABLE `vtiger_sostatushistory`
MODIFY `historyid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_start_hour`
--
ALTER TABLE `vtiger_start_hour`
MODIFY `start_hourid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `vtiger_status`
--
ALTER TABLE `vtiger_status`
MODIFY `statusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_taskpriority`
--
ALTER TABLE `vtiger_taskpriority`
MODIFY `taskpriorityid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_taskstatus`
--
ALTER TABLE `vtiger_taskstatus`
MODIFY `taskstatusid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vtiger_taxclass`
--
ALTER TABLE `vtiger_taxclass`
MODIFY `taxclassid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_ticketcategories`
--
ALTER TABLE `vtiger_ticketcategories`
MODIFY `ticketcategories_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vtiger_ticketcomments`
--
ALTER TABLE `vtiger_ticketcomments`
MODIFY `commentid` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_ticketpriorities`
--
ALTER TABLE `vtiger_ticketpriorities`
MODIFY `ticketpriorities_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_ticketseverities`
--
ALTER TABLE `vtiger_ticketseverities`
MODIFY `ticketseverities_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_ticketstatus`
--
ALTER TABLE `vtiger_ticketstatus`
MODIFY `ticketstatus_id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_time_zone`
--
ALTER TABLE `vtiger_time_zone`
MODIFY `time_zoneid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `vtiger_tracker`
--
ALTER TABLE `vtiger_tracker`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_tracking_unit`
--
ALTER TABLE `vtiger_tracking_unit`
MODIFY `tracking_unitid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vtiger_usageunit`
--
ALTER TABLE `vtiger_usageunit`
MODIFY `usageunitid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `vtiger_users`
--
ALTER TABLE `vtiger_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vtiger_users_last_import`
--
ALTER TABLE `vtiger_users_last_import`
MODIFY `id` int(36) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_version`
--
ALTER TABLE `vtiger_version`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_visibility`
--
ALTER TABLE `vtiger_visibility`
MODIFY `visibilityid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vtiger_webforms`
--
ALTER TABLE `vtiger_webforms`
MODIFY `id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_webforms_field`
--
ALTER TABLE `vtiger_webforms_field`
MODIFY `id` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_ws_entity`
--
ALTER TABLE `vtiger_ws_entity`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `vtiger_ws_entity_fieldtype`
--
ALTER TABLE `vtiger_ws_entity_fieldtype`
MODIFY `fieldtypeid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `vtiger_ws_fieldtype`
--
ALTER TABLE `vtiger_ws_fieldtype`
MODIFY `fieldtypeid` int(19) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `vtiger_ws_operation`
--
ALTER TABLE `vtiger_ws_operation`
MODIFY `operationid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `vtiger_ws_operation_parameters`
--
ALTER TABLE `vtiger_ws_operation_parameters`
MODIFY `operationid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `vtiger_wsapp`
--
ALTER TABLE `vtiger_wsapp`
MODIFY `appid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vtiger_wsapp_recordmapping`
--
ALTER TABLE `vtiger_wsapp_recordmapping`
MODIFY `id` int(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vtiger_wsapp_sync_state`
--
ALTER TABLE `vtiger_wsapp_sync_state`
MODIFY `id` int(19) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `vtiger_assets`
--
ALTER TABLE `vtiger_assets`
ADD CONSTRAINT `fk_1_vtiger_assets` FOREIGN KEY (`assetsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- 限制表 `vtiger_service`
--
ALTER TABLE `vtiger_service`
ADD CONSTRAINT `fk_1_vtiger_service` FOREIGN KEY (`serviceid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE;

--
-- 限制表 `vtiger_webforms_field`
--
ALTER TABLE `vtiger_webforms_field`
ADD CONSTRAINT `fk_1_vtiger_webforms_field` FOREIGN KEY (`webformid`) REFERENCES `vtiger_webforms` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `fk_3_vtiger_webforms_field` FOREIGN KEY (`fieldname`) REFERENCES `vtiger_field` (`fieldname`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
