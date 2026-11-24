-- Generated Code Do Not Modify
-- package org.allbinary.game.midlet

local GameMidletStateFactory = {}
package.loaded["org.allbinary.game.midlet.GameMidletStateFactory"] = GameMidletStateFactory

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

local GameState = java_lazy("org.allbinary.game.state.GameState")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

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

-- class table GameMidletStateFactory is declared before the requires
GameMidletStateFactory.__index = GameMidletStateFactory
GameMidletStateFactory.className = "GameMidletStateFactory"
GameMidletStateFactory.javaClassName = "org.allbinary.game.midlet.GameMidletStateFactory"

function GameMidletStateFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.currentGameState = GameStateFactory.getInstance().NO_GAME_STATE
end


function GameMidletStateFactory._jinit(self)
    GameMidletStateFactory._init_fields(self)
    return self
end

function GameMidletStateFactory.new(...)
    local self = setmetatable({}, GameMidletStateFactory)
    GameMidletStateFactory._jinit(self, ...)
    return self
end


function GameMidletStateFactory.getInstance()
        return GameMidletStateFactory.INSTANCE
end


function GameMidletStateFactory:getCurrentGameState()
        return self.currentGameState
end


function GameMidletStateFactory:setCurrentGameState(currentGameState)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().CURRENT):append(" GameState: "):append(StringUtil.getInstance():toString(currentGameState))), self, "setCurrentGameState")
        self.currentGameState = currentGameState
end

GameMidletStateFactory.INSTANCE = GameMidletStateFactory.new()

return GameMidletStateFactory

