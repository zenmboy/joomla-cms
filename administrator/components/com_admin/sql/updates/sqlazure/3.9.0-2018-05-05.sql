SET IDENTITY_INSERT #__extensions  ON;

INSERT INTO [#__extensions] ([extension_id], [package_id], [name], [type], [element], [folder], [client_id], [enabled], [access], [protected], [manifest_cache], [params], [custom_data], [system_data], [checked_out], [checked_out_time], [ordering], [state]) VALUES
(36, 0, 'com_userlogs', 'component', 'com_userlogs', '', 1, 1, 1, 1, '', '', '', '', 0, '1900-01-01 00:00:00', 0, 0),
(482, 0, 'plg_system_userlogs', 'plugin', 'userlogs', 'system', 0, 0, 1, 0, '', '{"logDeletePeriod":"0"}', '', '', 0, '1900-01-01 00:00:00', 0, 0),
(483, 0, 'plg_actionlogs_joomla', 'plugin', 'joomla', 'actionlogs', 0, 1, 1, 0, '', '{}', '', '', 0, '1900-01-01 00:00:00', 0, 0);

SET IDENTITY_INSERT #__extensions  OFF;

/****** Object:  Table [#__user_logs] ******/
SET QUOTED_IDENTIFIER ON;

CREATE TABLE [#__user_logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message_language_key] [nvarchar](255) NOT NULL DEFAULT '',
	[message] [nvarchar](max) NOT NULL DEFAULT '',
	[log_date] [datetime] NOT NULL DEFAULT '1900-01-01 00:00:00',
	[extension] [nvarchar](255) NOT NULL DEFAULT '',
	[user_id] [bigint] NOT NULL DEFAULT 0,
	[ip_address] [nvarchar](30) NOT NULL DEFAULT '0.0.0.0',
	CONSTRAINT [PK_#__user_logs_id] PRIMARY KEY CLUSTERED
 (
 	[id] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 ) ON [PRIMARY];

/****** Object:  Table [#__user_logs_extensions] ******/
SET QUOTED_IDENTIFIER ON;

CREATE TABLE [#__user_logs_extensions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[extension] [nvarchar](255) NOT NULL DEFAULT '',
	CONSTRAINT [PK_#__user_logs_extensions_id] PRIMARY KEY CLUSTERED
 (
 	[id] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 ) ON [PRIMARY];
SET IDENTITY_INSERT [#__user_logs_extensions]  ON;
INSERT INTO [#__user_logs_extensions] ([id], [extension])
SELECT 1, 'com_banners'
UNION ALL
SELECT 2, 'com_cache'
UNION ALL
SELECT 3, 'com_categories'
UNION ALL
SELECT 4, 'com_config'
UNION ALL
SELECT 5, 'com_contact'
UNION ALL
SELECT 6, 'com_content'
UNION ALL
SELECT 7, 'com_installer'
UNION ALL
SELECT 8, 'com_media'
UNION ALL
SELECT 9, 'com_menus'
UNION ALL
SELECT 10, 'com_messages'
UNION ALL
SELECT 11, 'com_modules'
UNION ALL
SELECT 12, 'com_newsfeeds'
UNION ALL
SELECT 13, 'com_plugins'
UNION ALL
SELECT 14, 'com_redirect'
UNION ALL
SELECT 15, 'com_tags'
UNION ALL
SELECT 16, 'com_templates'
UNION ALL
SELECT 17, 'com_users';

SET IDENTITY_INSERT [#__user_logs_extensions]  OFF;
/****** Object:  Table [#__user_logs_tables_data] ******/
SET QUOTED_IDENTIFIER ON;

CREATE TABLE [#__user_logs_tables_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_title] [nvarchar](255) NOT NULL DEFAULT '',
	[type_alias] [nvarchar](255) NOT NULL DEFAULT '',
	[title_holder] [nvarchar](255) NULL,
	[table_values] [nvarchar](255) NULL
	CONSTRAINT [PK_#__user_logs_tables_data_id] PRIMARY KEY CLUSTERED
 (
 	[id] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 ) ON [PRIMARY];

SET IDENTITY_INSERT [#__user_logs_tables_data]  ON;

INSERT INTO [#__user_logs_tables_data] ([id], [type_title], [type_alias], [id_holder], [title_holder], [table_name], [text_prefix])
SELECT 1, 'article', 'com_content.article', 'id' ,'title' , '#__content', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 2, 'article', 'com_content.form', 'id', 'title' , '#__content', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 3, 'banner', 'com_banners.banner', 'id' ,'name' , '#__banners', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 4, 'user_note', 'com_users.note', 'id', 'subject' ,'#__user_notes', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 5, 'media', 'com_media.file', '' , 'name' , '',  'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 6, 'category', 'com_categories.category', 'id' , 'title' , '#__categories', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 7, 'menu', 'com_menus.menu', 'id' ,'title' , '#__menu_types', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 8, 'menu_item', 'com_menus.item', 'id' , 'title' , '#__menu', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id' ,'name' , '#__newsfeeds', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 10, 'link', 'com_redirect.link', 'id', 'old_url' , '__redirect_links', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 11, 'tag', 'com_tags.tag', 'id', 'title' , '#__tags', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 12, 'style', 'com_templates.style', 'id' , 'title' , '#__template_styles', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 13, 'plugin', 'com_plugins.plugin', 'extension_id' , 'name' , '#__extensions', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 14, 'component_config', 'com_config.component', 'extension_id' , 'name', '', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 16, 'module', 'com_modules.module', 'id' ,'title', '#__modules', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 17, 'access_level', 'com_users.level', 'id' , 'title', '#__viewlevels', 'PLG_SYSTEM_USERLOGS'
UNION ALL
SELECT 18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_SYSTEM_USERLOGS';

SET IDENTITY_INSERT [#__user_logs_tables_data]  OFF;
