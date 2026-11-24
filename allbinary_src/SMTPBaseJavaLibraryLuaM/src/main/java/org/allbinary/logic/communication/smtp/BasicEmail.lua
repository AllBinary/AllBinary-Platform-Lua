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

local BasicEmail = {}
package.loaded["org.allbinary.logic.communication.smtp.BasicEmail"] = BasicEmail

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

local HashMap = java_lazy("java.util.HashMap")
-- local MimeMessage = require("javax.mail.internet.MimeMessage")
local BasicEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.EmailInfo")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local EmailInterface = require("org.allbinary.logic.communication.smtp.EmailInterface")
local AbEmail = java_lazy("org.allbinary.logic.communication.smtp.AbEmail")
local Email = java_lazy("org.allbinary.logic.communication.smtp.Email")

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

-- class table BasicEmail is declared before the requires
BasicEmail.__index = BasicEmail
BasicEmail.className = "BasicEmail"
BasicEmail.javaClassName = "org.allbinary.logic.communication.smtp.BasicEmail"
BasicEmail.java_implements = " EmailInterface "
BasicEmail.java_interfaces = function() return {EmailInterface} end

function BasicEmail:_init_fields()
    if self.email == nil then self.email = nil end
end


function BasicEmail._jinit(self, emailInfo, to)
    BasicEmail._init_fields(self)
        local basicEmailInfo = emailInfo:getBasicEmailInfo()
        self.email = AbEmail.new(basicEmailInfo:getEmailServerConfigurationInterface():getSmtpServer(), basicEmailInfo:getEmailServerConfigurationInterface():getAccountName(), to, basicEmailInfo:getSubject(), basicEmailInfo:getTextBody(), emailInfo:getHtmlAttachment(), emailInfo:getContentBase())
    return self
end

function BasicEmail.new(...)
    local self = setmetatable({}, BasicEmail)
    BasicEmail._jinit(self, ...)
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

