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

local GameTickDisplayInfoSingleton = require("org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local GameRunnable = require("org.allbinary.game.displayable.canvas.GameRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameCanvasRunnable = {}
GameCanvasRunnable.__index = GameCanvasRunnable
GameCanvasRunnable.className = "GameCanvasRunnable"
setmetatable(GameCanvasRunnable, {__index = GameRunnable})

function GameCanvasRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()
    self.allBinaryGameCanvas = nil
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function GameCanvasRunnable.new(allBinaryGameCanvas)
    local self = setmetatable(GameRunnable.new(), GameCanvasRunnable)
    self:_init_fields()
        self.allBinaryGameCanvas = allBinaryGameCanvas
    return self
end


function GameCanvasRunnable:run()
        local try_ok, try_error = pcall(function()
            self.allBinaryGameCanvas:getLoopTimeHelperP():setStartTime(self.gameTickTimeDelayHelper:setStartTime())
            self.gameTickDisplayInfoSingleton:update()
            self.allBinaryGameCanvas:processGame()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end


-- throws Exception
function GameCanvasRunnable:processLoopSleep()
        self.allBinaryGameCanvas:processLoopSleep()
end

return GameCanvasRunnable

