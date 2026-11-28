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

local EmailsNotUsed = {}
package.loaded["org.allbinary.logic.communication.smtp.EmailsNotUsed"] = EmailsNotUsed

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
local BasicErrorNodeUtil = java_lazy("org.allbinary.data.tree.dom.BasicErrorNodeUtil")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local Email = java_lazy("org.allbinary.logic.communication.smtp.Email")
local EmailData = java_lazy("org.allbinary.logic.communication.smtp.EmailData")

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

-- class table EmailsNotUsed is declared before the requires
EmailsNotUsed.__index = EmailsNotUsed
EmailsNotUsed.className = "EmailsNotUsed"
EmailsNotUsed.javaClassName = "org.allbinary.logic.communication.smtp.EmailsNotUsed"
EmailsNotUsed.java_implements = " DomNodeInterface "
EmailsNotUsed.java_interfaces = function() return {DomNodeInterface} end

function EmailsNotUsed:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.emailInfoVector == nil then self.emailInfoVector = nil end
end


function EmailsNotUsed._jinit(self)
    EmailsNotUsed._init_fields(self)
        self.emailInfoVector = BasicArrayListD.new()
    return self
end

function EmailsNotUsed.new(...)
    local self = setmetatable({}, EmailsNotUsed)
    EmailsNotUsed._jinit(self, ...)
    return self
end


-- throws Exception
function EmailsNotUsed:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENT) then
                self.logUtil:putF(self.commonStrings.START, self, "toXmlNode")
            end
            local node = document:createElement(EmailData.NAME)
            local size = self.emailInfoVector:size()
            for index = 0, size - 1 do
                local email = self.emailInfoVector:get(index)
                local emailNode = email:toXmlNode(document)
                if not rawequal(emailNode, nil) then
                    node:appendChild(emailNode)
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENT) then
                self.logUtil:putF(self.commonStrings.END, self, "toXmlNode()")
            end
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode()", e)
            end
            local error = "Error Processing Order.  Please contact us if error persists.<p/>"
            return BasicErrorNodeUtil.get(document, error)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return EmailsNotUsed

