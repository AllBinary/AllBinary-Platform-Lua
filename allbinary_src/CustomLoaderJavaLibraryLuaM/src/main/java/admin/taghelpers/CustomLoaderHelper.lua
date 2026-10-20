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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AppUrlGlobals = require("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local CustomLoaderHelper = {}
CustomLoaderHelper.__index = CustomLoaderHelper
CustomLoaderHelper.className = "CustomLoaderHelper"

function CustomLoaderHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function CustomLoaderHelper.new(...)
    local count = select("#", ...)
    if count == 2 then return CustomLoaderHelper._new2(...)
    elseif count == 0 then return CustomLoaderHelper._new0(...)
    end
end


function CustomLoaderHelper._new2(hashMap, pageContext)
    local self = setmetatable({}, CustomLoaderHelper)
    self:_init_fields()
    return self
end


function CustomLoaderHelper._new0()
    local self = setmetatable({}, CustomLoaderHelper)
    self:_init_fields()
    return self
end


-- throws Exception
function CustomLoaderHelper:getWebappPath()
        local try_ok, try_error = pcall(function()
            return org.allbinary.globals.URLGLOBALS:getWebappPath()
        end)
        if not try_ok then
            local e = try_error
            return nil
        end
end


-- throws Exception
function CustomLoaderHelper:setWebappPath(path)
        local try_ok, try_error = pcall(function()
            local urlGlobals = AppUrlGlobals.new()
            urlGlobals:setWebappPath(path)
            self.URLGLOBALS:init(urlGlobals)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setWebappPath()", e)
            end
        end
end

return CustomLoaderHelper

