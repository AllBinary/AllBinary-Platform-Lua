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
-- package org.allbinary.logic.communication.smtp

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicErrorNodeUtil = require("org.allbinary.data.tree.dom.BasicErrorNodeUtil")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EmailsNotUsed = {}
EmailsNotUsed.__index = EmailsNotUsed
EmailsNotUsed.className = "EmailsNotUsed"

function EmailsNotUsed:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.emailInfoVector = nil
end


function EmailsNotUsed.new()
    local self = setmetatable({}, EmailsNotUsed)
    self:_init_fields()
        self.emailInfoVector = BasicArrayListD.new()
    return self
end


-- throws Exception
function EmailsNotUsed:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
                self.logUtil:putF(self.commonStrings.START, self, "toXmlNode")
            end
            local node = document:createElement(EmailData.NAME)
            local size = self.emailInfoVector:size()
            for index = 0, size - 1 do
                local email = self.emailInfoVector:get(index)
                local emailNode = email:toXmlNode(document)
                if emailNode ~= nil then
                    node:appendChild(emailNode)
                end
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
                self.logUtil:putF(self.commonStrings.END, self, "toXmlNode()")
            end
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode()", e)
            end
            local error = "Error Processing Order.  Please contact us if error persists.<p/>"
            return BasicErrorNodeUtil.get(document, error)
        end
end

return EmailsNotUsed

