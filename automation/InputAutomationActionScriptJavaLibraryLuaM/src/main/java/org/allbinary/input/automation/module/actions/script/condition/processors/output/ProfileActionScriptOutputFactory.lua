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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

local ProfileActionScriptOutputFactory = {}
package.loaded["org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputFactory"] = ProfileActionScriptOutputFactory

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

local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local Node = java_lazy("org.w3c.dom.Node")
local ImageActionScriptOutput = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput")
local ImageActionScriptOutputData = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputData")
local ProfileActionScriptOutputInterface = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputInterface")

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

-- class table ProfileActionScriptOutputFactory is declared before the requires
ProfileActionScriptOutputFactory.__index = ProfileActionScriptOutputFactory
ProfileActionScriptOutputFactory.className = "ProfileActionScriptOutputFactory"
ProfileActionScriptOutputFactory.javaClassName = "org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputFactory"


function ProfileActionScriptOutputFactory._jinit(self)
    return self
end

function ProfileActionScriptOutputFactory.new(...)
    local self = setmetatable({}, ProfileActionScriptOutputFactory)
    ProfileActionScriptOutputFactory._jinit(self, ...)
    return self
end


-- throws Exception
function ProfileActionScriptOutputFactory.getInstance(node)
        local profileActionScriptOutputInterface = nil
        if DomSearchHelper.getNodeNoThrow(ImageActionScriptOutputData.NAME, node:getChildNodes()) ~= nil then
            profileActionScriptOutputInterface = ImageActionScriptOutput.new(node)
        else
            error(require("java.lang.Exception").new("No Such ActionScript Output"), 0)
        end
        return profileActionScriptOutputInterface
end

return ProfileActionScriptOutputFactory

