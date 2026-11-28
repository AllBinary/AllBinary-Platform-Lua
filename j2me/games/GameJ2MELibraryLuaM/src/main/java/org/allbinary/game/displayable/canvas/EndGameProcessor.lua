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

local EndGameProcessor = {}
package.loaded["org.allbinary.game.displayable.canvas.EndGameProcessor"] = EndGameProcessor

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

local Processor = require("org.allbinary.canvas.Processor")
local HighScores = java_lazy("org.allbinary.game.score.HighScores")
local HighScoresHelperBase = java_lazy("org.allbinary.game.score.HighScoresHelperBase")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table EndGameProcessor is declared before the requires
EndGameProcessor.__index = EndGameProcessor
EndGameProcessor.className = "EndGameProcessor"
EndGameProcessor.javaClassName = "org.allbinary.game.displayable.canvas.EndGameProcessor"
setmetatable(EndGameProcessor, {__index = Processor})

function EndGameProcessor:_init_fields()
    self.gameStateFactory = GameStateFactory.getInstance()
    if self.gameCanvas == nil then self.gameCanvas = nil end
    self.WAIT = 5000
end


function EndGameProcessor._jinit(self, gameCanvas)
    java_super_init(Processor, self)
    EndGameProcessor._init_fields(self)
        self.gameCanvas = gameCanvas
    return self
end

function EndGameProcessor.new(...)
    local self = setmetatable({}, EndGameProcessor)
    EndGameProcessor._jinit(self, ...)
    return self
end


-- throws Exception
function EndGameProcessor:process()
        if self.gameCanvas:isHighScoreSubmitted() then
            if self.gameCanvas:getGameStateTimeHelper():isElapsedTNT(self.WAIT) then
                if rawequal(self.gameCanvas:getGameState(), self.gameStateFactory.SHOW_END_RESULT_GAME_STATE) then
                    local highScoresBase = self.gameCanvas.highScoresHelper
                    local highScores = highScoresBase:getSelectedHighScores()
                    if not rawequal(highScores, NullHighScoresSingletonFactory.getInstance()) then
                        highScoresBase:selectHighScores()
                        self.gameCanvas:getRealHighScoresPaintable():setHighScores(highScores)
                        self.gameCanvas:setGameState(self.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE)
                        self.gameCanvas:setHighScoresPaintable(self.gameCanvas:getRealHighScoresPaintable())
                    end
                elseif rawequal(self.gameCanvas:getGameState(), self.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE) then
                    self.gameCanvas:setGameState(self.gameStateFactory.SHOW_END_RESULT_GAME_STATE)
                    self.gameCanvas:setHighScoresPaintable(NullPaintable.getInstance())
                end
            end
        end
end
java_overload(EndGameProcessor, "process", 0)

return EndGameProcessor

