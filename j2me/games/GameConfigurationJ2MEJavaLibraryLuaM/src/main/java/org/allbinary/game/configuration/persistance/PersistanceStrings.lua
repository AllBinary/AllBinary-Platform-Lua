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
-- package org.allbinary.game.configuration.persistance


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PersistanceStrings = {}
PersistanceStrings.__index = PersistanceStrings
PersistanceStrings.className = "PersistanceStrings"

function PersistanceStrings:_init_fields()
    self.SAVING = "Saving: "
    self.NUMBER_OF_RECORDS = "Number of records: "
    self.LOADING_ID = "Loading data with id: "
    self.LOAD_ALL = "loadAll"
    self.DELETING_WITH_ID = "Deleting data with id: "
    self.CLOSING_RECORDSTORE = "Closing RecordStore"
    self.NOT_SAVING = "Not Saving: "
    self.ERROR_LOADING = "Error Loading gameActionInput: "
    self.ERROR_LOADING_ID = "Error Loading id: "
    self.ID = " id: "
    self.GAME_ACTION_INPUT = " GameActionInput: "
end

function PersistanceStrings.new()
    local self = setmetatable({}, PersistanceStrings)
    self:_init_fields()
    return self
end


function PersistanceStrings.getInstance()
        return PersistanceStrings.instance
end

PersistanceStrings.instance = PersistanceStrings.new()

return PersistanceStrings

