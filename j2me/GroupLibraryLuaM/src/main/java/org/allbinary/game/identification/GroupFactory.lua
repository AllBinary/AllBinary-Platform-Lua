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

local GroupFactory = {}
package.loaded["org.allbinary.game.identification.GroupFactory"] = GroupFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Group = java_lazy("org.allbinary.game.identification.Group")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table GroupFactory is declared before the requires
GroupFactory.__index = GroupFactory
GroupFactory.className = "GroupFactory"
GroupFactory.javaClassName = "org.allbinary.game.identification.GroupFactory"

function GroupFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NULL_GROUP_ARRAY = java_new_array(nil, 0)
    self.list = BasicArrayListD.new()
    self.index = 0
end

function GroupFactory._jinit(self)
    GroupFactory._init_fields(self)
    return self
end

function GroupFactory.new()
    return GroupFactory._jinit(setmetatable({}, GroupFactory))
end


function GroupFactory.getInstance()
        return GroupFactory.instance_f
end


function GroupFactory:getNextGroup()
        local group = self.list.objectArray[self.index + 1]
        self.index = self.index + 1
        return group
end


function GroupFactory:getNextGroupByName(name)
        local group = self:getNextGroup()
        group:setName(name)
        return group
end


function GroupFactory:init(groups, nameArray)
        local stringMaker = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        local TEAM = "Team "
        self.list:clear()
        self.index = 0
        local size = self.list:size()
        local name = nil
        while size < groups do
            name = stringUtil.EMPTY_STRING
            if size < (nameArray.n or #nameArray) then
                name = nameArray[size + 1]
            else
                stringMaker:delete(0, stringMaker:length())
                name = tostring(stringMaker:append(TEAM):appendint(size))
            end
            self.list:add(Group.new(name, (size + 3)))
            size = size + 1
        end
end

GroupFactory.instance_f = GroupFactory.new()

return GroupFactory

