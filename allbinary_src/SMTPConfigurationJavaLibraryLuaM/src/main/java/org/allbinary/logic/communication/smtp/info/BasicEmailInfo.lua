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

local BasicEmailInfo = {}
package.loaded["org.allbinary.logic.communication.smtp.info.BasicEmailInfo"] = BasicEmailInfo

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local EmailServerConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicEmailInfo is declared before the requires
BasicEmailInfo.__index = BasicEmailInfo
BasicEmailInfo.className = "BasicEmailInfo"
BasicEmailInfo.javaClassName = "org.allbinary.logic.communication.smtp.info.BasicEmailInfo"

function BasicEmailInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.subject == nil then self.subject = nil end
    if self.textBody == nil then self.textBody = nil end
    if self.emailServerConfigurationInterface == nil then self.emailServerConfigurationInterface = nil end
end


function BasicEmailInfo._jinit(self, subject, textBody)
    BasicEmailInfo._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self.subject = subject
        self.textBody = textBody
    return self
end

function BasicEmailInfo.new(...)
    local self = setmetatable({}, BasicEmailInfo)
    BasicEmailInfo._jinit(self, ...)
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
        error(require("java.lang.RuntimeException").new(), 0)
end

return BasicEmailInfo

