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
-- package org.allbinary.logic.java.help

local JavaHelpSetNotifier = {}
package.loaded["org.allbinary.logic.java.help.JavaHelpSetNotifier"] = JavaHelpSetNotifier

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

-- local URL = require("java.net.URL")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HelpSet = require("javax.help.HelpSet")

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

-- class table JavaHelpSetNotifier is declared before the requires
JavaHelpSetNotifier.__index = JavaHelpSetNotifier
JavaHelpSetNotifier.className = "JavaHelpSetNotifier"
JavaHelpSetNotifier.javaClassName = "org.allbinary.logic.java.help.JavaHelpSetNotifier"


function JavaHelpSetNotifier._jinit(self)
    return self
end

function JavaHelpSetNotifier.new(...)
    local self = setmetatable({}, JavaHelpSetNotifier)
    JavaHelpSetNotifier._jinit(self, ...)
    return self
end


function JavaHelpSetNotifier.get()
        return JavaHelpSetNotifier.vector
end


function JavaHelpSetNotifier.isNotified(helpSet)
        local isNotified = false
        local url = helpSet:getHelpSetURL()
        local size = JavaHelpSetNotifier.vector:size()
        local urlArray = JavaHelpSetNotifier.vector:toArray()
        for i = 0, size - 1 do
            local nextURL = urlArray[i + 1]
            if ((tostring(url) < tostring(nextURL) and -1) or (tostring(url) > tostring(nextURL) and 1) or 0) == 0 then
                isNotified = true
            end
        end
        JavaHelpSetNotifier.vector:add(url)
        return isNotified
end

JavaHelpSetNotifier.vector = BasicArrayListD.new()

return JavaHelpSetNotifier

