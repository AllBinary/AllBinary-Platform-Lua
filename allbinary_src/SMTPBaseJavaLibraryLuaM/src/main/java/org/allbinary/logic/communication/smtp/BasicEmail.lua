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

-- local HashMap = require("java.util.HashMap")
-- local MimeMessage = require("javax.mail.internet.MimeMessage")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local EmailInterface = require("org.allbinary.logic.communication.smtp.EmailInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicEmail = {}
BasicEmail.__index = BasicEmail
BasicEmail.className = "BasicEmail"

function BasicEmail:_init_fields()
    self.email = nil
end


function BasicEmail.new(emailInfo, to)
    local self = setmetatable({}, BasicEmail)
    self:_init_fields()
        local basicEmailInfo = emailInfo:getBasicEmailInfo()
        self.email = AbEmail.new(basicEmailInfo:getEmailServerConfigurationInterface():getSmtpServer(), basicEmailInfo:getEmailServerConfigurationInterface():getAccountName(), to, basicEmailInfo:getSubject(), basicEmailInfo:getTextBody(), emailInfo:getHtmlAttachment(), emailInfo:getContentBase())
    return self
end


function BasicEmail:getEmail()
        return self.email:getEmail()
end


function BasicEmail:getMimeMessage()
        return self.email:getMimeMessage()
end


function BasicEmail:getDebugInfo()
        return self.email:getDebugInfo()
end


-- throws Exception
function BasicEmail:log()
        return self.email:log()
end


-- throws Exception
function BasicEmail:toHashMap()
        return self.email:toHashMap()
end


-- throws Exception
function BasicEmail:toXmlNode(document)
        return self.email:toXmlNode(document)
end


-- throws Exception
function BasicEmail:toXmlDoc()
        return self.email:toXmlDoc()
end

return BasicEmail

