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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local GroupInterface = require("org.allbinary.game.identification.GroupInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Group = {}
Group.__index = Group
Group.className = "Group"

function Group:_init_fields()
    self.name = StringUtil.getInstance().EMPTY_STRING
    self.teamId = nil
    self.string = StringUtil.getInstance().EMPTY_STRING
end


function Group.new(teamName, teamId)
    local self = setmetatable({}, Group)
    self:_init_fields()
        self.teamId = teamId
        self:setName(teamName)
    return self
end


function Group:getGroupName()
        return self.name
end


function Group:setName(name)
        self.name = name
        local groupCommonFactory = GroupCommonFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(groupCommonFactory.GROUP_NAME_LABEL)
        stringBuffer:append(self.name)
        stringBuffer:append(groupCommonFactory.ID_LABEL)
        stringBuffer:appendshort(self.teamId)
        self.string = tostring(stringBuffer)
end


function Group:getGroupId()
        return self.teamId
end


function Group:toString()
        return self.string
end
Group.__tostring = function(self) return self:toString() end

return Group

