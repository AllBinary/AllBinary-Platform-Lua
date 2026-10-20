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

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGroupFactory = {}
BasicGroupFactory.__index = BasicGroupFactory
BasicGroupFactory.className = "BasicGroupFactory"

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

function BasicGroupFactory.new()
    local self = setmetatable({}, BasicGroupFactory)
    self:_init_fields()
    return self
end


function BasicGroupFactory.getInstance()
        if BasicGroupFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            BasicGroupFactory.instance = BasicGroupFactory.new()
        end
        return BasicGroupFactory.instance
end

BasicGroupFactory.instance = NullUtil.getInstance().NULL_OBJECT

return BasicGroupFactory

