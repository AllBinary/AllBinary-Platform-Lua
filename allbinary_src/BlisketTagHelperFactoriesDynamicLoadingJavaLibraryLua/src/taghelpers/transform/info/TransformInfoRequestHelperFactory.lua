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
-- package taghelpers.transform.info

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")
local HelperFactory = require("admin.taghelpers.HelperFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoRequestHelperFactory = {}
TransformInfoRequestHelperFactory.__index = TransformInfoRequestHelperFactory
TransformInfoRequestHelperFactory.className = "TransformInfoRequestHelperFactory"


function TransformInfoRequestHelperFactory.new()
    local self = setmetatable({}, TransformInfoRequestHelperFactory)
    return self
end


-- throws LicensingException
function TransformInfoRequestHelperFactory:getInstance(hashMap, pageContext)
        return HelperFactory.getInstance(TransformInfoRequestHelperFactory.FACTORYNAME, TransformInfoRequestHelperFactory.CLASSNAME, hashMap, pageContext)
end

TransformInfoRequestHelperFactory.CLASSNAME = "taghelpers.transform.info.TransformInfoRequestHelper"
TransformInfoRequestHelperFactory.FACTORYNAME = "TransformInfoRequestHelperFactory"

return TransformInfoRequestHelperFactory

