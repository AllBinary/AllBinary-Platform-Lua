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
-- package org.allbinary.game.ag.layer.weapon.mine

local BasicGameResources = require("org.allbinary.game.layer.resources.BasicGameResources")
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

local MineWeaponResources = {}
MineWeaponResources.__index = MineWeaponResources
MineWeaponResources.className = "MineWeaponResources"
setmetatable(MineWeaponResources, {__index = BasicGameResources})

function MineWeaponResources:_init_fields()
    self.DROP_TEXT_RESOURCE = "/mine_drop_text_20_by_20.png"
    self.DROP_RESOURCE = "/mine_drop_20_by_20.png"
    self.DROP_ICON_RESOURCE = "/mine_drop_icon_20_by_20.png"
end


function MineWeaponResources.getInstance()
        if MineWeaponResources.instance == NullUtil.getInstance().NULL_OBJECT then
            MineWeaponResources.instance = MineWeaponResources.new()
        end
        return MineWeaponResources.instance
end


function MineWeaponResources.new()
    local self = setmetatable(BasicGameResources.new(), MineWeaponResources)
    self:_init_fields()
        local ROOT = "/mine"
        local SMALL = "_20_by_20.png"
        local MEDIUM = SMALL
        local SIZE_FOUR = SMALL
        local SIZE_FIVE = SMALL
        local SIZE_SIX = SMALL
        local SIZE = {SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX}
        BasicGameResources.init(self, ROOT, SIZE)
    return self
end

MineWeaponResources.instance = NullUtil.getInstance().NULL_OBJECT

return MineWeaponResources

