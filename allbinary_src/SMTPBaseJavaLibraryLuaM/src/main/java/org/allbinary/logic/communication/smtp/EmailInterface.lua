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

-- local MimeMessage = require("javax.mail.internet.MimeMessage")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomDocumentMappingInterface = require("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local EmailInterface = {}
EmailInterface.__index = EmailInterface
EmailInterface.className = "EmailInterface"
setmetatable(EmailInterface, {__index = DomNodeInterface})


function EmailInterface:getDebugInfo()
    error("abstract method getDebugInfo")
end


function EmailInterface:getMimeMessage()
    error("abstract method getMimeMessage")
end


-- throws Exception
function EmailInterface:log()
    error("abstract method log")
end

return EmailInterface

