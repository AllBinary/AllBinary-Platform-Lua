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

local ContextConfigurationInterface = require("org.allbinary.business.context.configuration.ContextConfigurationInterface")
local AdminConfiguration = require("org.allbinary.business.user.modules.admin.configuration.AdminConfiguration")
local AdminConfigurationInterface = require("org.allbinary.business.user.modules.admin.configuration.AdminConfigurationInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local EmailServerConfigurationInterface = require("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdminEmailInfo = {}
AdminEmailInfo.__index = AdminEmailInfo
AdminEmailInfo.className = "AdminEmailInfo"
setmetatable(AdminEmailInfo, {__index = BasicEmailInfo})

function AdminEmailInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AdminEmailInfo.new(subject, textBody)
    local self = setmetatable(BasicEmailInfo.new(subject, textBody), AdminEmailInfo)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self:init()
    return self
end


-- throws Exception
function AdminEmailInfo:init()
        local adminConfigurationInterface = AdminConfiguration.new()
        local contextConfigurationInterface = adminConfigurationInterface:getContextConfigurationInterface()
        local emailServerConfigurationInterface = contextConfigurationInterface:getEmailServerConfigurationInterface()
        self:setEmailServerConfigurationInterface(emailServerConfigurationInterface)
end

return AdminEmailInfo

