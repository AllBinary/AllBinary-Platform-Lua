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
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompositeGroup = {}
CompositeGroup.__index = CompositeGroup
CompositeGroup.className = "CompositeGroup"

function CompositeGroup:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.groupInterface = nil
    self.list = BasicArrayListD.new()
end


function CompositeGroup.new(groupInterface)
    local self = setmetatable({}, CompositeGroup)
    self:_init_fields()
        self.groupInterface = groupInterface
    return self
end


function CompositeGroup:clear()
        self.list:clear()
end


function CompositeGroup:add(groupInterface)
        local commonStrings = CommonStrings.getInstance()
        local groupCommonFactory = GroupCommonFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(groupCommonFactory.ADDING_LABEL)
        stringBuffer:append(tostring(groupInterface))
        stringBuffer:append(groupCommonFactory.TO_LABEL)
        stringBuffer:append(StringUtil.getInstance():toString(self.groupInterface))
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.ADD)
        self.list:add(groupInterface)
end


function CompositeGroup:isInGroup(groupInterface)
        if self.list:contains(groupInterface) then
            return true
        else
            return false
        end
end


function CompositeGroup:getGroup()
        return self.groupInterface
end

return CompositeGroup

