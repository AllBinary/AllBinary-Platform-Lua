--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local HelperFactory = require("admin.taghelpers.HelperFactory")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ViewHelperFactory = {}
ViewHelperFactory.__index = ViewHelperFactory
ViewHelperFactory.className = "ViewHelperFactory"


function ViewHelperFactory.new()
    local self = setmetatable({}, ViewHelperFactory)
    return self
end


-- throws Exception, LicensingException
function ViewHelperFactory:getInstance(propertiesHashMap, pageContext)
        return HelperFactory.getInstance(ViewHelperFactory.FACTORYNAME, ViewHelperFactory.CLASSNAME, propertiesHashMap, pageContext)
end

ViewHelperFactory.CLASSNAME = "taghelpers.ViewHelper"
ViewHelperFactory.FACTORYNAME = "taghelpers.ViewHelperFactory"

return ViewHelperFactory

