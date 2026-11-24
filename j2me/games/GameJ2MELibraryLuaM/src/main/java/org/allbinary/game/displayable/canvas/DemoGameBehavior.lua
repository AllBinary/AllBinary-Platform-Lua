-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local DemoGameBehavior = {}
package.loaded["org.allbinary.game.displayable.canvas.DemoGameBehavior"] = DemoGameBehavior

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

local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")

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

-- class table DemoGameBehavior is declared before the requires
DemoGameBehavior.__index = DemoGameBehavior
DemoGameBehavior.className = "DemoGameBehavior"
DemoGameBehavior.javaClassName = "org.allbinary.game.displayable.canvas.DemoGameBehavior"

function DemoGameBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function DemoGameBehavior._jinit(self)
    DemoGameBehavior._init_fields(self)
    return self
end

function DemoGameBehavior.new()
    return DemoGameBehavior._jinit(setmetatable({}, DemoGameBehavior))
end


function DemoGameBehavior.getInstance()
        return DemoGameBehavior.instance_f
end


-- throws Exception
function DemoGameBehavior:init()
end


function DemoGameBehavior:pause(allBinaryGameCanvas)
end


function DemoGameBehavior:unPause(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:updateTouch(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:updateScreenButtonPaintable(allBinaryGameCanvas)
        allBinaryGameCanvas:setTouchPaintableP(NullPaintable.getInstance())
end


-- throws Exception
function DemoGameBehavior:setGameState(allBinaryGameCanvas)
end


function DemoGameBehavior:removeAllGameKeyInputListeners(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:updateEndGameProcessor(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:buildGame(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:run(allBinaryGameCanvas)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(GameTypeFactory.getInstance().BOT), self, commonStrings.RUN)
end


-- throws Exception
function DemoGameBehavior:setHighScore(abeClientInformation, allBinaryGameCanvas, name, score, autoSubmit, isLast)
end

DemoGameBehavior.instance_f = DemoGameBehavior.new()

return DemoGameBehavior

