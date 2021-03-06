USE [ustep1]
GO
/****** Object:  Table [dbo].[tb_AdminToProjMan]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_AdminToProjMan](
	[ATPM_ID] [int] IDENTITY(1,1) NOT NULL,
	[ATPM_ProjectName] [nvarchar](200) NOT NULL,
	[ATPM_ChargeUserName] [nvarchar](20) NOT NULL,
	[ATPM_ProjectTips] [nvarchar](1000) NOT NULL,
	[ATPM_ProjectPath] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK__tb_Admin__B0D94408D4234669] PRIMARY KEY CLUSTERED 
(
	[ATPM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ApprovalStatus]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ApprovalStatus](
	[AS_ID] [int] IDENTITY(1,1) NOT NULL,
	[AS_TaskName] [nvarchar](100) NOT NULL,
	[AS_ProjectName] [nvarchar](100) NOT NULL,
	[AS_ApprovalOpinion] [nvarchar](20) NOT NULL,
	[AS_ApprovalState] [nvarchar](1000) NOT NULL,
	[AS_TaskFinishedEmployee] [nvarchar](50) NOT NULL,
	[AS_TaskChargerEmployee] [nvarchar](50) NOT NULL,
	[AS_TaskDeadLine] [datetime] NOT NULL,
	[AS_TaskFinishedTime] [datetime] NOT NULL,
 CONSTRAINT [PK__tb_Appro__E871DDCFCBDB07A1] PRIMARY KEY CLUSTERED 
(
	[AS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ComFiles]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ComFiles](
	[CF_ID] [int] IDENTITY(1,1) NOT NULL,
	[CF_FilesName] [nvarchar](50) NOT NULL,
	[CF_FilesPath] [nvarchar](100) NOT NULL,
	[CF_FilesClassify] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__tb_ComFi__A7C0CCE2A8022691] PRIMARY KEY CLUSTERED 
(
	[CF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ComSoftWare]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ComSoftWare](
	[CS_ID] [int] IDENTITY(1,1) NOT NULL,
	[CS_SoftName] [nvarchar](50) NOT NULL,
	[CS_SoftPath] [nvarchar](100) NOT NULL,
	[CS_SoftClassify] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__tb_ComSo__7415412630B324D5] PRIMARY KEY CLUSTERED 
(
	[CS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Department]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Department](
	[D_DepID] [int] IDENTITY(1,1) NOT NULL,
	[D_DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tb_Depar__309C772EB0A6EDCB] PRIMARY KEY CLUSTERED 
(
	[D_DepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_FilesClassify]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_FilesClassify](
	[FC_ID] [int] IDENTITY(1,1) NOT NULL,
	[FC_ClassifyName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__tb_Files__20E541921ED31921] PRIMARY KEY CLUSTERED 
(
	[FC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ProjectManage]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ProjectManage](
	[PM_ID] [int] IDENTITY(1,1) NOT NULL,
	[PM_ProjectName] [nvarchar](200) NOT NULL,
	[PM_TaskName] [nvarchar](50) NOT NULL,
	[PM_TaskRate] [nvarchar](10) NOT NULL,
	[PM_UserName] [nvarchar](20) NOT NULL,
	[PM_AttenderName] [nvarchar](20) NOT NULL,
	[PM_DeadLine] [datetime] NOT NULL,
	[PM_TaskDetails] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK__tb_Proje__8E8EC70BBBE33721] PRIMARY KEY CLUSTERED 
(
	[PM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ProjectName]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ProjectName](
	[P_ProjID] [int] IDENTITY(1,1) NOT NULL,
	[P_ProjectName] [nvarchar](200) NOT NULL,
	[P_ProjectFilesUrl] [nchar](200) NOT NULL,
 CONSTRAINT [PK__tb_Proje__452FCBC45A100486] PRIMARY KEY CLUSTERED 
(
	[P_ProjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_SoftsClassify]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SoftsClassify](
	[SC_ID] [int] IDENTITY(1,1) NOT NULL,
	[SC_ClassifyName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__tb_Softs__C402E49EBFB93103] PRIMARY KEY CLUSTERED 
(
	[SC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TaskStatus]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TaskStatus](
	[TS_ID] [int] IDENTITY(1,1) NOT NULL,
	[TS_TaskName] [nvarchar](100) NOT NULL,
	[TS_ProjectName] [nvarchar](100) NOT NULL,
	[TS_TaskStatusNow] [nvarchar](20) NOT NULL,
	[TS_SubmitTime] [datetime] NOT NULL,
	[TS_TaskEmployee] [nvarchar](50) NOT NULL,
	[TS_TaskState] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK__tb_TaskS__D128865AAD43D1C0] PRIMARY KEY CLUSTERED 
(
	[TS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_UserInfo]    Script Date: 2017/12/28 23:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_UserInfo](
	[U_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_UserName] [nvarchar](20) NOT NULL,
	[U_PassWord] [nvarchar](20) NOT NULL,
	[U_ChineseName] [nvarchar](50) NOT NULL,
	[U_Department] [nvarchar](50) NOT NULL,
	[U_Contact] [nvarchar](20) NOT NULL,
	[U_EmployDate] [datetime] NULL,
 CONSTRAINT [PK__tb_UserI__5A2040DB569E37AD] PRIMARY KEY CLUSTERED 
(
	[U_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tb_AdminToProjMan] ON 

INSERT [dbo].[tb_AdminToProjMan] ([ATPM_ID], [ATPM_ProjectName], [ATPM_ChargeUserName], [ATPM_ProjectTips], [ATPM_ProjectPath]) VALUES (1, N'测试项目2', N'测试人员2', N'请尽快安排项目进展！LooFor节点表示与请求URL匹配的路径正则，SendTo表示转换后的地址规则，$1表示LookFor正则中第一个括号匹配得到的值，$2表示LookFor正则中第二个括号匹配得到的值，熟悉正则的朋友都知道这个。', N'G:\webfiles\projectfies\测试文档1.docx                                                                                                                                                                      ')
INSERT [dbo].[tb_AdminToProjMan] ([ATPM_ID], [ATPM_ProjectName], [ATPM_ChargeUserName], [ATPM_ProjectTips], [ATPM_ProjectPath]) VALUES (2, N'测试项目1', N'测试人员1', N'a) 先想办法得到一个UrlRewriter.dll，通过http://download.microsoft.com/download/0/4/6/0463611e-a3f9-490d-a08c-877a83b797cf/MSDNURLRewriting.msi下载。下载得到的是一个用vs2003开发的源文件，可以用vs2008或者更高版本编译器转换后，生成解决方案，在bin目录中生成UrlRewriter.dll文件。
b) 新建一个网站项目，添加引用第一步产生的UrlRewriter.dll文件，添加Article.aspx、News.aspx页面。
c) 在Article.aspx后台代码中添加一行输出方法，代码如下：', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_AdminToProjMan] ([ATPM_ID], [ATPM_ProjectName], [ATPM_ChargeUserName], [ATPM_ProjectTips], [ATPM_ProjectPath]) VALUES (3, N'测试项目3', N'测试人员1', N'这个组件的原理和我们自定义HttpModule的原理一样，也是进入管道后拦截BeginRequest请求，然后将配置文件中的路径规则（正则表达式）引用过来，然后对请求的路径按正则进行替换成网站识别的路径。这个组件的核心代码(未翻译)如下：', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_AdminToProjMan] ([ATPM_ID], [ATPM_ProjectName], [ATPM_ChargeUserName], [ATPM_ProjectTips], [ATPM_ProjectPath]) VALUES (4, N'测试项目6', N'测试人员1', N'点击星星图片时提交表单，每颗星星传递不同的参数，比如从左到右第一颗星星传1，第二个星星传2……表单提交后，写入数据库就简单了', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
SET IDENTITY_INSERT [dbo].[tb_AdminToProjMan] OFF
SET IDENTITY_INSERT [dbo].[tb_ComFiles] ON 

INSERT [dbo].[tb_ComFiles] ([CF_ID], [CF_FilesName], [CF_FilesPath], [CF_FilesClassify]) VALUES (3, N'中国“山东省拟从明年1月1日起全面禁止赴韩旅游”', N'G:\webfiles\comfiles\PicoVRWindowsSDK_Unity开发说明文档1.7.0.pdf', N'文件测试分类1')
INSERT [dbo].[tb_ComFiles] ([CF_ID], [CF_FilesName], [CF_FilesPath], [CF_FilesClassify]) VALUES (4, N'两国领导人就推动中韩关系改善发展达成了许多重要共识', N'G:\webfiles\comfiles\Unity安装路径.txt', N'文件测试分类2')
INSERT [dbo].[tb_ComFiles] ([CF_ID], [CF_FilesName], [CF_FilesPath], [CF_FilesClassify]) VALUES (5, N'山东省20日召集青岛、烟台等地的旅行社开会', N'G:\webfiles\comfiles\勘探线剖面图从二维转化为三维算法.pdf', N'文件测试分类3')
INSERT [dbo].[tb_ComFiles] ([CF_ID], [CF_FilesName], [CF_FilesPath], [CF_FilesClassify]) VALUES (6, N'“有些媒体已经沦落为利益集团”“某些记者再次写这些没有经过确认的消息', N'G:\webfiles\comfiles\x86_64.meta', N'文件测试分类2')
SET IDENTITY_INSERT [dbo].[tb_ComFiles] OFF
SET IDENTITY_INSERT [dbo].[tb_ComSoftWare] ON 

INSERT [dbo].[tb_ComSoftWare] ([CS_ID], [CS_SoftName], [CS_SoftPath], [CS_SoftClassify]) VALUES (1, N'测试软件测试软件1', N'G:\webfiles\softwares\Anaconda2-4.4.0-Windows-x86_64.exe', N'软件分类测试1')
INSERT [dbo].[tb_ComSoftWare] ([CS_ID], [CS_SoftName], [CS_SoftPath], [CS_SoftClassify]) VALUES (2, N'测试软件测试软件2', N'G:\webfiles\softwares\pycharm-professional-2017.2.2.exe', N'软件分类测试2')
INSERT [dbo].[tb_ComSoftWare] ([CS_ID], [CS_SoftName], [CS_SoftPath], [CS_SoftClassify]) VALUES (3, N'测试软件测试软件3', N'G:\webfiles\softwares\blender_V2.7.8.0_windows_setup.msi', N'软件分类测试2')
INSERT [dbo].[tb_ComSoftWare] ([CS_ID], [CS_SoftName], [CS_SoftPath], [CS_SoftClassify]) VALUES (4, N'测试软件测试软件4', N'G:\webfiles\softwares\python-2.7.13.msi', N'软件分类测试3')
SET IDENTITY_INSERT [dbo].[tb_ComSoftWare] OFF
SET IDENTITY_INSERT [dbo].[tb_Department] ON 

INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (1, N'禹步南京-测试部门1')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (2, N'禹步南京-测试部门2')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (3, N'禹步南京-测试部门3')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (4, N'禹步南京-测试部门4')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (5, N'禹步南京-测试部门5')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (6, N'禹步南京-测试部门6')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (9, N'禹步南京-测试部门7')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (10, N'禹步南京-测试部门8')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (11, N'禹步南京-测试部门9')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (12, N'禹步南京-测试部门10')
INSERT [dbo].[tb_Department] ([D_DepID], [D_DepartmentName]) VALUES (13, N'禹步南京-测试部门11')
SET IDENTITY_INSERT [dbo].[tb_Department] OFF
SET IDENTITY_INSERT [dbo].[tb_FilesClassify] ON 

INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (1, N'文件测试分类1')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (2, N'文件测试分类2')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (3, N'文件测试分类3')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (4, N'文件测试分类4')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (5, N'文件测试分类5')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (6, N'文件测试分类6')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (7, N'文件测试分类7')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (8, N'文件测试分类8')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (9, N'文件测试分类9')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (10, N'文件测试分类10')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (11, N'文件测试分类11')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (12, N'文件测试分类12')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (13, N'文件测试分类13')
INSERT [dbo].[tb_FilesClassify] ([FC_ID], [FC_ClassifyName]) VALUES (14, N'文件测试分类14')
SET IDENTITY_INSERT [dbo].[tb_FilesClassify] OFF
SET IDENTITY_INSERT [dbo].[tb_ProjectManage] ON 

INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (1, N'测试项目1', N'测试任务1', N'2', N'测试人员1', N'测试人员2', CAST(N'2017-12-30 00:00:00.000' AS DateTime), N'有时候我们不但要把CheckBoxList的数据写入到数据库，还要把数据库的内容与CheckBoxList对应，让他显示上次我们选中的项，我是这么实现的：

比方说我们要给用户赋予不同的权限，那么我们数据库有Login,ProdClass两张表，那么我们在ProdClass表中插入一个字段UserID，下面是程序 ：')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (3, N'测试项目2', N'测试任务2', N'1', N'测试人员2', N'测试人员1', CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'在本例中，我们在 .aspx 文件中声明了一个 CheckBoxList 控件。然后我们为 SelectedIndexChanged 事件创建了一个事件句柄。这个可选列表包含六个复选框。当用户选中其中之一，页面会自动传回服务器，并执行 Check 子例程。该子例程会遍历控件的 Items 集合，并测试每个项目的 Selected 属性。被选的项目会显示在 Label 控件中。')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (4, N'测试项目3', N'2017-12-27测试', N'3', N'测试人员1', N'测试人员2', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'定义和用法
CheckBoxList 控件用于创建多选的复选框组。
每个 CheckBoxList 控件中的可选项都是由 ListItem 元素定义的！
提示：该控件支持数据绑定！')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (5, N'测试项目6', N'测试任务2-1', N'2', N'测试人员1', N'测试人员2', CAST(N'2017-12-26 00:00:00.000' AS DateTime), N'分数是由dataList中的Eval("Score")获得。看到过一些评级但是都用js做的，js能跟dataList中的数据绑定吗？不同星级的图片已经存在，现在只是想要一段完整的代码实现这个功能。')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (6, N'测试项目2', N'测试任务测试任务', N'1', N'测试人员2', N'测试人员1', CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'这个简写属性设置元素所有内边距的宽度，或者设置各边上内边距的宽度。行内非替换元素上设置的内边距不会影响行高计算；因此，如果一个元素既有内边距又有背景，从视觉上看可能会延伸到其他行，有可能还会与其他内容重叠。元素的背景会延伸穿过内边距。不允许指定负边距值。')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (7, N'测试项目6', N'测试任务2-1-1-0', N'2', N'测试人员1', N'测试人员2', CAST(N'2017-12-12 00:00:00.000' AS DateTime), N'画师画的vvSava沙发违法v无法哇方法')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (8, N'测试项目6', N'测试任务2-1-1-1', N'3', N'测试人员1', N'测试人员2', CAST(N'2018-01-06 00:00:00.000' AS DateTime), N'画师画的vvSava沙发违法v无法哇方法')
INSERT [dbo].[tb_ProjectManage] ([PM_ID], [PM_ProjectName], [PM_TaskName], [PM_TaskRate], [PM_UserName], [PM_AttenderName], [PM_DeadLine], [PM_TaskDetails]) VALUES (9, N'测试项目2', N'测试任务测试任务1-1-1', N'2', N'测试人员2', N'测试人员1', CAST(N'2018-01-04 00:00:00.000' AS DateTime), N'fa说法发生过发傻啥公司的八嘎三国杀')
SET IDENTITY_INSERT [dbo].[tb_ProjectManage] OFF
SET IDENTITY_INSERT [dbo].[tb_ProjectName] ON 

INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (1, N'测试项目1', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (2, N'测试项目2', N'E:\ustep\upload\test.csv                                                                                                                                                                                ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (3, N'测试项目3', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (4, N'测试项目4', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (5, N'测试项目5', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (6, N'测试项目6', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (7, N'测试项目7', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (8, N'测试项目8', N'E:\ustep\upload\testFile1.docx                                                                                                                                                                          ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (9, N'测试项目9', N'E:\ustep\upload\测试文档.txt                                                                                                                                                                                ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (10, N'测试项目10', N'E:\ustep\upload\测试文档1.docx                                                                                                                                                                              ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (12, N'测试项目11', N'G:\webfiles\projectfies\测试文档1.docx                                                                                                                                                                      ')
INSERT [dbo].[tb_ProjectName] ([P_ProjID], [P_ProjectName], [P_ProjectFilesUrl]) VALUES (13, N'测试项目12', N'G:\webfiles\projectfies\2017-07-13.py                                                                                                                                                                   ')
SET IDENTITY_INSERT [dbo].[tb_ProjectName] OFF
SET IDENTITY_INSERT [dbo].[tb_SoftsClassify] ON 

INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (1, N'软件分类测试1')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (2, N'软件分类测试2')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (3, N'软件分类测试3')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (4, N'软件分类测试4')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (5, N'软件分类测试5')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (6, N'软件分类测试6')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (7, N'软件分类测试7')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (8, N'软件分类测试8')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (9, N'软件分类测试9')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (10, N'软件分类测试10')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (11, N'软件分类测试11')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (12, N'软件分类测试12')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (13, N'软件分类测试13')
INSERT [dbo].[tb_SoftsClassify] ([SC_ID], [SC_ClassifyName]) VALUES (14, N'软件分类测试14')
SET IDENTITY_INSERT [dbo].[tb_SoftsClassify] OFF
SET IDENTITY_INSERT [dbo].[tb_TaskStatus] ON 

INSERT [dbo].[tb_TaskStatus] ([TS_ID], [TS_TaskName], [TS_ProjectName], [TS_TaskStatusNow], [TS_SubmitTime], [TS_TaskEmployee], [TS_TaskState]) VALUES (1, N'2017-12-27测试', N'测试项目3', N'进行中', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'测试人员1', N'load 事件里面下 
this.timer1.Interval = 1000;
this.timer1.Start();
timer1_Tick事件下写
label.Text = DateTime.Now.Second.ToString();
Application.DoEvents();')
INSERT [dbo].[tb_TaskStatus] ([TS_ID], [TS_TaskName], [TS_ProjectName], [TS_TaskStatusNow], [TS_SubmitTime], [TS_TaskEmployee], [TS_TaskState]) VALUES (2, N'测试任务2-1-1-0', N'测试项目6', N'待审批', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'测试人员1', N'该任务已按照要求完成，请审批')
INSERT [dbo].[tb_TaskStatus] ([TS_ID], [TS_TaskName], [TS_ProjectName], [TS_TaskStatusNow], [TS_SubmitTime], [TS_TaskEmployee], [TS_TaskState]) VALUES (3, N'测试任务1', N'测试项目1', N'未进行', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'测试人员1', N'目前正在研究相关方法，任务待进行')
INSERT [dbo].[tb_TaskStatus] ([TS_ID], [TS_TaskName], [TS_ProjectName], [TS_TaskStatusNow], [TS_SubmitTime], [TS_TaskEmployee], [TS_TaskState]) VALUES (4, N'测试任务测试任务', N'测试项目2', N'进行中', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'测试人员2', N'任务正在进行中，预估按时完成')
INSERT [dbo].[tb_TaskStatus] ([TS_ID], [TS_TaskName], [TS_ProjectName], [TS_TaskStatusNow], [TS_SubmitTime], [TS_TaskEmployee], [TS_TaskState]) VALUES (6, N'测试任务2-1-1-1', N'测试项目6', N'待审批', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'测试人员1', N'已完成全部工作，请审批')
INSERT [dbo].[tb_TaskStatus] ([TS_ID], [TS_TaskName], [TS_ProjectName], [TS_TaskStatusNow], [TS_SubmitTime], [TS_TaskEmployee], [TS_TaskState]) VALUES (7, N'测试任务2-1', N'测试项目6', N'进行中', CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'测试人员1', N'任务进行中，预计按期完成')
SET IDENTITY_INSERT [dbo].[tb_TaskStatus] OFF
SET IDENTITY_INSERT [dbo].[tb_UserInfo] ON 

INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (1, N'admin', N'admin', N'系统管理员', N'禹步信息-CEO', N'12131242101', CAST(N'2017-11-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (3, N'test1', N'123', N'测试人员1', N'禹步信息-程序组', N'11321214131', CAST(N'2017-12-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (4, N'test2', N'123', N'测试人员2', N'禹步信息-程序组', N'12321414141', CAST(N'2017-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (5, N'test3', N'123', N'测试人员3', N'禹步信息-程序组', N'211414141241', CAST(N'2017-12-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (6, N'test4', N'123', N'测试人员4', N'禹步信息-程序组', N'123414214412', CAST(N'2017-11-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (7, N'test5', N'1234', N'测试人员5', N'禹步信息-程序组', N'121431414219', CAST(N'2017-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (8, N'test6', N'1212412', N'测试人员6', N'禹步信息-美工组', N'13212421424', CAST(N'2017-11-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (9, N'test7', N'123124', N'测试人员7', N'禹步信息-美工组', N'12141412241', CAST(N'2017-12-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (10, N'test8', N'12321', N'测试人员8', N'禹步信息-美工组', N'131212414', CAST(N'2016-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (11, N'test9', N'123111', N'测试人员9', N'禹步信息-美工组', N'12312411111', CAST(N'2017-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_UserInfo] ([U_ID], [U_UserName], [U_PassWord], [U_ChineseName], [U_Department], [U_Contact], [U_EmployDate]) VALUES (12, N'test10', N'120088,./', N'测试人员10', N'禹步信息-美工组', N'1242141409', CAST(N'2017-12-10 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_UserInfo] OFF
