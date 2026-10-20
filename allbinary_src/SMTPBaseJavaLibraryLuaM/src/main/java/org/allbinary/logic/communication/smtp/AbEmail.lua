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

local AbEmail = {}
AbEmail.__index = AbEmail
AbEmail.className = "AbEmail"

function AbEmail:_init_fields()
    self.email = nil
end


function AbEmail.new(server, from, to, subject, textBody, htmlAttachment, contentBase)
    local self = setmetatable({}, AbEmail)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
            self.email = Email.new(from, to, subject, server, textBody, htmlAttachment, contentBase, true)
        else
            self.email = Email.new(from, to, subject, server, textBody, htmlAttachment, contentBase)
        end
    return self
end


function AbEmail:getMimeMessage()
        return self.email:getMimeMessage()
end


function AbEmail:getDebugInfo()
        return self.email:getDebugInfo()
end


-- throws Exception
function AbEmail:log()
        return self.email:log()
end


-- throws Exception
function AbEmail:toHashMap()
        return self.email:toHashMap()
end


-- throws Exception
function AbEmail:toXmlNode(document)
        return self.email:toXmlNode(document)
end


function AbEmail:getEmail()
        return self.email
end


-- throws Exception
function AbEmail:toXmlDoc()
        return self.email:toXmlDoc()
end

return AbEmail

