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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GroupFactory = {}
GroupFactory.__index = GroupFactory
GroupFactory.className = "GroupFactory"

function GroupFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NULL_GROUP_ARRAY = java_new_array(nil, 0)
    self.list = BasicArrayListD.new()
    self.index = 0
end

function GroupFactory.new()
    local self = setmetatable({}, GroupFactory)
    self:_init_fields()
    return self
end


function GroupFactory.getInstance()
        return GroupFactory.instance
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
        while size < groups do
            local name = stringUtil.EMPTY_STRING
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

GroupFactory.instance = GroupFactory.new()

return GroupFactory

