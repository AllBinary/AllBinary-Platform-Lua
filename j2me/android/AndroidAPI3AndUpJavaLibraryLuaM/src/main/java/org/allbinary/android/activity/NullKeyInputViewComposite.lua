-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.android.activity

local NullKeyInputViewComposite = {}
package.loaded["org.allbinary.android.activity.NullKeyInputViewComposite"] = NullKeyInputViewComposite

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

local View = java_lazy("android.view.View")
local KeyInputViewCompositeInterface = require("org.allbinary.android.activity.KeyInputViewCompositeInterface")

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

-- class table NullKeyInputViewComposite is declared before the requires
NullKeyInputViewComposite.__index = NullKeyInputViewComposite
NullKeyInputViewComposite.className = "NullKeyInputViewComposite"
NullKeyInputViewComposite.javaClassName = "org.allbinary.android.activity.NullKeyInputViewComposite"
NullKeyInputViewComposite.java_implements = " KeyInputViewCompositeInterface "
NullKeyInputViewComposite.java_interfaces = function() return {KeyInputViewCompositeInterface} end

function NullKeyInputViewComposite._jinit(self)
    return self
end

function NullKeyInputViewComposite.new()
    return NullKeyInputViewComposite._jinit(setmetatable({}, NullKeyInputViewComposite))
end


function NullKeyInputViewComposite:setKeyInputView(keyInputView)
end


function NullKeyInputViewComposite:getRootView()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullKeyInputViewComposite:getView()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullKeyInputViewComposite:runOnUiThread(action)
end

NullKeyInputViewComposite.NULL_KEY_INPUT_VIEW_COMPOSITE = NullKeyInputViewComposite.new()

return NullKeyInputViewComposite

