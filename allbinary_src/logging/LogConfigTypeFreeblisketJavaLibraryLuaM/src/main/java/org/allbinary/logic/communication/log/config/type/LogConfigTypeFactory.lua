-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.log.config.type

local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogConfigTypeFactory = {}
LogConfigTypeFactory.__index = LogConfigTypeFactory
LogConfigTypeFactory.className = "LogConfigTypeFactory"

function LogConfigTypeFactory:_init_fields()
    self.NO_DESCRIPTION = "No Description"
    self.AUTHENTICATION = LogConfigType.new("Authentication", self.NO_DESCRIPTION)
    self.AUTHENTICATIONERROR = LogConfigType.new("Authentication Error", self.NO_DESCRIPTION)
    self.CATEGORY = LogConfigType.new("Category", self.NO_DESCRIPTION)
    self.CATEGORYERROR = LogConfigType.new("Category Error", self.NO_DESCRIPTION)
    self.CRYPT = LogConfigType.new("Crypt", self.NO_DESCRIPTION)
    self.CRYPTERROR = LogConfigType.new("Crypt Error", self.NO_DESCRIPTION)
    self.EMAILLOGGING = LogConfigType.new("Email", self.NO_DESCRIPTION)
    self.EMAILLOGGINGERROR = LogConfigType.new("Email Error", self.NO_DESCRIPTION)
    self.ENTITYFACTORYERROR = LogConfigType.new("Entity Factory Error", self.NO_DESCRIPTION)
    self.NETBEANS_MODULE = LogConfigType.new("NetBeans Module", self.NO_DESCRIPTION)
    self.NETBEANS_MODULE_ERROR = LogConfigType.new("NetBeans Module Error", self.NO_DESCRIPTION)
    self.FACTORYERROR = LogConfigType.new("General Factory Error", self.NO_DESCRIPTION)
    self.FILE = LogConfigType.new("File", self.NO_DESCRIPTION)
    self.FILEERROR = LogConfigType.new("File Error", self.NO_DESCRIPTION)
    self.HTTP = LogConfigType.new("HTTP", self.NO_DESCRIPTION)
    self.HTTPERROR = LogConfigType.new("HTTP Error", self.NO_DESCRIPTION)
    self.HTTPREQUEST = LogConfigType.new("Http Request", self.NO_DESCRIPTION)
    self.HTTPREQUESTERROR = LogConfigType.new("Http Request Error", self.NO_DESCRIPTION)
    self.IDLOGGING = LogConfigType.new("ID Logging", self.NO_DESCRIPTION)
    self.JSPEXTRAOUTPUT = LogConfigType.new("JSP Extra Output", self.NO_DESCRIPTION)
    self.JSPTAGEXTRAOUTPUT = LogConfigType.new("JSP Tag Extra Output", self.NO_DESCRIPTION)
    self.JSPTAG = LogConfigType.new("JSP Tag", self.NO_DESCRIPTION)
    self.JSPTAGERROR = LogConfigType.new("JSP Tag Error", self.NO_DESCRIPTION)
    self.LICENSING = LogConfigType.new("Licensing", self.NO_DESCRIPTION)
    self.LICENSINGERROR = LogConfigType.new("Licensing Error", self.NO_DESCRIPTION)
    self.LOADER = LogConfigType.new("Loader", self.NO_DESCRIPTION)
    self.LOADERERROR = LogConfigType.new("Loader Error", self.NO_DESCRIPTION)
    self.OS = LogConfigType.new("OS", self.NO_DESCRIPTION)
    self.OSERROR = LogConfigType.new("OS Error", self.NO_DESCRIPTION)
    self.PAYMENT = LogConfigType.new("Payment", self.NO_DESCRIPTION)
    self.PAYMENTERROR = LogConfigType.new("Payment Error", self.NO_DESCRIPTION)
    self.PRELOADER = LogConfigType.new("PreLoader", self.NO_DESCRIPTION)
    self.PRELOADERERROR = LogConfigType.new("PreLoader Error", self.NO_DESCRIPTION)
    self.PRODUCTSEARCHLOGGING = LogConfigType.new("Product Search Logging", self.NO_DESCRIPTION)
    self.PRODUCTSEARCHLOGGINGERROR = LogConfigType.new("Product Search Logging Error", self.NO_DESCRIPTION)
    self.SERVLET = LogConfigType.new("Servlet", self.NO_DESCRIPTION)
    self.SERVLETERROR = LogConfigType.new("Servlet Error", self.NO_DESCRIPTION)
    self.SHIPPINGERROR = LogConfigType.new("Shipping Error", self.NO_DESCRIPTION)
    self.SQLLOGGINGERROR = LogConfigType.new("SQL Error", self.NO_DESCRIPTION)
    self.SQLLOGGING = LogConfigType.new("SQL Logging", self.NO_DESCRIPTION)
    self.SQLTAGS = LogConfigType.new("SQL Tag Logging", self.NO_DESCRIPTION)
    self.SQLTAGSERROR = LogConfigType.new("SQL Tag Error", self.NO_DESCRIPTION)
    self.STYLE = LogConfigType.new("Style", self.NO_DESCRIPTION)
    self.STYLEERROR = LogConfigType.new("Style Error", self.NO_DESCRIPTION)
    self.TAGHELPER = LogConfigType.new("Tag Helper", self.NO_DESCRIPTION)
    self.TAGHELPERERROR = LogConfigType.new("Tag Helper Error", self.NO_DESCRIPTION)
    self.TAGHELPERFACTORY = LogConfigType.new("Tag Helper Factory", self.NO_DESCRIPTION)
    self.TAGHELPERFACTORYERROR = LogConfigType.new("Tag Helper Factory Error", self.NO_DESCRIPTION)
    self.TAX = LogConfigType.new("Tax", self.NO_DESCRIPTION)
    self.TAXERROR = LogConfigType.new("Tax Error", self.NO_DESCRIPTION)
    self.VALIDATION = LogConfigType.new("Validation", self.NO_DESCRIPTION)
    self.VALIDATIONERROR = LogConfigType.new("Validation Error", self.NO_DESCRIPTION)
    self.VIEW = LogConfigType.new("View", self.NO_DESCRIPTION)
    self.VIEWERROR = LogConfigType.new("View Error", self.NO_DESCRIPTION)
    self.VIEWFACTORYERROR = LogConfigType.new("View Factory Error", self.NO_DESCRIPTION)
    self.WORKFLOW = LogConfigType.new("Workflow", self.NO_DESCRIPTION)
    self.WORKFLOWERROR = LogConfigType.new("Workflow Error", self.NO_DESCRIPTION)
    self.XMLLOGGING = LogConfigType.new("XML Logging", self.NO_DESCRIPTION)
    self.XMLLOGGINGERROR = LogConfigType.new("XML Logging Error", self.NO_DESCRIPTION)
    self.XSLLOGGING = LogConfigType.new("XSL Logging", self.NO_DESCRIPTION)
    self.XSLLOGGINGERROR = LogConfigType.new("XSL Logging Error", self.NO_DESCRIPTION)
    self.REPLACE = LogConfigType.new("Replace", self.NO_DESCRIPTION)
    self.REPLACE_INFO = LogConfigType.new("Replace Info", self.NO_DESCRIPTION)
    self.REPLACEERROR = LogConfigType.new("Replace Error", self.NO_DESCRIPTION)
    self.SQLLOGGINGPOOL = LogConfigType.new("SQL Pool", self.NO_DESCRIPTION)
    self.SQLLOGGINGPOOLERROR = LogConfigType.new("SQL Pool Error", self.NO_DESCRIPTION)
    self.STATICPAGEGENERATIONLOGGING = LogConfigType.new("Static Page Generation Logging", self.NO_DESCRIPTION)
    self.STATICPAGEGENERATIONLOGGINGERROR = LogConfigType.new("Static Page Generation Logging Error", self.NO_DESCRIPTION)
end


function LogConfigTypeFactory.getInstance()
        return LogConfigTypeFactory.instance
end


function LogConfigTypeFactory.new()
    local self = setmetatable({}, LogConfigTypeFactory)
    self:_init_fields()
        PreLogUtil.put("FreeBlisket", self, CommonStrings.getInstance().CONSTRUCTOR)
    return self
end

LogConfigTypeFactory.instance = LogConfigTypeFactory.new()

return LogConfigTypeFactory

