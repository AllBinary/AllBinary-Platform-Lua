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

local PersistanceStrings = {}
package.loaded["org.allbinary.game.configuration.persistance.PersistanceStrings"] = PersistanceStrings

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

-- class table PersistanceStrings is declared before the requires
PersistanceStrings.__index = PersistanceStrings
PersistanceStrings.className = "PersistanceStrings"
PersistanceStrings.javaClassName = "org.allbinary.game.configuration.persistance.PersistanceStrings"

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

function PersistanceStrings._jinit(self)
    PersistanceStrings._init_fields(self)
    return self
end

function PersistanceStrings.new()
    return PersistanceStrings._jinit(setmetatable({}, PersistanceStrings))
end


function PersistanceStrings.getInstance()
        return PersistanceStrings.instance_f
end

PersistanceStrings.instance_f = PersistanceStrings.new()

return PersistanceStrings

