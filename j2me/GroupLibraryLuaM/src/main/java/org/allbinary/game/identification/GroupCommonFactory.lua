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
-- package org.allbinary.game.identification

local GroupCommonFactory = {}
package.loaded["org.allbinary.game.identification.GroupCommonFactory"] = GroupCommonFactory

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")

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

-- class table GroupCommonFactory is declared before the requires
GroupCommonFactory.__index = GroupCommonFactory
GroupCommonFactory.className = "GroupCommonFactory"
GroupCommonFactory.javaClassName = "org.allbinary.game.identification.GroupCommonFactory"

function GroupCommonFactory:_init_fields()
    self.ID = SmallIntegerSingletonFactory.getInstance():getAt(10)
    self.GROUP_NAME_LABEL = "Group Name: "
    self.ID_LABEL = " Id: "
    self.ADDING_LABEL = "Adding: "
    self.TO_LABEL = " to: "
end

function GroupCommonFactory._jinit(self)
    GroupCommonFactory._init_fields(self)
    return self
end

function GroupCommonFactory.new()
    return GroupCommonFactory._jinit(setmetatable({}, GroupCommonFactory))
end


function GroupCommonFactory.getInstance()
        if GroupCommonFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            GroupCommonFactory.instance_f = GroupCommonFactory.new()
        end
        return GroupCommonFactory.instance_f
end

GroupCommonFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return GroupCommonFactory

