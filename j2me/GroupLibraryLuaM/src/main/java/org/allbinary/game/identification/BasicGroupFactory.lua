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
-- package org.allbinary.game.identification

local BasicGroupFactory = {}
package.loaded["org.allbinary.game.identification.BasicGroupFactory"] = BasicGroupFactory

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
local Group = java_lazy("org.allbinary.game.identification.Group")

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

-- class table BasicGroupFactory is declared before the requires
BasicGroupFactory.__index = BasicGroupFactory
BasicGroupFactory.className = "BasicGroupFactory"
BasicGroupFactory.javaClassName = "org.allbinary.game.identification.BasicGroupFactory"

function BasicGroupFactory:_init_fields()
    self.NAME = "GROUP_NAME"
    self.NO_SUCH_GROUP = "No Such Group: "
    self.GOOD = Group.new("Good Guys", 0)
    self.ENEMY = Group.new("Bad Guys", 1)
    self.ENEMY_ON_LEVEL = Group.new("Bad Guys on Level", 2)
    self.NONE = Group.new("Not On A Team", 3)
    self.GOOD_ARRAY = {self.GOOD}
    self.ENEMY_ARRAY = {self.ENEMY}
    self.ENEMY_ON_LEVEL_ARRAY = {self.ENEMY, self.ENEMY_ON_LEVEL}
    self.NONE_ARRAY = {self.NONE}
end

function BasicGroupFactory._jinit(self)
    BasicGroupFactory._init_fields(self)
    return self
end

function BasicGroupFactory.new()
    return BasicGroupFactory._jinit(setmetatable({}, BasicGroupFactory))
end


function BasicGroupFactory.getInstance()
        if rawequal(BasicGroupFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            BasicGroupFactory.instance_f = BasicGroupFactory.new()
        end
        return BasicGroupFactory.instance_f
end

BasicGroupFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return BasicGroupFactory

