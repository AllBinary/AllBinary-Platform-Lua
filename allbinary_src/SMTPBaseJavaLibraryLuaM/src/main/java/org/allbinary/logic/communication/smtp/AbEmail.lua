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

local AbEmail = {}
package.loaded["org.allbinary.logic.communication.smtp.AbEmail"] = AbEmail

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
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local EmailInterface = require("org.allbinary.logic.communication.smtp.EmailInterface")
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

-- class table AbEmail is declared before the requires
AbEmail.__index = AbEmail
AbEmail.className = "AbEmail"
AbEmail.javaClassName = "org.allbinary.logic.communication.smtp.AbEmail"
AbEmail.java_implements = " EmailInterface "
AbEmail.java_interfaces = function() return {EmailInterface} end

function AbEmail:_init_fields()
    if self.email == nil then self.email = nil end
end


function AbEmail._jinit(self, server, from, to, subject, textBody, htmlAttachment, contentBase)
    AbEmail._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
            self.email = Email.new(from, to, subject, server, textBody, htmlAttachment, contentBase, true)
        else
            self.email = Email.new(from, to, subject, server, textBody, htmlAttachment, contentBase)
        end
    return self
end

function AbEmail.new(...)
    local self = setmetatable({}, AbEmail)
    AbEmail._jinit(self, ...)
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

