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
-- package org.allbinary.business.init

local InitInfo2 = {}
package.loaded["org.allbinary.business.init.InitInfo2"] = InitInfo2

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

local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")

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

-- class table InitInfo2 is declared before the requires
InitInfo2.__index = InitInfo2
InitInfo2.className = "InitInfo2"
InitInfo2.javaClassName = "org.allbinary.business.init.InitInfo2"

function InitInfo2:_init_fields()
    self.directory = Directory.getInstance()
end

function InitInfo2._jinit(self)
    InitInfo2._init_fields(self)
    return self
end

function InitInfo2.new()
    return InitInfo2._jinit(setmetatable({}, InitInfo2))
end


function InitInfo2.getInstance()
        return InitInfo2.instance_f
end


function InitInfo2:isTestHtmlPathValid(value)
        return self.directory:create(value)
end


function InitInfo2:isMainPathValid(value)
        return self.directory:create(value)
end

InitInfo2.instance_f = InitInfo2.new()

return InitInfo2

