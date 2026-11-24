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

local GamePersistanceStrings = {}
package.loaded["org.allbinary.game.configuration.persistance.GamePersistanceStrings"] = GamePersistanceStrings

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

-- class table GamePersistanceStrings is declared before the requires
GamePersistanceStrings.__index = GamePersistanceStrings
GamePersistanceStrings.className = "GamePersistanceStrings"
GamePersistanceStrings.javaClassName = "org.allbinary.game.configuration.persistance.GamePersistanceStrings"

function GamePersistanceStrings:_init_fields()
    self.SAVED_GAME_RECORD_ID = "_SG"
    self.SAVED_GAME_CONFIGURATION_RECORD_ID = "_SGC"
    self.DEFAULT_INPUT_MAPPING_RECORD_ID = "_DIM"
    self.SAVED_INPUT_CONFIGURATION_RECORD_ID = "_SIC"
end

function GamePersistanceStrings._jinit(self)
    GamePersistanceStrings._init_fields(self)
    return self
end

function GamePersistanceStrings.new()
    return GamePersistanceStrings._jinit(setmetatable({}, GamePersistanceStrings))
end


function GamePersistanceStrings.getInstance()
        return GamePersistanceStrings.instance_f
end

GamePersistanceStrings.instance_f = GamePersistanceStrings.new()

return GamePersistanceStrings

