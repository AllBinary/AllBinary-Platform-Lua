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

local EndGameInfo = {}
package.loaded["org.allbinary.game.displayable.canvas.EndGameInfo"] = EndGameInfo

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

local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
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

-- class table EndGameInfo is declared before the requires
EndGameInfo.__index = EndGameInfo
EndGameInfo.className = "EndGameInfo"
EndGameInfo.javaClassName = "org.allbinary.game.displayable.canvas.EndGameInfo"

function EndGameInfo:_init_fields()
    self.NORMAL_GAME_OVER = "Game Over"
    self.NORMAL_GAME_OVER_WIN = "You Won"
    self.gameOverStr = StringUtil.getInstance().EMPTY_STRING
    self.winStr = self.gameOverStr
end


function EndGameInfo._jinit(self)
    EndGameInfo._init_fields(self)
    return self
end

function EndGameInfo.new(...)
    local self = setmetatable({}, EndGameInfo)
    EndGameInfo._jinit(self, ...)
    return self
end


function EndGameInfo:update(gameInfo, myCanvas)
        self:setGameOverStr(self.NORMAL_GAME_OVER)
        self:setWinStr(self.NORMAL_GAME_OVER_WIN)
end


function EndGameInfo:getGameOverStr()
        return self.gameOverStr
end


function EndGameInfo:setGameOverStr(gameOverStr)
        self.gameOverStr = gameOverStr
end


function EndGameInfo:getWinStr()
        return self.winStr
end


function EndGameInfo:setWinStr(winStr)
        self.winStr = winStr
end

return EndGameInfo

