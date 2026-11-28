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
-- package org.allbinary.game.displayable.canvas

local GameRunnable = {}
package.loaded["org.allbinary.game.displayable.canvas.GameRunnable"] = GameRunnable

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

local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local Runnable = require("java.lang.Runnable")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table GameRunnable is declared before the requires
GameRunnable.__index = GameRunnable
GameRunnable.className = "GameRunnable"
GameRunnable.javaClassName = "org.allbinary.game.displayable.canvas.GameRunnable"
GameRunnable.java_implements = " Runnable "
GameRunnable.java_interfaces = function() return {Runnable} end

function GameRunnable:_init_fields()
    self.WAIT = 240
    self.FAST = 60
    self.waitInMillis = self.WAIT
end


function GameRunnable._jinit(self)
    GameRunnable._init_fields(self)
    return self
end

function GameRunnable.new(...)
    local self = setmetatable({}, GameRunnable)
    GameRunnable._jinit(self, ...)
    return self
end


function GameRunnable:run()
        DisplayInfoSingleton.getInstance():process()
end


-- throws Exception
function GameRunnable:processLoopSleep()
        require("java.lang.Thread").sleep(self.waitInMillis)
end

return GameRunnable

