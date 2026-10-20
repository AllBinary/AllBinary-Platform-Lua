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
-- package org.allbinary.logic.communication.smtp.event.handler.factory

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local EmailEventHandlerUtil = require("org.allbinary.logic.communication.smtp.event.handler.EmailEventHandlerUtil")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
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

local AdminUserEmailEventHandlerSingletons = {}
AdminUserEmailEventHandlerSingletons.__index = AdminUserEmailEventHandlerSingletons
AdminUserEmailEventHandlerSingletons.className = "AdminUserEmailEventHandlerSingletons"

function AdminUserEmailEventHandlerSingletons:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.userEmailEventHandlerHashMap = StdUtil.getInstance():createHashMap()
end


function AdminUserEmailEventHandlerSingletons.getInstance()
        return AdminUserEmailEventHandlerSingletons.instance
end


function AdminUserEmailEventHandlerSingletons.new()
    local self = setmetatable({}, AdminUserEmailEventHandlerSingletons)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AdminUserEmailEventHandlerSingletons:getInstance(abeClientInformation, userEmailEventNameData)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.GET_INSTANCE)
        end
        local userEmailEventHandler = self.userEmailEventHandlerHashMap:get(userEmailEventNameData)
        if userEmailEventHandler == nil then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Creating New Named UserEmailEventHandler", self, self.commonStrings.GET_INSTANCE)
            end
            local userVector = UserEntityFactory.getInstance():getAdministrators()
            local newUserEmailEventHandler = EmailEventHandlerUtil.getInstance():getEventHandler(abeClientInformation, userEmailEventNameData, userVector)
            self.userEmailEventHandlerHashMap:put(userEmailEventNameData, newUserEmailEventHandler)
            return newUserEmailEventHandler
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Returning existing UserEmailEventHandler", self, self.commonStrings.GET_INSTANCE)
            end
            return userEmailEventHandler
        end
end

AdminUserEmailEventHandlerSingletons.instance = AdminUserEmailEventHandlerSingletons.new()

return AdminUserEmailEventHandlerSingletons

