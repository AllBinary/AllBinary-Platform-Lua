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
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local AdminEmailInfo = require("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicTextEmailHelper = {}
BasicTextEmailHelper.__index = BasicTextEmailHelper
BasicTextEmailHelper.className = "BasicTextEmailHelper"
setmetatable(BasicTextEmailHelper, {__index = TagHelper})

function BasicTextEmailHelper:_init_fields()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.hashMap = nil
    self.pageContext = nil
end


function BasicTextEmailHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), BasicTextEmailHelper)
    self:_init_fields()
        self.pageContext = pageContext
        self.hashMap = hashMap
    return self
end


-- throws Exception
function BasicTextEmailHelper:send()
        local adminEmailSubject = self.hashMap:get("Subject")
        local adminEmailTextBody = self.hashMap:get("Body")
        local adminBasicEmailInfo = AdminEmailInfo.new(adminEmailSubject, adminEmailTextBody)
        local adminEmailInfo = EmailInfo.new(adminBasicEmailInfo)
        local adminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.INSTALLER)
        adminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.INSTALLER, adminEmailInfo)
end

return BasicTextEmailHelper

