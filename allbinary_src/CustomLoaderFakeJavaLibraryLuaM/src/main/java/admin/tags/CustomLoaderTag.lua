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
-- package admin.tags

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local AppUrlGlobals = require("org.allbinary.globals.AppUrlGlobals")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomLoaderTag = {}
CustomLoaderTag.__index = CustomLoaderTag
CustomLoaderTag.className = "CustomLoaderTag"
setmetatable(CustomLoaderTag, {__index = CustomTagSupport})

function CustomLoaderTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.command = nil
    self.webappPath = nil
end


function CustomLoaderTag.new()
    local self = setmetatable(CustomTagSupport.new(), CustomLoaderTag)
    self:_init_fields()
    return self
end


function CustomLoaderTag:setCommand(command)
        self.command = command
end


function CustomLoaderTag:setWebappPath(value)
        self.webappPath = value
end


-- throws LicensingException
function CustomLoaderTag:setCustomLoaderWebappPath()
        local try_ok, try_error = pcall(function()
            local urlGlobals = AppUrlGlobals.new()
            urlGlobals:setWebappPath(self.webappPath)
            self.URLGLOBALS:init(urlGlobals)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setCustomLoaderWebappPath()", e)
            end
        end
end


-- throws JspTagException
function CustomLoaderTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF(self.commonStrings.START, self, self.tagStrings.DO_START_TAG)
            end
            if self.command ~= nil then
                if ((self.command < self.GLOBALS2.SET and -1) or (self.command > self.GLOBALS2.SET and 1) or 0) == 0 then
                    self:setCustomLoaderWebappPath()
                end
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return CustomLoaderTag

