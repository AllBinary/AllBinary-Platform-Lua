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

local Group = {}
package.loaded["org.allbinary.game.identification.Group"] = Group

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local GroupInterface = require("org.allbinary.game.identification.GroupInterface")
local GroupCommonFactory = java_lazy("org.allbinary.game.identification.GroupCommonFactory")

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

-- class table Group is declared before the requires
Group.__index = Group
Group.className = "Group"
Group.javaClassName = "org.allbinary.game.identification.Group"
Group.java_implements = " GroupInterface "
Group.java_interfaces = function() return {GroupInterface} end

function Group:_init_fields()
    self.name_f = StringUtil.getInstance().EMPTY_STRING
    if self.teamId == nil then self.teamId = 0 end
    self.string_ = StringUtil.getInstance().EMPTY_STRING
end


function Group._jinit(self, teamName, teamId)
    Group._init_fields(self)
        self.teamId = teamId
        self:setName(teamName)
    return self
end

function Group.new(...)
    local self = setmetatable({}, Group)
    Group._jinit(self, ...)
    return self
end


function Group:getGroupName()
        return self.name_f
end


function Group:setName(name)
        self.name_f = name
        local groupCommonFactory = GroupCommonFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(groupCommonFactory.GROUP_NAME_LABEL)
        stringBuffer:append(self.name_f)
        stringBuffer:append(groupCommonFactory.ID_LABEL)
        stringBuffer:appendshort(self.teamId)
        self.string_ = tostring(stringBuffer)
end


function Group:getGroupId()
        return self.teamId
end


function Group:toString()
        return self.string_
end
Group.__tostring = function(self) return self:toString() end

return Group

