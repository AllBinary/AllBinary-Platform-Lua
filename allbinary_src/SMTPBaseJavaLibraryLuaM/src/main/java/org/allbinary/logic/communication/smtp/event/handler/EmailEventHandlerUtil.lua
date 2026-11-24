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
-- package org.allbinary.logic.communication.smtp.event.handler

local EmailEventHandlerUtil = {}
package.loaded["org.allbinary.logic.communication.smtp.event.handler.EmailEventHandlerUtil"] = EmailEventHandlerUtil

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local UserConfigurationInterface = java_lazy("org.allbinary.business.user.modules.configuration.UserConfigurationInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface")
local UserEmailEventsConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface")
local UserEmailEventListenerInterface = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local LogUserEmailEventListenerModule = java_lazy("org.allbinary.logic.communication.smtp.event.modules.log.LogUserEmailEventListenerModule")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local UserEmailEventHandler = java_lazy("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")

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

-- class table EmailEventHandlerUtil is declared before the requires
EmailEventHandlerUtil.__index = EmailEventHandlerUtil
EmailEventHandlerUtil.className = "EmailEventHandlerUtil"
EmailEventHandlerUtil.javaClassName = "org.allbinary.logic.communication.smtp.event.handler.EmailEventHandlerUtil"

function EmailEventHandlerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function EmailEventHandlerUtil.getInstance()
        return EmailEventHandlerUtil.instance_f
end


function EmailEventHandlerUtil._jinit(self)
    EmailEventHandlerUtil._init_fields(self)
    return self
end

function EmailEventHandlerUtil.new(...)
    local self = setmetatable({}, EmailEventHandlerUtil)
    EmailEventHandlerUtil._jinit(self, ...)
    return self
end


-- throws Exception
function EmailEventHandlerUtil:getEventHandler(abeClientInformation, userEmailEventNameData, userVector)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Returning UserEmailEventHandler for ")
            stringBuffer:appendint(userVector:size())
            stringBuffer:append(" users.")
            self.logUtil:putF(tostring(stringBuffer), self, "getEventHandler")
        end
        local userEmailEventHandler = UserEmailEventHandler.new()
        userEmailEventHandler:addListener(LogUserEmailEventListenerModule.new())
        local size = userVector:size()
        for index = 0, size - 1 do
            local userInterface = userVector:get(index)
            local vector = EmailEventHandlerUtil.getUserEmailEventListenerVector(abeClientInformation, userEmailEventNameData, userInterface)
            userEmailEventHandler:addListener(vector)
        end
        return userEmailEventHandler
end


-- throws Exception
function EmailEventHandlerUtil.getUserEmailEventListenerVector(abeClientInformation, userEmailEventNameData, userInterface)
        local userConfigurationInterface = userInterface:getUserConfigurationInterface()
        local userEmailConfigurationInterface = userConfigurationInterface:getUserEmailConfigurationInterface()
        local userEmailEventsConfigurationInterface = userEmailConfigurationInterface:getUserEmailEventsConfigurationInterface()
        local userEmailEventListenerInterface = userEmailEventsConfigurationInterface:getEventListener(abeClientInformation, userEmailEventNameData, userInterface)
        local vector = BasicArrayListD.new()
        vector:add(userEmailEventListenerInterface)
        return vector
end

EmailEventHandlerUtil.instance_f = EmailEventHandlerUtil.new()

return EmailEventHandlerUtil

