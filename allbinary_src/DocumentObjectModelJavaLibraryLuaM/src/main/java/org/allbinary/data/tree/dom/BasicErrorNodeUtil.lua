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
-- package org.allbinary.data.tree.dom

local BasicErrorNodeUtil = {}
package.loaded["org.allbinary.data.tree.dom.BasicErrorNodeUtil"] = BasicErrorNodeUtil

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

local ErrorData = java_lazy("org.allbinary.business.error.ErrorData")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table BasicErrorNodeUtil is declared before the requires
BasicErrorNodeUtil.__index = BasicErrorNodeUtil
BasicErrorNodeUtil.className = "BasicErrorNodeUtil"
BasicErrorNodeUtil.javaClassName = "org.allbinary.data.tree.dom.BasicErrorNodeUtil"


function BasicErrorNodeUtil._jinit(self)
    return self
end

function BasicErrorNodeUtil.new(...)
    local self = setmetatable({}, BasicErrorNodeUtil)
    BasicErrorNodeUtil._jinit(self, ...)
    return self
end


-- throws Exception
function BasicErrorNodeUtil.get(document, errorText)
        local try_ok, try_error, try_value = pcall(function()
            local node = document:createElement(ErrorData.getInstance().NAME)
            node:appendChild(ModDomHelper.createNameValueNodes(document, ErrorData.getInstance().TEXT, errorText))
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(require("java.lang.Exception").new("Error Node Creation Failure"), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return BasicErrorNodeUtil

