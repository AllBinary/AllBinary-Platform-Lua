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
-- package org.allbinary.game

local GameMode = {}
package.loaded["org.allbinary.game.GameMode"] = GameMode

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table GameMode is declared before the requires
GameMode.__index = GameMode
GameMode.className = "GameMode"
GameMode.javaClassName = "org.allbinary.game.GameMode"

function GameMode:_init_fields()
    self.name_f = StringUtil.getInstance().EMPTY_STRING
end


function GameMode._jinit(self, name)
    GameMode._init_fields(self)
        self:setName(name)
    return self
end

function GameMode.new(...)
    local self = setmetatable({}, GameMode)
    GameMode._jinit(self, ...)
    return self
end


function GameMode:setName(name)
        self.name_f = name
end


function GameMode:getName()
        return self.name_f
end


function GameMode:toString()
        return self:getName()
end
GameMode.__tostring = function(self) return self:toString() end

GameMode.NONE = GameMode.new(StringUtil.getInstance().NULL_STRING)
GameMode.SERVER = GameMode.new("Server")
GameMode.CLIENT = GameMode.new("Client")

return GameMode

