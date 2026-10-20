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
-- package org.allbinary.logic.communication.smtp.info

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local EmailServerConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicEmailInfo = {}
BasicEmailInfo.__index = BasicEmailInfo
BasicEmailInfo.className = "BasicEmailInfo"

function BasicEmailInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.subject = nil
    self.textBody = nil
    self.emailServerConfigurationInterface = nil
end


function BasicEmailInfo.new(subject, textBody)
    local self = setmetatable({}, BasicEmailInfo)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self.subject = subject
        self.textBody = textBody
    return self
end


function BasicEmailInfo:getSubject()
        return self.subject
end


function BasicEmailInfo:getTextBody()
        return self.textBody
end


function BasicEmailInfo:getEmailServerConfigurationInterface()
        return self.emailServerConfigurationInterface
end


function BasicEmailInfo:setEmailServerConfigurationInterface(emailServerConfigurationInterface)
        self.emailServerConfigurationInterface = emailServerConfigurationInterface
end


function BasicEmailInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(self:getEmailServerConfigurationInterface()))
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append("Subject: \n")
        stringBuffer:append(self:getSubject())
        stringBuffer:append("\nText Body: \n")
        stringBuffer:append(self:getTextBody())
        return tostring(stringBuffer)
end
BasicEmailInfo.__tostring = function(self) return self:toString() end


-- throws Exception
function BasicEmailInfo:init()
        error(java_exception("RuntimeException"), 0)
end

return BasicEmailInfo

